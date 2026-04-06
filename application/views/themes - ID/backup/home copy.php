<?php
defined('BASEPATH') or exit('No direct script access allowed');

$productCatalog = 'Produk Katalog';
$kreasiKilat = 'Kreasi Kilat';
$bannerAltText = 'Banner Belfoods';
$kreasiKilatAltText = 'Kreasi Kilat Belfoods';
$kreasiKilatDefaultName = 'Kreasi Kilat';
$kreasiKilatMobileTitle = 'Masak Sat Set Untuk Keluarga';
$viewRecipeLabel = 'Lihat Resep';
$belfoodsLogoAltText = 'Belfoods Logo';
$replaceVideoAlertText = 'untuk ganti video bisa update di folder';
$replaceVideoFolderLabel = 'public/video/home.mp4';
$replaceVideoAlertText2 = 'dengan nama file harus sama dan format mp4 adalah';
$replaceVideoNameLabel = 'home.mp4';
$tvcModalTitle = 'TVC Belfoods 15 detik';
$closeLabel = 'Tutup';
?>
<!-- HOME BIG BANNER   -->
<section id="home-banner" class="home-banner">  
    <?php foreach($custom['banner'] as $row){?>
    <div>
        <img src="<?php echo $row['img']; ?>" width="100%" alt="<?php echo $bannerAltText; ?>">
    </div> 
    <?php } ?>
</section>
<?php echo $custom['banner_action']; ?>
   <br><br>
<!-- HOME DARK BGN INFO   -->
<section class="mb-5 bg-dark text-white py-5">
    <div class="container">
        <div class="row">
            <div class="col-12">
             
                <?php foreach($core['content']['galleries'] as $gallery){ ?>
                <img src="<?php echo $gallery['img']; ?>" width="100%"> 
                 <div class="text-center"> <?php echo $gallery['action']; ?></div>
                <?php } ?>

                <div class="text-center"> <?php echo $core['content']['galleries_action']; ?></div>
            </div>
            <div class="col-12  "> 
                <div class="mt-5">
                    <div  class="fnRichtext"  <?php echo $core['content']['data']['content'];?>>
                            <?php echo $core['content']['content']; ?>
                    </div> 
                </div>
                
            </div>
            <div class="col-12">
                    <?php echo $core['content']['edit']; ?>
                    <?php echo $core['content']['insert']; ?>
            </div>
        </div>
    </div>

</section>

<!-- PRODUCT CATALOG  -->
<div class="px-5 pt-5 py-3 home-slider"> 

    <section id="slider" class=" " aria-labelledby="slider-heading">

        <div class="row">
            <div class="col-12 ">
                <h1 class="text-center mb-3"> <?php echo $productCatalog; ?> </h1>
                <div class="slider-tabs">
                        <?php foreach ($core['navigation'] as $row) { ?>
                            <?php if($row['id'] == "3"){ ?>
                                <?php foreach ($row['level2'] as $sub) { ?>
                                    <a class="slider-tab" href="<?php echo $sub['href']; ?>"><?php echo $sub['name']; ?></a> 
                                <?php }?>
                            <?php }?>
                        <?php } ?> 
                </div>
            </div>

        </div>
        <div class="row slick-home-slide">

            <?php foreach ($core['navigation'] as $row) { ?>
                <?php if($row['id'] == "3"){ ?>
                    <?php foreach ($row['level2'] as $sub) { ?>
                            <div class="col-4 text-center ">
                            <div class="home-slider-featured">
                                <a href="<?php echo $sub['href']; ?>">
                                <img width="100%" src="<?php echo $sub['img']; ?>" alt="<?php echo $sub['name']; ?>">
                                </a>
                            </div>
                        </div>
                    <?php }?>
                <?php }?>
            <?php } ?> 
        </div>

    </section>
</div>
 
<!-- Kreasi Kilat BLOG -->
<div  class="kreasi-kilat d-none d-md-block">
    <div class="kreasi-kilat-icon">
        <?php foreach($custom['kreasiKilatImg'] as $row){?>
            <img src="<?php echo $row['img']; ?>" width="100%" alt="<?php echo $kreasiKilatAltText; ?>">
      
            <div class="text-center"> <?php echo $row['modal']; ?> </div>
        <?php } ?>
 
        
    </div>

    <div class="container" > 
        <div class="row g-0"> 
            
            <div class="col-9 offset-3">

                <?php 
                $data = [];
                foreach ($core['navigation'] as $row) { 
                      if($row['id'] == "2"){   
                        $data = $row;
                      }  
                  } 
                ?>

                


                <h2 class="text-end fw-bold "><?php echo $data['name']; ?>  </h2>
                <h1 class="text-end VAG-Rounded-Bold " style="font-size: 3rem;"><?php echo $kreasiKilatMobileTitle; ?></h1>

                <div id="blog" class="slick-3-1 mb-5">

                    <?php foreach($custom['kreasiKilat'] as $row){ ?>
                    <div class="m-2">
                        <div class="card h-100 shadow-sm border-0 rounded-4" style="background-color: #fd8103;">
                            <div class="p-3">
                                <img src="<?php echo $row['img'] == '' ? 'https://dummyimage.com/600x400/fff/fd8103.jpg' : $row['img']; ?>" width="100%"
                                    class="rounded-4">
                            </div>
                            <div class="card-body">
                                <h5 class="mb-1 text-white"><?php echo $data['name'] ?? $kreasiKilatDefaultName; ?></h5>
                               <div style="min-height: 80px;">
                                 <h4 class="py-1 text-white" ><?php echo $row['name']; ?></h4></div>
                                <a href="<?php echo $row['href']; ?>" class="btn btn-white rounded mt-1 fw-bold d-block"><?php echo $viewRecipeLabel; ?> </a>
                            </div>
                        </div>
                    </div>
                    <?php } ?>

                </div>
                <br>

            </div>
        </div>
    </div>
</div>
 

<div  class="kreasi-kilat d-block d-md-none py-5">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center mb-1">
                <h2 class=" fw-bold "><?php echo $data['name']; ?>  </h2>
                <h1 class="VAG-Rounded-Bold " style="font-size: 3rem;"><?php echo $kreasiKilatMobileTitle; ?></h1>

            </div>
            <div class="col-12">

                <div id="blog" class="slick-home-slide mb-5">

                    <?php foreach($custom['kreasiKilat'] as $row){ ?>
                    <div class="m-2">
                        <div class="card h-100 shadow-sm border-0 rounded-4" style="background-color: #fd8103;">
                            <div class="p-3">
                                <img src="<?php echo $row['img'] == '' ? 'https://dummyimage.com/600x400/fff/fd8103.jpg' : $row['img']; ?>" width="100%"
                                    class="rounded-4">
                            </div>
                            <div class="card-body">
                                <h5 class="mb-1 text-white"><?php echo $data['name'] ?? $kreasiKilatDefaultName; ?></h5>
                                <h4 class="py-1 text-white"><?php echo $row['name']; ?></h4>
                                <a href="<?php echo $row['href']; ?>" class="btn btn-white rounded mt-1 fw-bold"><?php echo $viewRecipeLabel; ?> </a>
                            </div>
                        </div>
                    </div>
                    <?php } ?>

                </div>
            </div>
        </div>
    </div>

</div>

 <!-- Info Buah Hati -->
<?php foreach($custom['infoHome'] as $row){?>
    <section id="info" class="info">
        <div class="container "
            style="background:url('<?php echo $row['img']; ?>') top center no-repeat; background-size: cover;">

            <div class="row">
                <div class="col-12 text-end">
                    <h2 class="VAG-Rounded-Bold fbText"   <?php echo $row['data']['h1']; ?>> <?php echo $row['h1']; ?></h2>
                    <h1 class="fnRichtext"   <?php echo $row['data']['h2']; ?> >
                       <?php echo $row['h2']; ?>
                    </h1>
                    <a href="<?php echo $row['href']; ?>" class="btn btn-lg btn-orange px-5"><?php echo $row['h4']; ?></a>
                    <br><br><br><br><br><br>
                    <?php echo $row['modal']; ?>
                </div>
            </div>

        </div>
    </section> 
<?php } ?> 
   
 
 
 <?php foreach($custom['videoHome'] as $row){?>
    <section id="tvc" class="hero-video" style="opacity: 0.8;">
        <video class="hero-video__media" src="<?php echo base_url(); ?>public/video/home.mp4" autoplay loop muted playsinline
            aria-hidden="true"></video>
        <div class="hero-video__scrim" aria-hidden="true"></div>
        <div class="hero-video__content">
            <div class="container">

                <div class="row">
                    <div class="col-12 mb-3">
                        <img src="<?php echo base_url(); ?>public/logo-mini.png" height="30" alt="<?php echo $belfoodsLogoAltText; ?>">
                    </div>
                </div>
                <h2 class="mb-4 fnText" <?php echo $row['data']['h1']; ?>><?php echo $row['h1']; ?></h2>
        
                <div class="hero-video__cta">
                    <a class="btn btn-lg btn-orange px-5" href="<?php echo $row['href']; ?>"
                        target="_blank"><?php echo $row['h4']; ?></a> 
                </div>

                <div><?php echo $row['modal']; ?></div>
                <?php if($core['login']){ ?>
                <div class="alert alert-warning mt-3" role="alert">
                    <?php echo $replaceVideoAlertText; ?> <strong><?php echo $replaceVideoFolderLabel; ?></strong> <?php echo $replaceVideoAlertText2; ?> <strong>"<?php echo $replaceVideoNameLabel; ?>"</strong>
                </div>
                <?php } ?>

            </div>
        </div>
    </section>
<?php } ?> 
  

<div class="modal fade hero-video-modal" id="tvcModal" tabindex="-1" aria-labelledby="tvcModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <h2 class="visually-hidden" id="tvcModalLabel"><?php echo $tvcModalTitle; ?></h2>
            <button type="button" class="btn-close btn-close-white hero-video-modal__close" data-bs-dismiss="modal"
                aria-label="<?php echo $closeLabel; ?>"></button>
            <div class="ratio ratio-16x9">
                <video id="tvcModalVideo" src="<?php echo base_url(); ?>public/video/TVC_Belfoods_15s.mp4" controls playsinline></video>
            </div>
        </div>
    </div>
</div>


 <?php foreach($custom['sales'] as $row){?>
    <section id="social-media" class="social-media-section">
        <div class="container"
            style="background: url(./public/photos/idmap.png) top center; background-repeat: no-repeat; background-size: contain;">
            <div class="row g-1">

                <div class="col-12">
                    <h2 class="text-end fw-bold mb-5 color-orange"><?php echo $row['h2']; ?></h2>
                </div>
                <div class="col-12 col-md-5 text-end">
                    <img src="<?php echo $row['img']; ?>" width="90%" alt="<?php echo $row['h1']; ?>">
                </div>
                <div class="col-12 col-md-7 text-end  align-content-center">
                    <h1 class="text-orange"><?php echo $row['h1']; ?> </h1>
                    <a href="<?php echo $row['href']; ?>" class="btn btn-lg btn-orange px-5"><?php echo $row['h4']; ?></a>
                </div>



                 <div><?php echo $row['modal']; ?></div>
            </div>
        </div>
    </section>
<?php } ?> 