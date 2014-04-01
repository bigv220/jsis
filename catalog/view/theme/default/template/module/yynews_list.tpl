<div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="box-heading">
        <?php echo $heading_title; ?>
    </div>
    <div class="box-content">
        <div style="overflow:hidden;" class="article_list-layer5E374E981DCAE2FA7C3393BD338C4C99">
            <?php if ($yynewss) { ?>
            <?php foreach ($yynewss as $yynews) { ?>
            <ul>
                <li class="wpart-border-line">
                    <p class="link title">
                        <?php if ($display_titleimage) {?> <?php echo ($yynews['titleimage']!="")? "<img width=\"64px\" high=\"64px\" src=\"{$yynews['titleimage']} \"  >":"";  ?><?php } ?>
                        <span class="category"></span>
                        <a href="<?php echo $yynews['action'][0]['href']; ?>"><?php echo $yynews['title']; ?></a>
                    </p>
                    <p class="time"><span class="wp-new-ar-pro-time"><?php echo $yynews['newsdate']; ?></span></p>
                </li>
            </ul>
            <?php } ?>
            <?php } else { ?>
            <?php echo $text_no_results; ?>
            <?php } ?>
        </div>

      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
