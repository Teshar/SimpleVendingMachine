// Application module
var VendingMachine = angular.module('VendingMachine',[]);
VendingMachine.controller("DbController",['$scope','$http', function($scope,$http)
{

	getInfo();
	getCoinInfo();
	var insertedCoinsTotal = 0.00;
	function getInfo()
	{
		// Sending request to prodDetails.php files
		$http.get("api/prodDetails.php").then(function (response) {$scope.details = response.data;});
		//$("#mainTable").animate(100);
	}

	function getCoinInfo()
	{
		$http.get("api/coinDetails.php").then(function (responseCoins) {$scope.Coindetails = responseCoins.data;});
	}

	 // Enabling show_form variable to enable Add employee button
    $scope.show_form = true;
    // Function to add toggle behaviour to form
    $scope.formToggle = function() {
        $('#prodForm').slideToggle();
        $('#editForm').css('display', 'none');
        $('#prod_name').val("");
    }
    
     $scope.insertInfo = function(info) 
     {
        $http.post('api/insertDetails.php', 
        {
            "name": info.name,
            "desc": info.desc,
            "price": info.price,
            "qty": info.qty
        }).then(function(response) 
        	{
            if (response.data == true) 
            	{
            		console.log("Added!");
                	getInfo();
                	$("#prodForm").css('display', 'none');
            	}
        	});
    }

    $scope.currentProd = {};
    $scope.editInfo = function(info) {
        $scope.currentProd = info;
        $('#ProdForm').slideUp();
        $('#editForm').slideToggle();
    }
    
    $scope.UpdateInfo = function(info) {
        $http.post('api/updateDetails.php', {
            "id": info.product_id,
            "name": info.product_name,
            "desc": info.product_desc,
            "price": info.product_price,
            "qty": info.product_qty
        }).then(function(response) {
            $scope.show_form = true;
            if (response.data == true) {
        		$('#editForm').slideUp();
                getInfo();
            }
        });
    }
    $scope.updateMsg = function(emp_id) {
        $('#editForm').css('display', 'none');
    }

    $scope.deleteInfo = function(info) {
        $http.post('api/deleteDetails.php', {
            "del_id": info.product_id
        }).success(function(response) {
            if (response.data == true) {
                getInfo();
            }
        });
    }



    $scope.clickCoin = function(value) 
    {
		//console.log(value);
		
		insertedCoinsTotal = +insertedCoinsTotal + +value;
		console.log(insertedCoinsTotal);
		
		$scope.coinTot = insertedCoinsTotal;
		
		calc($scope.prodPrice);

    }


    $scope.clickProd = function(info) 
    {
		console.log(info);
		$('#itemTxt').text(""+info.product_name + " Selected ");
		$('#itemPrice').text("R"+info.product_price);
		$scope.prodPrice = info.product_price;
		calc($scope.prodPrice);

    }

	function calc(productPrice)
	{
		
		var insertedCoins = $scope.coinTot;
		
		if(productPrice>insertedCoins) // Not Enough Money
		{
			$('#message').text("Please insert R"+ (productPrice-insertedCoins)+ " more");
			
			$('#purchaseBtn').addClass('btn-danger');
			$('#purchaseBtn').prop('disabled', true);
			
		}
		else if(productPrice<insertedCoins) //Excess Money
		{
			$('#message').text("R"+ (insertedCoins-productPrice)+ " change due");
			
			$('#purchaseBtn').removeClass('btn-danger');
			$('#purchaseBtn').addClass('btn-success');
			$('#purchaseBtn').prop('disabled', false);
		}
		else if (productPrice=insertedCoins) //Exact amount given
		{
		$('#message').text("exact amount given");
		
			$('#purchaseBtn').removeClass('btn-danger');
			$('#purchaseBtn').addClass('btn-success');
			$('#purchaseBtn').prop('disabled', false);
			
		}
		
		if ($scope.prodPrice ==0)
		{
				$('#message').text("");
				$('#purchaseBtn').prop('disabled', true);
				$('#purchaseBtn').removeClass('btn-success');



		}
		
		
		
	}
















}]);