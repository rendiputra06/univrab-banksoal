<?php defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends MY_Controller
{
	public $data = [];
	function __construct()
	{
		parent::__construct();
		$this->load->database();

		$this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));

		$this->lang->load('auth');
		$this->load->library('email');
		$this->session->set_flashdata('segment', explode('/', $this->uri->uri_string()));

		// Include the google api php libraries
		// $this->load->model('google_oauth_model'); // modular model
		$this->load->config('auth/google_config'); // modular config
		$this->load->config('auth/email'); // modular email

		include_once APPPATH . "libraries/Google/Google_Client.php";
		include_once APPPATH . "libraries/Google/contrib/Google_Oauth2Service.php";
	}

	private function output_json($data)
	{
		$this->output->set_content_type('application/json')->set_output(json_encode($data));
	}

	public function login()
	{
		if ($this->ion_auth->logged_in()) {
			$user_id = $this->ion_auth->user()->row()->id; // Get User ID
			$group = $this->ion_auth->get_users_groups($user_id)->row()->name; // Get user group
			redirect('beranda');
		}
		$this->data['identity'] = [
			'name' => 'identity',
			'id' => 'identity',
			'type' => 'text',
			'placeholder' => 'Email',
			'autofocus'	=> 'autofocus',
			'class' => 'form-control',
			'autocomplete' => 'off'
		];
		$this->data['password'] = [
			'name' => 'password',
			'id' => 'password',
			'type' => 'password',
			'placeholder' => 'Password',
			'class' => 'form-control',
		];

		$this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
		$this->load->view('tampilan_login/_header');
		$this->load->view('tampilan_login/index', $this->data);
		$this->load->view('tampilan_login/_footer');
	}

	public function cek_login()
	{
		$this->form_validation->set_rules('identity', str_replace(':', '', $this->lang->line('login_identity_label')), 'required|trim');
		$this->form_validation->set_rules('password', str_replace(':', '', $this->lang->line('login_password_label')), 'required|trim');

		if ($this->form_validation->run() === TRUE) {
			$remember = (bool)$this->input->post('remember');
			// check by email
			$login = $this->ion_auth->login($this->input->post('identity'), $this->input->post('password'), $remember);
			if (!$login) {
				$this->ion_auth_model->identity_column = 'username';

				// check by username
				$login = $this->ion_auth->login($this->input->post('identity'), $this->input->post('password'), $remember);
			}
			if ($login) {
				$this->cek_akses();
			} else {
				$data = [
					'status' => false,
					'failed' => 'Incorrect Login',
					'post' => $_POST,
				];
				$this->output_json($data);
			}
		} else {
			$invalid = [
				'identity' => form_error('identity'),
				'password' => form_error('password')
			];
			$data = [
				'status' 	=> false,
				'invalid' 	=> $invalid
			];
			$this->output_json($data);
		}
	}

	public function cek_akses()
	{
		if (!$this->ion_auth->logged_in()) {
			$status = false; // jika false, berarti login gagal
			$url = 'auth'; // url untuk redirect
		} else {
			$status = true; // jika true maka login berhasil
			$url = 'beranda';
			$user = $this->ion_auth->user()->row();
			$this->logger
				->user($user->id) //Set UserID, who created this  Action
				->type('post') //Entry type like, Post, Page, Entry
				->id($user->id) //Entry ID
				->token('login') //Token identify Action
				->log(); //Add Database Entry
		}
		// logger here
		$data = [
			'status' => $status,
			'url'	 => $url
		];
		$this->output_json($data);
	}

	function generate($id)
	{
		$data['title'] = "Generate Code";

		// get oAuth data from session 'google'
		$google = $this->session->userdata('google');

		if (isset($google)) {
			$users = $this->db->where(array('email' => $google['email']))->limit(1)->get('users')->row_array();

			$id = $users['id'];
			if ($users['activation'] == 1) {
				redirect('home', 'refresh');
			} else {
				$this->ion_auth->generate_activation($id);

				// Get new code
				$new_code = $this->db->where(array('email' => $google['email']))->limit(1)->get('users')->row_array();;

				$email_content = '<h2>Hello, <b>' . ucfirst($users['first_name']) . ' ' . ucfirst($users['last_name']) . '</b></h2>';
				$email_content .= '<p>Below is the the <i>activation code</i> that you just requested</p>';
				$email_content .= '<h3><b>' . $new_code['active_code'] . '</b></h3>';
				$email_content .= '<p>You can paste the code to the activation page</p>';
				$email_content .= '<p><b>- OR -</b></p>';
				$email_content .= '<p>You can click URL below to activate and login directly<br>';
				$email_content .= '<b>' . anchor('activation/user/' . $users['id'] . '/' . $new_code['active_code']) . '</b></p>';

				email_send($users['email'], 'Activation Code Request', $email_content);

				// notification if sgenerate uccess
				$this->session->set_flashdata('message', 'Generate Code has been sent to your email at <b>' . $users['email'] . '</b><br>Please check your <b>inbox</b> !');
				$this->session->set_flashdata('type', 'success');
				redirect('activation');
			}
		} else {
			redirect('login', 'refresh');
		}
	}

	// cancel google register
	function clear()
	{
		$this->session->unset_userdata('token');
		$this->session->unset_userdata('google');
		ob_end_clean();
		redirect('login', 'refresh');
	}

	// log the user out
	function logout()
	{
		$data['title'] = "Logout";

		// log the user out
		$logout = $this->ion_auth->logout();

		if ($logout) {
			$this->session->set_flashdata('message', $this->ion_auth->messages());
			$this->session->set_flashdata('type', 'success');
		} else {
			$this->session->set_flashdata('message', $this->ion_auth->errors());
			$this->session->set_flashdata('type', 'error');
		}

		$this->session->unset_userdata('token');
		$this->session->unset_userdata('google');
		$this->session->unset_userdata('userData');

		ob_end_clean();
		redirect('login', 'refresh');
	}

	function _get_csrf_nonce()
	{
		$this->load->helper('string');
		$key   = random_string('alnum', 8);
		$value = random_string('alnum', 20);
		$this->session->set_flashdata('csrfkey', $key);
		$this->session->set_flashdata('csrfvalue', $value);

		return array($key => $value);
	}

	function _valid_csrf_nonce()
	{
		if (
			$this->input->post($this->session->flashdata('csrfkey')) !== FALSE &&
			$this->input->post($this->session->flashdata('csrfkey')) == $this->session->flashdata('csrfvalue')
		) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
}
