<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}

        $this->load->model('catalog/product');

        $this->load->model('tool/image');



        /***********首页添加珠宝类产品***********/
        $data_zhubao = array(
            'filter_category_id' => 39,
            'filter_filter'      => '',
            'sort'               => '',
            'order'              => DESC,
            'start'              => 0,
            'limit'              => 4
        );
        $results_zhubao = $this->model_catalog_product->getProducts($data_zhubao);

        foreach ($results_zhubao as $result) {
            if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
            } else {
                $image = false;
            }

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }

            if ((float)$result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $special = false;
            }

            $this->data['products_zhubao'][] = array(
                'product_id'  => $result['product_id'],
                'thumb'       => $image,
                'name'        => $result['name'],
                'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
                'price'       => $price,
                'special'     => $special,
                'rating'      => $result['rating'],
                'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
            );
        }
        /******************END***************/



        /***********首页添加床上用品产品***********/
        $data_bed = array(
            'filter_category_id' => 18,
            'filter_filter'      => '',
            'sort'               => '',
            'order'              => DESC,
            'start'              => 0,
            'limit'              => 4
        );
        $results_bed = $this->model_catalog_product->getProducts($data_bed);

        foreach ($results_bed as $result) {
            if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
            } else {
                $image = false;
            }

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }

            if ((float)$result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $special = false;
            }

            $this->data['products_bed'][] = array(
                'product_id'  => $result['product_id'],
                'thumb'       => $image,
                'name'        => $result['name'],
                'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
                'price'       => $price,
                'special'     => $special,
                'rating'      => $result['rating'],
                'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
            );
        }
        /******************END***************/

        /***********首页添加日化品产品***********/
        $data_daily = array(
            'filter_category_id' => 15,
            'filter_filter'      => '',
            'sort'               => '',
            'order'              => DESC,
            'start'              => 0,
            'limit'              => 4
        );
        $results_daily = $this->model_catalog_product->getProducts($data_daily);

        foreach ($results_daily as $result) {
            if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
            } else {
                $image = false;
            }

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }

            if ((float)$result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $special = false;
            }

            $this->data['products_daily'][] = array(
                'product_id'  => $result['product_id'],
                'thumb'       => $image,
                'name'        => $result['name'],
                'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
                'price'       => $price,
                'special'     => $special,
                'rating'      => $result['rating'],
                'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
            );
        }
        /******************END***************/

        /***********首页添加澳洲代购产品***********/
        $data_daigou = array(
            'filter_category_id' => 81,
            'filter_filter'      => '',
            'sort'               => '',
            'order'              => DESC,
            'start'              => 0,
            'limit'              => 4
        );
        $results_daigou = $this->model_catalog_product->getProducts($data_daigou);

        foreach ($results_daigou as $result) {
            if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
            } else {
                $image = false;
            }

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }

            if ((float)$result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $special = false;
            }

            $this->data['products_daigou'][] = array(
                'product_id'  => $result['product_id'],
                'thumb'       => $image,
                'name'        => $result['name'],
                'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
                'price'       => $price,
                'special'     => $special,
                'rating'      => $result['rating'],
                'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
            );
        }
        /******************END***************/

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
?>