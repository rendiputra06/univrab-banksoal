<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Setting_model extends CI_Model
{
    public function update_setting()
    {
        $old_data = $this->db->get('setting')->result();
        foreach ($old_data as $od) {
            if ($this->input->post($od->kunci)) {
                $this->db->where('kunci', $od->kunci);
                $this->db->set('nilai', $this->input->post($od->kunci));
                $this->db->update('setting');
            }
        }
    }
    public function logo_change($filename)
    {
        $this->db->where('kunci', 'logo');
        $this->db->update('setting', ['nilai' => $filename]);
    }

    function get_setting($kunci)
    {
        $result = $this->db->get_where('setting', array('kunci' => $kunci), 1);
        if ($result->num_rows() == 1) {
            return $result->row()->kunci;
        }
    }
    function save_setting($kunci, $nilai, $tipe = "app")
    {
        $fields = array(
            'kunci' => $kunci,
            'nilai' => $nilai
        );

        $exists = $this->get_setting($kunci);
        if ($exists === NULL) {
            $fields["tipe"] = $tipe; //type can't be updated

            return $this->db->insert('setting', $fields);
        } else {
            $this->db->where('kunci', $kunci);
            $this->db->update('setting', $fields);
        }
    }

    function get_final_template($template_name = "")
    {
        $email_templates_table = $this->db->dbprefix('email_templates');

        $sql = "SELECT $email_templates_table.default_message, $email_templates_table.custom_message, $email_templates_table.email_subject, 
            signature_template.custom_message AS signature_custom_message, signature_template.default_message AS signature_default_message
        FROM $email_templates_table
        LEFT JOIN $email_templates_table AS signature_template ON signature_template.template_name='signature'
        WHERE $email_templates_table.deleted=0 AND $email_templates_table.template_name='$template_name'";
        $result = $this->db->query($sql)->row();

        $info = new stdClass();
        $info->subject = $result->email_subject;
        $info->message = $result->custom_message ? $result->custom_message : $result->default_message;
        $info->signature = $result->signature_custom_message ? $result->signature_custom_message : $result->signature_default_message;

        return $info;
    }
}
