<?php
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

     if (!isset($SESSION["idpengguna"])) {
         echo "<script>winodww.location='logout.php'</script>";
     } 
?>
    