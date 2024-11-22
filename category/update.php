<?php
include("../database/database.php");

$id = $_GET["id"];

$sql = "SELECT * FROM `category` WHERE ID = :id";
$stmt = $conn->prepare($sql);

$stmt->bindParam(':id', $id, PDO::PARAM_INT);

$stmt->execute();

$data = $stmt->fetch(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Category</title>
</head>

<body>
    <form action="/aht-training/lession07/category/update.php" method="POST">
        id <input name="code" readonly type="text" value="<?php echo htmlspecialchars($data['id']); ?>">
        name <input type="text" name="name" value="<?php echo htmlspecialchars($data['name']); ?>">
        <button type="submit">Save</button>
    </form>
</body>

</html>
<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['code'];
    $name = $_POST['name'];

    $sql = "UPDATE `category` SET `name` = ? WHERE `ID` = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$name, $id]);

    if ($stmt->execute()) {
        header("Location: /aht-training/lession07/");
        exit;
    } else {
        echo "Error updating category.";
    }
}
?>