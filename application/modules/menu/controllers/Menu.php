<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

include_once(APPPATH . 'widgets/admin_menu.php');

class Menu extends MY_Controller
{
    private $user;
    private $sort;
    private $menus;
    function __construct()
    {
        parent::__construct();
        $this->load->model('Menu_model', 'menu');
        $this->load->library('form_validation');
        $this->session->set_flashdata('segment', explode('/', $this->uri->uri_string()));
        $this->user = $this->ion_auth->user()->row();
    }
    public function index($flag = null)
    {
        $this->is_allowed('admin');
        $this->template->title = 'Menu';
        $this->load_libs();
        $this->breadcrumbs->push('Menu', '/menu');
        $flag           = $flag != null ? $flag : 'side-menu';
        $data['id']     = $this->menu->get_id_menu_type_by_flag($flag);
        $data['menu']   = $this->create_nestable(0, 1, 'side-menu', true);
        $data['topMenu']   = $this->create_nestable(0, 1, 'top-menu', true);

        $this->template->content->view('index', $data);
        $this->template->publish();
    }
    private function load_libs()
    {
        $this->template->stylesheet->add('partial/libs/m-switch/css/style.css');
        $this->template->stylesheet->add('partial/libs/nestable/nesteable.css');
        $this->template->stylesheet->add('partial/libs/select2/css/select2.min.css');
        $this->template->javascript->add('partial/libs/select2/js/select2.full.min.js');
        $this->template->javascript->add('partial/libs/js/jquery.hotkeys.js');
        $this->template->javascript->add('partial/libs/nestable/jquery.nestable.js');
        $this->template->javascript->add('partial/libs/m-switch/js/jquery.mswitch.js');
        $this->template->javascript->add('partial/js/halaman/menu.js?v=0.0.4');
    }
    private $menu_dropdown = null;

    private function display_menu_dropdown($row)
    {
        $menu_dropdown = $this->menu_dropdown;

        return sprintf(
            '
        <span class="dropdown float-end">
            <a class="dropdown-toggle" type="button" data-toggle="dropdown" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-cog"></i> <i class="mdi mdi-chevron-down"></i></a>
            <div class="dropdown-menu">
                <button class="removeMenu dropdown-item" data-id="%s">
                    <i class="fa fa-trash btn-action"></i> <span class="text-danger">Delete</span></button>
                <button class="dropdown-item editMenu" data-id="%s">
                    <i class="fa fa-edit btn-action"></i> Edit</button> 
                %s
            </div>
        </span>',
            $row->id,
            $row->id,
            ($row->type != 'label') ? sprintf(
                '
            <button class="dropdown-item addchildBtn" data-id="%s">
                <i class="fas fa-level-down-alt btn-action"></i> Add child</button>',
                $row->id
            ) : ''
        );
    }

    private function create_nestable($parent, $level, $menu_type, $ignore_active = false)
    {
        $menu_type_id = $this->menu->get_id_menu_type_by_flag($menu_type);

        $sql = "SELECT a.id, a.label, a.type, a.active, a.link, Deriv1.Count 
        FROM `navi` a  
        LEFT OUTER JOIN (SELECT parent, COUNT(*) AS Count FROM `navi` GROUP BY parent) Deriv1 ON a.id = Deriv1.parent 
        WHERE a.menu_type_id = ? AND a.parent = ? " . ($ignore_active ? '' : 'AND active = 1') . " ORDER BY `sort` ASC";
        $result = $this->db->query($sql, array($menu_type_id, $parent))->result();

        $ret = '';

        if ($result) {
            $ret .= '<ol class="dd-list">';
            foreach ($result as $row) {
                $class_names = sprintf(
                    'dd-item dd3-item %s %s',
                    ($row->active ? '' : 'menu-toggle-activate_inactive'),
                    'menu-toggle-activate'
                );

                $content = sprintf(
                    '<div class="dd-handle dd3-handle dd-handles %s%s"></div><div class="dd3-content"><%s>%s</%s>%s</div>',
                    ($row->type != 'label' ? '' : 'dd-handle-label'),
                    ($row->Count > 0 ? '' : 'dd-handles'),
                    ($row->type != 'label' ? 'span' : 'b'),
                    _ent($row->label),
                    ($row->type != 'label' ? 'span' : 'b'),
                    $this->display_menu_dropdown($row)
                );

                $ret .= sprintf(
                    '<li class="%s" data-id="%s" data-status="%s">%s',
                    $class_names,
                    $row->id,
                    $row->active,
                    $content
                );

                $ret .= $this->create_nestable($row->id, $level + 1, $menu_type, $ignore_active);

                $ret .= '</li>';
            }

            $ret .= '</ol>';
        }

        return $ret;
    }
    public function cari_parent_select2()
    {
        if ($this->input->is_ajax_request()) {
            $result = $this->menu->get_parent();
            $json = [];
            foreach ($result as $row) {
                $json[] = ['id' => $row->id, 'text' => $row->label];
            }
            echo json_encode($json);
        }
    }
    public function cari_group_select2()
    {
        if ($this->input->is_ajax_request()) {
            $result = $this->menu->get_user_group();
            $json = [];
            foreach ($result as $row) {
                $json[] = ['id' => $row->id, 'text' => $row->name];
            }
            echo json_encode($json);
        }
    }
    public function cari_menu_type_select2()
    {
        if ($this->input->is_ajax_request()) {
            $result = $this->menu->get_menu_type();
            $json = [];
            foreach ($result as $row) {
                $json[] = ['id' => $row->id, 'text' => $row->name];
            }
            echo json_encode($json);
        }
    }
    public function save()
    {
        if ($this->input->is_ajax_request()) {
            $data = array();
            $mode = $this->input->post('mode', true);
            $this->form_validation->set_error_delimiters('', '');
            $this->form_validation->set_rules('icon', 'Icon', 'required');
            $this->form_validation->set_rules('label', 'Label', 'required');
            $this->form_validation->set_rules('group[]', 'Group', 'required');
            $this->form_validation->set_message('required', '{field} Wajib diisi');
            if ($this->form_validation->run() == FALSE) {
                $errors = array(
                    'icon'  => form_error('icon'),
                    'label' => form_error('label'),
                    'group[]' => form_error('group[]'),
                );
                $data = array(
                    'status'     => FALSE,
                    'errors'     => $errors
                );
            } else {
                if ($mode == 'add') {
                    $id = $this->menu->addMenu();
                    $this->logger->user($this->user->id)->type('navi')
                        ->id($id)->token('create')->comment('Membuat Menu baru')->log();
                } else {
                    $this->menu->editMenu();
                    $this->logger->user($this->user->id)->type('navi')
                        ->id($this->input->post('id'))->token('update')->comment('Mengubah data Menu')->log();
                }
                $data = ['status' => TRUE];
            }
            $this->output->set_content_type('application/json')
                ->set_output(json_encode($data));
        }
    }
    public function editMenu()
    {
        if ($this->input->is_ajax_request()) {
            $menu = $this->menu->get_menu($this->input->post('id'));
            $data = ['status' => TRUE, 'menu' => $menu->row()];
            $this->output->set_content_type('application/json')->set_output(json_encode($data));
        }
    }
    public function delete()
    {
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');
            $old_data = $this->menu->get_menu($id);
            if ($this->db->delete('navi', ['id' => $id])) {
                $this->db->delete('navi_groups', ['navi_id' => $id]);
                $data = ['status' => TRUE];
                $this->logger->user($this->user->id)->type('users')->id($id)->token('delete')
                    ->comment('Menghapus Menu')->keep_data(json_encode($old_data))->log();
            } else {
                $data = ['status' => FALSE];
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($data));
        }
    }

    private function _parse_menu($menus, $parent = '')
    {
        $data = [];
        foreach ($menus as $menu) {
            $this->sort++;
            $this->menus[] = [
                'id' => $menu['id'],
                'sort' => $this->sort,
                'parent' => $parent
            ];
            if (isset($menu['children'])) {
                $this->_parse_menu($menu['children'], $menu['id']);
            }
        }
    }

    public function save_ordering()
    {
        $wmenu = new Admin_menu('admin_menu', array());
        $this->menus = [];
        $this->sort = 0;
        $this->_parse_menu($_POST['menu']);
        $save_ordering = $this->db->update_batch('navi', $this->menus, 'id');
        if ($save_ordering) {
            $data = [
                'success' => true,
                'message' => 'Berhasil Mengubah menu',
                'menu'    => $wmenu->show_menu(0, 1),
            ];
        } else {
            $data = [
                'success' => false,
                'message' => 'Gagal merubah menu'
            ];
        }
        $this->_json($data);
    }
}
