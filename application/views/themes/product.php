<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>  
<?php if($core['table'] == 'cms_pages'){ ?>
       <br> 
    <div class="my-5">
        <div class="container ">
            <div class="row">
                <h1 class="text-center mb-5 text-danger">
                   <?php echo $core['pages']['title']?>
                </h1>
                  <div class="col-12 text-center">
                    <?php echo $core['content']['insert']; ?>
                </div>
              
                <div class="col-12 g-1">

                    <div class="row fnSortable">
                        <?php foreach($core['content']['list'] as $row){ ?>
                        <div class="col-6 col-md-3 text-center mb-5 product-card" <?php if($core['login'] == true){ echo ' style="display: block; border:1px solid"' ; } ?>>
                            <a href="<?php echo $row['href']; ?>"><img
                                    src="<?php echo $row['img'] == '' ? 'https://dummyimage.com/600x400/fff/fd8103.jpg' : $row['img']; ?>" width="100%">
                                <div>
                                    <strong><?php echo $row['name']; ?></strong>
                                </div>
                            </a>
                           <div> <?php echo $row['action']; ?> </div>
                        </div>
                        <?php } ?>
                    </div>


                </div>
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
                        <h2 class="py-2 fnText" <?php echo $core['content']['data']['h1']; ?>><?php echo $core['content']['h1']?></h2>
                        <P class=""><strong class="fnText" <?php echo $core['content']['data']['h2']; ?>><?php echo $core['content']['h2']?></strong></p>
                        <div class="fnRichtext" <?php echo $core['content']['data']['content']; ?>> <?php echo $core['content']['content']; ?> </div>
                        <?php echo $core['content']['edit']; ?>
                    </div>
                    <div class="col-12 col-md-6 order-1 order-md-2 text-center mb-5">
                        <img src="<?php echo $core['content']['img']?>" width="80%">


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
                    <div class="col-12 col-md-3 mb-4">
                        <div class="card h-100 shadow-sm border-0 rounded-4" style="background-color: #fd8103">
                            <div class="p-3">
                                <img src="<?php echo $row['img'] == '' ? 'https://dummyimage.com/600x400/fff/fd8103.jpg' : $row['img']; ?>" width="100%" class="rounded-4"
                                    alt="<?php echo $row['h1']; ?>">
                            </div>

                            <div class="card-body">
                                <h5 class="mb-1"><?php echo $core['pages']['title']?></h5>
                                <h1 class="card-title text-white fw-bold py-1"><?php echo $row['name']?></h1>
                                <a href="<?php echo $row['href']?>" class="btn btn-white rounded mt-1">Lihat Resep <i
                                        class="bi bi-caret-right-square-fill"></i></a>  
                            </div>
                        </div>
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