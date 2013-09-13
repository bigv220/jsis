<?php
//==============================================================================
// Filter by Price Module v155.2
// 
// Author: Clear Thinking, LLC
// E-mail: johnathan@getclearthinking.com
// Website: http://www.getclearthinking.com
//==============================================================================
?>

<?php echo $header; ?>
<style type="text/css">
	div {
		white-space: nowrap;
	}
	td {
		background: #FFF;
	}
	.green {
		background: #080 !important;
	}
	.red {
		background: #B00 !important;
	}
	.status {
		color: #FFF; 
		cursor: pointer;
		font-size: 18px;
	}
	.sub-table {
		margin: auto;
	}
	.sub-table td {
		border: none;
		padding: 3px !important;
	}
	.tooltip-mark {
		background: #FF8;
		border: 1px solid #888;
		border-radius: 10px;
		color: #000;
		font-size: 10px;
		padding: 1px 4px;
	}
	.tooltip {
		background: #FFC;
		border: 1px solid #CCC;
		color: #000;
		display: none;
		font-size: 11px;
		font-weight: normal;
		line-height: 1.3;
		max-width: 300px;
		padding: 10px;
		position: absolute;
		text-align: left;
		white-space: normal;
		z-index: 100;
		box-shadow: 0 6px 9px #AAA;
		-moz-box-shadow: 0 6px 9px #AAA;
		-webkit-box-shadow: 0 6px 9px #AAA;
	}
	.tooltip-mark:hover, .tooltip-mark:hover + .tooltip, .tooltip:hover {
		display: inline;
		cursor: help;
	}
</style>
<?php if ($version > 149) { ?>
<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
<?php } ?>
<?php if ($error_warning) { ?><div class="warning"><?php echo $error_warning; ?></div><?php } ?>
<?php if ($success) { ?><div class="success"><?php echo $success; ?></div><?php } ?>
<div class="box">
	<?php if ($version < 150) { ?><div class="left"></div><div class="right"></div><?php } ?>
	<div class="heading">
		<h1 style="padding: 10px 2px 0"><img src="view/image/<?php echo $type; ?>.png" alt="" style="vertical-align: middle" /> <?php echo $heading_title; ?></h1>
		<div class="buttons">
			<a onclick="$('#form').attr('action', location + '&exit=true'); $('#form').submit()" class="button"><span><?php echo $button_save_exit; ?></span></a>
			<a onclick="$('#form').submit()" class="button"><span><?php echo $button_save_keep_editing; ?></span></a>
			<a onclick="location = '<?php echo $exit; ?>'" class="button"><span><?php echo $button_cancel; ?></span></a>
		</div>
	</div>
	<div class="content">
		<form action="" method="post" enctype="multipart/form-data" id="form">
			<table class="form">
				<tr>
					<td><?php echo $entry_filter_on; ?><span class="help" style="width: 300px; white-space: normal"><?php echo $help_filter_on; ?></span></td>
					<td><div><input type="checkbox" value="1" name="<?php echo $name; ?>_data[filter_categories]" <?php if (!empty(${$name.'_data'}['filter_categories'])) echo 'checked="checked"'; ?> />
							<?php echo $text_category_pages; ?>
						</div>
						<div><input type="checkbox" value="1" name="<?php echo $name; ?>_data[filter_subcategories]" <?php if (!empty(${$name.'_data'}['filter_subcategories'])) echo 'checked="checked"'; ?> />
							<em><?php echo $text_include_subcategories; ?></em>
						</div>
						<div><input type="checkbox" value="1" name="<?php echo $name; ?>_data[filter_manufacturers]" <?php if (!empty(${$name.'_data'}['filter_manufacturers'])) echo 'checked="checked"'; ?> />
							<?php echo $text_manufacturer_pages; ?>
						</div>
						<div><input type="checkbox" value="1" name="<?php echo $name; ?>_data[filter_searches]" <?php if (!empty(${$name.'_data'}['filter_searches'])) echo 'checked="checked"'; ?> />
							<?php echo $text_search_pages; ?>
						</div>
					</td>
				</tr>
			</table>
			<table class="list">
			<thead>
				<tr style="height: 40px">
					<td class="center"><span class="tooltip-mark">?</span> <span class="tooltip"><?php echo $help_status; ?></span></td>
					<td class="center"><div style="float: right"><span class="tooltip-mark">?</span> <span class="tooltip"><?php echo $help_price_ranges; ?></span></div> <?php echo $entry_price_ranges; ?></td>
					<td class="center"><div style="float: right"><span class="tooltip-mark">?</span> <span class="tooltip"><?php echo $help_flexible_filter; ?></span></div> <?php echo $entry_flexible_filter; ?></td>
					<?php if ($version > 149) { ?><td class="center"><?php echo $entry_layout; ?></td><?php } ?>
					<td class="center"><?php echo $entry_position; ?></td>
					<td class="center"><?php echo $entry_sort_order; ?></td>
					<?php if ($version > 149) { ?><td class="center"><span class="tooltip-mark">?</span> <span class="tooltip" style="right: 0"><?php echo $help_actions; ?></span></td><?php } ?>
				</tr>
			</thead>
			<?php $row = 1; ?>
			<?php $modules = (!empty(${$name.'_module'})) ? ${$name.'_module'} : array(''); ?>
			<?php foreach ($modules as $module) { ?>
				<tr>
					<?php $status = (isset($module['status']) && $module['status'] == 0) ? 0 : 1; ?>
					<td class="center status <?php echo ($status) ? 'green' : 'red'; ?>" onclick="toggleStatus($(this))">
						<span><?php echo ($status) ? '&#10004;' : '&#10008;'; ?></span>
						<input type="hidden" name="<?php echo $name; ?>_module[<?php echo $row; ?>][status]" value="<?php echo $status; ?>" />
					</td>
					<td class="center">
						<?php echo $text_currency; ?>
						<select name="<?php echo $name; ?>_module[<?php echo $row; ?>][currency]">
							<?php $currency = (!empty($module['currency'])) ? $module['currency'] : $this->config->get('config_currency'); ?>
							<?php foreach ($currencies as $c) { ?>
								<option value="<?php echo $c['code']; ?>" <?php if ($c['code'] == $currency) echo 'selected="selected"'; ?>><?php echo $c['code']; ?></option>
							<?php } ?>
						</select><br />
						<textarea style="width: 150px; height: 50px" name="<?php echo $name; ?>_module[<?php echo $row; ?>][ranges]"><?php echo (!empty($module['ranges'])) ? $module['ranges'] : ''; ?></textarea>
					</td>
					<td class="center">
						<select name="<?php echo $name; ?>_module[<?php echo $row; ?>][flexible_filter]">
							<?php $flexible_filter = (!empty($module['flexible_filter'])) ? $module['flexible_filter'] : 1; ?>
							<option value="1" <?php if ($flexible_filter) echo 'selected="selected"'; ?>><?php echo $text_enabled; ?></option>
							<option value="0" <?php if (!$flexible_filter) echo 'selected="selected"'; ?>><?php echo $text_disabled; ?></option>
						</select>
					</td>
				<?php if ($version > 149) { ?>
					<td class="center">
						<select name="<?php echo $name; ?>_module[<?php echo $row; ?>][layout_id]">
							<?php $layout_id = (!empty($module['layout_id'])) ? $module['layout_id'] : $this->config->get('config_layout_id'); ?>
							<?php foreach ($layouts as $layout) { ?>
								<option value="<?php echo $layout['layout_id']; ?>" <?php if ($layout['layout_id'] == $layout_id) echo 'selected="selected"'; ?>><?php echo $layout['name']; ?></option>
							<?php } ?>
						</select>
					</td>
				<?php } ?>
					<td class="center">
						<select name="<?php echo $name; ?>_module[<?php echo $row; ?>][position]">
							<?php $position = (!empty($module['position'])) ? $module['position'] : ''; ?>
							<?php foreach ($positions as $pos) { ?>
								<option value="<?php echo $pos; ?>" <?php if ($pos == $position) echo 'selected="selected"'; ?>><?php echo ${'text_'.$pos}; ?></option>
							<?php } ?>
						</select>
					</td>
					<td class="center">
						<input type="text" name="<?php echo $name; ?>_module[<?php echo $row; ?>][sort_order]" value="<?php echo (!empty($module['sort_order'])) ? $module['sort_order'] : ''; ?>" size="1" /></td>
					</td>
				<?php if ($version > 149) { ?>
					<td class="left" style="width: 1px">
						<a onclick="removeRow($(this))"><img src="view/image/error.png" title="Remove" /></a>
						<br /><br />
						<a onclick="copyRow($(this))"><img src="view/image/category.png" title="Copy" /></a>
					</td>
				<?php } ?>
					<input type="hidden" name="<?php echo $name; ?>_module[<?php echo $row; ?>][module_id]" value="[<?php echo $row; ?>]" />
				</tr>
				<?php $row++; ?>
			<?php } ?>
				<?php if ($version > 149) { ?>
					<tr>
						<td class="left" colspan="7" style="background: #EEE"><a onclick="addRow($(this))" class="button"><span><?php echo $button_add_module; ?></span></a></td>
					</tr>
				<?php } ?>
			</table>
		</form>
		<?php echo $copyright; ?>
	</div>
</div>
<?php if ($version > 149) { ?>
	</div>
<?php } ?>
<script type="text/javascript"><!--
	function toggleStatus(element) {
		if (element.hasClass('green')) {
			element.removeClass('green').addClass('red');
			element.find('span').html('&#10008;');
			element.find('input').val('0');
		} else {
			element.removeClass('red').addClass('green');
			element.find('span').html('&#10004;');
			element.find('input').val('1');
		}
	}
	
	var newRow = <?php echo $row; ?>;
	
	function addRow(element) {
		var clone = element.parent().parent().prev().clone();
		clone.html(clone.html().replace(/\[\d+\]/g, '['+newRow+']'));
		clone.find('.status').removeClass('red').addClass('green');
		clone.find('.status span').html('&#10004;');
		clone.find('.status input').val('1');
		clone.find('input[type="text"]').val('');
		clone.find('textarea').text('');
		clone.find(':checked').removeAttr('checked');
		clone.find(':selected').removeAttr('selected');
		$('.list > tbody > tr:last-child').before(clone);
		window.scrollTo(0, document.body.scrollHeight);
		newRow++;
	}
	
	function copyRow(element) {
		var row = element.parent().parent();
		row.find('input').each(function(){
			$(this).attr('value', $(this).val());
			if ($(this).is(':checked')) {
				$(this).attr('checked', 'checked');
			} else {
				$(this).removeAttr('checked');
			}
		});
		row.find('textarea').each(function(){
			$(this).html($(this).val());
		});
		var clone = row.clone();
		row.find('option').each(function(i){
			if($(this).is(':selected')) {
				clone.find('option').eq(i).attr('selected', 'selected');
			} else {
				clone.find('option').eq(i).removeAttr('selected');
			}
		});
		clone.html(clone.html().replace(/\[\d+\]/g, '['+newRow+']'));
		$('.list > tbody > tr:last-child').before(clone);
		window.scrollTo(0, document.body.scrollHeight);
		newRow++;
	}
	
	function removeRow(element) {
		if ($('.list > tbody > tr').length < 3) {
			element.parent().parent().find('.status').removeClass('red').addClass('green');
			element.parent().parent().find('.status span').html('&#10004;');
			element.parent().parent().find('.status input').val('1');
			element.parent().parent().find('input[type="text"]').val('');
			element.parent().parent().find('textarea').text('');
			element.parent().parent().find(':checked').removeAttr('checked');
			element.parent().parent().find('option:first-child').attr('selected', 'selected');
		} else {
			element.parent().parent().remove();
		}
	}
//--></script>
<?php echo $footer; ?>