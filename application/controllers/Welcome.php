<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

    public function __construct()
    {
            parent::__construct();
            $this->load->model('books_model');
            $this->load->helper('url_helper');
            $this->load->helper('html');
    }

    public function index()
    {       
        if ( isset($_REQUEST["addbook"]) && $_REQUEST["addbook"] == "Submit" )  {
            $this->books_model->addBook();
        }
        if ( isset($_REQUEST["b"]) && isset($_REQUEST["c"]) )  {
            $returned_check = $this->books_model->hireBook($_REQUEST["b"], $_REQUEST["c"]);
            
            if ( $returned_check == "13" ) {
                //echo "Selected customer is not allowed to hire more than 5 books";
            }
        }
            
            $data['books'] = $this->books_model->get_books();
            $data['categories'] = $this->books_model->get_categories();
            $data['customers'] = $this->books_model->get_customers();
        
            $data['title'] = 'Library Management';
            $data['level']=$this->uri->segment(3);
            $this->load->view('templates/header', $data);
            $this->load->view('welcome_message', $data);
            $this->load->view('templates/footer');            
    }
}
