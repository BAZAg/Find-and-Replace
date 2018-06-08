<?php $i = 0; $a = 0; ?>
<div id="header-carousel" class="header-carousel carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <?php foreach ($banners as $banner) { ?>
        <li data-target="#header-carousel" data-slide-to="<?php echo $i; ?>" <?php echo $i==0 ? 'class="active"' : ''; ?>></li>
        <?php $i++; ?>
        <?php } ?>
      </ol>
      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <?php foreach ($banners as $banner) { ?>
        <div class="item<?php echo $a==0 ? ' active' : ''; ?>">
          <?php if($banner['link']) { ?>
            <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
          <?php } else { ?>
            <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
          <?php } ?>
          <div class="carousel-caption"></div>
        </div>
        <?php $a++; ?>
        <?php } ?>
      </div>

      <!-- Controls -->
      <a class="left carousel-control" href="#header-carousel" role="button" data-slide="prev">
        <span class="icon-prev" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#header-carousel" role="button" data-slide="next">
        <span class="icon-next" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>