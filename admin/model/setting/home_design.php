<?php 
class ModelSettingHomeDesign extends Model {
	public function getDesign() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "home_design");
		return $query->row;
	}

	public function editDesign($data) {
		$this->db->query("TRUNCATE TABLE " . DB_PREFIX . "home_design");
		$this->db->query("INSERT INTO " . DB_PREFIX . "home_design SET h_block_1 = '" . $data['h_block_1'] . "', html_block_1 = '" . $data['html_block_1'] . "', image_block_1 = '" . $data['image_block_1'] . "', h_block_2 = '" . $data['h_block_2'] . "', html_block_2 = '" . $data['html_block_2'] . "', image_block_2_1 = '" . $data['image_block_2_1'] . "', image_block_2_2 = '" . $data['image_block_2_2'] . "', image_block_2_3 = '" . $data['image_block_2_3'] . "', h_block_3 = '" . $data['h_block_3'] . "', html_block_3 = '" . $data['html_block_3'] . "', image_block_3 = '" . $data['image_block_3'] . "'");
	}
}