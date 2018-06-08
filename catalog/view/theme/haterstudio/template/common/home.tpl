<?php echo $header; ?>
<?php echo $content_top; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
        <?php if($informations) { ?>
            <nav class="menu">
                <ul>
                    <?php foreach($informations as $information) { ?>
                        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </nav>
            <div class="clearfix"></div>
        <?php } ?>
        <?php echo $content_bottom; ?>
            <div class="products">
                <?php if($h_block_1) { ?>
                    <div class="products__item">
                        <h2><?php echo $h_block_1; ?></h2>
                        <div class="products__item-description">
                            <?php echo $html_block_1; ?>
                        </div>
                        <div class="products__item-image row">
                            <div class="col-sm-12">
                                <img src="<?php echo $image_block_1; ?>" alt="<?php echo $h_block_1; ?>" class="img-responsive">
                            </div>
                        </div>
                    </div>
                <?php } ?>
                <?php if($h_block_2) { ?>
                    <div class="products__item">
                        <h2><?php echo $h_block_2; ?></h2>
                        <div class="products__item-description">
                            <?php echo $html_block_2; ?>
                        </div>
                        <div class="products__item-image row">
                            <div class="col-sm-4">
                                <img src="<?php echo $image_block_2_1; ?>" alt="<?php echo $h_block_2; ?>" class="img-responsive">
                            </div>
                            <div class="col-sm-4">
                                <img src="<?php echo $image_block_2_2; ?>" alt="<?php echo $h_block_2; ?>" class="img-responsive">
                            </div>
                            <div class="col-sm-4">
                                <img src="<?php echo $image_block_2_3; ?>" alt="<?php echo $h_block_2; ?>" class="img-responsive">
                            </div>
                        </div>
                    </div>
                <?php } ?>
                <?php if($h_block_3) { ?>
                    <div class="products__item">
                        <h2><?php echo $h_block_3; ?></h2>
                        <div class="products__item-description">
                            <?php echo $html_block_3; ?>
                        </div>
                        <div class="products__item-image row">
                            <div class="col-sm-12">
                                <img src="<?php echo $image_block_3; ?>" alt="<?php echo $h_block_3; ?>" class="img-responsive">
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>