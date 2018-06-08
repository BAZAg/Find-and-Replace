<div class="header-recall-background">
  <div class="header-recall-popup">
    <div class="h"><?php echo $text_order_recall; ?></div>
    <form id="header-recall-form">
      <div class="col-xs-12 col-sm-6 nopadding-l">
        <input class="form-control" name="name" placeholder="<?php echo $text_name; ?>" value="" />
      </div>
      <div class="col-xs-12 col-sm-6 nopadding-r">
        <input class="form-control" name="telephone" placeholder="<?php echo $text_telephone; ?>" value="" />
      </div>
      <div class="btn-brown">
        <button type="button" id="send-header-recall" class="btn-brown" data-loading-text="<?php echo $text_btn_loading; ?>"><?php echo $text_send_request; ?></button>
      </div>
    </form>
    <div class="close-popup">
      <i class="fal fa-times"></i>
    </div>
  </div>
  <div id="cart-added-popup">
    <div class="product-image"></div>
    <div class="product-description">
      <div class="added"><?php echo $text_added; ?></div>
      <div><?php echo $text_punkt; ?></div>
    </div>
    <div class="clearfix"></div>
    <div class="continue-buy">
      <span><?php echo $continue_buy; ?></span>
    </div>
    <div class="close-popup">
      <i class="fal fa-times"></i>
    </div>
  </div>
</div>
<div class="feedback-form">
      <div class="container">
        <form id="footer-form">
          <div class="text-center feedback-form__title">
            <?php echo $text_need_consult; ?>
          </div>
          <div class="row">
            <div class="block-centered col-sm-10 col-lg-8 col-md-9 col-xs-12">
              <div class="row">
                <div class="col-sm-4"><input type="text" name="name" id="" placeholder="<?php echo $text_your_name; ?>" class="form-control footer-form-name"></div>
                <div class="col-sm-4"><input type="text" name="telephone" id="" placeholder="<?php echo $text_your_telephone; ?>" class="form-control footer-form-telephone"></div>
                <div class="col-sm-4 btn-brown nopadding"><button type="button" class="btn-brown" data-loading-text="<?php echo $text_btn_loading; ?>" id="send-footer-form"><?php echo $text_send_request; ?></button></div>
              </div>
              <label class="feedback-form__permition"><span class="check"><input type="checkbox" value="1" checked="checked" name="agree"><i></i></span> <?php echo $text_agree_conf; ?></label>
            </div>
          </div>
        </form>
      </div>
    </div>
<footer>
  <div class="container">
    <div class="row">
      <?php if($categories) { ?>
        <?php foreach ($categories as $category) { ?>
          <div class="col-sm-2">
            <div class="main-chapter">
              <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
            </div>
            <?php if($category['products']) { ?>
              <?php foreach($category['products'] as $product) { ?>
                <div class="secondary-chapter">
                  <a href="<?php echo $product['href']; ?>" ><?php echo $product['name']; ?></a>
                </div>
              <?php } ?>
            <?php } ?>
          </div>
        <?php } ?>
      <?php } ?>
      <div class="col-sm-2">
        <div class="main-chapter">
          <a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
        </div>
      <?php if ($informations) { ?>
        <?php foreach ($informations as $information) { ?>
          <div class="secondary-chapter"><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></div>
        <?php } ?>
      <?php } ?>
      </div>
      <?php if($telephone || $second_telephone || $link_tg || $link_whatsapp || $link_viber) { ?>
        <div class="col-sm-2">
        <?php if($telephone) { ?>
          <div class="contacts"><a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a></div>
        <?php } ?>
        <?php if($second_telephone) { ?>
          <div class="contacts"><a href="tel:<?php echo $second_telephone; ?>"><?php echo $second_telephone; ?></a></div>
        <?php } ?>
        <?php if($telephone || $second_telephone) { ?>
          <div class="free-call"><?php echo $text_free_call; ?></div>
        <?php } ?>
        <?php if($link_tg || $link_whatsapp || $link_viber) { ?>
          <div class="messengers">
            <span><?php echo $text_messanger; ?></span>
            <?php if($link_tg) {?>
              <a href="<?php echo $link_tg; ?>" target="_blank"><i class="fab fa-telegram-plane"></i></a>
            <?php } ?>
            <?php if($link_whatsapp) { ?>
              <a href="<?php echo $link_whatsapp; ?>" target="_blank"><i class="fab fa-whatsapp"></i></a>
            <?php } ?>
            <?php if($link_viber) { ?>
              <a href="<?php echo $link_viber; ?>" target="_blank"><i class="fab fa-viber"></i></a>
            <?php } ?>
          </div>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="col-sm-2">
        <div class="secondary-chapter"><?php echo $text_pickup; ?></div>
        <?php if($link_vk || $link_instagram) { ?>
          <div class="social">
            <span><?php echo $text_social; ?></span>
            <?php if($link_vk) { ?>
              <a href="<?php echo $link_vk; ?>" target="_blank"><i class="fab fa-vk"></i></a>
            <?php } ?>
            <?php if($link_instagram) { ?>
              <a href="<?php echo $link_instagram; ?>" target="_blank"><i class="fab fa-instagram"></i></a>
            <?php } ?>
          </div>
        <?php } ?>
      </div>
      <div class="col-sm-12 payment-method">
        <?php echo $text_payment_method; ?>
        <img alt="VISA icon" src="<?php echo $img_visa; ?>" />
        <img alt="MasterCard icon" src="<?php echo $img_mastercard; ?>" />
        <img alt="Tinkoff icon" src="<?php echo $img_tinkoff_bank; ?>" />
        <img alt="Sberbank icon" src="<?php echo $img_sberbank_online; ?>" />
        <img alt="YandexMoney icon" src="<?php echo $img_yandex_money; ?>" />
      </div>
      <?php if ($informations_ex) { ?>
      <?php $i = 0; ?>
        <div class="col-sm-12 nopadding">
          <?php foreach($informations_ex as $ex) { ?>
            <?php if($i % 2 == 0 || $i == 0) { ?>
              <div class="col-sm-3">
            <?php } ?>
            <div class="ex-information <?php echo !$i%2 == 0 && !array_key_exists($i + 1, $informations_ex) ? 'finish' : ''; ?>"><a href="<?php echo $ex['href']; ?>"><?php echo $ex['title']; ?></a></div>
            <?php if(!$i % 2 == 0 && $i != 0) { ?>
              </div>
            <?php } ?>
          <?php $i++; ?>
          <?php } ?>
          <div class="clearfix"></div>
        </div>
      <?php } ?>
    </div>
  </div>
  <div class="information">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 nopadding">
          <div class="col-sm-10">
            <?php echo $text_comment; ?>
          </div>
          <div class="col-sm-2 pull-right text-right">
            <?php echo $text_copir; ?>
          </div>
          </div>
      </div>
    </div>
  </div>
</footer>
<script type="text/javascript">
  $('#send-footer-form').click(function() {
    $.ajax({
      url: 'index.php?route=common/footer/sendForm',
      data: $('#footer-form').serialize(),
      dataType: 'json',
      type: 'post',
      beforeSend: function() {
        $('#send-footer-form').button('loading');
        $('.error').removeClass('error');
      },
      complete: function() {
         $('#send-footer-form').button('reset');
      },
      success: function(json) {
        if(json['success']) {
          $('#send-footer-form').prop('disabled', true).html('<i class="fal fa-check"></i>');
        } else {
          for(i=0;json['error'].length>i;i++) {
            $('.footer-form-'+json['error'][i]).addClass('error');
          }
        }
      }
    });
  });
</script>
<script type="text/javascript">
  $('#send-header-recall').click(function() {
    $.ajax({
      url: 'index.php?route=common/header/sendRecallRequest',
      type: 'post',
      dataType: 'json',
      data: $('#header-recall-form').serialize(),
      beforeSend: function() {
        $('#send-header-recall').button('loading');
        $('.error').removeClass('remove');
      },
      complete: function() {
        $('#send-header-recall').button('reset');
      },
      success: function(json) {
        if(json['success']) {
          setTimeout(function() {
            $('.close-popup').trigger('click');
          }, 300);
        } else {
          for(i=0;json['error'].length>i;i++) {
            $('input[name="' + json['error'][i] + '"]').addClass('error');
          }
        }
      }
    });
  })
</script>
<script type="text/javascript">
  $('#button-cart').on('click', function() {
    $.ajax({
      url: 'index.php?route=checkout/cart/add',
      type: 'post',
      data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
      dataType: 'json',
      beforeSend: function() {
        $('#button-cart').button('loading');
      },
      complete: function() {
        $('#button-cart').button('reset');
      },
      success: function(json) {
        $('.alert, .text-danger').remove();
        $('.form-group').removeClass('has-error');

        if (json['error']) {
          if (json['error']['option']) {
            for (i in json['error']['option']) {
              var element = $('#input-option' + i.replace('_', '-'));

              if (element.parent().hasClass('input-group')) {
                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
              } else {
                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
              }
            }
          }

          if (json['error']['recurring']) {
            $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
          }

          // Highlight any found errors
          $('.text-danger').parent().addClass('has-error');
        }

        if (json['success']) {

          $('#cart > button > .count-products').html(json['total']);

          if(json['image']) {
            $('#cart-added-popup > .product-image').html('<img class="img-responsive" src="' + json['image'] + '" />');
          }

          blurOn($('#cart-added-popup'));

          $('#cart > ul').load('index.php?route=common/cart/info ul li');
        }
      },
          error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
    });
  });

  $('#btn-header-recall').click(function() {
    blurOn($('.header-recall-popup'));
    return false;
  });

  $('.header-recall-background').click(function() {
    blurOff($('.header-recall-popup'));
  });

  $('.header-recall-popup, #cart-added-popup').click(function(e) {
    e.stopPropagation();
  });

  $('.continue-buy').click(function() {
    $('.close-popup').trigger('click');
  });

  $('.close-popup').click(function() {
    $(this).parent().parent().fadeOut();
    blurOff();
  });

  function blurOff(el) {
    $('.header-recall-background').fadeOut();
    if(el) {
      el.fadeOut();
    }
    $('.container, header, footer, #header-carousel').removeClass('blur');
  }

  function blurOn(el) {
    $('.header-recall-background').fadeIn();
    if(el) {
      el.fadeIn();
    }
    $('.container, header, footer, #header-carousel').addClass('blur');
  }
</script>

</body></html>