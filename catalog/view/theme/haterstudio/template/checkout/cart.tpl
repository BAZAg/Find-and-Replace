<?php echo $header; ?>
<div class="menu-holder">
  <div class="container">
    <ul class="breadcrumb nomargin">
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
</div>
<div class="container" id="container">
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> order"><?php echo $content_top; ?>
      <form id="order-form" method="post" enctype="multipart/form-data">
      <h2>Оформление<br> заказа</h2>
        <div class="order-table-box">
          <div class="order-table">
            <table>
              <thead>
                <tr>
                  <th><?php echo $column_order; ?></th>
                  <th><?php echo $column_name; ?></th>
                  <th><?php echo $column_model; ?></th>
                  <th><?php echo $column_quantity; ?></th>
                  <th><?php echo $column_price; ?></th>
                  <th><?php echo $column_total; ?></th>
                  <th>&nbsp;</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($products as $product) { ?>
                  <tr>
                    <td>
                      <?php if ($product['thumb']) { ?>
                      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                      <?php } ?>
                    </td>
                    <td>
                      <?php echo $product['name']; ?>
                      <?php if (!$product['stock']) { ?>
                        <span class="text-danger">***</span>
                      <?php } ?>
                      <?php if ($product['option']) { ?>
                      <?php foreach ($product['option'] as $option) { ?>
                      <br />
                      <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                      <?php } ?>
                      <?php } ?>
                      <?php if ($product['reward']) { ?>
                      <br />
                      <small><?php echo $product['reward']; ?></small>
                      <?php } ?>
                      <?php if ($product['recurring']) { ?>
                      <br />
                      <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                      <?php } ?>
                    </td>
                    <td><?php echo $product['model']; ?></td>
                    <td>
                      <div class="input-counter">
                        <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" id="cart-quantity-<?php echo $product['cart_id']; ?>" data-cart-id="<?php echo $product['cart_id']; ?>" class="input cart-cart-quantity" value="<?php echo $product['quantity']; ?>">
                        <div class="btn-plus" data-cart-id="<?php echo $product['cart_id']; ?>" data-action="plus">+</div>
                        <div class="btn-minus" data-cart-id="<?php echo $product['cart_id']; ?>" data-action="minus">-</div>
                      </div>
                    </td>
                    <td><?php echo $product['price']; ?></td>
                    <td><?php echo $product['total']; ?></td>
                    <td class="text-center"><a href="#" class="btn-del" onclick="cart.remove('<?php echo $product['cart_id']; ?>');return false;" title="Удалить"><span class="glyphicon glyphicon-trash"></span></a></td>
                  </tr>
                <?php } ?>
                <?php foreach ($vouchers as $voucher) { ?>
                  <tr>
                    <td></td>
                    <td class="text-left"><?php echo $voucher['description']; ?></td>
                    <td class="text-left"></td>
                    <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                        <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                        <span class="input-group-btn">
                        <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                        </span></div></td>
                    <td class="text-right"><?php echo $voucher['amount']; ?></td>
                    <td class="text-right"><?php echo $voucher['amount']; ?></td>
                  </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </div>
        <?php $a = 0; ?>
        <?php foreach ($totals as $total) { ?>
          <?php if(!array_key_exists($a + 1, $totals)) { ?>
            <div class="total-summ"><?php echo $total['title']; ?>: <?php echo $total['text']; ?></div>
          <?php } ?>
          <?php $a++; ?>
        <?php } ?>
        <p>&nbsp;</p>
      <?php if ($shipping_methods) { ?>
        <div class="delivery">
          <h3>Доставка</h3>
            <div class="delivery__type">
              <?php foreach ($shipping_methods as $shipping_method) { ?>
                <?php if (!$shipping_method['error']) { ?>
                  <?php foreach ($shipping_method['quote'] as $quote) { ?>
                    <label for="method-<?php echo $quote['code']; ?>" class="radio-button">
                      <?php if ($quote['code'] == $shipping_code || !$shipping_code) { ?>
                        <?php $shipping_code = $quote['code']; ?>
                        <input type="radio" data-free-shipping="<?php echo !(int)$quote['text'] ? '1' : '0'; ?>" name="shipping_method" value="<?php echo $quote['code']; ?>" id="method-<?php echo $quote['code']; ?>" checked="checked">
                      <?php } else { ?>
                        <input type="radio" data-free-shipping="<?php echo !(int)$quote['text'] ? '1' : '0'; ?>" name="shipping_method" value="<?php echo $quote['code']; ?>" id="method-<?php echo $quote['code']; ?>">
                      <?php } ?>
                      <span class="checkmark"></span>
                      <span class="radio-text"><?php echo $quote['title']; ?> <?php echo (int)$quote['text'] ? '(<strong>+' . $quote['text'] . '</strong>)' : ''; ?></span>
                    </label>
                  <?php } ?>
                <?php } else { ?>
                  <div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
                <?php } ?>
              <?php } ?>
            </div> 
          <div class="row hidden">
            <div class="col-sm-8">
              <div class="map-holder">
                <img src="img/img-05.jpg" alt="" class="img-responsive" style="width: 100%">
              </div>
            </div>
            <div class="col-sm-4">
              <p class="delivery__place-text">Выберите удобный Вам пункт выдачи на карте</p>
              Выбран: г. Ставрополь, ул. Кулакова 8а
            </div>
          </div>
        </div>
      <?php } ?>
      <?php if ($payment_methods) { ?>
        <div class="<?php echo count($payment_methods) == 1 ? 'hidden' : 'payment'; ?>">
          <h3>Оплата</h3>
          <div class="payment__type">
            <?php foreach ($payment_methods as $payment_method) { ?>
              <label for="payment-<?php echo $payment_method['code']; ?>" class="radio-button">
                <?php if ($payment_method['code'] == $payment_code || !$payment_code) { ?>
                  <?php $payment_code = $payment_method['code']; ?>
                  <input type="radio" id="payment-<?php echo $payment_method['code']; ?>" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
                <?php } else { ?>
                  <input type="radio" id="payment-<?php echo $payment_method['code']; ?>" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
                <?php } ?>
                <span class="checkmark"></span>
                <span class="radio-text"><?php echo $payment_method['title']; ?></span>
              </label>
              <?php if ($payment_method['terms']) { ?>
              (<?php echo $payment_method['terms']; ?>)
              <?php } ?>
            <?php } ?>
          </div>
        </div>
      <?php } ?>
      <?php if ($modules) { ?>
        <h2><?php echo $text_next; ?></h2>
        <p><?php echo $text_next_choice; ?></p>
        <div class="panel-group" id="accordion">
          <?php foreach ($modules as $module) { ?>
          <?php echo $module; ?>
          <?php } ?>
        </div>
      <?php } ?>
      <br />
      <div class="row">
        <div class="col-sm-8">
          <h3><?php echo $text_contact_information; ?></h3>
          <div class="contact-form">
            <div class="form-horizontal">
              <div class="form-group requared">
                <label class="col-sm-4 control-label" for="customer_full_name"><?php echo $text_contact_face; ?></label>
                <div class="col-sm-8">
                  <input type="text" value="" name="customer_full_name" placeholder="Ваше Фамилия Имя Отчество" class="form-control" id="customer_full_name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" for="telephone"><?php echo $text_telephone; ?></label>
                <div class="col-sm-8">
                  <input type="text" value="" placeholder="<?php echo $place_telephone; ?>" name="telephone" class="form-control" id="telephone">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" for="email"><?php echo $text_email; ?></label>
                <div class="col-sm-8">
                  <input type="text" value="" placeholder="<?php echo $place_email; ?>" name="email" class="form-control" id="email">
                </div>
              </div>
              <div class="form-group hidden">
                <label class="col-sm-4 control-label" for="address_1"><?php echo $text_address; ?>*</label>
                <div class="col-sm-8">
                  <input type="text" value="" placeholder="<?php echo $text_address; ?>" name="address_1" class="form-control" id="address_1">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" for="comment"><?php echo $text_comment; ?></label>
                <div class="col-sm-8">
                  <textarea class="form-control" name="comment" id="comment" rows="5" placeholder="<?php echo $place_comment; ?>"></textarea>
                </div>
              </div>
            </div>
            <div class="form-buttons">
              <a href="<?php echo $continue; ?>" class="follow-order"><?php echo $text_continue; ?></a>
              <div class="btn-brown">
                <button type="button" class="btn-brown" id="confirm-order" data-loading-text="<?php echo $text_loading; ?>"><?php echo $text_pay; ?></button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <input type="hidden" name="need_address" value="" />
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
  var request;

  $(document).on('click', '.btn-plus, .btn-minus', function(e) {
    updateCart($(this));
    e.stopPropagation();
  });

  $(document).on('keyup', '.cart-cart-quantity', function(e) {
    updateCart($(this));
    e.stopPropagation();
  });

  function updateCart(el) {
    if(request) {
      clearTimeout(request);
    }

    var key = el.attr('data-cart-id');
    var action = el.attr('data-action');
    var quantity = $('#cart-quantity-' + key).val();

    console.log(key, action, quantity);

    if(action) {
      if(action == 'plus') {
        quantity = parseInt(quantity) + 1;
      } else if(action == 'minus') {
        quantity = parseInt(quantity) - 1;
        if(quantity < 0) {
          quantity = 0;
        }
      }

      $('#cart-quantity-' + key).val(quantity);
    }

    request = setTimeout(function() {
      $.ajax({
        url: 'index.php?route=checkout/cart/edit&type=ajax',
        type: 'post',
        data: 'quantity['+key+']=' + (typeof(quantity) != 'undefined' ? quantity : 1),
        dataType: 'json',
        beforeSend: function() {
          $('#cart > button').button('loading');
        },
        complete: function() {
          $('#cart > button').button('reset');
        },
        success: function(json) {
          window.location.reload();
        }
      });
    }, 400);
  }
</script>
<script type="text/javascript">
  $('input[name="shipping_method"]').change(function() {
    var fSh = $('input[name="shipping_method"]:checked').attr('data-free-shipping');
    if(fSh == '1') {
      $('input[name="need_address"]').val('0');
      $('input[name="address_1"]').parent().parent().addClass('hidden');
    } else {
      $('input[name="need_address"]').val('1');
      $('input[name="address_1"]').parent().parent().removeClass('hidden');
    }
  });

  $(document).ready(function() {
    $('input[name="shipping_method"]').trigger('change');
  });
</script>
<script type="text/javascript">
  $('#confirm-order').click(function() {
    $.ajax({
      url: 'index.php?route=checkout/cart/checkout',
      data: $('#order-form').serialize(),
      type: 'post',
      dataType: 'json',
      beforeSend: function() {
        $('.error').removeClass('error');
        $('#confirm-order').button('loading');
      },
      complete: function() {
        $('#confirm-order').button('reset');
      },
      success: function(json) {
        if(json['success']) {
          $.ajax({
            url: json['success'],
            success: function() {
              window.location = 'index.php?route=checkout/success';
            }
          });
        } else if(json['redirect']) {
          window.location = json['redirect'];
        } else if(json['error']) {
          for(var key in json['error']) {
            if(key == 'warning') {
              $('#container').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'][key] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            } else {
              $('#'+key).addClass('error').attr('placeholder', json['error'][key]);
            }
          }
        }
        console.log(json);
      }
    });
  });
</script>
<?php echo $footer; ?>
