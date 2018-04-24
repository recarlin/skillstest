<?php
	//Allows access to database authentication
	require("config.php");
	//Set variables from get data
	$type = $_GET["type"];
	$field = $_GET["field"];
	$term = $_GET["term"];
	//Establish a connection to database
	$conn = mysqli_connect($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME) or die('Error connecting to MySQL server.');
	//Query to call based on type
	if ($type == "parent") {
		$query = "SELECT * FROM parentParts WHERE $field LIKE '%$term%'";
	} else {
		$query = "SELECT * FROM childParts WHERE parentPart LIKE '%$term%'";
	}
	//Execute the query with established connection
	$result = mysqli_query($conn, $query);
	//Gather results into an array
	$array = mysqli_fetch_all($result, MYSQLI_ASSOC);
	//Send results back to the JS after encoding it to JSON
	echo json_encode($array);
	//Close connection
	mysqli_close($conn);
?>