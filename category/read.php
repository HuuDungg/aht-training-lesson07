<?php
include("./database/database.php");

$sql = "SELECT * FROM `category`;";

echo "<table border='1'>";
echo "<tr><th>ID</th><th>Name</th></tr>";

foreach ($conn->query($sql) as $row) {
    echo "<tr>";
    echo "<td>" . $row['id'] . "</td>";
    echo "<td>" . $row['name'] . "</td>";
    echo "<td> <a href='/aht-training/lession07/category/delete.php?id=" .  $row['id'] . "'>Delete</a>";
    echo "  <a href='/aht-training/lession07/category/update.php?id=" .  $row['id'] . "'>Edit</a> </td>";
    echo "</tr>";
}

echo "</table>";
