<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form method="post" action="./category/create.php">
        name
        <input type="text" name="name">
        <button type="submit">Create</button>
    </form>
</body>

</html>
<?php
include_once("./category/read.php");
