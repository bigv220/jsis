<?php
//==============================================================================
// Filter by Price Module v155.2
// 
// Author: Clear Thinking, LLC
// E-mail: johnathan@getclearthinking.com
// Website: http://www.getclearthinking.com
//==============================================================================
?>

<?php $box_size = ($version < 150) ? '2' : '3'; ?>

<div class="box">
	<div class="top box-heading">
		<?php if ($version < 150) { ?><img src="catalog/view/theme/default/image/discount.png" alt="" /><?php } ?>
		<?php echo $heading_title; ?>
	</div>
	<div class="middle box-content">
		<?php if (!empty($ranges)) { ?>
			<ul style="margin: 0 8px 8px; padding-left: 12px; line-height: 1.5em">
				<?php foreach ($ranges as $range) { ?>
					<li><a href="<?php echo $range['href']; ?>"><?php echo $range['text']; ?></a></li>
				<?php } ?>
			</ul>
		<?php } ?>
		<?php if ($flexible_filter) { ?>
			<input type="text" size="<?php echo $box_size; ?>" name="lower" value="<?php echo $lower; ?>" onkeydown="if (event.keyCode == 13) redirectToPricePage($(this))" style="font-size: 11px" />
			<?php echo $text_flexible_middle; ?>
			<input type="text" size="<?php echo $box_size; ?>" name="upper" value="<?php echo $upper; ?>" onkeydown="if (event.keyCode == 13) redirectToPricePage($(this))" style="font-size: 11px" />
			&nbsp;
			<a class="button" onclick="redirectToPricePage($(this))"><span><?php echo $button_go; ?></span></a>
		<?php } ?>
	</div>
	<?php if ($version < 150) { ?><div class="bottom">&nbsp;</div><?php } ?>
</div>

<script type="text/javascript"><!--
	function redirectToPricePage(element) {
		var lower = element.parent().find('input[name="lower"]').val();
		var upper = element.parent().find('input[name="upper"]').val();
		<?php if ($this->language->get('decimal_point') != '.') { ?>
			lower = lower.replace('<?php echo $this->language->get('decimal_point'); ?>', '.');
			upper = upper.replace('<?php echo $this->language->get('decimal_point'); ?>', '.');
		<?php } ?>
		lower = lower.replace(/[^0-9.]/g, '');
		upper = upper.replace(/[^0-9.]/g, '');
		lower = (lower.indexOf('.') == -1) ? parseInt(lower) : parseFloat(lower).toFixed(2);
		upper = (upper.indexOf('.') == -1) ? parseInt(upper) : parseFloat(upper).toFixed(2);
		lower = (isNaN(lower)) ? 0 : lower;
		upper = (isNaN(upper)) ? '' : upper;
		
		if (upper != '') {
			$.post(
				'index.php?route=module/price/rewriteURL',
				{route: 'product/price', args: '<?php echo $args; ?>&range=' + lower + '-' + upper},
				function(data) {
					location = data;
				}
			);
		}
	}
//--></script>