<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Welcome to CodeIgniter</title>

	<style type="text/css">

	</style>
    
    <script>
        $( document ).ready(function() {
            
            $( ".hirebook" ).click(function() {
                var bookid = $(this).attr("id");
                var customer = $("#customers_"+bookid).val();
                window.location.href="?b="+bookid+"&c="+customer;
            });
            
            
        });
    </script>
</head>
<body>

<div id="container">
	

	<div id="body">
        
        <h1>Add Book</h1>
        <div class="container-fluid">
        <form action="" method="post">
            <div class="row mainpanel">
                <div class="row">
                    <div class="col-md-3">ISBN</div>
                    <div class="col-md-3"><input type="text" name="isbn" id="isbn"></div>
                </div>
                <div class="row">
                    <div class="col-md-3">Title</div>
                    <div class="col-md-3"><input type="text" name="title" id="title"></div>
                </div>
                <div class="row">
                    <div class="col-md-3">Category</div>
                    <div class="col-md-3">
                        <select name="category" id="category">
                            <?php foreach ( $categories as $key => $value )  {?>
                                <option value="<?php echo $value['id']; ?>"><?php echo $value['category']; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6"><input type="submit" value="Submit" name="addbook" id="addbook"></div>
                    <div class="col-md-6"><input type="reset" value="Cancel" name="cancel" id="cancel"></div>
                </div>
            </div>
        </form>
        </div>
        
	<h1>Books Listing</h1> 
		
    <div class="grid">
        <div class="row">
            <div class="col-md-2">ISBN</div>
            <div class="col-md-2">category_id</div>
            <div class="col-md-2">Issued Status</div>
            <div class="col-md-2">Title</div>
            <div class="col-md-2">Select Customer</div>
            <div class="col-md-2">Action</div>
            
        </div>
    <?php foreach ($books as $key => $book) { ?>
        <div class="row">
            <div class="col-md-2"><?php echo $book['isbn']; ?></div>
            <div class="col-md-2"><?php echo $book['category_id']; ?></div>
            <div class="col-md-2"><?php echo $book['issued_status']; ?></div>
            <div class="col-md-2"><?php echo $book['title']; ?></div>          
            <div class="col-md-2">
                <?php if ( isset($book['issued_status']) && $book['issued_status'] == 0 ) { ?>
                    <select name="customers" id="customers_<?php echo $book['bookid']; ?>">
                    <?php foreach ( $customers as $key => $value ) { ?>
                        <option value="<?php echo $value['id'];?>"><?php echo $value['firstname'];?></option>
                    <?php } ?>
                    </select>
                <?php }?>
            </div>          
            <div class="col-md-2">
                <?php if ( isset($book['issued_status']) && $book['issued_status'] == 0 ) { ?>
                    <div id="<?php echo $book['bookid']; ?>" class="hirebook" style="cursor:pointer;">hire book</div>
                <?php } else { ?>
                    <div>Book is Issued.</div>
                <?php }?>
            </div>
        </div>
    <?php } ?>
    </div>
    
	</div>
</div>

</body>
</html>