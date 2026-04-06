<?php
defined('BASEPATH') or exit('No direct script access allowed');

$viewRecipeLabel = 'Lihat Resep';
$othersSuffix = 'Lainnya';
?>  
<?php if($core['table'] == 'cms_pages'){ ?>
    <section id="blog" class="py-5 blog-section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="text-center fw-bold mb-2"><?php echo $core['pages']['title']?></h2>
                    <h1 class="text-center mb-5 VAG-Rounded-Bold fnText" <?php echo $custom['kreasiKilatTitle']['attributes']?> style="font-size: 3rem;"><?php echo $custom['kreasiKilatTitle']['content']?></h1>
                </div>
                <div class="col-12 text-center">
                    <?php echo $core['content']['insert']; ?>
                </div>
            </div>


            <div class="row fnSortable">
              
                <?php 
                $i=0;
                foreach($core['content']['list'] as $row){ $i++;?>
                    <div class="col-12 col-md-3 mb-4 " <?php if($core['login'] == true){ echo ' style="display: block; border:1px solid"' ; } ?>>
                        <div class="card h-100 shadow-sm border-0 rounded-4" style="background-color: #fd8103">
                            <div class="p-3">
                                <img src="<?php echo $row['img'] == '' ? 'https://dummyimage.com/600x400/fff/fd8103.jpg' : $row['img']; ?>" width="100%" class="rounded-4"
                                    alt="<?php echo $row['h1']; ?>">
                            </div>

                            <div class="card-body">
                                <h5 class="mb-1"><?php echo $core['pages']['title']?></h5>
                                <h1 class="card-title text-white py-1"><?php echo $row['name']?></h1>
                                                                    <a href="<?php echo $row['href']; ?>" class="btn btn-white rounded fw-bold d-block"><?php echo $viewRecipeLabel; ?></a>
                                <div><?php echo $row['action']; ?></div>
                            </div>
                        </div>
                    </div>

                    

                <?php } ?>

               
 
            </div>
        </div>
    </section>
<?php }else{ ?>

    <div class="wrapper-sm py-5">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1><?php echo $core['content']['name']?></h1>
                    <img src="<?php echo $core['content']['img']?>" class="rounded shadow-sm" width="100%">
                </div>
                <div class="col-12">
                 <?php echo $core['content']['edit']; ?>
                    <section class="recipe-detail mt-4">
                        <div class="card border-0 ">
                            <div class="card-body">
                                <div class="fnRichtext" <?php echo $core['content']['data']['content']; ?>><?php echo $core['content']['content']; ?></div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>

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
                    <div class="col-12 col-md-3 mb-4">
                        <div class="card h-100 shadow-sm border-0 rounded-4" style="background-color: #fd8103">
                            <div class="p-3">
                                <img src="<?php echo $row['img'] == '' ? 'https://dummyimage.com/600x400/fff/fd8103.jpg' : $row['img']; ?>" width="100%" class="rounded-4"
                                    alt="<?php echo $row['h1']; ?>">
                            </div>

                             <div class="card-body">
                                <h5 class="mb-1"><?php echo $core['pages']['title']?></h5>
                                <h1 class="card-title text-white fw-bold py-1"><?php echo $row['name']?></h1>
                                <a href="<?php echo $row['href']?>" class="btn btn-white rounded mt-1 fw-bold d-block"><?php echo $viewRecipeLabel; ?> </a>  
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