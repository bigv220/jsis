<?php if ($mitems) { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/supermenu/supermenu.css" />
<?php if ($supermenuisresponsive) { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/supermenu/supermenu-mobile.css" />
<?php } ?>
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/supermenu/supermenuie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/supermenu/supermenuie6.css" />
<![endif]-->
<?php if ($supermenu_settings_status) { ?>
<style type="text/css">
<?php if ($supermenu_settings['bg']) { ?>
   #supermenu, #supermenu-mobile {
   background-color: <?php echo $supermenu_settings['bg']; ?>;
   }
   #supermenu ul li a.tll, #supermenu-mobile ul li a.tll {
	text-shadow: 0 0 1px <?php echo $supermenu_settings['bg']; ?>;
	}
<?php } ?>
<?php if ($supermenu_settings['tlc']) { ?>
   #supermenu ul li a.tll, #supermenu-mobile ul li a.tll {
   color: <?php echo $supermenu_settings['tlc']; ?>;
   }
<?php } ?>
<?php if ($supermenu_settings['dbg']) { ?>
   #supermenu ul li.tlli:hover a.tll, #supermenu-mobile ul li.tlli:hover a.tll {
   background: <?php echo $supermenu_settings['dbg']; ?>;
   color:#000;
   }
   #supermenu ul li div.bigdiv, #supermenu-mobile ul li div.bigdiv {
    background: <?php echo $supermenu_settings['dbg']; ?>;
   }
<?php } ?>
<?php if ($supermenu_settings['slc']) { ?>
   #supermenu  ul  li  div  .withchild a.theparent, #supermenu  ul  li  div .withimage .name a {
   color: #000;
   }
   #supermenu-mobile  ul  li  div  .withchild a.theparent {
   	color:#fff;
   }
<?php } ?>
<?php if ($supermenu_settings['slbg']) { ?>
   #supermenu  ul  li  div  .withchild a.theparent, #supermenu-mobile  ul  li  div  .withchild a.theparent {
   background: <?php echo $supermenu_settings['slbg']; ?>;
   border-bottom: none;
   }
   #supermenu  ul  li  div .withimage .image img {
    border: 4px solid <?php echo $supermenu_settings['slbg']; ?>;
   }
<?php } ?>
<?php if ($supermenu_settings['slbgh']) { ?>
   #supermenu ul li div .withchild, #supermenu-mobile ul li div .withchild {
   border: 1px solid <?php echo $supermenu_settings['slbgh']; ?>;
   }
   #supermenu  ul  li  div .withoutchild .withchild a:hover, #supermenu  ul  li  div  .withchild a.theparent:hover, #supermenu-mobile  ul  li  div .withoutchild .withchild a:hover, #supermenu-mobile  ul  li  div  .withchild a.theparent:hover {
   background: <?php echo $supermenu_settings['slbgh']; ?>;
   }
   #supermenu  ul  li  div  .withchild ul.child-level li a:hover {
    background: <?php echo $supermenu_settings['slbgh']; ?>;
   }
   #supermenu  ul  li  div .withimage .image img:hover {
    border: 4px solid <?php echo $supermenu_settings['slbgh']; ?>;
   }
<?php } ?>
<?php if ($supermenu_settings['thlc']) { ?>
   #supermenu  ul  li  div  .withchild ul.child-level li a, #supermenu  ul  li  div .withimage .child-level a {
   color: <?php echo $supermenu_settings['thlc']; ?>;
   }
<?php } ?>
</style>
<?php } ?>
<script type="text/javascript" src="catalog/view/supermenu/supermenu.js"></script>

<script type="text/javascript"> 
$(document).ready(function(){ 

$("#supermenu ul li.tlli").hover(function() {
		$(this).find('.bigdiv').show();
	
	} , function() {
		$(this).find('.bigdiv').hide();
});

});
</script>
<div id="supermenu">
  <ul>
    <?php foreach ($mitems as $mitem) { ?>
	<li class="tlli<?php if ($mitem['children']) { ?> mkids <?php } ?>" <?php if ($mitem['tlstyle']) { ?>style="<?php echo $mitem['tlstyle']; ?>" <?php } ?>><a class="tll" <?php if ($mitem['tlcolor']) { ?>style="color: <?php echo $mitem['tlcolor']; ?>;" <?php } ?><?php if ($mitem['href']) { ?>href="<?php echo $mitem['href']; ?>"<?php } ?>><?php echo $mitem['name']; ?></a>
	<?php if ($mitem['children'] || ($mitem['chtml'] && $mitem['chtml'] == 1)) { ?>
     <div class="bigdiv"<?php if ($mitem['dwidth']) { ?> style="width: <?php echo $mitem['dwidth']; ?>px;"<?php } ?>>
	 
	  <?php if (!$mitem['dwidth']) { ?>
	  <?php if ($mitem['add'] || ($mitem['chtml'] && $mitem['chtml'] == 2)) { ?><div class="supermenu-left" style="width: 755px;"><?php } else { ?><div class="supermenu-left" style="width: 960px;"><?php } ?>
	  <?php } else { ?>
	  <?php if ($mitem['add'] || ($mitem['chtml'] && $mitem['chtml'] == 2)) { ?><div class="supermenu-left"  style="width: <?php echo $mitem['ddwidth']; ?>px;"><?php } else { ?><div class="supermenu-left"  style="width: <?php echo $mitem['dwidth']; ?>px;"><?php } ?>
	  <?php } ?>
	  <?php if ($mitem['chtml'] && $mitem['chtml'] == 1) { ?><?php echo $mitem['cchtml']; ?><?php } ?>
	  
	  <?php if ($mitem['chtml'] && $mitem['chtml'] == 3) { ?><div style="display: block;"><?php echo $mitem['cchtml']; ?></div><?php } ?>
	  
	  <?php if (!$mitem['chtml'] || $mitem['chtml'] == 2 || $mitem['chtml'] == 3) { ?>
	  
	  <?php if (!$mitem['view']) { ?>
          <?php foreach ($mitem['children'] as $mildren) { ?>
		   <?php if ($mildren['gchildren']) { ?>
            <div class="withchild"<?php if ($mitem['iwidth']) { ?> style="width: <?php echo $mitem['iwidth']; ?>px;"<?php } ?>>
			<span class="mainexpand"></span>
		     <a class="theparent" href="<?php echo $mildren['href']; ?>"><?php echo $mildren['name']; ?></a>
               <ul class="child-level">
                <?php foreach ($mildren['gchildren'] as $gmildren) { ?>
                 <li><a href="<?php echo $gmildren['href']; ?>"><?php echo $gmildren['name']; ?></a></li>
                <?php } ?>
               </ul>
		    </div>
		   <?php } ?>
          <?php } ?>
		  <div class="withoutchild">
		   <?php foreach ($mitem['children'] as $mildren) { ?>
		    <?php if (!$mildren['gchildren']) { ?>
             <div class="withchild"<?php if ($mitem['iwidth']) { ?> style="width: <?php echo $mitem['iwidth']; ?>px;"<?php } ?>>
		      <a class="theparent" href="<?php echo $mildren['href']; ?>"><?php echo $mildren['name']; ?></a>
		     </div>
		    <?php } ?>
           <?php } ?>
		  </div>
	  <?php } else { ?>
		  <?php foreach ($mitem['children'] as $mildren) { ?>
		   <div class="withimage"<?php if ($mitem['iwidth']) { ?> style="width: <?php echo $mitem['iwidth']; ?>px;"<?php } ?>>
		    <div class="image">
		     <a href="<?php echo $mildren['href']; ?>"><img src="<?php echo $mildren['thumb']; ?>" alt="<?php echo $mildren['name']; ?>" title="<?php echo $mildren['name']; ?>" /></a>

		    </div>
			<a href="<?php echo $mildren['href']; ?>"><span></span></a>
		    <div class="name">
			<?php if ($mildren['gchildren']) { ?><span class="mainexpand"></span><?php } ?>
		     <a class="nname" href="<?php echo $mildren['href']; ?>"><?php echo $mildren['name']; ?></a>
		     <?php if ($mildren['gchildren']) { ?>
		      <ul class="child-level">
               <?php foreach ($mildren['gchildren'] as $gmildren) { ?>
                <li><a href="<?php echo $gmildren['href']; ?>">+ <?php echo $gmildren['name']; ?></a></li>
               <?php } ?>
              </ul>
	         <?php } ?>
		    </div>
		   </div>
		  <?php } ?>
	  <?php } ?>
	  <?php } ?>
	  </div>
	  <?php if ($mitem['add'] || ($mitem['chtml'] && $mitem['chtml'] == 2)) { ?>
	   <div class="menu-add">
	    <?php if ($mitem['chtml'] && $mitem['chtml'] == 2) { ?>
		 <?php echo $mitem['cchtml']; ?>
		<?php } else { ?>
		 <a <?php if ($mitem['addurl']) { ?>href="<?php echo $mitem['addurl']; ?>"<?php } ?>><img src="image/<?php echo $mitem['add']; ?>" alt="<?php echo $mitem['name']; ?>" /></a>
		<?php } ?>
	   </div>
	  <?php } ?>
     </div>
    <?php } ?>
   </li>
  <?php } ?>
 </ul>
</div>
<?php if ($supermenuisresponsive) { ?>
<div id="supermenu-mobile">
<ul>
 <li class="tlli"><a class="tll"><?php echo $categ_text; ?></a>
  <div class="bigdiv">
    <?php foreach ($mitems as $mitem) { ?>
	<div class="withchild">
	<?php if ($mitem['children']) { ?><span class="toexpand"></span><?php } ?>
	 <a class="theparent" id="<?php echo $mitem['cssid']; ?>" <?php if ($mitem['tlcolor']) { ?>style="color: <?php echo $mitem['tlcolor']; ?>;" <?php } ?><?php if ($mitem['href']) { ?>href="<?php echo $mitem['href']; ?>"<?php } ?>><?php echo $mitem['name']; ?></a>
	 
	<?php if ($mitem['children']) { ?>
	  <ul>
	   <?php foreach ($mitem['children'] as $mildren) { ?>
        <li>
		  <a  href="<?php echo $mildren['href']; ?>"><?php echo $mildren['name']; ?></a>
		  <?php if ($mildren['gchildren']) { ?>
		  <span class="toexpandkids"></span>
           <ul class="child-level">
            <?php foreach ($mildren['gchildren'] as $gmildren) { ?>
             <li><a href="<?php echo $gmildren['href']; ?>"><?php echo $gmildren['name']; ?></a></li>
            <?php } ?>
           </ul>
		  <?php } ?>
		</li>
       <?php } ?>
	  </ul>
	<?php } ?>
	 
	</div> 
	<?php } ?>
	</div>
 </li>
</ul> 
</div>	
<?php } ?>
<script type="text/javascript"><!--
$('#supermenu-mobile  ul  li  div  .withchild .toexpand').bind('click', function() {
    parenton = $(this).parent().hasClass('exped');
    if (!parenton) {
	$(this).parent().addClass('exped');
	parenton = true;
	} else {
	$(this).parent().removeClass('exped');
	parenton = false;
	}
});

$('#supermenu-mobile  ul  li  div  .withchild ul li .toexpandkids').bind('click', function() {
    kidon = $(this).parent().hasClass('exped');
    if (!kidon) {
	$(this).parent().addClass('exped');
	kidon = true;
	} else {
	$(this).parent().removeClass('exped');
	kidon = false;
	}
});
$('#supermenu  ul  li  div  .withchild  .mainexpand').bind('click', function() {
    mainparenton = $(this).parent().hasClass('exped');
    if (!mainparenton) {
	$(this).parent().addClass('exped');
	mainparenton = true;
	} else {
	$(this).parent().removeClass('exped');
	mainparenton = false;
	}
});
$('#supermenu  ul  li  div  .withimage .name .mainexpand').bind('click', function() {
    imageparenton = $(this).parent().hasClass('exped');
    if (!imageparenton) {
	$(this).parent().addClass('exped');
	imageparenton = true;
	} else {
	$(this).parent().removeClass('exped');
	imageparenton = false;
	}
});
superparent = $('#supermenu-mobile ul li.tlli').hasClass('exped');
$('#supermenu-mobile ul li.tlli a').bind('click', function() {
    if (!superparent) {
	$(this).parent().find('.bigdiv').slideDown('fast');
	superparent = true;
	$(this).css('color','#000');
	} else {
	$(this).parent().find('.bigdiv').slideUp('fast');
	$(this).css('color','#000');
	superparent = false;
	}
});
//--></script>
<?php } ?>