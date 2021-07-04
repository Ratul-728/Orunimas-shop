<?php
    require "../admin/connection.php";

    //Here, We will take order whose stock out and unavailable. 
    //Then admin can see this pre order and when store is available, admin let know the user that order is available now and can order. 
    //We can get buyer information from userid.
    //Lets product id 11 (See in the database) is stock out and someone preorder this product. We store it different table which is preorder table

    //From Frontend
    $productid = 11;
    $qty = 3;

    $qrych = "SELECT `name`,`price`,`weights`,`taste` FROM `products` WHERE id = ".$productid;
    $resultch = $conn->query($qrych);
    $rowch = $resultch->fetch_assoc();



    $qrypreorder = "INSERT INTO `preorder`(`productid`, `productname`, `price`, `qty`, `weights`,`taste`, `userid`, `makedt`) 
                                VALUES (".$productid.",'".$rowch["name"]."',".$rowch["price"].",".$qty.",'".$rowch["weights"]."','".$rowch["taste"]."',1,sysdate())";
    //echo $qrypreorder;
    if($conn->query($qrypreorder)){
        //Go to the desire page;
        echo "Successfully place your pre order";
    }else{
        //Show error
        echo "Something went wrong";
    }


?>