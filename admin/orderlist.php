<?php
    require "connection.php";

    //Pending Order List
    echo "No-----Invoice Nunmber----Product Name-----Price-------Quantity----Total price----
        Weights---Taste-----User Phone------User Address--------Inside Dhaka?--         
        Delivery Charge---Order Date----Delivery Status<br><br>";

    $no = 0;
    $oldin = '';
    $qrylist = "SELECT `invoice`, `productname`, `productid`, `price`, `qty`, `weights`, `taste`, `userid`, `userphone`, `useraddress`,
                 `insidedhaka`, `deliverycharge`, `makedt`, `st` FROM `orderlist`";
    $resultlist = $conn->query($qrylist);
    while($rowlist = $resultlist->fetch_assoc()){

        //Delivery Status
        if($rowlist["st"] == 1){
            $st = "processing";
        }else if($rowlist["st"] == 2){
            $st = "Deliver to delivery man";
        }else if($rowlist["st"] == 3){
            $st = "Delivery Complete";
        }else if($rowlist["st"] == 4){
            $st = "Delivery Cancelled";
        }
        
        //Inside Dhaka or Not
        if($rowlist["insidedhaka"] == 1){
            $inside = "Yes";
        }else{
            $inside = "No";
        }

        //Invoice Same
        if($oldin != $rowlist["invoice"]){
            echo "<br>";
            $oldin = $rowlist["invoice"];
            $no++;

            echo $no;echo "-------";
            echo $oldin;echo "----";
        }else{
            echo "----------------------------------";
        }

        echo $rowlist["productname"];echo "----------";
        echo $rowlist["price"];echo "Taka-----";
        echo $rowlist["qty"];echo "-------";
        echo $rowlist["price"] * $rowlist["qty"];echo "Taka--------";
        echo $rowlist["weights"];echo "--------";
        echo $rowlist["taste"];echo "-----";
        echo $rowlist["userphone"];echo "-----";
        echo $rowlist["useraddress"];echo "----------";
        echo $inside;echo "--------------";
        echo $rowlist["deliverycharge"];echo "Taka-----";
        echo $rowlist["makedt"];echo "-----";
        echo $st;
        echo "<br>";

    }
?>