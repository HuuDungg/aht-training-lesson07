<?php
include("../database/database.php");
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    var_dump($conn);
    try {
        if (!empty($name)) {
            $sql = "INSERT INTO `category` (`name`) VALUES (?);";
            $stmt = $conn->prepare($sql);
            $stmt->execute([$name]);
            header("Location: /aht-training/lession07/");
            exit;
        } else {
            echo "Tên không được để trống.";
        }
    } catch (Error $e) {
        var_dump($e);
    }
}
