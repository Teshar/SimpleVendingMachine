<?php 
// Including database connections
require_once 'database.php';
// Fetching the updated data & storin in new variables
$data = json_decode(file_get_contents("php://input")); 
// Escaping special characters from updated data
$id = mysqli_real_escape_string($con, $data->purchase_id);
$query = "UPDATE products SET product_qty = product_qty -1 WHERE product_id = $id";
mysqli_query($con, $query);
echo true;
?>