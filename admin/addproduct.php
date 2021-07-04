<?php
    require "connection.php";

    //Require information comes from frontend
    $name = 'Orange'; $name = addslashes($name);
    $qty = 5;
    $price = 150.50;
    $weight = '1kg'; $weight = addslashes($weight);
    $taste = 'Salty'; $taste = addslashes($taste);
    $details = "China's Orange "; $details = addslashes($details);

    //Query for store the product
    $qry = "INSERT INTO `products`( `name`, `qty`, `price`, `weights`, `taste`, `details`, `makedt`) 
                            VALUES ('".$name."',".$qty.",".$price.",'".$weight."','".$taste."','".$details."',sysdate())";

    if ($conn->query($qry) == TRUE) {
        echo "Successfully Added Product!";
        //redirerct to desire page
    } else {
        echo "Something went wrong!";
        //redirerct to desire page and show error
    }

?>