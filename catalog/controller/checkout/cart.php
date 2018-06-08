<?php
class ControllerCheckoutCart extends Controller {
	public function index() {
		$this->load->language('checkout/cart');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('common/home'),
			'text' => $this->language->get('text_home')
		);

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('checkout/cart'),
			'text' => $this->language->get('heading_title')
		);

		if ($this->cart->hasProducts() || !empty($this->session->data['vouchers'])) {
			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_recurring_item'] = $this->language->get('text_recurring_item');
			$data['text_next'] = $this->language->get('text_next');
			$data['text_next_choice'] = $this->language->get('text_next_choice');
			$data['text_loading'] = $this->language->get('text_loading');
			$data['text_contact_information'] = $this->language->get('text_contact_information');
			$data['text_contact_face'] = $this->language->get('text_contact_face');
			$data['text_telephone'] = $this->language->get('text_telephone');
			$data['place_telephone'] = $this->language->get('place_telephone');
			$data['text_email'] = $this->language->get('text_email');
			$data['text_address'] = $this->language->get('text_address');
			$data['text_comment'] = $this->language->get('text_comment');
			$data['text_continue'] = $this->language->get('text_continue');
			$data['text_pay'] = $this->language->get('text_pay');
			$data['place_email'] = $this->language->get('place_email');
			$data['place_comment'] = $this->language->get('place_comment');

			$data['column_order'] = $this->language->get('column_order');
			$data['column_name'] = $this->language->get('column_name');
			$data['column_model'] = $this->language->get('column_model');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_price'] = $this->language->get('column_price');
			$data['column_total'] = $this->language->get('column_total');

			$data['button_update'] = $this->language->get('button_update');
			$data['button_remove'] = $this->language->get('button_remove');
			$data['button_shopping'] = $this->language->get('button_shopping');
			$data['button_checkout'] = $this->language->get('button_checkout');

			if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
				$data['error_warning'] = $this->language->get('error_stock');
			} elseif (isset($this->session->data['error'])) {
				$data['error_warning'] = $this->session->data['error'];

				unset($this->session->data['error']);
			} else {
				$data['error_warning'] = '';
			}

			if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
				$data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
			} else {
				$data['attention'] = '';
			}

			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];

				unset($this->session->data['success']);
			} else {
				$data['success'] = '';
			}

			$data['action'] = $this->url->link('checkout/cart/edit', '', true);

			if ($this->config->get('config_cart_weight')) {
				$data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
			} else {
				$data['weight'] = '';
			}

			$this->load->model('tool/image');
			$this->load->model('tool/upload');

			$data['products'] = array();

			$products = $this->cart->getProducts();

			foreach ($products as $product) {
				$product_total = 0;

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}

				if ($product['minimum'] > $product_total) {
					$data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
				}

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
				} else {
					$image = '';
				}

				$option_data = array();

				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['value'];
					} else {
						$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

						if ($upload_info) {
							$value = $upload_info['name'];
						} else {
							$value = '';
						}
					}

					if($option['image']) {
						$image = $this->model_tool_image->resize($option['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
					}

					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
				}

				// Display prices
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
					
					$price = $this->currency->format($unit_price, $this->session->data['currency']);
					$total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
				} else {
					$price = false;
					$total = false;
				}

				$recurring = '';

				if ($product['recurring']) {
					$frequencies = array(
						'day'        => $this->language->get('text_day'),
						'week'       => $this->language->get('text_week'),
						'semi_month' => $this->language->get('text_semi_month'),
						'month'      => $this->language->get('text_month'),
						'year'       => $this->language->get('text_year'),
					);

					if ($product['recurring']['trial']) {
						$recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
					}

					if ($product['recurring']['duration']) {
						$recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
					} else {
						$recurring .= sprintf($this->language->get('text_payment_cancel'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
					}
				}

				$data['products'][] = array(
					'cart_id'   => $product['cart_id'],
					'thumb'     => $image,
					'name'      => $product['name'],
					'model'     => $product['model'],
					'option'    => $option_data,
					'recurring' => $recurring,
					'quantity'  => $product['quantity'],
					'stock'     => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
					'reward'    => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
					'price'     => $price,
					'total'     => $total,
					'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);
			}

			// Gift Voucher
			$data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $key => $voucher) {
					$data['vouchers'][] = array(
						'key'         => $key,
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency']),
						'remove'      => $this->url->link('checkout/cart', 'remove=' . $key)
					);
				}
			}

			// Totals
			$this->load->model('extension/extension');

			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;
			
			// Because __call can not keep var references so we put them into an array. 			
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
			
			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$sort_order = array();

				$results = $this->model_extension_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('extension/total/' . $result['code']);
						
						// We have to put the totals in an array so that they pass by reference.
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					}
				}

				$sort_order = array();

				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $totals);
			}

			$data['totals'] = array();

			foreach ($totals as $total) {
				$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
				);
			}

			$data['continue'] = $this->url->link('common/home');

			$data['checkout'] = $this->url->link('checkout/checkout', '', true);

			$data['modules'] = array();
			
			$files = glob(DIR_APPLICATION . '/controller/extension/total/*.php');

			if ($files) {
				foreach ($files as $file) {
					$result = $this->load->controller('extension/total/' . basename($file, '.php'));
					
					if ($result) {
						$data['modules'][] = $result;
					}
				}
			}

			$this->load->model('catalog/information');

			$data['informations'] = array();

			foreach ($this->model_catalog_information->getInformations() as $result) {
				if ($result['bottom']) {
					$data['informations'][] = array(
						'title' => $result['title'],
						'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
					);
				}
			}

			/* Shipping Method */
			$country_id = $this->config->get('config_country_id');
			$zone_id = 0;
			$standart_localisation['country_id'] = $country_id;
			$standart_localisation['zone_id'] = $zone_id;

			// Shipping Methods
			$method_data = array();

			$results = $this->model_extension_extension->getExtensions('shipping');

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/shipping/' . $result['code']);

					$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($standart_localisation);

					if ($quote) {
						$method_data[$result['code']] = array(
							'title'      => $quote['title'],
							'quote'      => $quote['quote'],
							'sort_order' => $quote['sort_order'],
							'error'      => $quote['error']
						);
					}
				}
			}

			$sort_order = array();

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);

			$this->session->data['shipping_methods'] = $method_data;
			
			if (empty($this->session->data['shipping_methods'])) {
				$data['error_warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
			} else {
				$data['error_warning'] = '';
			}

			if (isset($this->session->data['shipping_methods'])) {
				$data['shipping_methods'] = $this->session->data['shipping_methods'];
			} else {
				$data['shipping_methods'] = array();
			}

			if (isset($this->session->data['shipping_method']['code'])) {
				$data['shipping_code'] = $this->session->data['shipping_method']['code'];
			} else {
				$data['shipping_code'] = '';
			}

			/* Shipping Method */
			/* Payment Method */

			// Totals
			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);
					
					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}

			// Payment Methods
			$method_data = array();

			$results = $this->model_extension_extension->getExtensions('payment');

			$recurring = $this->cart->hasRecurringProducts();

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/payment/' . $result['code']);

					$method = $this->{'model_extension_payment_' . $result['code']}->getMethod($standart_localisation, $total);

					if ($method) {
						if ($recurring) {
							if (property_exists($this->{'model_extension_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_extension_payment_' . $result['code']}->recurringPayments()) {
								$method_data[$result['code']] = $method;
							}
						} else {
							$method_data[$result['code']] = $method;
						}
					}
				}
			}

			$sort_order = array();

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);

			$this->session->data['payment_methods'] = $method_data;

			if (empty($this->session->data['payment_methods'])) {
				$data['error_warning'] = sprintf($this->language->get('error_no_payment'), $this->url->link('information/contact'));
			} else {
				$data['error_warning'] = '';
			}

			if (isset($this->session->data['payment_methods'])) {
				$data['payment_methods'] = $this->session->data['payment_methods'];
			} else {
				$data['payment_methods'] = array();
			}

			if (isset($this->session->data['payment_method']['code'])) {
				$data['payment_code'] = $this->session->data['payment_method']['code'];
			} else {
				$data['payment_code'] = '';
			}

			if (isset($this->session->data['comment'])) {
				$data['comment'] = $this->session->data['comment'];
			} else {
				$data['comment'] = '';
			}

			$data['scripts'] = $this->document->getScripts();

			if ($this->config->get('config_checkout_id')) {
				$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

				if ($information_info) {
					$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_checkout_id'), true), $information_info['title'], $information_info['title']);
				} else {
					$data['text_agree'] = '';
				}
			} else {
				$data['text_agree'] = '';
			}

			if (isset($this->session->data['agree'])) {
				$data['agree'] = $this->session->data['agree'];
			} else {
				$data['agree'] = '';
			}

			/* Payment Method */

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('checkout/cart', $data));
		} else {
			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_error'] = $this->language->get('text_empty');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			unset($this->session->data['success']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function add() {
		$this->load->language('checkout/cart');

		$json = array();
		$json['error'] = array();

		if (isset($this->request->post['product_id'])) {
			$product_id = (int)$this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			if (isset($this->request->post['quantity']) && ((int)$this->request->post['quantity'] >= $product_info['minimum'])) {
				$quantity = (int)$this->request->post['quantity'];
			} else {
				$quantity = $product_info['minimum'] ? $product_info['minimum'] : 1;
			}

			if (isset($this->request->post['option'])) {
				$option = array_filter($this->request->post['option']);
			} else {
				$option = array();
			}

			$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);
			$this->load->model('tool/image');

			foreach ($product_options as $product_option) {
				if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
					$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
				}

				if($product_option['product_option_value']  && !empty($option[$product_option['product_option_id']])) {
					foreach($product_option['product_option_value'] as $option_value) {
						if($option_value['image'] && $option_value['product_option_value_id'] == $option[$product_option['product_option_id']]) {
							$json['image'] = $this->model_tool_image->resize($option_value['image'], 130, 90);
						}
					}
				}
			}

			if(!isset($json['image'])) {
				$json['image'] = $this->model_tool_image->resize($product_info['image'], 130, 90);
			}

			if (isset($this->request->post['recurring_id'])) {
				$recurring_id = $this->request->post['recurring_id'];
			} else {
				$recurring_id = 0;
			}

			$recurrings = $this->model_catalog_product->getProfiles($product_info['product_id']);

			if ($recurrings) {
				$recurring_ids = array();

				foreach ($recurrings as $recurring) {
					$recurring_ids[] = $recurring['recurring_id'];
				}

				if (!in_array($recurring_id, $recurring_ids)) {
					$json['error']['recurring'] = $this->language->get('error_recurring_required');
				}
			}

			if (!$json['error']) {
				$this->cart->add($this->request->post['product_id'], $quantity, $option, $recurring_id);

				$json['success'] = true;

				// Unset all shipping and payment methods
				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);

				// Totals
				$this->load->model('extension/extension');

				$totals = array();
				$taxes = $this->cart->getTaxes();
				$total = 0;
		
				// Because __call can not keep var references so we put them into an array. 			
				$total_data = array(
					'totals' => &$totals,
					'taxes'  => &$taxes,
					'total'  => &$total
				);

				// Display prices
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$sort_order = array();

					$results = $this->model_extension_extension->getExtensions('total');

					foreach ($results as $key => $value) {
						$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
					}

					array_multisort($sort_order, SORT_ASC, $results);

					foreach ($results as $result) {
						if ($this->config->get($result['code'] . '_status')) {
							$this->load->model('extension/total/' . $result['code']);

							// We have to put the totals in an array so that they pass by reference.
							$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
						}
					}

					$sort_order = array();

					foreach ($totals as $key => $value) {
						$sort_order[$key] = $value['sort_order'];
					}

					array_multisort($sort_order, SORT_ASC, $totals);
				}

				$json['total'] = $this->cart->countProducts();
			} else {
				$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function edit() {
		$this->load->language('checkout/cart');

		$json = array();

		// Update
		if (!empty($this->request->post['quantity'])) {
			foreach ($this->request->post['quantity'] as $key => $value) {
				$this->cart->update($key, $value);
			}

			$this->session->data['success'] = $this->language->get('text_remove');

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['reward']);

			if(!isset($this->request->get['type']) && $this->request->get['type'] != 'ajax') {
				$this->response->redirect($this->url->link('checkout/cart'));
			} else {
				$json['success'] = true;
				$json['total'] = $this->cart->countProducts();
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function remove() {
		$this->load->language('checkout/cart');

		$json = array();

		// Remove
		if (isset($this->request->post['key'])) {
			$this->cart->remove($this->request->post['key']);

			unset($this->session->data['vouchers'][$this->request->post['key']]);

			$json['success'] = true;

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['reward']);

			// Totals
			$this->load->model('extension/extension');

			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array. 			
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$sort_order = array();

				$results = $this->model_extension_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('extension/total/' . $result['code']);

						// We have to put the totals in an array so that they pass by reference.
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					}
				}

				$sort_order = array();

				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $totals);
			}

			$json['total'] = $this->cart->countProducts();
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function checkout() {
		$json = array();

		$this->load->language('checkout/checkout');

		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$json['redirect'] = $this->url->link('checkout/cart');
		}

		if (!$json) {
			if (!empty(trim($this->request->post['customer_full_name']))) {
				$customer_name = explode(' ', $this->request->post['customer_full_name']);
				if((empty($customer_name[0]) || utf8_strlen($customer_name[0]) < 2) || (empty($customer_name[1]) || utf8_strlen($customer_name[1]) < 2) || (empty($customer_name[2]) || utf8_strlen($customer_name[2]) < 2)) {
					$json['error']['customer_full_name'] = $this->language->get('error_customer_full_name');
				}
			} else {
				$json['error']['customer_full_name'] = $this->language->get('error_customer_full_name');
			}

			if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
				$json['error']['telephone'] = $this->language->get('error_telephone');
			}

			if ($this->request->post['need_address'] && ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128))) {
				$json['error']['address_1'] = $this->language->get('error_address_1');
			}

			// Customer Group
			if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
				$customer_group_id = $this->request->post['customer_group_id'];
			} else {
				$customer_group_id = $this->config->get('config_customer_group_id');
			}

			// Custom field validation
			$this->load->model('account/custom_field');

			$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

			foreach ($custom_fields as $custom_field) {
				if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
					$json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
				} elseif (($custom_field['type'] == 'text') && !empty($custom_field['validation']) && !filter_var($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']], FILTER_VALIDATE_REGEXP, array('options' => array('regexp' => $custom_field['validation'])))) {
                    $json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
                }
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('guest', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error']['captcha'] = $captcha;
				}
			}

			$this->session->data['guest'] = 'guest';

			/* Shipping Method */

			if (!isset($this->request->post['shipping_method'])) {
				$json['error']['warning'] = $this->language->get('error_shipping');
			} else {
				$shipping = explode('.', $this->request->post['shipping_method']);

				if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
					$json['error']['warning'] = $this->language->get('error_shipping');
				}
			}

			if (!$json) {
				$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
			}

			/* Shipping Method */
			/* Payment Method */

			if (!isset($this->request->post['payment_method'])) {
				$json['error']['warning'] = $this->language->get('error_payment');
			} elseif (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
				$json['error']['warning'] = $this->language->get('error_payment');
			}

			if ($this->config->get('config_checkout_id')) {
				$this->load->model('catalog/information');

				$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

				if ($information_info && !isset($this->request->post['agree'])) {
					$json['error']['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
				}
			}

			if (!$json) {
				$this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];

				$this->session->data['comment'] = strip_tags($this->request->post['comment']);
			}

			/* Payment Method */
			/* Confirm */
			if(!$json) {

				$this->load->model('extension/extension');

				$country_id = $this->config->get('config_country_id');
				$zone_id = 0;

				$order_data = array();

				$totals = array();
				$taxes = $this->cart->getTaxes();
				$total = 0;

				// Because __call can not keep var references so we put them into an array.
				$total_data = array(
					'totals' => &$totals,
					'taxes'  => &$taxes,
					'total'  => &$total
				);

				$sort_order = array();

				$results = $this->model_extension_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('extension/total/' . $result['code']);

						// We have to put the totals in an array so that they pass by reference.
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					}
				}

				$sort_order = array();

				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $totals);

				$order_data['totals'] = $totals;

				$this->load->language('checkout/checkout');

				$order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
				$order_data['store_id'] = $this->config->get('config_store_id');
				$order_data['store_name'] = $this->config->get('config_name');

				if ($order_data['store_id']) {
					$order_data['store_url'] = $this->config->get('config_url');
				} else {
					if ($this->request->server['HTTPS']) {
						$order_data['store_url'] = HTTPS_SERVER;
					} else {
						$order_data['store_url'] = HTTP_SERVER;
					}
				}

				if ($this->customer->isLogged()) {
					$this->load->model('account/customer');

					$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

					$order_data['customer_id'] = $this->customer->getId();
					$order_data['customer_group_id'] = $customer_info['customer_group_id'];
					$order_data['firstname'] = $customer_info['firstname'];
					$order_data['lastname'] = $customer_info['lastname'];
					$order_data['email'] = $customer_info['email'];
					$order_data['telephone'] = $customer_info['telephone'];
					$order_data['fax'] = $customer_info['fax'];
					$order_data['custom_field'] = json_decode($customer_info['custom_field'], true);
				} elseif (isset($this->session->data['guest'])) {
					$order_data['customer_id'] = 0;
					$order_data['customer_group_id'] = $customer_group_id;
					$order_data['firstname'] = !empty($customer_name[0]) ? $customer_name[0] : '';
					$order_data['lastname'] = !empty($customer_name[1]) ? $customer_name[1] : '';
					$order_data['middlename'] = !empty($customer_name[2]) ? $customer_name[2] : '';
					$order_data['email'] = $this->request->post['email'];
					$order_data['telephone'] = $this->request->post['telephone'];
					$order_data['fax'] = '';
					$order_data['custom_field'] = '';
				}

				$order_data['payment_firstname'] = !empty($customer_name[0]) ? $customer_name[0] : '';
				$order_data['payment_lastname'] = !empty($customer_name[1]) ? $customer_name[1] : '';
				$order_data['payment_middlename'] = !empty($customer_name[2]) ? $customer_name[2] : '';
				$order_data['payment_company'] = '';
				$order_data['payment_address_1'] = $this->request->post['address_1'];
				$order_data['payment_address_2'] = '';
				$order_data['payment_city'] = '';
				$order_data['payment_postcode'] = '';
				$order_data['payment_zone'] = '';
				$order_data['payment_zone_id'] = $zone_id;
				$order_data['payment_country'] = '';
				$order_data['payment_country_id'] = $country_id;
				$order_data['payment_address_format'] = '';
				$order_data['payment_custom_field'] = (isset($this->session->data['payment_address']['custom_field']) ? $this->session->data['payment_address']['custom_field'] : array());

				if (isset($this->session->data['payment_method']['title'])) {
					$order_data['payment_method'] = $this->session->data['payment_method']['title'];
				} else {
					$order_data['payment_method'] = '';
				}

				if (isset($this->session->data['payment_method']['code'])) {
					$order_data['payment_code'] = $this->session->data['payment_method']['code'];
				} else {
					$order_data['payment_code'] = '';
				}

				if ($this->cart->hasShipping()) {
					$order_data['shipping_firstname'] = !empty($customer_name[0]) ? $customer_name[0] : '';
					$order_data['shipping_lastname'] = !empty($customer_name[1]) ? $customer_name[1] : '';
					$order_data['shipping_middlename'] = !empty($customer_name[2]) ? $customer_name[2] : '';
					$order_data['shipping_company'] = '';
					$order_data['shipping_address_1'] = $this->request->post['address_1'];
					$order_data['shipping_address_2'] = '';
					$order_data['shipping_city'] = '';
					$order_data['shipping_postcode'] = '';
					$order_data['shipping_zone'] = '';
					$order_data['shipping_zone_id'] = $zone_id;
					$order_data['shipping_country'] = '';
					$order_data['shipping_country_id'] = $country_id;
					$order_data['shipping_address_format'] = '';
					$order_data['shipping_custom_field'] = (isset($this->session->data['shipping_address']['custom_field']) ? $this->session->data['shipping_address']['custom_field'] : array());

					if (isset($this->session->data['shipping_method']['title'])) {
						$order_data['shipping_method'] = $this->session->data['shipping_method']['title'];
					} else {
						$order_data['shipping_method'] = '';
					}

					if (isset($this->session->data['shipping_method']['code'])) {
						$order_data['shipping_code'] = $this->session->data['shipping_method']['code'];
					} else {
						$order_data['shipping_code'] = '';
					}
				} else {
					$order_data['shipping_firstname'] = '';
					$order_data['shipping_lastname'] = '';
					$order_data['shipping_company'] = '';
					$order_data['shipping_address_1'] = '';
					$order_data['shipping_address_2'] = '';
					$order_data['shipping_city'] = '';
					$order_data['shipping_postcode'] = '';
					$order_data['shipping_zone'] = '';
					$order_data['shipping_zone_id'] = '';
					$order_data['shipping_country'] = '';
					$order_data['shipping_country_id'] = '';
					$order_data['shipping_address_format'] = '';
					$order_data['shipping_custom_field'] = array();
					$order_data['shipping_method'] = '';
					$order_data['shipping_code'] = '';
				}

				$order_data['products'] = array();

				foreach ($this->cart->getProducts() as $product) {
					$option_data = array();

					foreach ($product['option'] as $option) {
						$option_data[] = array(
							'product_option_id'       => $option['product_option_id'],
							'product_option_value_id' => $option['product_option_value_id'],
							'option_id'               => $option['option_id'],
							'option_value_id'         => $option['option_value_id'],
							'name'                    => $option['name'],
							'value'                   => $option['value'],
							'type'                    => $option['type']
						);
					}

					$order_data['products'][] = array(
						'product_id' => $product['product_id'],
						'name'       => $product['name'],
						'model'      => $product['model'],
						'option'     => $option_data,
						'download'   => $product['download'],
						'quantity'   => $product['quantity'],
						'subtract'   => $product['subtract'],
						'price'      => $product['price'],
						'total'      => $product['total'],
						'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
						'reward'     => $product['reward']
					);
				}

				// Gift Voucher
				$order_data['vouchers'] = array();

				if (!empty($this->session->data['vouchers'])) {
					foreach ($this->session->data['vouchers'] as $voucher) {
						$order_data['vouchers'][] = array(
							'description'      => $voucher['description'],
							'code'             => token(10),
							'to_name'          => $voucher['to_name'],
							'to_email'         => $voucher['to_email'],
							'from_name'        => $voucher['from_name'],
							'from_email'       => $voucher['from_email'],
							'voucher_theme_id' => $voucher['voucher_theme_id'],
							'message'          => $voucher['message'],
							'amount'           => $voucher['amount']
						);
					}
				}

				$order_data['comment'] = $this->session->data['comment'];
				$order_data['total'] = $total_data['total'];

				if (isset($this->request->cookie['tracking'])) {
					$order_data['tracking'] = $this->request->cookie['tracking'];

					$subtotal = $this->cart->getSubTotal();

					// Affiliate
					$this->load->model('affiliate/affiliate');

					$affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);

					if ($affiliate_info) {
						$order_data['affiliate_id'] = $affiliate_info['affiliate_id'];
						$order_data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
					} else {
						$order_data['affiliate_id'] = 0;
						$order_data['commission'] = 0;
					}

					// Marketing
					$this->load->model('checkout/marketing');

					$marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

					if ($marketing_info) {
						$order_data['marketing_id'] = $marketing_info['marketing_id'];
					} else {
						$order_data['marketing_id'] = 0;
					}
				} else {
					$order_data['affiliate_id'] = 0;
					$order_data['commission'] = 0;
					$order_data['marketing_id'] = 0;
					$order_data['tracking'] = '';
				}

				$order_data['language_id'] = $this->config->get('config_language_id');
				$order_data['currency_id'] = $this->currency->getId($this->session->data['currency']);
				$order_data['currency_code'] = $this->session->data['currency'];
				$order_data['currency_value'] = $this->currency->getValue($this->session->data['currency']);
				$order_data['ip'] = $this->request->server['REMOTE_ADDR'];

				if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
					$order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
				} elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
					$order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
				} else {
					$order_data['forwarded_ip'] = '';
				}

				if (isset($this->request->server['HTTP_USER_AGENT'])) {
					$order_data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
				} else {
					$order_data['user_agent'] = '';
				}

				if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
					$order_data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
				} else {
					$order_data['accept_language'] = '';
				}

				$this->load->model('checkout/order');

				$this->session->data['order_id'] = $this->model_checkout_order->addOrder($order_data);

				$data['text_recurring_item'] = $this->language->get('text_recurring_item');
				$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');

				$data['column_name'] = $this->language->get('column_name');
				$data['column_model'] = $this->language->get('column_model');
				$data['column_quantity'] = $this->language->get('column_quantity');
				$data['column_price'] = $this->language->get('column_price');
				$data['column_total'] = $this->language->get('column_total');

				$this->load->model('tool/upload');

				$data['products'] = array();

				foreach ($this->cart->getProducts() as $product) {
					$option_data = array();

					foreach ($product['option'] as $option) {
						if ($option['type'] != 'file') {
							$value = $option['value'];
						} else {
							$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

							if ($upload_info) {
								$value = $upload_info['name'];
							} else {
								$value = '';
							}
						}

						$option_data[] = array(
							'name'  => $option['name'],
							'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
						);
					}

					$recurring = '';

					if ($product['recurring']) {
						$frequencies = array(
							'day'        => $this->language->get('text_day'),
							'week'       => $this->language->get('text_week'),
							'semi_month' => $this->language->get('text_semi_month'),
							'month'      => $this->language->get('text_month'),
							'year'       => $this->language->get('text_year'),
						);

						if ($product['recurring']['trial']) {
							$recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
						}

						if ($product['recurring']['duration']) {
							$recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
						} else {
							$recurring .= sprintf($this->language->get('text_payment_cancel'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
						}
					}

					$data['products'][] = array(
						'cart_id'    => $product['cart_id'],
						'product_id' => $product['product_id'],
						'name'       => $product['name'],
						'model'      => $product['model'],
						'option'     => $option_data,
						'recurring'  => $recurring,
						'quantity'   => $product['quantity'],
						'subtract'   => $product['subtract'],
						'price'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']),
						'total'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'], $this->session->data['currency']),
						'href'       => $this->url->link('product/product', 'product_id=' . $product['product_id'])
					);
				}

				// Gift Voucher
				$data['vouchers'] = array();

				if (!empty($this->session->data['vouchers'])) {
					foreach ($this->session->data['vouchers'] as $voucher) {
						$data['vouchers'][] = array(
							'description' => $voucher['description'],
							'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency'])
						);
					}
				}

				$data['totals'] = array();

				foreach ($order_data['totals'] as $total) {
					$data['totals'][] = array(
						'title' => $total['title'],
						'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
					);
				}

				$json['success'] = $this->url->link('extension/payment/' . $this->session->data['payment_method']['code']);

				/* Confirm */
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
