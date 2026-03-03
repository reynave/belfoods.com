<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>

<footer class="footer">
        <div class="container ">

            <div class="row g-1">
                <div class="col-4">
                    <img src="<?php echo base_url(); ?>public/logo-mini.png" height="60px" alt="Belfoods Logo">
                </div>
                <div class="col-4 text-center">
                    <div class="social-icons d-flex gap-3 text-center justify-content-center mb-2">
                        <a href="#" aria-label="Facebook" class="social-icon">
                            <i class="bi bi-facebook"></i>
                        </a>
                        <a href="https://www.instagram.com/belfoodsid" aria-label="Instagram" class="social-icon">
                            <i class="bi bi-instagram"></i>
                        </a>
                        <a href="#" aria-label="YouTube" class="social-icon">
                            <i class="bi bi-youtube"></i>
                        </a>
                        <a href="https://www.tiktok.com/@belfoodsid" aria-label="TikTok" class="social-icon">
                            <i class="bi bi-tiktok"></i>
                        </a>
                        <a href="#" aria-label="Twitter" class="social-icon">
                            <i class="bi bi-twitter-x"></i>
                        </a>

                    </div>


                    <div class="fnRichtext" <?php echo $footer['attributes']; ?>><?php echo $footer['content']; ?>  </div>
                </div>

                <div class="col-4 text-end">
                    <img src="<?php echo base_url(); ?>public/sm/belfoods-Halal.png" class="mx-1" height="70px" alt="Halal Indonesia">

                    <img src="<?php echo base_url(); ?>public/sm/NKV-Belfoods.png" class="mx-1" height="70px" alt="Halal Indonesia">
                </div>

            </div>

        </div>
    </footer>

    
    <script src="<?php echo base_url(); ?>assets/js/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-gJmXkyb53UDvPq4a4FiC5xTN/pgQ80dtLZL+po52A5d+OJk3Ez5QiadG7bdDATTG"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>


    <script type="text/javascript" src="<?php echo base_url(); ?>assets/js/slick-1.8.1/slick/slick.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>assets/js/main.js"></script>
    

    <?php $this->load->view('admin/footer'); ?>
</body>

</html>