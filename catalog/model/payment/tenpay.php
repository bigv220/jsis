<?php 
class ModelPaymentTenpay extends Model {
  	public function getMethod($address) {
		if ($this->config->get('tenpay_status')) {
		$method_data = array();
}
?>