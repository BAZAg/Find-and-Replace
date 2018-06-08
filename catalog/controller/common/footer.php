<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_order_recall'] = $this->language->get('text_order_recall');
		$data['text_telephone'] = $this->language->get('text_telephone');
		$data['text_name'] = $this->language->get('text_name');
		$data['text_send_request'] = $this->language->get('text_send_request');
		$data['text_btn_loading'] = $this->language->get('text_btn_loading');
		$data['text_messanger'] = $this->language->get('text_messanger');
		$data['text_social'] = $this->language->get('text_social');
		$data['text_payment_method'] = $this->language->get('text_payment_method');
		$data['text_added'] = $this->language->get('text_added');
		$data['text_punkt'] = $this->language->get('text_punkt');
		$data['continue_buy'] = $this->language->get('continue_buy');
		$data['text_free_call'] = $this->language->get('text_free_call');
		$data['text_need_consult'] = $this->language->get('text_need_consult');
		$data['text_your_name'] = $this->language->get('text_your_name');
		$data['text_your_telephone'] = $this->language->get('text_your_telephone');
		$data['text_agree_conf'] = $this->language->get('text_agree_conf');
		$data['text_copir'] = sprintf($this->language->get('text_copir'), date('Y'));
		$data['text_pickup'] = sprintf($this->language->get('text_pickup'), $this->config->get('config_region_name_2'));


		$data['text_comment'] = sprintf($this->language->get('text_comment'), $this->config->get('config_company_name'), $this->config->get('config_company_inn'), $this->config->get('config_company_ogrn'), $this->config->get('config_company_rs'));

		$data['telephone'] = $this->config->get('config_telephone');
		$data['second_telephone'] = $this->config->get('config_second_telephone');

		if($this->config->get('config_vk')) {
			$data['link_vk'] = $this->config->get('config_vk');
		} else {
			$data['link_vk'] = false;
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

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['img_visa'] = $server . 'image/visa.png';
		$data['img_sberbank_online'] = $server . 'image/sberbank_online.png';
		$data['img_tinkoff_bank'] = $server . 'image/tinkoff_bank.png';
		$data['img_mastercard'] = $server . 'image/mastercard.png';
		$data['img_yandex_money'] = $server . 'image/yandex_money.png';

		//HaterStudio

		$this->load->model('tool/image');

		if($this->config->get('config_map_code')) 
			$data['map_code'] = $this->config->get('config_map_code');
		else 
			$data['map_code'] = '';

		if($this->config->get('config_post_address')) 
			$data['post_address'] = html_entity_decode($this->config->get('config_post_address'));
		else 
			$data['post_address'] = '';

		if (!empty($this->config->get('config_gerb')) && is_file(DIR_IMAGE . $this->config->get('config_gerb'))) {
			$data['gerb'] = $this->model_tool_image->resize($this->config->get('config_gerb'), 100, 100);
		} else {
			$data['gerb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		//HaterStudio

		$this->load->model('catalog/information');

		$data['informations'] = array();
		$data['informations_ex'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			} elseif($result['extra_bottom']) {
				$data['informations_ex'][] =array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$this->load->model('catalog/category');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['bottom']) {
				// Level 2
				$product_data = array();

				$category_products = $this->model_catalog_category->getCategoriesProducts($category['category_id']);

				foreach ($category_products as $product) {
					$product_data[] = array(
						'name'  => $product['name'],
						'href'  => $this->url->link('product/product', 'product_id=' . $product['product_id'], true)
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'products' => $product_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}

	public function sendForm() {
		$json['error'] = array();
		$json['success'] = false;

		if(empty($this->request->post['name'])) {
			$json['error'][] = 'name';
		}

		if(empty($this->request->post['telephone']) || !is_numeric($this->request->post['telephone'])) {
			$json['error'][] = 'telephone';
		}

		if(empty($this->request->post['agree']) || !$this->request->post['telephone']) {
			$json['error'][] = 'agree';
		}

		if(!$json['error']) {
			$json['success'] = true;
		}

		$this->response->addHeader('Content-Type: application/json'); 
		$this->response->setOutput(json_encode($json));
	}
}
