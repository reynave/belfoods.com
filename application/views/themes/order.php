

<section class=" banner-product-detail">
    <div class="container">
        <div class="row g-4 align-items-center">
            <div class="col-12 text-center">
                <?php echo $core['content']['id'] == ''? $core['content']['insert'] :$core['content']['edit']  ;?>
            </div>
            <div class="col-12 text-center">
                <h1 class="VAG-Rounded-Bold color-orange"><?php echo $core['content']['name'];?></h1>
            </div>
            <div class="col-lg-12 col-12 text-center">
                <img src="<?php echo $core['content']['img'];?>" width="60%">
            </div>
            <!-- <div class="col-lg-4 col-12">
                <div class="promo-copy"> 
                    <div class="promo-links fnRichtext" <?php echo $core['content']['data']['content']?>><?php echo $core['content']['content']?>
                    </div>
                </div>
            </div> -->
            <div class="col-12">
                <div class="row g-0 mb-5">
                    <?php foreach($custom['onlineShop'] as $row ){ ?>
                    <div class="col-6 col-md-3 text-center">
                        <a target="_blank" href="<?php echo $row['href'];?>"><img src="<?php echo $row['img'];?>" width="100%"> </a>

                       <div> <?php echo $row['modal'];?></div>
                    </div> 
                    <?php } ?>
                </div>
                
                <div class="row">
                   <div class="col-12 text-center">
                         <?php echo $custom['onlineShop_action'];?>
                   </div>

                </div>
            </div>
        </div>


        <div class="row">
         
            <?php foreach($custom['bannerOrder'] as $row ){ ?>
                <div class="col-12 mb-3 text-center">    
                    <img src="<?php echo $row['img'];?>" width="100%">
                </div>
            <?php } ?>
            
            <div class="col-12">
                <?php echo $custom['bannerOrder_action'];?>
            </div>
        </div>

    </div>
</section>

