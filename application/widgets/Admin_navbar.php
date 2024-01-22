<?php

/*
 * Demo widget
 */
class Admin_navbar extends Widget
{

    public function display($data)
    {

        if (!isset($data['items'])) {
            $data['items'] = array('Home', 'About', 'Contact');
        }
        $data['pp'] = $this->ion_auth->user()->row();

        $this->view('widgets/admin/navbar', $data);
    }
}
