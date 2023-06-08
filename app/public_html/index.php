<html>

<head>
  <title>PHP Test</title>
</head>

<body>
  <?php
  $servername = "mariadb";
  $username = "AgBRAT";
  $password = "JScov3MgrROl8FXBZMofO+ixsVWo0IcQbV55sNSq3TQ=";
  $dbname = "creations";
  $port = "3306";

  try {
    $conn = new PDO("mysql:host=$servername;port=$port;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected succesfully";
  } catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
  }
  ?>
</body>

</html>