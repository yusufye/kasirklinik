<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" media="print" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" media="print" href="<?= base_url('assets/css/print.css'); ?>">

<?php
$tgl_obj = new DateTime($arr_sales->row()->created_date);
if ($arr_sales->row()->payment_type == 1) {
	$metode_pembayaran = "TUNAI";
} elseif ($arr_sales->row()->payment_type == 2) {
	$metode_pembayaran = "DEBIT";
} elseif ($arr_sales->row()->payment_type == 1) {
	$metode_pembayaran = "KREDIT";
} elseif ($arr_sales->row()->payment_type == 1) {
	$metode_pembayaran = "TRANSFER";
}
?>
<h1><?= $arr_company->row()->company_name; ?></h1>
<div class="row">
	<div class="col-12">
		<!-- <img src="<?= base_url('assets/img/logo swr frozen food.jpeg'); ?>" class="grayscale logo" style="height: 2cm;" /> -->
		<!-- <p><?= $arr_company->row()->company_name; ?></p> -->
		<!-- <p class="text-center"><?= $arr_company->row()->phone; ?></p> -->
		<!-- <p class="text-center"><?= $arr_company->row()->address; ?></p> -->
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<script>
	window.print()
</script>
