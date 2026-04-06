<?php
defined('BASEPATH') or exit('No direct script access allowed');

$aboutBelfoodsAltText = 'About Belfoods.com';
?>  
 

    <section class=" banner-product-detail mb-5" style="background:rgb(193, 2, 48);">
        <!-- <div class="wrapper-md">

            <div class="container ">
                <div class="row">
                    <div class="text-center">
                        <h2 class="luckiest-guy-regular mb-3 text-white"><?php echo $core['pages']['name'];?></h2>
                         <h3 class="mb-4 text-white fnText" <?php echo $core['content']['data']['h1'];?> ><?php echo $core['content']['h1'];?></h3> -->
 <!-- <h5 class="text-white mt-3 fnText" <?php echo $core['content']['data']['h2'];?> ><?php echo $core['content']['h2'];?> </h5>
                         
                    </div> 
                    
                </div>
            </div>

        </div> -->
        <div class="container">
            <div class="col-12 text-center"> 
                <img src="<?php echo $core['content']['img'];?>" class="rounded-5 mt-4" width="100%" alt="<?php echo $aboutBelfoodsAltText; ?>">
            </div>  
            <div class="col-12 text-center"> 
                <div> <?php echo $core['content']['edit'];?> </div>
            </div>
        </div>
    </section>

    <div class="wrapper">
        <div class="container mb-5">
            <div class="row">
                <div class="col-6">
                   <div class="fnRichtext" <?php echo $core['content']['data']['content'];?>><?php echo $core['content']['content'];?></div>
                </div>

                <div class="col-6">
                    <?php echo $core['content']['galleries_action'];?>
                    <?php foreach($core['content']['galleries'] as $row){?>
                    <img src="<?php echo $row['img'];?>" class="rounded-5" width="100%">
                    <?php echo $row['action']?>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>

    <div class="bg-light-gold py-5">
        <div class="wrapper">
            <div class="container my-5">
                <div class="row">
                    <div class="col-12 text-center mb-5">
                        <h1 class="luckiest-guy-regular color-orange fnText" <?php echo $custom['widgetAboutTitle']['attributes']?>><?php echo $custom['widgetAboutTitle']['content']?></h1>
                    </div>
                </div>
                <div class="row g-5"> 
                    <?php 
                    foreach ($custom['widgetAbout'] as $row) { 
                    ?>
                        <div class="col-12 col-md-4 text-center">
                            <img src="<?php echo $row['img'] ?>" class="rounded-5 mb-3" width="100%">
                            <h5 class="fnText" <?php echo $row['data']['h1'] ?>><?php echo $row['h1'] ?></h5>
                            <div class="fnRichtext" <?php echo $row['data']['content'] ?>> <?php echo $row['content']?>  </div>
                            <?php echo $row['modal']?>
                        </div>
                    <?php 
                    } ?>

                    <div class="col-12 text-center"><?php echo $custom['widgetAbout_action'];?></div>
              
                </div>
            </div>

        </div>
    </div>
 