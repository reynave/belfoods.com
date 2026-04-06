$path = "en-2026-04-06.sql"
$sql = Get-Content -Raw -Path $path

$startMarker = "-- Dumping data for table u1067365_mirrel5_id.cms_content"
$endMarker = "-- Dumping structure for table u1067365_mirrel5_id.cms_content_column"

$start = $sql.IndexOf($startMarker)
$end = $sql.IndexOf($endMarker)

if ($start -lt 0 -or $end -lt 0 -or $end -le $start) {
    throw "cms_content marker block not found"
}

$prefix = $sql.Substring(0, $start)
$block = $sql.Substring($start, $end - $start)
$suffix = $sql.Substring($end)

# Phrase-based replacements only to avoid corrupting URLs/SRC and SQL structure.
$replacements = @(
    @("Menyambut Ramadhan Seru Dengan Anak", "Welcoming Ramadan Joyfully with Children"),
    @("Mempersiapkan Acara Special Natal", "Preparing a Special Christmas Event"),
    @("PT Belfoods Indonesia Ekspor Perdana Nugget ke Jepang", "PT Belfoods Indonesia's First Nugget Export to Japan"),
    @("Belfoods Berhasil Tembus Pasar Filipina", "Belfoods Successfully Enters the Philippine Market"),
    @("Belfoods Raih Penghargaan 'Golden Brand Of The Year 2025'", "Belfoods Wins the 'Golden Brand Of The Year 2025' Award"),
    @("Bersama Belfoods Bikin Untung!", "Grow Your Profits with Belfoods!"),
    @("Belanja Belfoods di Official Store Sekarang!", "Shop Belfoods at the Official Store Now!"),
    @("Tentang Belfoods", "About Belfoods"),
    @("Mencuci Tangan : Tangan Bersih, Hidup Sehat", "Handwashing: Clean Hands, Healthy Life"),
    @("Bekal Berkualitas Penting Untuk Keluarga", "Quality Lunchboxes Are Important for the Family"),
    @("Lezatnya Bekal<br>Cinta Ibu", "Delicious Lunchbox<br>Made with Mom's Love"),
    @("Berat Bersih", "Net Weight"),
    @("Untuk 4 porsi", "For 4 servings"),
    @("Untuk 4 Porsi", "For 4 servings"),
    @("Bahan-Bahan", "Ingredients"),
    @("Cara Membuat", "How to Make"),
    @("Sumber :", "Source:"),
    @("Sumber:", "Source:"),

    @("Rasakan kelezatan premium dari", "Experience the premium deliciousness of"),
    @("Terbuat dari", "Made from"),
    @("secara konsisten berinovasi dengan menghadirkan sajian produk premium berkualitas tinggi yang sesuai dengan tren terkini", "consistently innovates by presenting high-quality premium products aligned with the latest trends"),
    @("Kami percaya akan memberikan pengalaman yang lebih mewah dan berkualitas kepada konsumen.", "We believe in delivering a more premium and high-quality experience to consumers."),
    @("Oleh karena itu, Royal by Belfoods akan semakin dikenal sebagai merek yang dapat diandalkan", "Therefore, Royal by Belfoods is increasingly recognized as a trusted brand"),
    @("produk-produk berkualitas tinggi yang tetap mengikuti tren.", "high-quality products that stay on trend."),
    @("Nikmati kelezatan serta kualitas produk yang premium!", "Enjoy the premium taste and quality of our products!"),
    @("Belfoods mempersembahkan produk berkualitas selezat buatan Ibu, Nikmati kelezatan serta kualitas produk yang premium!", "Belfoods presents high-quality products as delicious as homemade cooking. Enjoy the premium taste and quality of our products!"),
    @("Belfoods mempersembahkan produk berkualitas selezat buatan Ibu,", "Belfoods presents high-quality products as delicious as homemade cooking,"),
    @("dan memberikan", "and delivers"),

    @("Perlu siasat khusus untuk memberikan bekal berkualitas", "A special strategy is needed to provide high-quality lunchboxes"),
    @("Selektif Memilih Bahan", "Be Selective in Choosing Ingredients"),
    @("Perhatikan Kebutuhan Gizi", "Pay Attention to Nutritional Needs"),
    @("Libatkan Anak", "Involve Children"),
    @("Hidangkan Semenarik Mungkin", "Serve It as Attractively as Possible"),
    @("Kreasikan bekal spesial Anda dengan mudah dan praktis tapi tetap memenuhi kandungan nutrisi yang dibutuhkan oleh anak.", "Create special lunchboxes easily and practically while still meeting the nutritional intake children need."),
    @("Simak tips memilih bekal praktis bernutrisi untuk anak berikut ini :", "Check out the following tips for choosing practical and nutritious lunchboxes for children:"),
    @("Hasil olahan makanan yang baik diawali dari pemilihan bahan baku yang berkualitas.", "Good food preparation starts with selecting high-quality ingredients."),
    @("Pastikan bekal anak Anda mengandung unsur gizi lengkap seperti karbohidrat, protein, vitamin dan mineral.", "Make sure your child lunchbox contains complete nutrients such as carbohydrates, protein, vitamins, and minerals."),
    @("Ajak anak mulai dari memilih menu makanannya, berbelanja, hingga proses pembuatannya.", "Invite children to take part from choosing the menu, shopping, to preparing it."),

    @("sangat penting menjaga kebersihan tangan", "it is very important to maintain hand hygiene"),
    @("Berikut tahapan yang tepat dalam mencuci tangan, Mom:", "Here are the proper steps for handwashing, Mom:"),
    @("Selamat membimbing kesehatan keluarga, Mom", "Wishing your family good health, Mom"),
    @("Yuk bimbing anak-anak agar rutin mencuci&nbsp;tangan.", "Let guide children to wash their hands regularly."),
    @("Banyak penyakit yang disebarkan oleh mereka yang tidak mencuci tangan dengan sabun, air bersih, dan air mengalir.", "Many diseases are spread by people who do not wash their hands with soap, clean water, and running water."),
    @("Jika air bersih tidak dapat diakses, seperti umum di banyak bagian dunia, menggunakan sabun dan air tersedia.", "If clean water is not accessible, as is common in many parts of the world, use whatever soap and water are available."),
    @("Jika sabun dan air tidak tersedia, gunakan&nbsp;pembersih tangan berbasis alkohol yang mengandung setidaknya 60% alkohol untuk membersihkan tangan.", "If soap and water are unavailable, use an alcohol-based hand sanitizer containing at least 60% alcohol."),
    @("WHO menyampaikan kebanyakan infeksi terkait perawatan kesehatan dapat dicegah melalui kebersihan tangan yang baik, membersihkan tangan pada saat yang tepat&nbsp;dan dengan cara yang tepat.", "WHO states that most healthcare-related infections can be prevented through good hand hygiene, by cleaning hands at the right time and in the right way."),

    @("Dengan bekal sarapan yang bergizi,", "With a nutritious breakfast lunchbox,"),
    @("Ibu sudah memberikan", "Mothers are already giving"),
    @("masa depan untuk anak bisa berprestasi.", "a better future for children to achieve."),
    @("Kecukupan nutrisi bagi anak untuk tumbuh dan berkembang adalah hal yang sangat penting", "Adequate nutrition for children to grow and develop is very important"),
    @("Agar kebutuhan gizi bias terpenuhi dengan baik,", "To ensure nutritional needs are met properly,"),
    @("Jika anak tidak sempat sarapan di rumah", "If children do not have time for breakfast at home"),
    @("jajanan tidak sehat", "unhealthy snacks"),

    @("Belfoods menyediakan various menu options chicken nugget, sosis dan bakso", "Belfoods provides various menu options such as chicken nuggets, sausages, and meatballs"),
    @("yang bisa melayani untuk digoreng ditempat menjadi ready-to-eat food", "which can be fried on-site into ready-to-eat food"),
    @("atau bisa juga untuk dibawa untuk pulang", "or can also be taken home"),
    @("setelah beraktivitas di Water park.", "after activities at the water park."),

    @("Untuk lebih mendekatkan diri kepada customer", "To get closer to customers"),
    @("Belfoods hadir di beberapa lokasi", "Belfoods is present in several locations"),
    @("berbagai variasi menu", "various menu options"),
    @("makanan siap saji", "ready-to-eat food"),

    @("menjanjikan kelezatan di setiap gigitannya.", "promises deliciousness in every bite."),
    @("menghadirkan sajian favorit seluruh keluarga", "brings a favorite serving for the whole family"),
    @("diolah dari daging ayam berkualitas", "processed from high-quality chicken meat"),

    @("Hubungi kami untuk informasi lebih lanjut tentang Kemitraan Belfoods", "Contact us for more information about Belfoods partnerships"),
    @("dan dapatkan penawaran Harga Spesial!", "and get a special price offer!"),

    @("Naget Ayam", "Chicken Nugget"),
    @("Sosis Ayam", "Chicken Sausage"),
    @("Bakso Ayam", "Chicken Meatballs"),
    @("Bakso Daging", "Meatballs"),
    @("Ayam Goreng Renyah", "Crispy Fried Chicken"),
    @("Kentang Goreng Beku", "Frozen French Fries"),
    @("Ayam Stik", "Chicken Stick"),

    @("untuk kemudahan anda", "for your convenience"),
    @("untuk kemudahan Anda", "for your convenience"),
    @("di meja makan anda", "on your dining table"),
    @("di meja makan Anda", "on your dining table"),
    @("rumah anda", "your home"),
    @("rumah Anda", "your home"),

    @("Saus Tomat", "Tomato Sauce"),
    @("Saus Madu Lemon", "Honey Lemon Sauce")
)

foreach ($pair in $replacements) {
    $block = $block.Replace($pair[0], $pair[1])
}

$block = $block.Replace("Net Weight :", "Net Weight:")

$newSql = $prefix + $block + $suffix
Set-Content -Path $path -Value $newSql -Encoding UTF8
Write-Output "DONE_SAFE"