<?php
// Heading
$_['heading_title']    		= 'Canada Post WS/REST(Q)';

// Text
$_['text_shipping']    		= 'Shipping';
$_['text_success']     		= 'Success: You have modified the shipping extension!';
$_['text_counter']    		= 'Counter';
$_['text_commercial']    	= 'Commercial';
$_['text_volumetric']    	= 'Volumetric';
$_['text_linear']    		= 'Linear';
$_['text_static']    		= 'Static';


$_['text_DOM.RP']      		= 'CA - Regular Parcel';
$_['text_DOM.EP']      		= 'CA - Expedited Parcel';
$_['text_DOM.XP']      		= 'CA - Xpresspost';
$_['text_DOM.XP.CERT'] 		= 'CA - Xpresspost Certified';
$_['text_DOM.PC']      		= 'CA - Priority';
$_['text_DOM.LIB']     		= 'CA - Library Books';
$_['text_USA.EP']      		= 'US - Expedited Parcel USA';
$_['text_USA.PW.ENV']  		= 'US - Priority Worldwide Envelope USA';
$_['text_USA.PW.PAK']   	= 'US - Priority Worldwide pak USA';
$_['text_USA.PW.PARCEL']    = 'US - Priority Worldwide Parcel USA';
$_['text_USA.SP.AIR']    	= 'US - Small Packet USA Air';
$_['text_USA.SP.SURF']    	= 'US - Small Packet USA Surface';
$_['text_USA.TP']    	   	= 'US - Tracked Packet USA';
$_['text_USA.XP']    	   	= 'US - Xpresspost USA';
$_['text_INT.XP']    	   	= 'INT - Xpresspost International';
$_['text_INT.IP.AIR']    	= 'INT - International Parcel Air';
$_['text_INT.IP.SURF']    	= 'INT - International Parcel Surface';
$_['text_INT.PW.ENV']    	= 'INT - Priority Worldwide Envelope Intl';
$_['text_INT.PW.PAK']    	= 'INT - Priority Worldwide pak Intl';
$_['text_INT.PW.PARCEL']    = 'INT - Priority Worldwide parcel Intl';
$_['text_INT.SP.AIR']    	= 'INT - Small Packet International Air';
$_['text_INT.SP.SURF']    	= 'INT - Small Packet International Surface';

$_['tab_debug']		   		= 'Debug';

// Entry
$_['entry_postcode']   		= 'Origin Post Code:<br/><span class="help">This is your origin postcode. Must be based in Canada.</span>';
$_['entry_mid']        		= 'API Username:<br/><span class="help">This is the first half of your API key, before the ":" colon. Be sure you use the correct one for which server you selected.</span>';
$_['entry_key']        		= 'API Password:<br/><span class="help">This is the second half of your API key, after the ":" colon. Be sure you use the correct one for which server you selected.</span>';
$_['entry_customer_number'] = 'Customer Number:<br/><span class="help">Get this from your Canada Post "My Profile" page near the top. This is the same for either server.</span>';
$_['entry_adjust'] 			= 'Rate Adjust:<br/><span class="help">Apply a fee or discount to each rate. +/- Flat value or %. (ex 10%, 1.25, -2, -5%)</span>';
$_['entry_service']    		= 'Services:<br/><span class="help">Hold Ctrl+click to select multiple</span>';
$_['entry_geo_zone']   		= 'Geo Zone:';
$_['entry_tax']        		= 'Tax Class:';
$_['entry_geo_zone']   		= 'Geo Zone:';
$_['entry_status']     		= 'Status:';
$_['entry_sort_order'] 		= 'Sort Order:';
$_['entry_quote_type'] 		= 'Quote Type:<br/><span class="help">Counter = Standard Rates<br/> Commercial = Discounted Rates for your account</span>';
$_['entry_contract_id'] 	= 'Contract ID:<br/><span class="help">Needed for Commercial Discounted Rates</span>';
$_['entry_debug']  	   		= 'Debug Mode:<br/><span class="help" style="color:red;">If not seeing rates, enable this and try again. The communication between the gateway and your site will be logged under the Debug tab. Email this data when asking for support.</span>';
$_['entry_debug_file'] 		= 'Debug File:';
$_['entry_shipping_calc']	= 'Shipping Calculation Method:<br/><span class="help">Canada Post WS does not support individual package rates at this time so choose your best alternative.</span>';
$_['entry_test'] 	   		= 'Dev Server:<br /><span class="help">Yes = Dev server<br/>No = Prod Server</span>';
$_['entry_length'] 	   		= 'Avg Length (cm):<span class="help">Used if Volumetric Shipping = NO or as a fallback for 0 volume<br/>(ex 5)</span>';
$_['entry_width'] 	   		= 'Avg Width (cm):<span class="help">Used if Volumetric Shipping = NO or as a fallback for 0 volume<br/>(ex 5)</span>';
$_['entry_height'] 	   		= 'Avg Height (cm):<span class="help">Used if Volumetric Shipping = NO or as a fallback for 0 volume<br/>(ex 5)</span>';
$_['entry_display_weight'] 	= 'Display Weight Next to Rate:';
$_['entry_display_dims'] 	= 'Display Dimensions Next to Rate:';
$_['entry_display_date'] 	= 'Display Delivery Date Next to Rate:';
$_['entry_display_errors']  = 'Display Errors:<br/><span class="help">Show/Hide errors on the checkout page when there are no rates. For example instead of "No rates available" it will just hide. Enable this when debugging problems.</span>';

// Help
$_['help_shipping_calc'] 	= 'Volumetric - Each product\'s dimensions are multiplied together, summed together, and cube-rooted (eg. 125 cuberoot = 5 so dimensions will be 5x5x5).<br/>Linear - Each unit of a products dimensions are added together (ex 4x6x6 and 4x5x3 = 8x11x9).<br/>Static - Override with the static Avg measurements below.';

// Error
$_['error_permission'] 		= 'Warning: You do not have permission to modify Canada Post shipping!';
$_['error_postcode']   		= 'Field Required!';
$_['error_mid']  	   		= 'Field Required!';
$_['error_key']  	   		= 'Field Required!';
$_['error_customer_number'] = 'Field Required!';
$_['error_service']    		= 'You must select at least one service!';
?>