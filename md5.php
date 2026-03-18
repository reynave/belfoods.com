<?php 
// bisa buatkan cde untuk md5 hash generator dengan inputan string dan tombol generate, lalu tampilkan hasilnya di bawah tombol generate?
// admin@belfoods.com
//b3l0ood5@2026
?>
<form method="post">
    <input type="text" name="input_string" placeholder="Masukkan string" required>
    <button type="submit" name="generate">Generate MD5</button>
</form>

<?php
if (isset($_POST['generate'])) {
    $input = $_POST['input_string'];
    $md5_hash = md5($input);
    echo "<p>MD5 Hash: <strong>{$md5_hash}</strong></p>";
}
?>