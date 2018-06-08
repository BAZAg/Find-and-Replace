<?php
class ModelCatalogHomeDesign extends Model {
	public function getDesign() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "home_design");
		return $query->row;
	}
}