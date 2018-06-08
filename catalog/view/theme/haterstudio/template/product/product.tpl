<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <?php if($h_block_0) { ?>
          <div class="product-block-0<?php echo $image_block_0 ? ' img' : ''; ?>">
            <?php if($image_block_0) {
              $block_class_img = 'col-sm-8';
              $block_class = 'col-sm-4';
             } else { 
              $block_class_img = '';
              $block_class = 'col-sm-12';
             } ?>
            <div class="<?php echo $block_class; ?>">
              <div class="<?php echo !$image_block_0 ? 'text-center' : ''; ?>">
                <h1 class="product"><?php echo $h_block_0; ?></h1>
              </div>
              <div class="<?php echo !$image_block_0 ? 'text-center' : ''; ?>">
                <div class="line"></div>
              </div>
              <div class="<?php echo !$image_block_0 ? 'text-center' : ''; ?>">
                <?php echo $html_block_0; ?>
              </div>
            </div>
            <?php if($image_block_0) { ?>
              <div class="<?php echo $block_class_img; ?> pull-right">
                <img class="img-responsive" alt="<?php echo $h_block_0; ?>" src="<?php echo $image_block_0; ?>" />
              </div>
            <?php } ?>
            <div class="background-block-0<?php echo $image_block_0 ? ' img' : ''; ?>"></div>
            <div class="clearfix"></div>
          </div>
        <?php } ?>
        <div class="top-line">
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
        <div class="col-sm-6">
          <h2><?php echo $heading_title; ?></h2>
          <div class="line"></div>
          <ul class="nav nav-tabs hidden">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
        </div>
        <div class="col-xs-12 col-sm-6" id="product">
          <?php if ($thumb || $images) { ?>
          <ul class="thumbnails">
            <?php if ($thumb) { ?>
            <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive" /></a></li>
            <?php } ?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          <?php if ($options) { ?>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio_image') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <div id="input-option<?php echo $option['product_option_id']; ?>" class="owl-carousel">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <div class="option-image">
                    <input type="radio" id="input-radio-<?php echo $option['product_option_id']; ?>-<?php echo $option_value['product_option_value_id']; ?>" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <label for="input-radio-<?php echo $option['product_option_id']; ?>-<?php echo $option_value['product_option_value_id']; ?>"></label>
                    <?php if ($option_value['image']) { ?>
                      <img src="<?php echo $option_value['image']; ?>" data-image-full="<?php echo $option_value['image_full']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail option-img" /> 
                    <?php } ?>
                    <div class="text-center">                    
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                       (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <div id="input-option<?php echo $option['product_option_id']; ?>" class="col-sm-12 col-md-8 nopadding">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio col-sm-12 col-md-6 nopadding-l">
                  <div class="option-radio-item">
                    <input type="radio" id="input-radio-<?php echo $option['product_option_id']; ?>-<?php echo $option_value['product_option_value_id']; ?>" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <label for="input-radio-<?php echo $option['product_option_id']; ?>-<?php echo $option_value['product_option_value_id']; ?>">
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                       (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <?php } ?>
              </div>
              <div class="clearfix"></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <div class="quantity">
              <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
              <input type="radio" id="input-quantity-1" value="1" name="quantity-radio" />
              <label class="green-radio" for="input-quantity-1">1</label>
              <?php foreach($discounts as $discount) { ?>
                <input type="radio" id="input-quantity-<?php echo $discount['quantity']; ?>" class="green-radio" value="<?php echo $discount['quantity']; ?>" name="quantity-radio" />
                <label class="green-radio" for="input-quantity-<?php echo $discount['quantity']; ?>"><?php echo $discount['quantity']; ?> <?php echo $discount['difference'] ? '(-' . $discount['difference'] . '%)' : ''; ?></label>
              <?php } ?>
              <label class="green-radio" for="input-quantity-other">
              <input type="radio" id="input-quantity-other" class="green-radio" value="" name="quantity-radio" />
              <input type="text" id="input-quantity-other-other" class="green-radio" value="" name="quantity-other" />
              </label>
              <input type="hidden" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
               <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
               <?php if ($minimum > 1) { ?>
              <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
            </div>
          <?php if ($price) { ?>
            <?php if (!$special) { ?>
              <div class="price"><?php echo $price; ?></div>
            <?php } else { ?>
              <span style="text-decoration: line-through;"><?php echo $price; ?></span>
              <div class="price"><?php echo $special; ?></div>
            <?php } ?>
          <?php } ?>
          <div>
            
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring; ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            <div class="form-group text-center">
              <div class="btn-brown">
                <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn-brown"><?php echo $button_cart; ?></button>
              </div>
            </div>
          </div>
          <?php if ($review_status) { ?>
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
            <hr>
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
            <!-- AddThis Button END -->
          </div>
          <?php } ?>
          <div class="orange-background"></div>
        </div>
      </div>
      <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-xs-8 col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-xs-6 col-md-4'; ?>
        <?php } else { ?>
        <?php $class = 'col-xs-6 col-sm-3'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($j = 1; $j <= 5; $j++) { ?>
                <?php if ($product['rating'] < $j) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && (($i+1) % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && (($i+1) % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif (($i+1) % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php if($block_1_text) { ?>
        <div class="decor-block">
          <fieldset>
          <legend><?php echo $block_1_text; ?></legend>
          </fieldset>
        </div>
      <?php } ?>
      <?php if($h_block_2) { ?>
        <div class="product-block-2">
          <div class="col-xs-12 col-sm-6">
            <img alt="<?php echo $h_block_2; ?>" src="<?php echo $image_block_2; ?>" class="img-responsive" />
          </div>
          <div class="col-xs-12 col-sm-6 pull-right">
            <h3><?php echo $h_block_2; ?></h3>
            <div class="line"></div>
            <?php echo $html_block_2; ?>
          </div>
          <div class="clearfix"></div>
        </div>
      <?php } ?>
      <?php if($h_block_3) { ?>
        <div class="product-block-3">
          <div class="col-xs-12 col-sm-6">
            <h3><?php echo $h_block_3; ?></h3>
            <div class="line"></div>
            <?php echo $html_block_3; ?>
          </div>
          <div class="col-xs-12 col-sm-6 pull-right">
            <img alt="<?php echo $h_block_3; ?>" src="<?php echo $image_block_3; ?>" class="img-responsive" />
          </div>
          <div class="product-background-block-3" style="background: url(<?php echo $background_block_3; ?>) no-repeat center center"></div>
          <div class="clearfix"></div>
        </div>
      <?php } ?>
      <?php if($h_block_4) { ?>
        <div class="product-block-4">
          <div class="col-xs-12 col-sm-6 col-sm-pull-1">
            <img alt="<?php echo $h_block_4; ?>" src="<?php echo $image_block_4; ?>" class="img-responsive" />
          </div>
          <div class="col-xs-12 col-sm-6 pull-right">
            <h3><?php echo $h_block_4; ?></h3>
            <div class="line"></div>
            <?php echo $html_block_4; ?>
          </div>
          <div class="clearfix"></div>
        </div>
      <?php } ?>
      <?php if($h_block_5) { ?>
        <div class="product-block-5">
          <div class="col-xs-12 col-sm-6">
            <h3><?php echo $h_block_5; ?></h3>
            <div class="line"></div>
            <?php echo $html_block_5; ?>
          </div>
          <div class="col-xs-12 col-sm-6 pull-right">
            <img alt="<?php echo $h_block_5; ?>" src="<?php echo $image_block_5; ?>" class="img-responsive" />
          </div>
          <div class="clearfix"></div>
        </div>
      <?php } ?>
      <?php if($block_6_text) { ?>
        <div class="decor-block last">
          <fieldset>
          <legend><?php echo $block_6_text; ?></legend>
          </fieldset>
        </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
              $('input[name="quantity-radio"]').change(function() {
                if($(this).val() == undefined || $(this).val() == '') {
                  $(this).parent().addClass('active');
                } else {
                  $(this).parent().parent().find('.active').removeClass('active');
                  $('input[name="quantity"]').val($(this).val());
                } 

              });
              $('input[name="quantity-other"]').keyup(function() {
                $('#input-quantity-other').trigger('click');
                setTimeout(function() {
                  if($('input[name="quantity"]').val() != '') {
                    $('input[name="quantity"]').val($('#input-quantity-other-other').val());
                  } else {
                    $('input[name="quantity"]').val(1);
                  }
                }, 100);
              })
            </script>
<script type="text/javascript">
  $('.option-img').click(function() {
    var option_img = $(this).parent().children('input');
    option_img.prop('checked', true);
    var img_full = $(this).attr('data-image-full');
    $('.thumbnails').children('li').children('a').children('img').attr('src', img_full);
  });
</script>
<script type="text/javascript">
  $('.owl-carousel').owlCarousel({
  items: 4,
  navigation: true,
  navigationText: ['<i class="fal fa-chevron-left fa-5x"></i>', '<i class="fal fa-chevron-right fa-5x"></i>'],
  pagination: false,
  responsiveClass:true,
  responsive:{
    0:{
      items: 2
    },
    768:{
      items: 4
    }
  }
});
</script>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>
