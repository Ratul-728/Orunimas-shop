<?php
    require"../admin/connection.php";

    //Check Voucher applied or not.
    //Assume that voucher is applied and voucher id is 1;
    $voucherid = 1;
    if($voucherid == ''){
        $appliedvoucher = false;
        $isdicount = '0';
        $discountprice = 0;
    }else{
        $appliedvoucher = true;

        //Voucher information
        $qryvoucher = "SELECT `amount`, `ispercent` FROM `voucher` WHERE id = ".$voucherid;
        $resultv = $conn->query($qryvoucher);
        $rowv = $resultv->fetch_assoc();

        $ispercent = $rowv["ispercent"];
        $amount = $rowv["amount"];
        $isdicount = '1';
    }


    //Generate invoice number
    $invoiceno = date('dmYHis');

    // Error flag
    $errflag = 0;

    //Suppose user add 3 products to his cart and place order. After place order, we get product id like 3,4,5 , qty , user id, user phone number user address;
    //We can use loop and place every order into our database from his cart. Here I use default value

    for($i = 5; $i < 8; $i++){
        //Require information comes from front end
        $productid = $i; //let $i is products id from user carts

        //Product information from database
        $qrycheck = "SELECT `name`, `price`, `weights`, `taste`, `qty`,`st` FROM `products` WHERE id = ".$productid;
        $resultcheck = $conn->query($qrycheck);
        $rowcheck = $resultcheck->fetch_assoc();

        //Check stock available or not. 1 means available and 2 means stock out.
        if($rowcheck["st"] == 1){
            $productname = $rowcheck["name"];

            $price = $rowcheck["price"];
            //If voucher applied, price will be change
            if($appliedvoucher){
                //If voucher is %
                if($ispercent == '1'){
                    $discountprice = ($price * $amount) / 100;
                    $price = $price - $discountprice;
                }
                //If fixed amount
                else{
                    if($amount > 0){
                        if($price >= $amount){
                            $price -= $amount;
                            $discountprice = $amount;
                            $amount = 0;
                        }else{
                            $amount -= $price;
                            $discountprice = $price;
                            $price = 0;
                        }
                    }
                }
            }
            $weights = $rowcheck["weights"];
            $taste = $rowcheck["taste"];

            //Order information from frontend
            $qty = 2;
            $userid = 1;
            $userphone = "01555566666";
            $useraddress = "House no: 23"; $useraddress = addslashes($useraddress);

            //Inside dhaka or not comes from checkbox. value 1 for inside dhaka and value 2 for outside dhaka. Take random value
            if($i % 2 == 0){
                $insidedhk = "1";
                $deliverycharge = 60;
            }else{
                $insidedhk = "2";
                $deliverycharge = 100;
            }

            $qryplaceorder = "INSERT INTO `orderlist`(`invoice`, `productname`, `productid`, `price`, `qty`, `weights`, `taste`, `userid`, `userphone`, `useraddress`,`insidedhaka`,`deliverycharge`, `makedt`, `isdiscount`,`discountprice`) 
                                        VALUES ('".$invoiceno."','".$productname."',".$productid.",".$price.",".$qty.",'".$weights."','".$taste."',".$userid.",'".$userphone."','".$useraddress."','".$insidedhk."',".$deliverycharge.",sysdate(),'".$isdicount."', ".$discountprice.")";

            if ($conn->query($qryplaceorder) == FALSE) {
                $errflag++;
            }else{
                //Reduce Quantity and we can not give permission to order more then stock
                $redqty = $rowcheck["qty"] - $qty;
                if($redqty == 0){
                    $st = 0;
                }else{
                    $st = 1;
                }
                $qryreduceqty = "UPDATE `products` SET `qty`=".$redqty.",`st`='".$st."' WHERE id = ".$productid;
                $conn->query($qryreduceqty);
            }
        }else{

            //Thus product Name is unique.
            echo "Sorry! Stock is out for ".$rowcheck["name"]." which is taste ".$rowcheck["taste"]; echo "<br>";
            echo "Here is some suggested product which is almost similar to your product";echo "<br>";

            $qrysimilarproduct = "SELECT `name`,`price`,`qty`,`weights`,`taste` FROM `products` where `st`= 1 and (`price` > (".$rowcheck["price"]." - 100) and  `price` < (".$rowcheck["price"]." + 100) ) and `name` = '".$rowcheck["name"]."'";
            $resultsmpr = $conn->query($qrysimilarproduct);
            if($resultsmpr->num_rows > 0){
                echo "Product Name---------- Stock available-------Price---------Taste---------Weights<br>";
                while($rowsmpr = $resultsmpr->fetch_assoc()){
                    echo $rowsmpr["name"];echo "------------------------";
                    echo $rowsmpr["qty"]; echo "-----------------";
                    echo $rowsmpr["price"]; echo "Take--";
                    echo $rowsmpr["taste"]; echo "----------";
                    echo $rowsmpr["weights"];
                    echo "<br>";
                }
            }else{
                echo "Sorry there is no similar product in our stock";echo "<br>";
            }

            echo "<br><br>";
        }

    }

    if($errflag == 0){
        //Show invoice to the customer
        echo "Your invoice no: ".$invoiceno; echo "<br>";

        $qryorderinfo = "SELECT  `productname`, `price`, `qty`, `weights`, `taste`, `userphone`, `useraddress`,`deliverycharge`,`makedt` 
                            FROM `orderlist` WHERE invoice = ".$invoiceno;
        
        $resultoi = $conn->query($qryorderinfo);
        $prouctlist = 1;
        $totalprice = 0;
        while($rowoi = $resultoi->fetch_assoc()){
            $totalprice += ($rowoi["price"] * $rowoi["qty"]);
            $usradd = $rowoi["useraddress"];
            $usrphn = $rowoi["userphone"];
            $makedt = $rowoi["makedt"];
            
            echo "<br>";
            echo "Product no: ".$prouctlist; echo "<br>";
            echo "Product Name: ".$rowoi["productname"];echo "<br>";
            echo "Price (".$rowoi["price"]."*".$rowoi["qty"]."): ".($rowoi["price"] * $rowoi["qty"]); echo "Taka<br>";
            echo "Quantity: ".$rowoi["qty"]; echo "<br>";
            $prouctlist++;

        }
        echo"---------------------------------------- <br><br>";
        echo "Your Phone number: ".$usrphn; echo "<br>";
        echo "Delivery Address: ".$usradd; echo "<br>";
        echo "Order Date: ".$makedt; echo "<br>";
        echo "Total amount need to paid: ".($totalprice+$rowoi["deliverycharge"])."Taka<br>";
        echo "Be sure to count ".($totalprice+$rowoi["deliverycharge"])."Taka while paying delivery man<br>Happy Shopping!";

    }else{
        //redirerct to desire page and show error
    }

?>