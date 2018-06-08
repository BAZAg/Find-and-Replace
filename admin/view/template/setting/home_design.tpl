<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-design" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <form action="<?php echo $action; ?>" id="form-design" method="post">
      <fieldset>
       <legend><?php echo $text_block_1; ?></legend>
        <div class="form-group">
         <div class="col-sm-2">
          <a href="" id="thumb-image-block-1" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb_block_1; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image_block_1" value="<?php echo $image_block_1; ?>" id="input-image-block-1" />
         </div>
          <div class="col-sm-10">
        <div class="form-group">
          <label class="col-sm-3 control-label" for="input-block-1-h"><?php echo $entry_block_h; ?></label>
          <div class="col-sm-9">
           <input type="text" name="h_block_1" value="<?php echo $h_block_1; ?>" placeholder="<?php echo $entry_block_h; ?>" id="input-block-1-h" class="form-control" />
          </div>
          <div class="clearfix"></div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="input-block-1-html"><?php echo $entry_block_html; ?></label>
          <div class="col-sm-9">
           <textarea name="html_block_1" placeholder="<?php echo $entry_block_html; ?>" id="input-block-1-html" class="form-control summernote" ><?php echo $html_block_1; ?></textarea>
          </div>
          <div class="clearfix"></div>
        </div>
        </div>
       </div>
      </fieldset>
      <fieldset>
       <legend><?php echo $text_block_2; ?></legend>
        <div class="form-group">
         <div class="col-sm-2">
          <div>
            <a href="" id="thumb-image-block-2-1" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb_block_2_1; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image_block_2_1" value="<?php echo $image_block_2_1; ?>" id="input-image-block-2-1" />
          </div>
          <div>
            <a href="" id="thumb-image-block-2-2" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb_block_2_2; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image_block_2_2" value="<?php echo $image_block_2_2; ?>" id="input-image-block-2-2" />
          </div>
          <div>
            <a href="" id="thumb-image-block-2-3" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb_block_2_3; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image_block_2_3" value="<?php echo $image_block_2_3; ?>" id="input-image-block-2-3" />
          </div>
         </div>
          <div class="col-sm-10">
        <div class="form-group">
          <label class="col-sm-3 control-label" for="input-block-2-h"><?php echo $entry_block_h; ?></label>
          <div class="col-sm-9">
           <input type="text" name="h_block_2" value="<?php echo $h_block_2; ?>" placeholder="<?php echo $entry_block_h; ?>" id="input-block-2-h" class="form-control" />
          </div>
          <div class="clearfix"></div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="input-block-2-html"><?php echo $entry_block_html; ?></label>
          <div class="col-sm-9">
           <textarea name="html_block_2" placeholder="<?php echo $entry_block_html; ?>" id="input-block-2-html" class="form-control summernote" ><?php echo $html_block_2; ?></textarea>
          </div>
          <div class="clearfix"></div>
        </div>
        </div>
       </div>
      </fieldset>
      <fieldset>
       <legend><?php echo $text_block_3; ?></legend>
        <div class="form-group">
         <div class="col-sm-2">
          <a href="" id="thumb-image-block-3" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb_block_3; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image_block_3" value="<?php echo $image_block_3; ?>" id="input-image-block-3" />
         </div>
          <div class="col-sm-10">
        <div class="form-group">
          <label class="col-sm-3 control-label" for="input-block-3-h"><?php echo $entry_block_h; ?></label>
          <div class="col-sm-9">
           <input type="text" name="h_block_3" value="<?php echo $h_block_3; ?>" placeholder="<?php echo $entry_block_h; ?>" id="input-block-3-h" class="form-control" />
          </div>
          <div class="clearfix"></div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="input-block-3-html"><?php echo $entry_block_html; ?></label>
          <div class="col-sm-9">
           <textarea name="html_block_3" placeholder="<?php echo $entry_block_html; ?>" id="input-block-3-html" class="form-control summernote" ><?php echo $html_block_3; ?></textarea>
          </div>
          <div class="clearfix"></div>
        </div>
        </div>
       </div>
      </fieldset>
    </form>
  </div>
</div>
<?php echo $footer; ?>