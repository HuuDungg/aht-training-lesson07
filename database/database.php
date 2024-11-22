<?php
$servername = "127.0.0.1";
$username = "root";
$password = "12345678";
$port = 3306;
$dbname = "aht";

try {
    // Tạo kết nối với PDO
    $conn = new PDO("mysql:host=$servername;port=$port;dbname=$dbname", $username, $password);

    // Cấu hình PDO để ném ngoại lệ khi có lỗi
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Xử lý ngoại lệ nếu có lỗi
    die("Connection failed: " . $e->getMessage());
}
