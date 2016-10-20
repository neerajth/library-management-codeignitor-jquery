<?php
class Books_model extends CI_Model {

        public function __construct()
        {
                $this->load->database();
        }
    
        public function get_books($slug = FALSE)
        {
                if ($slug === FALSE)
                {
                        $sqlquery="select books.id as bookid, books.*, books_detail.* from books, books_detail where books.isbn = books_detail.isbn;";
                        $query = $this->db->query($sqlquery);
                        
                        return $query->result_array();
                }
        }
        public function get_categories($slug = FALSE){
            if ($slug === FALSE)
                {
                        $sqlquery="select * from books_category;";
                        $query = $this->db->query($sqlquery);
                        
                        return $query->result_array();
                }
        }
        public function get_customers($slug = FALSE){
            if ($slug === FALSE)
                {
                        $sqlquery="select * from customers;";
                        $query = $this->db->query($sqlquery);
                        
                        return $query->result_array();
                }
        }
    
        public function addBook(){
            $this->load->helper('url');

            $data = array(
                'isbn' => $this->input->post('isbn'),
                'title' => $this->input->post('title')
            );
            
            $data_book_detail = array (
                'isbn' => $this->input->post('isbn'),
                'category_id' => $this->input->post('category')
            );
            
            $this->db->insert('books_detail', $data_book_detail);
            
            return $this->db->insert('books', $data);
        }
    
        public function hireBook($bookid,$customerid){
            $this->load->helper('url');

            /*count number of books hired by customer*/
            $sqlquery="select count(*) as customer_counter from customer_books where customer_id = ".$customerid;
            $query = $this->db->query($sqlquery);
            $book_counter = $query->result_array();
            if ( (int)$book_counter[0]['customer_counter'] > 5) {
                return "13";
            }    
                
            $data_customer_books = array(
                'book_id' => $bookid,
                'customer_id' => $customerid,
                'date_issued' => date("Y-m-d")
            );
            
            $this->db->insert('customer_books', $data_customer_books);
            
            /*update book issued_status to 1*/
            $sqlquery="update books set issued_status=1 where id = ".$bookid;
            $query = $this->db->query($sqlquery);
                    
            return true;
        }
        
}
