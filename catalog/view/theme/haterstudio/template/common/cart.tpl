<div id="cart" class="btn-group btn-block">
  <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="dropdown-toggle cart"><span id="cart-total"><?php echo $text_items; ?></span><span class="count-products"><?php echo $count_product; ?></span></button>
  <ul class="dropdown-menu pull-right">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn-remove-product"><i class="fal fa-trash-alt"></i></button></td>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-center"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-center quantity">
            <input type="text" value="<?php echo $product['quantity']; ?>" data-product-price="<?php echo (int)$product['total'] / (int)$product['quantity']; ?>" data-cart-id="<?php echo $product['cart_id']; ?>" class="cart-input" id="quantity-<?php echo $product['cart_id']; ?>" />
            <div class="pull-right">
              <div class="quantity-plus text-center" data-action="plus" data-cart-id="<?php echo $product['cart_id']; ?>">+</div>   
              <div class="quantity-minus text-center" data-action="minus" data-cart-id="<?php echo $product['cart_id']; ?>">-</div>
            </div>   
          </td>
          <td class="text-center"><?php echo $product['total']; ?></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div class="pull-right text-left">
        <?php foreach ($totals as $total) { ?>
          <div class="total">
            <?php echo $total['title']; ?>:
            <?php echo $total['text']; ?>
          </div>
        <?php } ?>
        <div class="btn-brown">
          <a href="<?php echo $cart; ?>" class="btn-brown"><?php echo $text_checkout; ?></a>
        </div>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
<script type="text/javascript">
  var request;

  $(document).on('click', '.quantity-plus, .quantity-minus', function(e) {
    updateCart($(this));
    e.stopPropagation();
  });

  $(document).on('keyup', '.cart-input', function(e) {
    updateCart($(this));
    e.stopPropagation();
  });

  function updateCart(el) {
    if(request) {
      clearTimeout(request);
    }

    var key = el.attr('data-cart-id');
    var action = el.attr('data-action');
    var quantity = $('#quantity-' + key).val();

    if(action) {
      if(action == 'plus') {
        quantity = parseInt(quantity) + 1;
      } else if(action == 'minus') {
        quantity = parseInt(quantity) - 1;
        if(quantity < 0) {
          quantity = 0;
        }
      }

      $('#quantity-' + key).val(quantity);
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
          // Need to set timeout otherwise it wont update the total
          setTimeout(function () {
            $('#cart > button > .count-products').html(json['total']);
          }, 100);

          if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
            location = 'index.php?route=checkout/cart';
          } else {
            $('#cart > ul').load('index.php?route=common/cart/info ul li');
          }
        }
      });
    }, 400);
  }
</script>