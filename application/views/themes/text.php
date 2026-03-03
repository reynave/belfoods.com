<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>  

<div class="wrapper py-5">
        <div class="container">
            <div class="row">
                <div class="col-12"> 
                    <h1><?php echo $core['content']['name']?></h1>
                    <img src="<?php echo $core['content']['img']?>" class="rounded shadow-sm" width="100%">
                </div>
                <div class="col-12">
                     <?php echo count($core['content']) <= 0 ? $core['content']['insert'] : ''; 
                     echo $core['content']['edit']; ?>
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