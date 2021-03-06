<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="f_form">
    <h2><?php echo $text_location; ?></h2>
    <div class="contact-info">
      <div class="content"><div class="left"><b><?php echo $text_address; ?></b><br />
        <?php echo $store; ?><br />
        <?php echo $address; ?></div>
      <div class="right">
        <?php if ($telephone) { ?>
        <b><?php echo $text_telephone; ?></b><br />
        <?php echo $telephone; ?><br />
        <br />
        <?php } ?>
        <?php if ($fax) { ?>
        <b><?php echo $text_fax; ?></b><br />
        <?php echo $fax; ?>
        <?php } ?>

          <div>
              <?php echo $online_qq; ?>
                  <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1457328016&amp;site=<?php echo $company_name; ?>&amp;Menu=yes" target="blank">
                      <img border="0" alt="<?php echo $click_send_msg; ?>" src="http://wpa.qq.com/pa?p=2:1457328016:52">1457328016
                  </a>
                  <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=2979651300&amp;site=<?php echo $company_name; ?>&amp;Menu=yes" target="blank">
                      <img border="0" alt="<?php echo $click_send_msg; ?>" src="http://wpa.qq.com/pa?p=2:2979651300:52">2979651300
                  </a>
                  <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=2508407356&amp;site=<?php echo $company_name; ?>&amp;Menu=yes" target="blank">
                      <img border="0" alt="<?php echo $click_send_msg; ?>" src="http://wpa.qq.com/pa?p=2:2508407356:52">2508407356
                  </a>
                  <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=2842162274&amp;site=<?php echo $company_name; ?>&amp;Menu=yes" target="blank">
                      <img border="0" alt="<?php echo $click_send_msg; ?>" src="http://wpa.qq.com/pa?p=2:2842162274:52">2842162274
                  </a>
          </div>
      </div>
    </div>
    </div>
    <h2><?php echo $text_contact; ?></h2>
    <div class="content">
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="<?php echo $name; ?>"  class="contact-info-input"/>
    <br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_email; ?></b><br />
    <input type="text" name="email" value="<?php echo $email; ?>" class="contact-info-input"/>
    <br />
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_enquiry; ?></b><br />
    <textarea name="enquiry" cols="40" rows="10" style="width: 90%;"><?php echo $enquiry; ?></textarea>
    <br />
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
    <br />
    <img src="index.php?route=information/contact/captcha" alt="" />
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
    </div>

    <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
	<div class="h20"></div>
	<div class="h20"></div>	
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>