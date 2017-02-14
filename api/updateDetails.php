<?php 
// Including database connections
require_once 'database.php';
// Fetching the updated data & storin in new variables
$data = json_decode(file_get_contents("php://input")); 
// Escaping special characters from updated data
$id = mysqli_real_escape_string($con, $data->id);
$name = mysqli_real_escape_string($con, $data->name);
$desc = mysqli_real_escape_string($con, $data->desc);
$price = mysqli_real_escape_string($con, $data->price);
$qty = mysqli_real_escape_string($con, $data->qty);

// mysqli query to insert the updated data
$query = "UPDATE products SET product_name='$name',product_desc='$desc',product_price='$price',product_qty='$qty' WHERE product_id=$id";
mysqli_query($con, $query);
echo true;
?>

