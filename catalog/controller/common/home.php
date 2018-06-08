<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
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

		if($this->config->get('config_secure')) {
			$server = HTTPS_SERVER;
		} else {
			$server = HTTP_SERVER;
		}

		$pattern = array('/{base}/', '/{email}/', '/{telephone}/', '/{peoples}/', '/{city_name}/', '/{city_name_2}/', '/{city_name_3}/', '/{region_name}/', '/{region_name_2}/', '/{region_name_3}/');

		$replacement = array($server, $this->config->get('config_email'), $this->config->get('config_telephone'), $this->config->get('config_peoples'), $this->config->get('config_city_name'), $this->config->get('config_city_name_2'), $this->config->get('config_city_name_3'), $this->config->get('config_region_name'), $this->config->get('config_region_name_2'), $this->config->get('config_region_name_3'));

		$this->load->model('catalog/home_design');
		$design = $this->model_catalog_home_design->getDesign();

		$data['h_block_1'] = preg_replace($pattern, $replacement, $design['h_block_1']);
		$data['html_block_1'] = html_entity_decode(preg_replace($pattern, $replacement, $design['html_block_1']));
		$data['image_block_1'] = $server . 'image/' . $design['image_block_1'];
		$data['h_block_2'] = preg_replace($pattern, $replacement, $design['h_block_2']);
		$data['html_block_2'] = html_entity_decode(preg_replace($pattern, $replacement, $design['html_block_2']));
		$data['image_block_2_1'] = $server . 'image/' . $design['image_block_2_1'];
		$data['image_block_2_2'] = $server . 'image/' . $design['image_block_2_2'];
		$data['image_block_2_3'] = $server . 'image/' . $design['image_block_2_3'];
		$data['h_block_3'] = preg_replace($pattern, $replacement, $design['h_block_3']);
		$data['html_block_3'] = html_entity_decode(preg_replace($pattern, $replacement, $design['html_block_3']));
		$data['image_block_3'] = $server . 'image/' . $design['image_block_3'];

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
