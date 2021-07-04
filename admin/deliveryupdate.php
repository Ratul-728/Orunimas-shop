<?php
    require "connection.php";

    //If invoice no:01072021213238 deliver to Delivery man
    $invo = '01072021213238';

    //Update status to delivery to delivery man
    $qrydeup = "UPDATE `orderlist` SET `st`='2' WHERE invoice = ".$invo;
    $conn->query($qrydeup);

    //If invoice no:01072021213504 delivery successfull
    $successinvo = "01072021213504";
    $qrydesucc = "UPDATE `orderlist` SET `st`='3' WHERE invoice = ".$successinvo;
    $conn->query($qrydesucc);

    //If invoice no:01072021215209not Successfull
    $notsuccessinvo = "01072021215209";
    $qrydenotsucc = "UPDATE `orderlist` SET `st`='4' WHERE invoice = ".$notsuccessinvo;
    $conn->query($qrydenotsucc);

    //Update the Quantity which was not delivery successfully

    $qrych = "SELECT `productid`, `qty` FROM `orderlist` WHERE `invoice` = ".$notsuccessinvo;
    $resultch = $conn->query($qrych);
    $rowch = $resultch->fetch_assoc();

    $qryupqty = "UPDATE `products` SET `qty`=`qty`+".$rowch["qty"].",`st`='1' WHERE `id` = ".$rowch["productid"];
    if($conn->query($qryupqty) == true){
        echo "Successfully update delivery information";
    }else{
        echo "Something went wrong";
    }


?>