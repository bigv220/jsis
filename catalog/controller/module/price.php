<?php
//==============================================================================
// Filter by Price Module v155.2
// 
// Author: Clear Thinking, LLC
// E-mail: johnathan@getclearthinking.com
// Website: http://www.getclearthinking.com
//==============================================================================

class ControllerModulePrice extends Controller {
	private $type = 'module';
	private $name = 'price';
	private $module = '';
	
	protected function index($module = '') {
		$this->module = $module;
		$version = $this->data['version'] = (!defined('VERSION')) ? 140 : (int)substr(str_replace('.', '', VERSION), 0, 3);
		$settings = ($version < 151) ? unserialize($this->config->get($this->name . '_data')) : $this->config->get($this->name . '_data');
		
		if ($this->session->data['currency'] != $this->getModuleSetting('currency')) return;
		
		$this->data = array_merge($this->data, $this->load->language($this->type . '/' . $this->name));
		
		$this->data['args'] = '';
		if (!empty($settings['filter_categories']) && !empty($this->request->get['path'])) {
			$this->data['args'] .= '&path=' . $this->request->get['path'];
		}
		if (!empty($settings['filter_manufacturers']) && !empty($this->request->get['manufacturer_id'])) {
			$this->data['args'] .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
		}
		if (!empty($settings['filter_searches'])) {
			$search_filters = array(
				'category_id',
				'description',
				'filter_category_id',
				'filter_description',
				'filter_name',
				'filter_sub_category',
				'filter_tag',
				'keyword',
				'model',
				'search',
				'sub_category',
				'tag'
			);
			foreach ($search_filters as $filter) {
				if (!empty($this->request->get[$filter])) {
					$this->data['args'] .= '&' . $filter . '=' . $this->request->get[$filter];
				}
			}
		}
		
		$this->data['ranges'] = array();
		
		$results = explode(',', str_replace(' ', '', $this->getModuleSetting('ranges')));
		if ($results[0] != '' && (int)$results[0] !== 0) {
			array_unshift($results, 0);
		}
		$num_results = (count($results) > 1) ? count($results) : 0;
		
		for ($i = 1; $i <= $num_results; $i++) {
			$lower = (strpos($results[$i-1], '.') === false) ? $results[$i-1] : number_format($results[$i-1], 2, '.', '');
			$converted_lower = $this->currency->convert($lower, $this->session->data['currency'], $this->config->get('config_currency'));
			
			$upper = (isset($results[$i])) ? (float)$results[$i] : '';
			$upper = (strpos($upper, '.') === false) ? $upper : number_format($upper, 2, '.', '');
			$converted_upper = $this->currency->convert($upper, $this->session->data['currency'], $this->config->get('config_currency'));
			
			if ($i == 1) {
				$text = sprintf($this->language->get('text_bottom'), $this->currency->format($converted_upper));
			} elseif ($i == $num_results) {
				$text = sprintf($this->language->get('text_top'), $this->currency->format($converted_lower));
			} else {
				$text = sprintf($this->language->get('text_middle'), $this->currency->format($converted_lower), $this->currency->format($converted_upper));
			}
			
			$this->data['ranges'][] = array(
				'text'	=> $text,
				'href'	=> $this->makeURL('product/' . $this->name, $this->data['args'] . '&range=' . $lower . '-' . $upper, 'NONSSL', false)
			);
		}
		
		$this->data['text_flexible_middle'] = sprintf($this->language->get('text_middle'), '', '');
		if (!empty($this->request->get['range'])) {
			$range = explode('-', $this->request->get['range']);
			$this->data['lower'] = $range[0];
			$this->data['upper'] = (isset($range[1])) ? $range[1] : '';
		} else {
			$this->data['lower'] = '';
			$this->data['upper'] = '';
		}
		
		$this->data['flexible_filter'] = $this->getModuleSetting('flexible_filter');
		
		$this->id = $this->name;
		
		$file = ($this->getModuleSetting('position') == 'home') ? $this->name . '_home' : $this->name;
		$template = (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/' . $this->type . '/' . $file . '.tpl')) ? $this->config->get('config_template') : 'default';
		$this->template = $template . '/template/' . $this->type . '/' . $file . '.tpl';
		
		$this->render();
	}
	
	private function getModuleSetting($setting) {
		if (!defined('VERSION') || VERSION < 1.5) {
			$value = $this->config->get($this->name . '_' . $setting);
		} elseif (strpos(VERSION, '1.5.0') === 0) {
			$value = $this->config->get($this->name . '_' . $this->module . '_' . $setting);
		} else {
			$value = (!empty($this->module[$setting])) ? $this->module[$setting] : false;
		}
		return (is_string($value) && strpos($value, 'a:') === 0) ? unserialize($value) : $value;
	}
	
	private function makeURL($route, $args = '', $connection = 'NONSSL', $rewrite = true) {
		if (!defined('VERSION') || VERSION < 1.5 || !$rewrite) {
			$url = ($connection == 'NONSSL') ? HTTP_SERVER : HTTPS_SERVER;
			$url .= 'index.php?route=' . $route;
			$url .= ($args) ? '&' . ltrim($args, '&') : '';
			if ($rewrite) {
				$this->load->model('tool/seo_url');
				$url = $this->model_tool_seo_url->rewrite($url);
			}
			return $url;
		} else {
			return $this->url->link($route, $args, $connection);
		}
	}
	
	public function rewriteURL() {
		echo html_entity_decode($this->makeURL($this->request->post['route'], html_entity_decode($this->request->post['args']), 'NONSSL', false));
	}
}
?>