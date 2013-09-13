<?php
//==============================================================================
// Filter by Price Module v155.2
// 
// Author: Clear Thinking, LLC
// E-mail: johnathan@getclearthinking.com
// Website: http://www.getclearthinking.com
//==============================================================================

class ControllerProductPrice extends Controller {
	private $type = 'product';
	private $name = 'price';
	private $copy = 'special';
	
	public function index() {
		$version = $this->data['version'] = (!defined('VERSION')) ? 140 : (int)substr(str_replace('.', '', VERSION), 0, 3);
		$settings = ($version < 151) ? unserialize($this->config->get($this->name . '_data')) : $this->config->get($this->name . '_data');
		
		$this->data = array_merge($this->data, $this->load->language($this->type . '/' . $this->copy));
		$this->data = array_merge($this->data, $this->load->language($this->type . '/' . $this->name));
		
		$url = array();
		
		$filters = array(
			'category_id'			=> '',
			'description'			=> '',
			'filter_category_id'	=> '',
			'filter_description'	=> '',
			'filter_name'			=> '',
			'filter_sub_category'	=> '',
			'filter_tag'			=> '',
			'keyword'				=> '',
			'limit' 				=> $this->config->get('config_catalog_limit'),
			'manufacturer_id'		=> '',
			'model'					=> '',
			'order'					=> 'ASC',
			'page'					=> 1,
			'path'					=> '',
			'range' 				=> '0-100',
			'search'				=> '',
			'sort'					=> 'price',
			'sub_category'			=> '',
			'tag'					=> ''
		);
		
		foreach ($filters as $key => $value) {
			if (!empty($this->request->get[$key])) {
				$url[$key] = '&' . $key . '=' . $this->request->get[$key];
				$filters[$key] = $this->request->get[$key];
			} else {
				$url[$key] = '';
			}
			$this->data[$key] = $filters[$key];
		}
		$url['searches'] = $url['search'] . $url['sub_category'] . $url['tag'] . $url['keyword'] . $url['description'] . $url['model'] . $url['category_id'] . $url['filter_name'] . $url['filter_tag'] . $url['filter_description'] . $url['filter_category_id'] . $url['filter_sub_category'];
		
		$breadcrumbs = array();
		$breadcrumbs[] = array(
			'href'		=> $this->makeURL('common/home'),
			'text'		=> $this->language->get('text_home'),
			'separator'	=> false
		);
		
		$heading_beg = $this->language->get('heading_products');
		if (!empty($settings['filter_categories']) && !empty($filters['path'])) {
			$this->load->model('catalog/category');
			$path = '';
			
			foreach (explode('_', $filters['path']) as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}
				
				$category = $this->model_catalog_category->getCategory($path_id);
				
				if ($category) {
					$breadcrumbs[] = array(
						'href'		=> $this->makeURL('product/category', 'path=' . $path),
						'text'		=> $category['name'],
						'separator'	=> $this->language->get('text_separator')
					);
				}
			}
			
			$heading_beg = (isset($category['name'])) ? $category['name'] : '';
		}
		
		$heading_end = '';
		if (!empty($settings['filter_manufacturers']) && !empty($filters['manufacturer_id'])) {
			$this->load->model('catalog/manufacturer');
			$manufacturer = $this->model_catalog_manufacturer->getManufacturer($filters['manufacturer_id']);
			
			if ($manufacturer) {
				if ($version < 150) {
					$breadcrumbs[] = array(
						'href'		=> HTTP_SERVER . 'index.php?route=product/manufacturer' . $url['manufacturer_id'],
						'text'		=> $manufacturer['name'],
						'separator'	=> $this->language->get('text_separator')
					);
				} else {
					$breadcrumbs[] = array(
						'href'		=> $this->url->link('product/manufacturer'),
						'text'		=> $this->language->get('text_brand'),
						'separator'	=> $this->language->get('text_separator')
					);
					$breadcrumbs[] = array(
						'href'		=> $this->url->link('product/manufacturer/product', $url['manufacturer_id']),
						'text'		=> $manufacturer['name'],
						'separator'	=> $this->language->get('text_separator')
					);
				}
				$heading_end = $this->language->get('heading_made_by') . ' ' . $manufacturer['name'];
			}
		}
		
		if (!empty($settings['filter_searches']) && !empty($url['searches'])) {
			$breadcrumbs[] = array(
				'href'		=> $this->makeURL('product/search', $url['searches']),
				'text'		=> $this->language->get('button_search'),
				'separator'	=> $this->language->get('text_separator')
			);
		}
		
		$range = explode('-', $filters['range']);
		$lower = $this->currency->convert($range[0], $this->session->data['currency'], $this->config->get('config_currency'));
		$upper = (!empty($range[1])) ? $this->currency->convert($range[1], $this->session->data['currency'], $this->config->get('config_currency')) : '';
		
		if ($upper) {
			$heading_mid = sprintf($this->language->get('heading_title'), $this->currency->format($lower), $this->currency->format($upper));
		} else {
			$heading_mid = sprintf($this->language->get('heading_title_alt'), $this->currency->format($lower));
		}
		$breadcrumbs[] = array(
			'href'		=> $this->makeURL($this->type . '/' . $this->name, $url['path'] . $url['manufacturer_id'] . $url['searches'] . $url['range'] . $url['sort'] . $url['order'] . $url['limit'] . $url['page'], 'NONSSL', false),
			'text'      => $heading_mid,
			'separator' => $this->language->get('text_separator')
		);
		$this->data['heading_title'] = $heading_beg . ' ' . $heading_mid . ' ' . $heading_end;
		
		$this->load->model('tool/image');
		$this->load->model('catalog/product');
		$this->load->model('catalog/' . $this->name);
		
		$product_total = $this->{'model_catalog_'.$this->name}->getProducts($filters, 'total');
		
		if ($product_total) {
			$this->data['products'] = array();
			
			$results = $this->{'model_catalog_'.$this->name}->getProducts($filters);
			
			foreach ($results as $result) {
				$options = $this->model_catalog_product->getProductOptions($result['product_id']);
				$rating = ($this->config->get('config_review' . ($version < 150 ? '' : '_status'))) ? (int)$result['rating'] : false;
				
				$this->data['products'][] = array(
					'add'			=> $this->makeURL(($options ? 'product/product' : 'checkout/cart'), 'product_id=' . $result['product_id']),
					'description'	=> substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '...',
					'href'			=> $this->makeURL('product/product', 'product_id=' . $result['product_id']),
					'model'			=> $result['model'],
					'name'			=> $result['name'],
					'options'		=> $options,
					'price'			=> (!$this->config->get('config_customer_price') || $this->customer->isLogged()) ? $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax'))) : false,
					'product_id'	=> $result['product_id'],
					'rating'		=> $rating,
					'reviews'		=> ($version > 149) ? sprintf($this->data['text_reviews'], (int)$result['reviews']) : '',
					'special'		=> ((float)$result['special']) ? $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax'))) : false,
					'stars'			=> ($version < 150) ? sprintf($this->data['text_stars'], $rating) : '',
					'tax'			=> ($this->config->get('config_tax')) ? $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']) : false,
					'thumb'			=> $this->model_tool_image->resize(($result['image']) ? $result['image'] : 'no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'))
				);
			}
			
			$this->data['sorts'] = array();
			$this->data['sorts'][] = array(
				'text'	=> $this->data['text_default'],
				'value' => '',
				'href'	=> $this->makeURL($this->type . '/' . $this->name, $url['limit'])
			);
			
			$sort_array = array(
				'name',
				'price',
				'rating',
				'model'
			);
			if ($version == 148) array_pop($sort_array);
			$order_array = array(
				'asc',
				'desc'
			);
			
			foreach ($sort_array as $sort) {
				foreach ($order_array as $order) {
					$this->data['sorts'][] = array(
						'text'	=> $this->language->get('text_' . $sort . '_' . $order),
						'value' => $sort . '-' . $order,
						'href'	=> $this->makeURL($this->type . '/' . $this->name, $url['path'] . $url['manufacturer_id'] . $url['searches'] . $url['range'] . '&sort=' . $sort . '&order=' . $order . $url['limit'], 'NONSSL', false)
					);
				}
			}
			
			$limit_array = array($this->config->get('config_catalog_limit'), 25, 50, 75, 100);
			
			foreach ($limit_array as $limit) {
				$this->data['limits'][] = array(
					'text'  => $limit,
					'value' => $limit,
					'href'  => $this->makeURL($this->type . '/' . $this->name, $url['path'] . $url['manufacturer_id'] . $url['searches'] . $url['range'] . $url['sort'] . $url['order'] . '&limit=' . $limit, 'NONSSL', false)
				);
			}
			
			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $filters['page'];
			$pagination->limit = $filters['limit'];
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->makeURL($this->type . '/' . $this->name, $url['path'] . $url['manufacturer_id'] . $url['searches'] . $url['range'] . $url['sort'] . $url['order'] . $url['limit'] . '&page={page}', 'NONSSL', false);
			
			$this->data['pagination'] = $pagination->render();
			$this->data['display_price'] = (!$this->config->get('config_customer_price') || $this->customer->isLogged());
			
			$template = (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/' . $this->type . '/' . $this->copy . '.tpl')) ? $this->config->get('config_template') : 'default';
			$this->template = $template . '/template/' . $this->type . '/' . $this->copy . '.tpl';
		} else {
			$this->data['text_error'] = $this->data['text_empty'];
			$this->data['continue'] = $this->makeURL('common/home');
			
			$template = (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) ? $this->config->get('config_template') : 'default';
			$this->template = $template . '/template/error/not_found.tpl';
		}
		
		if ($version < 150) {
			$this->data['display_price'] = (!$this->config->get('config_customer_price') || $this->customer->isLogged());
			
			$this->document->title = $this->data['heading_title'];
			$this->document->breadcrumbs = $breadcrumbs;
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/footer',
				'common/header'
			);
			$this->response->setOutput($this->render(true), $this->config->get('config_compression'));
		} else {
			if ($version > 154) {
				$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
			}
			
			$this->data['text_compare'] = sprintf($this->data['text_compare'], (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$this->data['compare'] = $this->makeURL('product/compare');
			
			$this->document->setTitle($this->data['heading_title']);
			$this->data['breadcrumbs'] = $breadcrumbs;
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
			$this->response->setOutput($this->render());
		}
	}
	
	private function makeURL($route, $args = '', $connection = 'NONSSL', $rewrite = true) {
		if (!defined('VERSION') || VERSION < 1.5 || !$rewrite) {
			$url = ($connection == 'NONSSL') ? HTTP_SERVER : HTTPS_SERVER;
			$url .= 'index.php?route=' . $route;
			$url .= ($args) ? '&' . ltrim($args, '&') : '';
			if ($rewrite) {
				$this->load->model('tool/seo_url');
				return $this->model_tool_seo_url->rewrite($url);
			} else {
				return $url;
			}
		} else {
			return $this->url->link($route, $args, $connection);
		}
	}
}
?>