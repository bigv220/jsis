<?php
//==============================================================================
// Filter by Price Module v155.2
// 
// Author: Clear Thinking, LLC
// E-mail: johnathan@getclearthinking.com
// Website: http://www.getclearthinking.com
//==============================================================================

$version = 'v155.2';

// Heading
$_['heading_title']					= 'Price (Filter by Price)';

// Buttons
$_['button_save_exit']				= 'Save & Exit';
$_['button_save_keep_editing']		= 'Save & Keep Editing';

// Entry
$_['entry_filter_on']				= 'Filter On:';
$_['entry_price_ranges']			= 'Price Ranges';
$_['entry_flexible_filter']			= 'Flexible Filter';
$_['entry_layout']					= 'Layout';
$_['entry_position']				= 'Position';
$_['entry_sort_order']				= 'Sort Order';

// Help
$_['help_filter_on']				= 'If checked, clicking on a price range will filter within the currenty category, manufacturer, or search page. If not checked, clicking on a price range will show all products in that range.';
$_['help_status']					= 'Toggle the status from Enabled (green with checkmark) to Disabled (red with X) by clicking on the box.';
$_['help_price_ranges']				= 'Using commas, enter the price points at which to separate the ranges. For example, if you want to have ranges of:<ul style="margin: 5px"><li>Under $25</li><li>$25 - $50</li><li>$50 - $100</li><li>$100 and up </li></ul>then enter 25, 50, 100.';
$_['help_flexible_filter']			= 'If enabled, customers will be able to set their own lower and upper limits when filtering by price, in addition to the Price Ranges set above. To show only the flexible filter, set to "Enabled" and leave the Price Ranges field blank.';
$_['help_actions']					= '<em>Remove</em><br />Click the red minus button to remove the rate. Note that if it is the last rate remaining, it will instead be cleared of all values.<br /><br /><em>Copy</em><br />Click the gray and blue button to copy the rate to the end of the list.';

// Text
$_['text_currency']					= 'Currency:';
$_['text_category_pages']			= 'Category Pages';
$_['text_include_subcategories']	= 'Include Sub-Categories';
$_['text_manufacturer_pages']		= 'Manufacturer Pages';
$_['text_search_pages']				= 'Search Pages';

// Copyright
$_['copyright']						= '<div style="text-align: center" class="help">' . $_['heading_title'] . ' ' . $version . ' &copy; <a target="_blank" href="http://www.getclearthinking.com">Clear Thinking, LLC</a></div>';

// Standard Text
$_['text_left']						= 'Left';
$_['text_right']					= 'Right';
$_['text_content_top']				= 'Content Top';
$_['text_content_bottom']			= 'Content Bottom';
$_['text_column_left']				= 'Column Left';
$_['text_column_right']				= 'Column Right';
$_['standard_module']				= 'Modules';
$_['standard_shipping']				= 'Shipping';
$_['standard_payment']				= 'Payments';
$_['standard_total']				= 'Order Totals';
$_['standard_feed']					= 'Product Feeds';
$_['standard_success']				= 'Success: You have modified ' . $_['heading_title'] . '!';
$_['standard_error']				= 'Warning: You do not have permission to modify ' . $_['heading_title'] . '!';
?>