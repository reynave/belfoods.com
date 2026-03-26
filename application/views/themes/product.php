<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>  
<?php if($core['table'] == 'cms_pages'){ ?>
    <br> 

    <div class="my-5">
        <div class="container ">
            <div class="row">
                 
                <div class="col-12 text-center mb-5">
                    <?php foreach($core['content']['galleries'] as $gallery) { ?>
                       <img src="<?php echo $gallery['img']; ?>"   height="200px" >
                       <div>
                            <?php echo $gallery['action']; ?>
                        </div>
                    <?php } ?>
                    
                    <?php if($core['login']){ ?>
                    <div class="alert alert-warning">
                       <p>Halaman ini adalah halaman produk, untuk mengubah tampilannya silahkan edit pada bagian konten dengan tipe produk</p>
                        <?php echo $core['content']['insert']; ?>  <?php echo $core['content']['galleries_action']; ?> 
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
                                           <h1 class="product-card-name" style="min-height: 60px;"><?php echo str_replace($core['pages']['name'], "", $row['name']); ?></h1>
                              
                                        <button class="btn  btn-light rounded-pill fw-bold">Selengkapnya</button>
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



    <section class=" bg-light-gold banner-product-detail">
        <div class="wrapper">

            <div class="container ">
                <div class="row">
                    <div
                        class="col-12 col-md-6 order-2 order-md-1 align-content-center d-flex flex-column justify-content-center">
 
                        <h1 class="text-orange"><?php echo $core['content']['name']?></h1>
                        <P class="nunito"><strong class="fnText nunito" <?php echo $core['content']['data']['h2']; ?>><?php  echo $core['content']['h2']?></strong></p>
                        <div class="fnRichtext nunito" <?php echo $core['content']['data']['content']; ?>> <?php echo $core['content']['content']; ?> </div>
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
                    <h2 class="text-center fw-bold mb-4"><?php echo $core['pages']['title']?> Lainnya</h2> 
                </div>
            </div>


            <div class="row slick-home-slide">
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


                    <div class="p-2">
                        <div class="product-card">
                                <a href="<?php echo $row['href']; ?>">
                                    <div class="text-center">
                                    <img class="product-card-img" width="100%"
                                        src="<?php echo $row['img'] == '' ? 'https://dummyimage.com/900x900/fff/fd8103.jpg' : $row['img']; ?>" >
                                    </div>  
                                      <div class="product-card-info d-grid rounded-bottom-5">
                                        <h2 class="product-card-brand"><?php echo $core['pages']['name']; ?></h2>
                                        <h1 class="product-card-name" style="min-height: 60px;"><?php echo str_replace(strtoupper($core['pages']['name']), "", strtoupper($row['name'])); ?></h1>
                              
                                        <button class="btn  btn-light rounded-pill fw-bold" >Selengkapnya</button>
                                    </div>
                                </a>
                              
                            </div>
                            <div class="text-center"> <?php echo $row['action']; ?> </div>
                        </div>
 
                <?php 
                    
                } ?>

               
 
 
            </div>
        </div>
    </section>

<?php }?>