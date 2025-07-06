<?php
    include("keselamatan.php");
    include("sambungan.php");
    include("penjual_menu.php");

    if (isset($_POST["submit"])) {
        $idproduk = $_POST["idproduk"];
        $namaproduk = $_POST["namaproduk"];
        $harga = $_POST["harga"];
        $butiran = $_POST["butiran"];
        $namafail = $idproduk.".png";
        $sementara = $_FILES["namafail"]["tmp_name"];
        move_uploaded_file($sementara, "imej/".basename($namafail));
        
        $sql = "update produk set namaproduk = '$namaproduk',
              gambar = '$namafail', harga = $harga, butiran = '$butiran'
              where idproduk = '$idproduk'";
        $result = mysqli_query($sambungan, $sql);
        if ($result == true)
            echo "<br><center>Berjaya kemaskini</center>";
        else
            echo "<br><center>Ralat : $sql<br>".mysqli_error($sambungan)."</center";
    }
    
    if (isset($_GET["idproduk"]))
        $idproduk = $_GET["idproduk"];

    $sql = "select * from produk where idproduk = '$idproduk'";

    $result = mysqli_query($sambungan, $sql);
    while($produk = mysqli_fetch_array($result)) {
        $namaproduk = $produk["namaproduk"];
        $namafail = $idproduk.".png";
        $harga = $produk["harga"];
        $butiran = $produk["butiran"];
    }
?>

<link rel="stylesheet" href="aborang.css">
<link rel="stylesheet" href="abutton.css">

<h3 class="panjang">KEMASKINI produk</h3>
<form class="panjang" action="produk_update.php" method="post" enctype="multipart/form-data">
<table>
    <tr>
        <td>ID produk</td>
        <td><input type="text" name="idproduk" value="<?php echo $idproduk; ?>"></td>
    </tr>
    <tr>
        <td>Nama Produk</td>
        <td><input type="text" name="namaproduk" value="<?php echo $namaproduk; ?>"></td>
    </tr>
    <tr>
        <td class="warna">Gambar</td>
        <td><input type="file" name="namafail">
            <?php echo "<img width=100 src='imej/".$namafail."'>";?>
        </td>
    </tr>
    <tr>
        <td>Harga</td>
        <td><input type="text" name="harga" value="<?php echo $harga; ?>"></td>
    </tr>
    <tr>
        <td>Butiran</td>
        <td><textarea name="butiran" cols="24" rows="5">
            <?php echo $butiran; ?></textarea>
        </td>
    </tr>
    </table>
    <button class="update" type="submit" name="submit">Update</button>
</form>