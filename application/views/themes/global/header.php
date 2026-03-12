<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <?php echo $core['opengraph']; ?>
       
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cherry+Bomb+One&family=Hedvig+Letters+Sans&family=League+Spartan:wght@100..900&family=Luckiest+Guy&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <?php $this->load->view('admin/header'); ?>

    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/style/fonts.css">

    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/js/slick-1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/js/slick-1.8.1/slick/slick-theme.css" />


    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/style/root.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/style/header.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/style/main.css">
 
</head>

<body>
     

<body class="header-margin">

    <header class="site-header">

        <nav class="navbar navbar-expand-lg main-nav">
            <div class="container">
                <a class="navbar-brand brand-logo " href="<?php echo base_url(); ?>">
                    <div class="logo-wrapper">
                         <img  src="<?php echo base_url(); ?>public/belfoods.png"  alt="Belfoods logo" width="100%" >
                    </div>
                   
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarMainMenu" aria-controls="navbarMainMenu" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarMainMenu">
                    <ul class="navbar-nav main-menu ms-auto gap-2 align-items-lg-center">

                        <?php foreach ($core['navigation'] as $row) { ?>
                            <?php if (!empty($row['level2']) && is_array($row['level2'])) { ?>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle <?php echo $row['active'] == true ? 'active' : ''; ?>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <?php echo $row['name']; ?>
                                    </a>
                                    <ul class="dropdown-menu sub-menu">
                                        <?php foreach ($row['level2'] as $sub) { ?>
                                            <li><a class="dropdown-item" href="<?php echo $sub['href']; ?>"><?php echo $sub['name']; ?></a></li>
                                        <?php } ?>
                                    </ul>
                                </li>
                            <?php } else { ?>
                                <li class="nav-item"><a class="nav-link <?php echo $row['active'] == true ? 'active' : ''; ?>" href="<?php echo $row['href']; ?>"><?php echo $row['name']; ?></a></li>
                            <?php } ?>
                        <?php } ?>

                        <li class="nav-item">
                            <?php foreach($custom['orderNow'] as $row){ ?>
                            <a class="btn btn-order d-inline-flex align-items-center gap-2" href="<?php echo $row['href']; ?>">
                                <?php echo $row['h1']; ?> <i class="bi bi-bag-check"></i>
                            </a>
                                  <?php echo $row['modal']; ?>
                            <?php } ?> 
                        </li>
                    
                    </ul>
                </div>
            </div>
        </nav>
    </header>