<?php echo $header; ?>
<div class="head">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-4">
        <h1><?php echo $heading_title; ?></h1>
        <div class="line"></div>
      </div>
      <div class="col-xs-12 col-sm-8">
        <img class="img-responsive" alt="<?php echo $heading_title; ?>" src="<?php echo $image; ?>" />
      </div>
    </div>
  </div>
</div>
<div class="container">
  <div class="top-line nomargin">
    <ul class="breadcrumb">
      <?php $bread_count = count($breadcrumbs); ?>
      <?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
        <?php if(($bread_count - 1) == $key) { ?>
          <li><?php echo $breadcrumb['text']; ?></li>
        <?php } else { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      <?php } ?>
    </ul>
    <?php if($informations) { ?>
      <nav class="menu">
       <ul class="list-unstyled">
        <?php foreach($informations as $information) { ?>
         <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
        <?php } ?>
       </ul>
      </nav>
     <?php } ?>
    <div class="clearfix"></div>
  </div>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php echo $description; ?>
      <?php if($ex_block) { ?>
        <div class="decor-block">
          <fieldset>
            <legend><?php echo $ex_block; ?></legend>
          </fieldset>
        </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>