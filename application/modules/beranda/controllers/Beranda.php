<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Beranda extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->session->set_flashdata('segment', explode('/', $this->uri->uri_string()));
        $this->user = $this->ion_auth->user()->row();
    }

    public function index()
    {
        $this->is_allowed();
        $this->template->title = 'Dashboard!';
        $this->template->javascript->add('partial/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js');
        $this->template->javascript->add('partial/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-world-mill-en.js');
        $this->template->javascript->add('partial/js/pages/dashboard.init.js');
        $news = array(); // load from model (but using a dummy array here)
        $this->template->content->view('beranda', $news);
        $this->template->publish();
    }
    public function index2()
    {
        $this->is_allowed();
        $this->template->title = 'Dashboard!';
        $this->template->javascript->add('partial/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js');
        $this->template->javascript->add('partial/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-world-mill-en.js');
        $this->template->javascript->add('partial/js/pages/dashboard.init.js');
        $news = array(); // load from model (but using a dummy array here)
        $this->template->content->view('test2', $news);
        $this->template->publish('template2');
    }
}
