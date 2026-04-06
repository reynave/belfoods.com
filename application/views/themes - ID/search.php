<?php
defined('BASEPATH') or exit('No direct script access allowed');

$searchTitle = 'Search';
$searchBreadcrumbPrefix = 'Home > Search Result > Showing';
$searchBreadcrumbFor = 'for';
?>

<div class="bg-danger p-2"></div>

<main class="bg-body pt-4">
    <div class="container">

        <div class="row">
            <div class="col-12">
                <h4><?php echo $searchTitle; ?></h4>
                <p><?php echo $searchBreadcrumbPrefix; ?> <?php echo count($this->core->search()); ?> <?php echo $searchBreadcrumbFor; ?> “<?php echo $this->input->get('q'); ?>”</p>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <?php
                foreach ($this->core->search() as $row) {
                    ?>
                    <p><a href="<?php echo $row['url']; ?>" class="search-title"><?php echo $row['name']; ?></a></p>
                    <p><a href="<?php echo $row['url']; ?>" class="search-url"><?php echo $row['url']; ?></a> - <?php echo $row['content']; ?></p>
                    <hr>
                <?php
                }
                ?>
            </div>
        </div>


    </div>
</main>