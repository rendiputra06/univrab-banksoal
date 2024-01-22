<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Settings extends MY_Controller
{
    private $user;
    function __construct()
    {
        parent::__construct();

        $this->session->set_flashdata('segment', explode('/', $this->uri->uri_string()));
        $this->user = $this->ion_auth->user()->row();
        $this->load->model('Setting_model', 'setting');
    }

    public function index()
    {
        $this->is_allowed('admin');
        $this->template->title = 'Settings';
        $this->breadcrumbs->push('Settings', '/settings');
        $this->template->stylesheet->add('partial/libs/dropify/css/dropify.min.css');
        $this->template->stylesheet->add('partial/libs/summernote/summernote.css');
        $this->template->stylesheet->add('partial/libs/summernote/summernote-bs3.css');
        $this->template->javascript->add('partial/libs/dropify/js/dropify.min.js');
        $this->template->javascript->add('partial/libs/summernote/summernote.min.js');
        $this->template->javascript->add('partial/js/halaman/setting.js?v=0.0.2');
        $data['general'] = convert_setting_data($this->db->get('setting')->result());
        $data["templates"] = $this->_templates();
        $this->template->content->view('index', $data);
        $this->template->publish();
    }

    public function save()
    {
        if ($this->input->is_ajax_request()) {
            $data = array();
            $this->_rules();
            if ($this->form_validation->run() == FALSE) {
                $errors = array(
                    'system_name'  => form_error('system_name'),
                    'system_title' => form_error('system_title'),
                    'system_email' => form_error('system_email'),
                    'address'      => form_error('address'),
                );
                $data       = ['status' => FALSE, 'errors' => $errors];
            } else {
                $this->setting->update_setting();
                $data = ['status' => TRUE, 'cek' => $_POST];
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($data));
        }
    }
    public function _rules()
    {
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('system_name', 'Nama Sistem', 'trim|required');
        $this->form_validation->set_rules('system_title', 'Title Sistem', 'trim|required');
        $this->form_validation->set_rules('system_email', 'Default Email', 'trim|required');
        $this->form_validation->set_rules('address', 'Alamat', 'trim|required');

        $this->form_validation->set_message('required', '%s masih kosong, silahkan isi');
    }

    public function save_logo()
    {
        $file_name = $this->_do_upload();
        $this->setting->logo_change($file_name);
        $data = ['status' => TRUE];
        $this->output->set_content_type('application/json')->set_output(json_encode($data));
    }
    private function _do_upload()
    {
        $config['upload_path'] = 'partial/images/logo'; //path folder
        $config['allowed_types'] = 'gif|jpg|png|jpeg|bmp|svg'; //type yang dapat diakses bisa anda sesuaikan
        $config['max_size']      = 1000;
        $config['encrypt_name'] = TRUE; //nama yang terupload nantinya

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload('filefoto')) //upload and validate
        {
            $hasil['status'] = false;
            $hasil['pesan'] = $this->upload->display_errors();
            echo json_encode($hasil);
            exit();
        }
        return $this->upload->data('file_name');
    }
    public function save_email()
    {
        $this->ajax_only();
        $this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_rules('email_sent_from_address', 'Email Pengirim', 'trim|required');
        $this->form_validation->set_rules('email_sent_from_name', 'Email Atas Nama', 'trim|required');
        $this->form_validation->set_rules('email_smtp_host', 'SMTP Host', 'trim|required');
        $this->form_validation->set_rules('email_smtp_user', 'SMTP User', 'trim|required');
        // $this->form_validation->set_rules('email_smtp_pass', 'SMTP Password', 'trim|required');
        $this->form_validation->set_rules('email_smtp_port', 'SMTP Port', 'trim|required');
        $this->form_validation->set_rules('email_smtp_security_type', 'Security Type', 'trim|required');
        if ($this->form_validation->run() == FALSE) {
            $errors = array(
                'email_sent_from_address' => form_error('email_sent_from_address'),
                'email_sent_from_name' => form_error('email_sent_from_name'),
                'email_smtp_host' => form_error('email_smtp_host'),
                'email_smtp_user' => form_error('email_smtp_user'),
                // 'email_smtp_pass'   => form_error('email_smtp_pass'),
                'email_smtp_port'   => form_error('email_smtp_port'),
                'email_smtp_security_type'   => form_error('email_smtp_security_type'),
            );
            $data = ['status' => FALSE, 'errors' => $errors];
        } else {
            $settings = array("email_sent_from_address", "email_sent_from_name", "email_protocol", "email_smtp_host", "email_smtp_port", "email_smtp_user", "email_smtp_pass", "email_smtp_security_type");
            foreach ($settings as $setting) {
                $value = $this->input->post($setting);
                if (!$value) {
                    $value = "";
                }

                if ($setting == "email_smtp_pass") {
                    $value = encode_id($value, "email_smtp_pass");
                }

                $this->setting->save_setting($setting, $value);
            }
            $data = array('status' => TRUE);
            // melakukan test pengiriman jika send_test_email_to berisi
            $test_email_to = $this->input->post("send_test_mail_to");
            if ($test_email_to) {
                $email_config = array(
                    'charset' => 'utf-8',
                    'mailtype' => 'html'
                );
                if ($this->input->post("email_protocol") === "smtp") {
                    $email_config["protocol"] = "smtp";
                    $email_config["smtp_host"] = $this->input->post("email_smtp_host");
                    $email_config["smtp_port"] = $this->input->post("email_smtp_port");
                    $email_config["smtp_user"] = $this->input->post("email_smtp_user");
                    // $email_config["smtp_pass"] = 'Abdurrab051';
                    $email_config["smtp_pass"] = $this->input->post("email_smtp_pass") ? $this->input->post("email_smtp_pass") : decode_password(get_setting('email_smtp_pass'), "email_smtp_pass");
                    $email_config["smtp_crypto"] = $this->input->post("email_smtp_security_type");
                    if ($email_config["smtp_crypto"] === "none") {
                        $email_config["smtp_crypto"] = "";
                    }
                }

                $this->load->library('email');
                $this->email->initialize($email_config);
                $this->email->set_newline("\r\n");
                $this->email->set_crlf("\r\n");
                $this->email->from($this->input->post("email_sent_from_address"), $this->input->post("email_sent_from_name"));

                $this->email->to($test_email_to);
                $this->email->subject("Hanya Pengetesan Sistem");
                $this->email->message("This is a test message to check mail configuration.");
                $this->email->message("Ini adalah Uji pengiriman pesan untuk mengecek konfigurasi mail.");

                if ($this->email->send()) {
                    $test = array("success" => true, 'message' => 'Test Mail Berhasil dikirim');
                } else {
                    log_message('error', $this->email->print_debugger());
                    $test = array("success" => false, 'message' => 'Test Mail Gagal dikirim', 'error', $this->email->print_debugger());
                }
                $data['test'] = $test;
            }
        }
        $this->_json($data);
    }
    public function ajax_theme()
    {
        $this->ajax_only();
        $table = 'user_setting';
        $val = $this->input->post('val');
        // cek apakah setting sudah ada di database
        $cek = $this->db->get_where($table, ['user_id' => $this->user->id])->row();
        if ($cek) {
            $this->db->set('theme', $val);
            $this->db->where('id', $cek->id);
            $this->db->update($table);
        } else {
            $this->db->insert($table, ['user_id' => $this->user->id, 'theme' => $val]);
        }
        $this->_json(['status' => TRUE]);
    }

    private function _templates()
    {
        $templates_array = array(
            "account" => array(
                "login_info" => array("USER_FIRST_NAME", "USER_LAST_NAME", "DASHBOARD_URL", "USER_LOGIN_EMAIL", "USER_LOGIN_PASSWORD", "LOGO_URL", "SIGNATURE"),
                "reset_password" => array("ACCOUNT_HOLDER_NAME", "RESET_PASSWORD_URL", "SITE_URL", "LOGO_URL", "SIGNATURE"),
                "team_member_invitation" => array("INVITATION_SENT_BY", "INVITATION_URL", "SITE_URL", "LOGO_URL", "SIGNATURE"),
                "new_client_greetings" => array("CONTACT_FIRST_NAME", "CONTACT_LAST_NAME", "COMPANY_NAME", "DASHBOARD_URL", "CONTACT_LOGIN_EMAIL", "CONTACT_LOGIN_PASSWORD", "LOGO_URL", "SIGNATURE"),
                "client_contact_invitation" => array("INVITATION_SENT_BY", "INVITATION_URL", "SITE_URL", "LOGO_URL", "SIGNATURE"),
                "verify_email" => array("VERIFY_EMAIL_URL", "SITE_URL", "LOGO_URL", "SIGNATURE"),
            ),
            "project" => array(
                "project_task_deadline_reminder" => array("APP_TITLE", "DEADLINE", "SIGNATURE", "TASKS_LIST", "LOGO_URL"),
            ),
            "invoice" => array(
                "send_invoice" => array("INVOICE_ID", "CONTACT_FIRST_NAME", "CONTACT_LAST_NAME", "PROJECT_TITLE", "BALANCE_DUE", "DUE_DATE", "SIGNATURE", "INVOICE_URL", "LOGO_URL", "PUBLIC_PAY_INVOICE_URL"),
                "invoice_payment_confirmation" => array("INVOICE_ID", "PAYMENT_AMOUNT", "INVOICE_URL", "LOGO_URL", "SIGNATURE"),
                "invoice_due_reminder_before_due_date" => array("INVOICE_ID", "CONTACT_FIRST_NAME", "CONTACT_LAST_NAME", "PROJECT_TITLE", "BALANCE_DUE", "DUE_DATE", "SIGNATURE", "INVOICE_URL", "LOGO_URL"),
                "invoice_overdue_reminder" => array("INVOICE_ID", "CONTACT_FIRST_NAME", "CONTACT_LAST_NAME", "PROJECT_TITLE", "BALANCE_DUE", "DUE_DATE", "SIGNATURE", "INVOICE_URL", "LOGO_URL"),
                "recurring_invoice_creation_reminder" => array("CONTACT_FIRST_NAME", "CONTACT_LAST_NAME", "APP_TITLE", "INVOICE_URL", "NEXT_RECURRING_DATE", "LOGO_URL", "SIGNATURE"),
            ),
            "estimate" => array(
                "estimate_sent" => array("ESTIMATE_ID", "CONTACT_FIRST_NAME", "CONTACT_LAST_NAME", "SIGNATURE", "ESTIMATE_URL", "LOGO_URL"),
                "estimate_accepted" => array("ESTIMATE_ID", "SIGNATURE", "ESTIMATE_URL", "LOGO_URL"),
                "estimate_rejected" => array("ESTIMATE_ID", "SIGNATURE", "ESTIMATE_URL", "LOGO_URL"),
                "estimate_request_received" => array("ESTIMATE_REQUEST_ID", "CONTACT_FIRST_NAME", "CONTACT_LAST_NAME", "SIGNATURE", "ESTIMATE_REQUEST_URL", "LOGO_URL"),
            ),
            "notif" => array(
                "notif_surat_masuk" => array("SYSTEM_NAME", "NAMA_PENERIMA", "NAMA_PENGIRIM", "SIGNATURE", "PERIHAL", "SURAT_URL"),
                "notif_disposisi_masuk" => array("SYSTEM_NAME", "NAMA_PENERIMA", "NAMA_PENGIRIM", "SIGNATURE", "ISI", "DISPOSISI_URL"),
            ),
            "message" => array(
                "message_received" => array("SUBJECT", "USER_NAME", "MESSAGE_CONTENT", "MESSAGE_URL", "APP_TITLE", "LOGO_URL", "SIGNATURE"),
            ),
            "common" => array(
                "general_notification" => array("EVENT_TITLE", "EVENT_DETAILS", "APP_TITLE", "COMPANY_NAME", "NOTIFICATION_URL", "LOGO_URL", "SIGNATURE"),
                "signature" => array()
            )
        );

        return $templates_array;
    }
    public function form()
    {
        $this->ajax_only();
        $id = $this->input->post('id');
        $data['model_info'] = $this->db->get_where('email_templates', ['template_name' => $id])->row();
        $variables_array = array_column($this->_templates(), $id);
        $variables = get_array_value($variables_array, 0);
        $data['variables'] = $variables ? $variables : array();
        $this->load->view('tab/form', $data);
    }
    public function save_template()
    {
        $this->ajax_only();
        $send = array(
            'email_subject' => $this->input->post('email_subject'),
            'custom_message' => $this->input->post('custom_message'),
        );
        $this->db->update('email_templates', $send, ['id' => $this->input->post('id')]);
        $this->_json(['status' => TRUE]);
    }
    public function restore_template()
    {
        $this->ajax_only();
        // mengosongkan kostum template
        $id = $this->input->post('id');
        $data = array(
            "custom_message" => ""
        );
        $this->db->update('email_templates', $data, array('id' => $id));
        $default = $this->db->get_where('email_templates', ['id' => $id])->row();
        $this->_json(['status' => TRUE, 'default' => $default->default_message]);
    }
}
