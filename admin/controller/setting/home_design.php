<?php
class ControllerSettingHomeDesign extends Controller {
	public function index() {
		$this->load->language('setting/home_design');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/home_design');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['text_block_1'] = $this->language->get('text_block_1');
		$data['text_block_2'] = $this->language->get('text_block_2');
		$data['text_block_3'] = $this->language->get('text_block_3');
		$data['entry_block_h'] = $this->language->get('entry_block_h');
		$data['entry_block_html'] = $this->language->get('entry_block_html');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('setting/home_design', 'token=' . $this->session->data['token'], true)
		);

		$data['cancel'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true);
		$data['action'] = $this->url->link('setting/home_design', 'token=' . $this->session->data['token'], true);

		$this->load->model('setting/home_design');
		$this->load->model('tool/image');

		$design = $this->model_setting_home_design->getDesign();

		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$this->model_setting_home_design->editDesign($this->request->post);
			$this->response->redirect($this->url->link('setting/home_design', 'token=' . $this->session->data['token'], true));
		}

		if (isset($this->request->post['h_block_1'])) {
			$data['h_block_1'] = $this->request->post['h_block_1'];
		} elseif (!empty($design)) {
			$data['h_block_1'] = $design['h_block_1'];
		} else {
			$data['h_block_1'] = '';
		}

		if (isset($this->request->post['html_block_1'])) {
			$data['html_block_1'] = $this->request->post['html_block_1'];
		} elseif (!empty($design)) {
			$data['html_block_1'] = html_entity_decode($design['html_block_1']);
		} else {
			$data['html_block_1'] = '';
		}

		if (isset($this->request->post['image_block_1']) && is_file(DIR_IMAGE . $this->request->post['image_block_1'])) {
			$data['thumb_block_1'] = $this->model_tool_image->resize($this->request->post['image_block_1'], 100, 100);
		} elseif (!empty($design) && is_file(DIR_IMAGE . $design['image_block_1'])) {
			$data['thumb_block_1'] = $this->model_tool_image->resize($design['image_block_1'], 100, 100);
		} else {
			$data['thumb_block_1'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['image_block_1'])) {
			$data['image_block_1'] = $this->request->post['image_block_1'];
		} elseif (!empty($design)) {
			$data['image_block_1'] = $design['image_block_1'];
		} else {
			$data['image_block_1'] = '';
		}

		if (isset($this->request->post['h_block_2'])) {
			$data['h_block_2'] = $this->request->post['h_block_2'];
		} elseif (!empty($design)) {
			$data['h_block_2'] = $design['h_block_2'];
		} else {
			$data['h_block_2'] = '';
		}

		if (isset($this->request->post['html_block_2'])) {
			$data['html_block_2'] = $this->request->post['html_block_2'];
		} elseif (!empty($design)) {
			$data['html_block_2'] = html_entity_decode($design['html_block_2']);
		} else {
			$data['html_block_2'] = '';
		}

		if (isset($this->request->post['image_block_2_1']) && is_file(DIR_IMAGE . $this->request->post['image_block_2_1'])) {
			$data['thumb_block_2_1'] = $this->model_tool_image->resize($this->request->post['image_block_2_1'], 100, 100);
		} elseif (!empty($design) && is_file(DIR_IMAGE . $design['image_block_2_1'])) {
			$data['thumb_block_2_1'] = $this->model_tool_image->resize($design['image_block_2_1'], 100, 100);
		} else {
			$data['thumb_block_2_1'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['image_block_2_2']) && is_file(DIR_IMAGE . $this->request->post['image_block_2_2'])) {
			$data['thumb_block_2_2'] = $this->model_tool_image->resize($this->request->post['image_block_2_2'], 100, 100);
		} elseif (!empty($design) && is_file(DIR_IMAGE . $design['image_block_2_2'])) {
			$data['thumb_block_2_2'] = $this->model_tool_image->resize($design['image_block_2_2'], 100, 100);
		} else {
			$data['thumb_block_2_2'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['image_block_2_3']) && is_file(DIR_IMAGE . $this->request->post['image_block_2_3'])) {
			$data['thumb_block_2_3'] = $this->model_tool_image->resize($this->request->post['image_block_2_3'], 100, 100);
		} elseif (!empty($design) && is_file(DIR_IMAGE . $design['image_block_2_3'])) {
			$data['thumb_block_2_3'] = $this->model_tool_image->resize($design['image_block_2_3'], 100, 100);
		} else {
			$data['thumb_block_2_3'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['image_block_2_1'])) {
			$data['image_block_2_1'] = $this->request->post['image_block_2_1'];
		} elseif (!empty($design)) {
			$data['image_block_2_1'] = $design['image_block_2_1'];
		} else {
			$data['image_block_2_1'] = '';
		}

		if (isset($this->request->post['image_block_2_2'])) {
			$data['image_block_2_2'] = $this->request->post['image_block_2_2'];
		} elseif (!empty($design)) {
			$data['image_block_2_2'] = $design['image_block_2_2'];
		} else {
			$data['image_block_2_2'] = '';
		}

		if (isset($this->request->post['image_block_2_3'])) {
			$data['image_block_2_3'] = $this->request->post['image_block_2_3'];
		} elseif (!empty($design)) {
			$data['image_block_2_3'] = $design['image_block_2_3'];
		} else {
			$data['image_block_2_3'] = '';
		}

		if (isset($this->request->post['h_block_3'])) {
			$data['h_block_3'] = $this->request->post['h_block_3'];
		} elseif (!empty($design)) {
			$data['h_block_3'] = $design['h_block_3'];
		} else {
			$data['h_block_3'] = '';
		}

		if (isset($this->request->post['html_block_3'])) {
			$data['html_block_3'] = $this->request->post['html_block_3'];
		} elseif (!empty($design)) {
			$data['html_block_3'] = html_entity_decode($design['html_block_3']);
		} else {
			$data['html_block_3'] = '';
		}

		if (isset($this->request->post['image_block_3']) && is_file(DIR_IMAGE . $this->request->post['image_block_3'])) {
			$data['thumb_block_3'] = $this->model_tool_image->resize($this->request->post['image_block_3'], 100, 100);
		} elseif (!empty($design) && is_file(DIR_IMAGE . $design['image_block_3'])) {
			$data['thumb_block_3'] = $this->model_tool_image->resize($design['image_block_3'], 100, 100);
		} else {
			$data['thumb_block_3'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['image_block_3'])) {
			$data['image_block_3'] = $this->request->post['image_block_3'];
		} elseif (!empty($design)) {
			$data['image_block_3'] = $design['image_block_3'];
		} else {
			$data['image_block_3'] = '';
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);



		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('setting/home_design', $data));
	}
}