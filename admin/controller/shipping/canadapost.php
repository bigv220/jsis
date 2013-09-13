<?php
/* 
 * OpenCart Canada Post Shipping Module
 * Version: 1.6
 * Author: Olivier Labbé
 * Email: olivier.labbe@votreespace.net
 * Web: http://www.votreespace.net
 * Description: Connects with Canada Post sellonline server to provide a
 *              shipping estimate.
*/

class ControllerShippingCanadaPost extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('shipping/canadapost');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('canadapost', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect(HTTPS_SERVER . 'index.php?token=' . $this->session->data['token'] . '&route=extension/shipping');
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
      $this->data['text_eng'] = $this->language->get('text_eng');
		$this->data['text_french'] = $this->language->get('text_french');
      $this->data['text_none'] = $this->language->get('text_none');
      $this->data['text_yes'] = $this->language->get('text_yes');
      $this->data['text_no'] = $this->language->get('text_no');
      $this->data['text_all_zones'] = $this->language->get('text_all_zones');
      
      $this->data['entry_server'] = $this->language->get('entry_server');
		$this->data['entry_port'] = $this->language->get('entry_port');
		$this->data['entry_language'] = $this->language->get('entry_language');
      
      $this->data['entry_merchantId'] = $this->language->get('entry_merchantId');
      $this->data['entry_origin'] = $this->language->get('entry_origin');
		$this->data['entry_handling'] = $this->language->get('entry_handling');
      $this->data['entry_turnAround'] = $this->language->get('entry_turnAround');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
      $this->data['entry_originalPackaging'] = $this->language->get('entry_originalPackaging');
      $this->data['entry_tax'] = $this->language->get('entry_tax');
      $this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$this->data['entry_version_status'] = $this->language->get('entry_version_status');
		$this->data['entry_author'] = $this->language->get('entry_author');
		$this->data['entry_contributor'] = $this->language->get('entry_contributor');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
		$this->data['entry_link_sellonline'] = $this->language->get('entry_link_sellonline');
		$this->data['entry_sellonline'] = $this->language->get('entry_sellonline');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['postcode'])) {
			$this->data['error_postcode'] = $this->error['postcode'];
		} else {
			$this->data['error_postcode'] = '';
		}
		
  		$this->document->breadcrumbs = array();
		
		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?token=' . $this->session->data['token'] . '&route=common/home',
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?token=' . $this->session->data['token'] . '&route=extension/shipping',
       		'text'      => $this->language->get('text_shipping'),
      		'separator' => ' :: '
   		);
		
   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?token=' . $this->session->data['token'] . '&route=shipping/canadapost',
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = HTTPS_SERVER . 'index.php?token=' . $this->session->data['token'] . '&route=shipping/canadapost';
		
		$this->data['cancel'] = HTTPS_SERVER . 'index.php?token=' . $this->session->data['token'] . '&route=extension/shipping';

		if (isset($this->request->post['canadapost_server'])) {
			$this->data['canadapost_server'] = $this->request->post['canadapost_server'];
		} else {
			$this->data['canadapost_server'] = $this->config->get('canadapost_server');
		}
      if (isset($this->request->post['canadapost_port'])) {
			$this->data['canadapost_port'] = $this->request->post['canadapost_port'];
		} else {
			$this->data['canadapost_port'] = $this->config->get('canadapost_port');
		}
      if (isset($this->request->post['canadapost_language'])) {
			$this->data['canadapost_language'] = $this->request->post['canadapost_language'];
		} else {
			$this->data['canadapost_language'] = $this->config->get('canadapost_language');
		}
      if (isset($this->request->post['canadapost_merchantId'])) {
			$this->data['canadapost_merchantId'] = $this->request->post['canadapost_merchantId'];
		} else {
			$this->data['canadapost_merchantId'] = $this->config->get('canadapost_merchantId');
		}
      
      if (isset($this->request->post['canadapost_origin'])) {
			$this->data['canadapost_origin'] = $this->request->post['canadapost_origin'];
		} else {
			$this->data['canadapost_origin'] = $this->config->get('canadapost_origin');
		}
		
		if (isset($this->request->post['canadapost_handling'])) {
			$this->data['canadapost_handling'] = $this->request->post['canadapost_handling'];
		} else {
			$this->data['canadapost_handling'] = $this->config->get('canadapost_handling');
		}

		if (isset($this->request->post['canadapost_turnAround'])) {
			$this->data['canadapost_turnAround'] = $this->request->post['canadapost_turnAround'];
		} else {
			$this->data['canadapost_turnAround'] = $this->config->get('canadapost_turnAround');
		}
      
      if (isset($this->request->post['canadapost_originalPackaging'])) {
			$this->data['canadapost_originalPackaging'] = $this->request->post['canadapost_originalPackaging'];
		} else {
			$this->data['canadapost_originalPackaging'] = $this->config->get('canadapost_originalPackaging');
		}

		if (isset($this->request->post['canadapost_status'])) {
			$this->data['canadapost_status'] = $this->request->post['canadapost_status'];
		} else {
			$this->data['canadapost_status'] = $this->config->get('canadapost_status');
		}
		
		if (isset($this->request->post['canadapost_sort_order'])) {
			$this->data['canadapost_sort_order'] = $this->request->post['canadapost_sort_order'];
		} else {
			$this->data['canadapost_sort_order'] = $this->config->get('canadapost_sort_order');
		}				
      if (isset($this->request->post['canadapost_tax_class_id'])) {
			$this->data['canadapost_tax_class_id'] = $this->request->post['canadapost_tax_class_id'];
		} else {
			$this->data['canadapost_tax_class_id'] = $this->config->get('canadapost_tax_class_id');
		}
      if (isset($this->request->post['canadapost_geo_zone_id'])) {
			$this->data['canadapost_geo_zone_id'] = $this->request->post['canadapost_geo_zone_id'];
		} else {
			$this->data['canadapost_geo_zone_id'] = $this->config->get('canadapost_geo_zone_id');
		}		

		$this->load->model('localisation/tax_class');
		
		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
		
		$this->load->model('localisation/geo_zone');
		
		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		$this->template = 'shipping/canadapost.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'shipping/canadapost')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
      
         //Set a default handling fee immediately after install
			if($this->request->post['canadapost_handling'] == "") {
			 $this->request->post['canadapost_handling'] = "0.00";
			}
         //Set a default turnAroundTime fee immediately after install
			if($this->request->post['canadapost_turnAround'] == "0") {
			 $this->request->post['canadapost_turnAround'] = "0";
			}
         //Set a default server immediately after install
			if($this->request->post['canadapost_server'] == "") {
			 $this->request->post['canadapost_server'] = "sellonline.canadapost.ca";
			}
         //Set a default port immediately after install
			if($this->request->post['canadapost_port'] == "") {
			 $this->request->post['canadapost_port'] = "30000";
			}
         //Set a default port immediately after install
			if($this->request->post['canadapost_merchantId'] == "") {
			 $this->request->post['canadapost_merchantId'] = "CPC_DEMO_XML";
			}
         //Set a default language immediately after install
		 
			if(!isset($this->request->post['canadapost_language']) || $this->request->post['canadapost_language'] == "") {
			 $this->request->post['canadapost_language'] = "en";
			}
         
		//Only check values when the status is enabled, we don't want to bother then if they are just trying to disable it 
		if ($this->request->post['canadapost_status'] == 1) {
         
         //Make sure merchantId is not blank if enabling this module
			if($this->request->post['canadapost_merchantId'] == "") {
			 $this->error['warning'] = "You must have a Canada Post Sell Online Merchant Id to use this module";
			}
         
			//Validate origin postcode
			if(!preg_match('/[ABCEGHJKLMNPRSTVXYabceghjklmnprstvxy][0-9][A-Za-z] *[0-9][A-Za-z][0-9]/', $this->request->post['canadapost_origin'])){
				$this->error['warning'] = "Postal Code is invalid.  Must be a valid Canadian postal code.";
			}

			//Validate handling cost

			if(!preg_match('/^[0-9]{1,2}(\.[0-9]{1,2})?$/',$this->request->post['canadapost_handling'])){
				$this->error['warning'] = "Additional Handling Cost must be a decimal value eg. (2.00). Maximum value (99.99)";
			} else {
				//Clean it up if the user has put in single decimal (which is valid) eg 2.5., or whole number eg. 2
				//This will be done silently, user will see it when they return to the shipping module
				$this->request->post['canadapost_handling'] = sprintf("%.2f",$this->request->post['canadapost_handling']);
			}

		}


		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>
