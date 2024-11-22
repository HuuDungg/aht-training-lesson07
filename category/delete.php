<?php
include("../database/database.php");
$id = $_GET["id"];
try {
    if (!empty($id)) {
        $sql = "DELETE FROM category WHERE id = ?;";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$id]);
        header("Location: /aht-training/lession07/");
        exit;
    } else {
        echo "Tên không được để trống.";
    }
} catch (Error $e) {
    var_dump($e);
}
