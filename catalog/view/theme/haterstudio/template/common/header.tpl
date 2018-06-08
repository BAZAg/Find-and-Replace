<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/theme/haterstudio/stylesheet/fontawesome-all.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/haterstudio/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-2">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-2 info">
        <?php echo $text_work_time; ?><br/>
        <?php echo $work_time; ?>
      </div>
      <div class="col-sm-3 info">
        <?php echo $text_central_office; ?><br/>
        <?php echo $shop_address; ?><br/>
        <?php echo $email; ?>
      </div>
      <div class="col-sm-3 info">
        <?php echo $telephone; ?><br/>
        <a href="#" id="btn-header-recall"><?php echo $text_recall; ?></a>
      </div>
      <div class="col-sm-2 icon-social">
        <?php if($link_vk) { ?>
          <a href="<?php echo $link_vk; ?>" target="_blank"><i class="fab fa-vk"></i></a>
        <?php } ?>
        <?php if($link_fb) { ?>
          <a href="<?php echo $link_fb; ?>" target="_blank"><i class="fab fa-facebook-f"></i></a>
        <?php } ?>
        <?php if($link_instagram) { ?>
          <a href="<?php echo $link_instagram; ?>" target="_blank"><i class="fab fa-instagram"></i></a>
        <?php } ?>
        <?php if($link_tg) { ?>
          <a href="<?php echo $link_tg; ?>" target="_blank"><i class="fab fa-telegram-plane"></i></a>
        <?php } ?>
        <?php if($link_whatsapp) { ?>
          <a href="<?php echo $link_whatsapp; ?>" target="_blank"><i class="fab fa-whatsapp"></i></a>
        <?php } ?>
        <?php if($link_viber) { ?>
          <a href="<?php echo $link_viber; ?>" target="_blank"><i class="fab fa-viber"></i></a>
        <?php } ?>
      </div>
      <?php if ($categories) { ?>
        <nav id="menu" class="navbar col-sm-8">
          <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
            <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
          </div>
          <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav col-sm-12">
              <?php foreach ($categories as $category) { ?>
              <?php if ($category['products']) { ?>
              <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
                <div class="dropdown-menu">
                  <div class="dropdown-inner">
                    <?php foreach (array_chunk($category['products'], ceil(count($category['products']) / $category['column'])) as $products) { ?>
                    <ul class="list-unstyled">
                      <?php foreach ($products as $product) { ?>
                      <li><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></li>
                      <?php } ?>
                    </ul>
                    <?php } ?>
                  </div>
                </div>
              </li>
              <?php } else { ?>
              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php } ?>
              <?php } ?>
            </ul>
          </div>
        </nav>
      <?php } ?>
      <div class="col-sm-2 pull-right"><?php echo $cart; ?></div>
    </div>
  </div>
</header>
