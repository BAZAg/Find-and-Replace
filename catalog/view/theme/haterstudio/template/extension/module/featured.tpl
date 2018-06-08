<div class="catalogue-list">
  <div class="row">
    <?php foreach ($products as $product) { ?>
     <div class="item col-sm-3 col-xs-12">
      <a href="<?php echo $product['href']; ?>">
       <div class="item__image"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive">
       <div class="btn-brown">
         <button class="btn-brown"><?php echo $product['name']; ?></button>
       </div>
       </div>
      </a>
     </div>
    <?php } ?>
  </div>
</div>