<?php
class ControllerShippingCanadaPostWSREST extends Controller {
	private $error = array();

	public function index() {

		/* START ERRORS */
		$errors = array(
			'warning',
			'mid',
			'postcode',
			'service',
			'key',
			'customer_number',
			'length',
			'width',
			'height'
		);
		/* END ERRORS */



		/* START COMMON STUFF */
		$classname = str_replace('vq2-admin_controller_shipping_', '', basename(__FILE__, '.php'));

		if (!isset($this->session->data['token'])) { $this->session->data['token'] = 0; }
		$this->data['token'] = $this->session->data['token'];
		$this->data = array_merge($this->data, $this->load->language('shipping/' . $classname));

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate($errors))) {
			foreach ($this->request->post as $key => $value) {
				if (is_array($value)) { $this->request->post[$key] = implode(',', $value); }
			}

			$this->load->model('setting/setting');

			$this->model_setting_setting->editSetting($classname, $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect((((HTTPS_SERVER) ? HTTPS_SERVER : HTTP_SERVER) . 'index.php?token=' . $this->session->data['token'] . '&route=extension/shipping'));
		}

		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'href'      => (((HTTPS_SERVER) ? HTTPS_SERVER : HTTP_SERVER) . 'index.php?token=' . $this->session->data['token'] . '&route=common/home'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => (((HTTPS_SERVER) ? HTTPS_SERVER : HTTP_SERVER) . 'index.php?token=' . $this->session->data['token'] . '&route=extension/shipping'),
       		'text'      => $this->language->get('text_shipping'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => (((HTTPS_SERVER) ? HTTPS_SERVER : HTTP_SERVER) . 'index.php?token=' . $this->session->data['token'] . '&route=shipping/' . $classname),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);

		$this->data['action'] = (((HTTPS_SERVER) ? HTTPS_SERVER : HTTP_SERVER) . 'index.php?token=' . $this->session->data['token'] . '&route=shipping/' . $classname);

		$this->data['cancel'] = (((HTTPS_SERVER) ? HTTPS_SERVER : HTTP_SERVER) . 'index.php?token=' . $this->session->data['token'] . '&route=extension/shipping');

		$this->id       = 'content';
		$this->template = 'shipping/' . $classname . '.tpl';

		/* 14x backwards compatibility */
		if (method_exists($this->document, 'addBreadcrumb')) { //1.4.x
			$this->document->breadcrumbs = $this->data['breadcrumbs'];
			unset($this->data['breadcrumbs']);
		}//

		$this->children = array(
            'common/header',
            'common/footer'
        );

        foreach ($errors as $error) {
			if (isset($this->error[$error])) {
				$this->data['error_' . $error] = $this->error[$error];
			} else {
				$this->data['error_' . $error] = '';
			}
		}
		/* END COMMON STUFF */




		/* START FIELDS */
		$this->data['extension_class'] = 'shipping';
		$this->data['tab_class'] = 'htabs';

		$geo_zones = array();

		$this->load->model('localisation/geo_zone');

		$geo_zones[0] = $this->language->get('text_all_zones');
		foreach ($this->model_localisation_geo_zone->getGeoZones() as $geozone) {
			$geo_zones[$geozone['geo_zone_id']] = $geozone['name'];
		}

		$order_statuses = array();

		$this->load->model('localisation/order_status');

		foreach ($this->model_localisation_order_status->getOrderStatuses() as $order_status) {
			$order_statuses[$order_status['order_status_id']] = $order_status['name'];
		}

		$customer_groups = array();

		$this->load->model('sale/customer_group');

		foreach ($this->model_sale_customer_group->getCustomerGroups() as $customer_group) {
			$customer_groups[$customer_group['customer_group_id']] = $customer_group['name'];
		}

		$tax_classes = array();

		$this->load->model('localisation/tax_class');

		$tax_classes[0] = $this->language->get('text_none');
		foreach ($this->model_localisation_tax_class->getTaxClasses() as $tax_class) {
			$tax_classes[$tax_class['tax_class_id']] = $tax_class['title'];
		}

		$this->data['tabs'] = array();

		$this->data['tabs'][] = array(
			'id'		=> 'tab_general',
			'title'		=> $this->language->get('tab_general')
		);

		$this->data['tabs'][] = array(
			'id'		=> 'tab_debug',
			'title'		=> $this->language->get('tab_debug')
		);

		$this->data['fields'] = array();

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_status'),
			'type'			=> 'select',
			'name' 			=> $classname . '_status',
			'value' 		=> (isset($this->request->post[$classname . '_status'])) ? $this->request->post[$classname . '_status'] : $this->config->get($classname . '_status'),
			'required' 		=> false,
			'options'		=> array(
				'0' => $this->language->get('text_disabled'),
				'1' => $this->language->get('text_enabled')
			)
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_test'),
			'type'			=> 'select',
			'name' 			=> $classname . '_test',
			'value' 		=> (isset($this->request->post[$classname . '_test'])) ? $this->request->post[$classname . '_test'] : $this->config->get($classname . '_test'),
			'required' 		=> false,
			'options'		=> array(
				'0' => $this->language->get('text_no'),
				'1' => $this->language->get('text_yes')
			)
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_mid'),
			'type'			=> 'text',
			'size'			=> '40',
			'name' 			=> $classname . '_mid',
			'value' 		=> (isset($this->request->post[$classname . '_mid'])) ? $this->request->post[$classname . '_mid'] : $this->config->get($classname . '_mid'),
			'required' 		=> true,
			'error'			=> (isset($this->error['mid'])) ? $this->error['mid'] : ''
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_key'),
			'type'			=> 'text',
			'size'			=> '40',
			'name' 			=> $classname . '_key',
			'value' 		=> (isset($this->request->post[$classname . '_key'])) ? $this->request->post[$classname . '_key'] : $this->config->get($classname . '_key'),
			'required' 		=> true,
			'error'			=> (isset($this->error['key'])) ? $this->error['key'] : ''
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_customer_number'),
			'type'			=> 'text',
			'size'			=> '40',
			'name' 			=> $classname . '_customer_number',
			'value' 		=> (isset($this->request->post[$classname . '_customer_number'])) ? $this->request->post[$classname . '_customer_number'] : $this->config->get($classname . '_customer_number'),
			'required' 		=> true,
			'error'			=> (isset($this->error['customer_number'])) ? $this->error['customer_number'] : ''
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_postcode'),
			'type'			=> 'text',
			'size'			=> '20',
			'name' 			=> $classname . '_postcode',
			'value' 		=> (isset($this->request->post[$classname . '_postcode'])) ? $this->request->post[$classname . '_postcode'] : $this->config->get($classname . '_postcode'),
			'required' 		=> true,
			'error'			=> (isset($this->error['postcode'])) ? $this->error['postcode'] : ''
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_quote_type'),
			'type'			=> 'select',
			'name' 			=> $classname . '_quote_type',
			'value' 		=> (isset($this->request->post[$classname . '_quote_type'])) ? $this->request->post[$classname . '_quote_type'] : $this->config->get($classname . '_quote_type'),
			'required' 		=> false,
			'options'		=> array(
				'counter' 		=> $this->language->get('text_counter'),
				'commercial' 	=> $this->language->get('text_commercial')
			)
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_contract_id'),
			'type'			=> 'text',
			'size'			=> '60',
			'name' 			=> $classname . '_contract_id',
			'value' 		=> (isset($this->request->post[$classname . '_contract_id'])) ? $this->request->post[$classname . '_contract_id'] : $this->config->get($classname . '_contract_id'),
			'required' 		=> false
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_service'),
			'type'			=> 'select',
			'size'			=> '12',
			'multiple'		=> true,
			'name' 			=> $classname . '_service[]',
			'value' 		=> explode(',', (isset($this->request->post[$classname . '_service'])) ? $this->request->post[$classname . '_service'] : $this->config->get($classname . '_service')),
			'required' 		=> true,
			'options'		=> array(
				'DOM.RP' 		=> $this->language->get('text_DOM.RP'),
				'DOM.EP' 		=> $this->language->get('text_DOM.EP'),
				'DOM.XP' 		=> $this->language->get('text_DOM.XP'),
				'DOM.XP.CERT' 	=> $this->language->get('text_DOM.XP.CERT'),
				'DOM.PC' 		=> $this->language->get('text_DOM.PC'),
				'DOM.LIB' 		=> $this->language->get('text_DOM.LIB'),
				'USA.EP' 		=> $this->language->get('text_USA.EP'),
				'USA.PW.ENV' 	=> $this->language->get('text_USA.PW.ENV'),
				'USA.PW.PAK' 	=> $this->language->get('text_USA.PW.PAK'),
				'USA.PW.PARCEL' => $this->language->get('text_USA.PW.PARCEL'),
				'USA.SP.AIR' 	=> $this->language->get('text_USA.SP.AIR'),
				'USA.SP.SURF' 	=> $this->language->get('text_USA.SP.SURF'),
				'USA.TP' 		=> $this->language->get('text_USA.TP'),
				'USA.XP' 		=> $this->language->get('text_USA.XP'),
				'INT.XP' 		=> $this->language->get('text_INT.XP'),
				'INT.IP.AIR' 	=> $this->language->get('text_INT.IP.AIR'),
				'INT.IP.SURF' 	=> $this->language->get('text_INT.IP.SURF'),
				'INT.PW.ENV' 	=> $this->language->get('text_INT.PW.ENV'),
				'INT.PW.PAK' 	=> $this->language->get('text_INT.PW.PAK'),
				'INT.PW.PARCEL' => $this->language->get('text_INT.PW.PARCEL'),
				'INT.SP.AIR' 	=> $this->language->get('text_INT.SP.AIR'),
				'INT.SP.SURF' 	=> $this->language->get('text_INT.SP.SURF')
			),
			'error'			=> (isset($this->error['service'])) ? $this->error['service'] : ''
		);
		/*
		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_individual'),
			'type'			=> 'select',
			'name' 			=> $classname . '_individual',
			'value' 		=> (isset($this->request->post[$classname . '_individual'])) ? $this->request->post[$classname . '_individual'] : $this->config->get($classname . '_individual'),
			'required' 		=> false,
			'options'		=> array(
				'0' => $this->language->get('text_no'),
				'1' => $this->language->get('text_yes')
			)
		);
		*/

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_shipping_calc'),
			'type'			=> 'select',
			'name' 			=> $classname . '_shipping_calc',
			'value' 		=> (isset($this->request->post[$classname . '_shipping_calc'])) ? $this->request->post[$classname . '_shipping_calc'] : $this->config->get($classname . '_shipping_calc'),
			'required' 		=> false,
			'help'			=> ($this->language->get('help_shipping_calc')) ? $this->language->get('help_shipping_calc') : '',
			'options'		=> array(
				'volumetric' 	=> $this->language->get('text_volumetric'),
				'linear' 		=> $this->language->get('text_linear'),
				'static' 		=> $this->language->get('text_static')
			)

		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_length'),
			'type'			=> 'text',
			'size'			=> '4',
			'name' 			=> $classname . '_length',
			'value' 		=> (isset($this->request->post[$classname . '_length'])) ? $this->request->post[$classname . '_length'] : $this->config->get($classname . '_length'),
			'required' 		=> true,
			'error'			=> (isset($this->error['length'])) ? $this->error['length'] : ''
		);


		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_width'),
			'type'			=> 'text',
			'size'			=> '4',
			'name' 			=> $classname . '_width',
			'value' 		=> (isset($this->request->post[$classname . '_width'])) ? $this->request->post[$classname . '_width'] : $this->config->get($classname . '_width'),
			'required' 		=> true,
			'error'			=> (isset($this->error['width'])) ? $this->error['width'] : ''
		);


		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_height'),
			'type'			=> 'text',
			'size'			=> '4',
			'name' 			=> $classname . '_height',
			'value' 		=> (isset($this->request->post[$classname . '_height'])) ? $this->request->post[$classname . '_height'] : $this->config->get($classname . '_height'),
			'required' 		=> true,
			'error'			=> (isset($this->error['height'])) ? $this->error['height'] : ''
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_adjust'),
			'type'			=> 'text',
			'size'			=> '60',
			'name' 			=> $classname . '_adjust',
			'value' 		=> (isset($this->request->post[$classname . '_adjust'])) ? $this->request->post[$classname . '_adjust'] : $this->config->get($classname . '_adjust'),
			'required' 		=> false,
			'error'			=> (isset($this->error['adjust'])) ? $this->error['adjust'] : ''
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_display_weight'),
			'type'			=> 'select',
			'name' 			=> $classname . '_display_weight',
			'value' 		=> (isset($this->request->post[$classname . '_display_weight'])) ? $this->request->post[$classname . '_display_weight'] : $this->config->get($classname . '_display_weight'),
			'required' 		=> false,
			'options'		=> array(
				'0' => $this->language->get('text_no'),
				'1' => $this->language->get('text_yes')
			)
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_display_dims'),
			'type'			=> 'select',
			'name' 			=> $classname . '_display_dims',
			'value' 		=> (isset($this->request->post[$classname . '_display_dims'])) ? $this->request->post[$classname . '_display_dims'] : $this->config->get($classname . '_display_dims'),
			'required' 		=> false,
			'options'		=> array(
				'0' => $this->language->get('text_no'),
				'1' => $this->language->get('text_yes')
			)
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_display_date'),
			'type'			=> 'select',
			'name' 			=> $classname . '_display_date',
			'value' 		=> (isset($this->request->post[$classname . '_display_date'])) ? $this->request->post[$classname . '_display_date'] : $this->config->get($classname . '_display_date'),
			'required' 		=> false,
			'options'		=> array(
				'0' => $this->language->get('text_no'),
				'1' => $this->language->get('text_yes')
			)
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_debug'),
			'type'			=> 'select',
			'name' 			=> $classname . '_debug',
			'value' 		=> (isset($this->request->post[$classname . '_debug'])) ? $this->request->post[$classname . '_debug'] : $this->config->get($classname . '_debug'),
			'required' 		=> false,
			'options'		=> array(
				'0' => $this->language->get('text_disabled'),
				'1' => $this->language->get('text_enabled')
			)
		);
		
		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_display_errors'),
			'type'			=> 'select',
			'name' 			=> $classname . '_display_errors',
			'value' 		=> (isset($this->request->post[$classname . '_display_errors'])) ? $this->request->post[$classname . '_display_errors'] : $this->config->get($classname . '_display_errors'),
			'required' 		=> false,
			'options'		=> array(
				'0' => $this->language->get('text_no'),
				'1' => $this->language->get('text_yes')
			)
		);
/*
		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_customer_group'),
			'type'			=> 'select',
			'multiple'		=> true,
			'name' 			=> $classname . '_customer_group[]',
			'value' 		=> (isset($this->request->post[$classname . '_customer_group'])) ? $this->request->post[$classname . '_customer_group'] : $this->config->get($classname . '_customer_group'),
			'required' 		=> false,
			'options'		=> $customer_groups
		);
*/

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_tax'),
			'type'			=> 'select',
			'name' 			=> $classname . '_tax_class_id',
			'value' 		=> (isset($this->request->post[$classname . '_tax_class_id'])) ? $this->request->post[$classname . '_tax_class_id'] : $this->config->get($classname . '_tax_class_id'),
			'required' 		=> false,
			'options'		=> $tax_classes
		);

		$this->data['fields'][] = array(
			'entry' 		=> $this->language->get('entry_geo_zone'),
			'type'			=> 'select',
			'name' 			=> $classname . '_geo_zone_id',
			'value' 		=> (isset($this->request->post[$classname . '_geo_zone_id'])) ? $this->request->post[$classname . '_geo_zone_id'] : $this->config->get($classname . '_geo_zone_id'),
			'required' 		=> false,
			'options'		=> $geo_zones
		);

		$this->data['fields'][] = array(
			'entry'			=> $this->language->get('entry_sort_order'),
			'type'			=> 'text',
			'name'			=> $classname . '_sort_order',
			'value'			=> (isset($this->request->post[$classname . '_sort_order'])) ? $this->request->post[$classname . '_sort_order'] : $this->config->get($classname . '_sort_order'),
			'required'		=> false,
		);

		$this->data['fields'][] = array(
			'tab'			=> 'tab_debug',
			'entry'			=> $this->language->get('entry_debug_file'),
			'type'			=> 'label',
			'name'			=> '',
			'value'			=> DIR_LOGS . $classname . '.class.log'
		);

		$this->data['fields'][] = array(
			'tab'			=> 'tab_debug',
			'entry'			=> '',
			'type'			=> 'textarea',
			'cols'			=> '160',
			'rows'			=> '100',
			'name'			=> '',
			'value'			=> (file_exists(DIR_LOGS . $classname . '.class.log')) ? file_get_contents(DIR_LOGS . $classname . '.class.log') : 'empty'
		);
		/* END FIELDS */

        $this->response->setOutput($this->render(TRUE));
	}

	private function validate($errors = array()) {
		$classname = str_replace('vq2-admin_controller_shipping_', '', basename(__FILE__, '.php'));
		if (!$this->user->hasPermission('modify', 'shipping/' . $classname)) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($errors as $error) {
			if (isset($this->request->post[$classname . '_' . $error]) && !$this->request->post[$classname . '_' . $error]) {
				$this->error[$error] = $this->language->get('error_' . $error);
			}
			if ($error == 'service') {
				if (!isset($this->request->post[$classname . '_service']) || !$this->request->post[$classname . '_service']) {
					$this->error[$error] = $this->language->get('error_' . $error);
				}
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