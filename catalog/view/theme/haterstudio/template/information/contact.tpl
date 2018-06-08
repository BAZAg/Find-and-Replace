<?php echo $header; ?>
<div class="head">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-4">
        <h1 class="contact"><?php echo $heading_title; ?></h1>
        <div class="line"></div>
      </div>
      <div class="col-xs-12 col-sm-8">
        <img class="img-responsive" alt="<?php echo $heading_title; ?>" src="<?php echo $image_head; ?>" />
      </div>
    </div>
  </div>
</div>
<div class="container">
  <div class="top-line contact">
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
      <div class="col-xs-12"><h2 class="contact"><?php echo $contact_h; ?></h2></div>
      <div id="contacts">
        <div class="col-xs-12 col-sm-5">
          <h4 class="contact"><?php echo $text_company; ?></h4>
          <table class="table contact">
            <thead>
              <tr>
                <td>
                  <?php echo $text_company_name; ?>
                </td>
                <td>
                  <?php echo $company_name; ?>
                </td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <?php echo $text_company_inn; ?>
                </td>
                <td>
                  <?php echo $company_inn; ?>
                </td>
              </tr>
               <tr>
                <td>
                  <?php echo $text_company_ogrn; ?>
                </td>
                <td>
                  <?php echo $company_ogrn; ?>
                </td>
              </tr>
               <tr>
                <td>
                  <?php echo $text_company_rs; ?>
                </td>
                <td>
                  <?php echo $company_rs; ?>
                </td>
              </tr>
               <tr>
                <td>
                  <?php echo $text_company_bank; ?>
                </td>
                <td>
                  <?php echo $company_bank; ?>
                </td>
              </tr>
               <tr>
                <td>
                  <?php echo $text_company_bik; ?>
                </td>
                <td>
                  <?php echo $company_bik; ?>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="col-xs-12 col-sm-5 col-sm-push-2">
          <h4 class="contact"><?php echo $text_contact_us; ?></h4>
          <table class="table contact">
            <thead>
              <tr>
                <td>
                  <?php echo $text_telephone; ?>
                </td>
                <td>
                  <?php echo $telephone; ?>
                </td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <?php echo $text_email; ?>
                </td>
                <td>
                  <?php echo $company_email; ?>
                </td>
              </tr>
               <tr>
                <td>
                  <?php echo $text_fax; ?>
                </td>
                <td>
                  <?php echo $fax; ?>
                </td>
              </tr>
               <tr>
                <td>
                  <?php echo $text_whatsapp; ?>
                </td>
                <td>
                  <a class="whatsapp" href="<?php echo $whatsapp; ?>"><?php echo $text_can_write; ?></a>
                </td>
              </tr>
               <tr>
                <td>
                  <?php echo $text_skype; ?>
                </td>
                <td>
                  <?php echo $skype; ?>
                </td>
              </tr>
               <tr>
                <td>
                  <?php echo $text_instagram; ?>
                </td>
                <td>
                  <?php echo $instagram; ?>
                </td>
              </tr>
              <tr>
                <td>
                  <?php echo $text_vk; ?>
                </td>
                <td>
                  <?php echo $vk; ?>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="clearfix"></div>
      </div>
      <?php if($about_us) { ?>
        <div class="about-us">
          <h4 class="about-us"><?php echo $text_about_us; ?></h4>
          <div><?php echo $about_us; ?></div>
        </div>
      <?php } ?>
      <?php if($contact_block) { ?>
        <div class="decor-block contact">
          <fieldset>
          <legend><?php echo $contact_block; ?></legend>
          </fieldset>
        </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
