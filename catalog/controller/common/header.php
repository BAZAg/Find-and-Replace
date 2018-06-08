<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');
		$this->load->language('common/header');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		//HaterStudio

		if($this->config->get('config_email'))
			$data['email'] = sprintf($this->language->get('text_email'), $this->config->get('config_email'));
		else
			$data['email'] = '';

		if($this->config->get('config_peoples'))
			$data['peoples'] = $this->config->get('config_peoples');
		else
			$data['peoples'] = '';

		if($this->config->get('config_city_name'))
			$data['city_name'] = $this->config->get('config_city_name');
		else 
			$data['city_name'] = '';

		if($this->config->get('config_city_name_2'))
			$data['city_name_2'] = $this->config->get('config_city_name_2');
		else 
			$data['city_name_2'] = '';

		if($this->config->get('config_city_name_3'))
			$data['city_name_3'] = $this->config->get('config_city_name_3');
		else 
			$data['city_name_3'] = '';

		if($this->config->get('config_region_name'))
			$data['region_name'] = $this->config->get('config_region_name');
		else
			$data['region_name'] = '';

		if($this->config->get('config_region_name_2'))
			$data['region_name_2'] = $this->config->get('config_region_name_2');
		else
			$data['region_name_2'] = '';

		if($this->config->get('config_region_name_3'))
			$data['region_name_3'] = $this->config->get('config_region_name_3');
		else
			$data['region_name_3'] = '';

		//HaterStudio

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		if($this->config->get('config_vk')) {
			$data['link_vk'] = $this->config->get('config_vk');
		} else {
			$data['link_vk'] = false;
		}

		if($this->config->get('config_fb')) {
			$data['link_fb'] = $this->config->get('config_fb');
		} else {
			$data['link_fb'] = false;
		}

		if($this->config->get('config_instagram')) {
			$data['link_instagram'] = $this->config->get('config_instagram');
		} else {
			$data['link_instagram'] = false;
		}

		if($this->config->get('config_tg')) {
			$data['link_tg'] = $this->config->get('config_tg');
		} else {
			$data['link_tg'] = false;
		}

		if($this->config->get('config_viber')) {
			$data['link_viber'] = $this->config->get('config_viber');
		} else {
			$data['link_viber'] = false;
		}

		if($this->config->get('config_whatsapp')) {
			$data['link_whatsapp'] = $this->config->get('config_whatsapp');
		} else {
			$data['link_whatsapp'] = false;
		}

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_work_time'] = $this->language->get('text_work_time');
		$data['text_central_office'] = $this->language->get('text_central_office');
		$data['text_recall'] = $this->language->get('text_recall');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = sprintf($this->language->get('text_telephone'), $this->config->get('config_telephone'));
		$data['work_time'] = $this->config->get('config_open');
		$data['shop_address'] = $this->config->get('config_address');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();
				$product_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);
				$category_products = $this->model_catalog_category->getCategoriesProducts($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				foreach ($category_products as $product) {
					$product_data[] = array(
						'name'  => $product['name'],
						'href'  => $this->url->link('product/product', 'product_id=' . $product['product_id'], true)
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'products' => $product_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}

	public function sendRecallRequest() {
		$json = array();
		$json['success'] = false;
		$json['error'] = array();

		if(empty($this->request->post['name'])) {
			$json['error'][] = 'name';
		}

		if(empty($this->request->post['telephone']) || !is_numeric($this->request->post['telephone'])) {
			$json['error'][] = 'telephone';
		}

		if(!$json['error']) {
			$json['success'] = true;

			$this->load->model('setting/store');
			$this->load->language('common/header');

			$message = sprintf($this->language->get('email_name'), $this->request->post['name']);
			$message .= sprintf($this->language->get('email_telephone'), $this->request->post['name']);

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')));
			$mail->setHtml($message);
			$mail->send();
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json)); 
	}
}
