<?php
defined('BASEPATH') or exit('No direct script access allowed');

$productPageAlert = 'Halaman ini adalah halaman produk, untuk mengubah tampilannya silahkan edit pada bagian konten dengan tipe produk';
$colorSettingsLabel = 'Pengaturan Warna code (#hex)';
$h4BackgroundColorLabel = 'H4. Background Color';
$h5BigTextColorLabel = 'H5. H1 Color (big text)';
$h6ContentTextColorLabel = 'H6. Content text color';
$productDetailButtonLabel = 'Selengkapnya';
$othersSuffix = 'Lainnya';
?>  
<?php if($core['table'] == 'cms_pages'){ ?>
    <br> 

    <div class="my-5">
        <div class="container ">
            <div class="row">
                <h1 class="text-center ">
                   <?php echo $core['pages']['title']?> 
                </h1>
                <div class="col-12 text-center mb-5">
                    <?php foreach($core['content']['galleries'] as $gallery) { ?>
                       <img src="<?php echo $gallery['img']; ?>"   height="200px" >
                       <div>
                            <?php echo $gallery['action']; ?>
                        </div>
                    <?php } ?>

                    <?php if($core['login']){ ?>
                    <div class="alert alert-warning">
                        <p><?php echo $productPageAlert; ?></p>
                        <?php echo $core['content']['insert']; ?>  <?php echo $core['content']['galleries_action']; ?>

                        <p><?php echo $colorSettingsLabel; ?></p>
                        <table class="table table-sm">
                            <tbody>
                                <tr>
                                    <td><strong><?php echo $h4BackgroundColorLabel; ?> </strong></td>
                                    <td>
                                        <div class="form-control fnText" <?php echo $core['content']['data']['h4']; ?>><?php echo $core['content']['h4']; ?><div>
                                    </td>
                                </tr>
                                 <tr>
                                    <td><strong><?php echo $h5BigTextColorLabel; ?></strong></td>
                                    <td>
                                        <div class="form-control fnText" <?php echo $core['content']['data']['h5']; ?>><?php echo $core['content']['h5']; ?><div>
                                    </td>
                                </tr>
                                 <tr>
                                    <td><strong><?php echo $h6ContentTextColorLabel; ?></strong></td>
                                    <td>
                                        <div class="form-control fnText" <?php echo $core['content']['data']['h6']; ?>><?php echo $core['content']['h6']; ?><div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                     </div>
                   <?php } ?>
                </div>
              
                
            </div>
              <div class="row fnSortable">
                        <?php foreach($core['content']['list'] as $row){ ?>

                        <div class="col-12 col-md-3 mb-5">
                            <div class="product-card">
                                <a href="<?php echo $row['href']; ?>">
                                    <div class="text-center">
                                    <img class="product-card-img" width="100%"
                                        src="<?php echo $row['img'] == '' ? 'https://dummyimage.com/900x900/fff/fd8103.jpg' : $row['img']; ?>" >
                                    </div>  
                                      <div class="product-card-info d-grid rounded-bottom-5">
                                        <h2 class="product-card-brand"><?php echo $core['pages']['name']; ?></h2>
                                           <h1 class="product-card-name" style="min-height: 60px;"><?php echo str_replace(strtoupper($core['pages']['name']), "", strtoupper($row['name'])); ?></h1>
                              
                                        <button class="btn  btn-light rounded-pill"><?php echo $productDetailButtonLabel; ?></button>
                                    </div>
                                </a>
                              
                            </div>
                            <div class="text-center"> <?php echo $row['action']; ?> </div>
                        </div>


                       
                        <?php } ?>
                    </div>
        </div>
    </div>



<?php }else{ ?>



    <section class=" bg-light-gold banner-product-detail" style="<?php echo $core['content']['h4'] == '' ? "":"background-color:#".$core['content']['h4']; ?>">
        <div class="wrapper">

            <div class="container ">
                <div class="row">
                    <div
                        class="col-12 col-md-6 order-2 order-md-1 align-content-center d-flex flex-column justify-content-center">
 
                        <h1 class="text-orange" style="<?php echo $core['content']['h5'] == '' ? "":"color:#".$core['content']['h5']; ?>"><?php echo $core['content']['name']?></h1>
                        <p style="<?php echo $core['content']['h6'] == '' ? "":"color:#".$core['content']['h6']; ?>"><strong class="fnText" <?php echo $core['content']['data']['h2']; ?>><?php  echo $core['content']['h2']?></strong></p>
                        <div style="<?php echo $core['content']['h6'] == '' ? "":"color:#".$core['content']['h6']; ?>" class="fnRichtext" <?php echo $core['content']['data']['content']; ?>> <?php echo $core['content']['content']; ?> </div>
                        <?php echo $core['content']['edit']; ?>
                    </div>
                    <div class="col-12 col-md-6 order-1 order-md-2 text-center mb-5">
                        <img src="<?php echo $core['content']['img']?>" width="100%">


                    </div>
                </div>
            </div>

        </div>
    </section>




    <section id="blog" class="py-5 blog-section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="text-center fw-bold mb-4"><?php echo $core['pages']['title']?> <?php echo $othersSuffix; ?></h2> 
                </div>
            </div>


            <div class="row ">
                <?php
                $n = 1;
                for($i = 0; $i < count($core['content']['list']); $i++){ 
                    $row = $core['content']['list'][$i]; 
                    if($row['id'] == $core['content']['id']) {
                        continue; // Lewati item yang sedang ditampilkan
                    }else{
                        $n++;
                    }   
                    ?>


                    <div class="col-12 col-md-3 mb-5">
                            <div class="product-card">
                                <a href="<?php echo $row['href']; ?>">
                                    <div class="text-center">
                                    <img class="product-card-img" width="100%"
                                        src="<?php echo $row['img'] == '' ? 'https://dummyimage.com/900x900/fff/fd8103.jpg' : $row['img']; ?>" >
                                    </div>  
                                      <div class="product-card-info d-grid rounded-bottom-5">
                                        <h2 class="product-card-brand"><?php echo $core['pages']['name']; ?></h2>
                                        <h1 class="product-card-name" style="min-height: 60px;"><?php echo str_replace(strtoupper($core['pages']['name']), "", strtoupper($row['name'])); ?></h1>
                              
                                        <button class="btn  btn-light rounded-pill"><?php echo $productDetailButtonLabel; ?></button>
                                    </div>
                                </a>
                              
                            </div>
                            <div class="text-center"> <?php echo $row['action']; ?> </div>
                        </div>


                   
                <?php 
                    if($n == 5) {
                        break; // Hentikan loop setelah menampilkan 2 item
                    }
                } ?>

               
 
 
            </div>
        </div>
    </section>

<?php }?>