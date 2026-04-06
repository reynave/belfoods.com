 <?php
defined('BASEPATH') or exit('No direct script access allowed');

$emailButtonLabel = 'e-Mail';
$sendEmailDetailLabel = 'Kirim Email dengan Detail';
$whatsappButtonLabel = 'Whatsapp';
?>  


    <section id="social-media" class="social-media-section">

        <div class="container"
            style="background: url(./public/photos/idmap.png) top center; background-repeat: no-repeat; background-size: contain;">
            <div class="row g-1"> 

                <div class="col-12">
                    <h2 class="text-center fw-bold mb-5 color-orange "><?php echo $core['pages']['name'];?></h2>
                </div>
                <div class="col-md-4 col-12 align-self-center d-none d-sm-block">
                    <img src="<?php echo $core['content']['img']?>" width="90%" alt="<?php echo $core['pages']['name'];?>">
                </div>
                <div class="col-md-8 col-12 text-start align-self-center">
                    <h1 class="text-orange text-center text-sm-start"><?php echo $core['content']['name']?></h1>
                </div> 

            </div>
        </div>
        <div class="wrapper-sm">

            <div class="container">
                <div class="row g-2"> 
                    <div class="col-12 mt-5"> 
                        <div class="fnText" <?php echo $core['content']['data']['h1']?>><?php echo $core['content']['h1']?></div>
                        <div class="fnRichtext" <?php echo $core['content']['data']['content']?> ><?php echo $core['content']['content']?></div>
                    </div>

                    <div><?php echo $core['content']['id'] == "" ? $core['content']['insert'] :   $core['content']['edit'];  ?></div>

                    <div class="col-12 col-md-6 d-grid align-items-center">
                        <a  href="mailto:<?php echo $core['content']['h2']?>" class="btn btn-lg btn-orange rounded-pill" >
                           <i class="bi bi-envelope-at"></i>  <?php echo $emailButtonLabel; ?>
                        </a> 
                    </div>

                    <a href="mailto:tujuan@contoh.com?subject=Halo&cc=lain@contoh.com&body=Isi%20pesan">
  <?php echo $sendEmailDetailLabel; ?>
</a>
                    <div class="col-12 col-md-6  d-grid align-items-center"> 
                        <a target="_blank" href="https://wa.me/<?php echo $core['content']['h3']?>" 
                        class="btn btn-lg btn-success rounded-pill " style="font-family: 'VAG-Rounded-Bold';">
                           <i class="bi bi-whatsapp"></i> <?php echo $whatsappButtonLabel; ?>
                        </a>
                    </div>

                </div>
            </div>

        </div>
    </section>