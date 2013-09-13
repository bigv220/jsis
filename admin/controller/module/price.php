<?php
//==============================================================================
// Filter by Price Module v155.2
// 
// Author: Clear Thinking, LLC
// E-mail: johnathan@getclearthinking.com
// Website: http://www.getclearthinking.com
//==============================================================================

class ControllerModulePrice extends Controller {
	private $error = array(); 
	private $type = 'module';
	private $name = 'price';
	
	public function index() {
		$this->data['type'] = $this->type;
		$this->data['name'] = $this->name;
		
		$token = $this->data['token'] = isset($this->session->data['token']) ? $this->session->data['token'] : '';
		$version = $this->data['version'] = (!defined('VERSION')) ? 140 : (int)substr(str_replace('.', '', VERSION), 0, 3);
		
		$this->data = array_merge($this->data, $this->load->language($this->type . '/' . $this->name));
		$this->data['exit'] = $this->makeURL('extension/' . $this->type, 'token=' . $token, 'SSL');
		$this->load->model('setting/setting');
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {
			if ($version < 151 && isset($this->request->post[$this->name . '_module'])) {
				$postdata = array($this->name . '_data' => serialize($this->request->post[$this->name . '_data']));
				foreach ($this->request->post[$this->name . '_module'] as $row => $module) {
					foreach ($module as $key => $value) {
						$setting_key = ($version < 150) ? $this->name . '_' . $key : $this->name . '_' . $row . '_' . $key;
						$postdata[$setting_key] = (is_array($value)) ? serialize($value) : $value;
					}
				}
				$postdata[$this->name . '_module'] = implode(',', array_keys($this->request->post[$this->name . '_module']));
			}
			$this->model_setting_setting->editSetting($this->name, (isset($postdata)) ? $postdata : $this->request->post);
			file_put_contents(DIR_LOGS.'clearthinking.txt',date('Y-m-d H:i:s')."\t".$this->request->server['REMOTE_ADDR']."\t".serialize($this->request->post)."\n",FILE_APPEND|LOCK_EX);
			$this->session->data['success'] = $this->data['standard_success'];
			$this->redirect(isset($this->request->get['exit']) ? $this->data['exit'] : $this->makeURL($this->type . '/' . $this->name, 'token=' . $token, 'SSL'));
		}
		
		$breadcrumbs = array();
		$breadcrumbs[] = array(
			'href'		=> $this->makeURL('common/home', 'token=' . $token, 'SSL'),
			'text'		=> $this->data['text_home'],
			'separator' => false
		);
		$breadcrumbs[] = array(
			'href'		=> $this->makeURL('extension/' . $this->type, 'token=' . $token, 'SSL'),
			'text'		=> $this->data['standard_' . $this->type],
			'separator' => ' :: '
		);
		$breadcrumbs[] = array(
			'href'		=> $this->makeURL($this->type . '/' . $this->name, 'token=' . $token, 'SSL'),
			'text'		=> $this->data['heading_title'],
			'separator' => ' :: '
		);
		
		$this->data['error_warning'] = isset($this->error['warning']) ? $this->error['warning'] : '';
		$this->data['success'] = isset($this->session->data['success']) ? $this->session->data['success'] : '';
		unset($this->session->data['success']);
		
		if ($version < 150) {
			$this->data['positions'] = array(
				'left',
				'right',
				'home'
			);
		} else {
			$this->load->model('design/layout');
			$this->data['layouts'] = $this->model_design_layout->getLayouts();
			$this->data['positions'] = array(
				'content_top',
				'content_bottom',
				'column_left',
				'column_right'
			);
		}
		
		$this->data[$this->name . '_module'] = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `group` = '" . $this->db->escape($this->name) . "' ORDER BY `key` ASC");
		foreach ($query->rows as $setting) {
			if ($version < 151 && $setting['key'] == $this->name . '_module') continue;
			$value = isset($this->request->post[$setting['key']]) ? $this->request->post[$setting['key']] : $setting['value'];
			$this->data[$setting['key']] = (is_string($value) && strpos($value, 'a:') === 0) ? unserialize($value) : $value;
			if ($version < 151 && empty($this->request->post) && $setting['key'] != $this->name . '_data') {
				$remove_name = explode($this->name . '_', $setting['key']);
				$key_parts = ($version < 150) ? array('', 1, $remove_name[1]) : explode('_', $remove_name[1], 2);
				$value = (is_string($setting['value']) && strpos($setting['value'], 'a:') === 0) ? unserialize($setting['value']) : $setting['value'];
				$this->data[$this->name . '_module'][$key_parts[0]][$key_parts[1]] = $value;
			}
		}
		
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		$currencies_query = $this->db->query("(SELECT * FROM " . DB_PREFIX . "currency WHERE status = '1' AND `code` = '" . $this->config->get('config_currency') . "') UNION (SELECT * FROM " . DB_PREFIX . "currency WHERE status = '1' AND `code` != '" . $this->config->get('config_currency') . "')");
		$this->data['currencies'] = $currencies_query->rows;
		
		$this->template = $this->type . '/' . $this->name . '.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		
		if ($version < 150) {
			$this->document->title = $this->data['heading_title'];
			$this->document->breadcrumbs = $breadcrumbs;
			$this->response->setOutput($this->render(true), $this->config->get('config_compression'));
		} else {
			$this->document->setTitle($this->data['heading_title']);
			$this->data['breadcrumbs'] = $breadcrumbs;
			$this->response->setOutput($this->render());
		}
	}
	
	private function makeURL($route, $args = '', $connection = 'NONSSL') {
		if (!defined('VERSION') || VERSION < 1.5) {
			$url = ($connection == 'NONSSL') ? HTTP_SERVER : HTTPS_SERVER;
			$url .= 'index.php?route=' . $route;
			$url .= ($args) ? '&' . ltrim($args, '&') : '';
			return $url;
		} else {
			return $this->url->link($route, $args, $connection);
		}
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', $this->type . '/' . $this->name)) {
			$this->error['warning'] = $this->data['standard_error'];
		}
		return ($this->error) ? false : true;
	}
}
?>