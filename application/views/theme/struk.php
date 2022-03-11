<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<!-- <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,300;0,500;0,700;1,300;1,500;1,700&display=swap" rel="stylesheet"> -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	<link rel="stylesheet" type="text/css" media="print" href="<?= base_url('assets/css/print.css'); ?>">
	<link rel="stylesheet" type="text/css" href="<?= base_url('assets/css/debug_print.css'); ?>">
	<title>Print Struk — <?= $sales_number; ?></title>
</head>
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

<body>
	<div>
		<p>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?= $arr_company->row()->company_name; ?><br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?= $arr_company->row()->phone; ?><br />
			<?= $arr_company->row()->address; ?>
		</p>
		--------------------------------
		<p>
			<?= $tgl_obj->format('d-m-Y H:i') ?><br />
			<?= $arr_sales->row()->sales_number; ?><br />
			<?= $arr_sales->row()->fullname; ?><br />
			<?= $metode_pembayaran; ?><br />
			<?php if ($arr_sales->row()->payment_type != 1) {
				echo $arr_sales->row()->bank_name . " " . $arr_sales->row()->card_number . "<br/>";
			}
			?>
		</p>
		--------------------------------
		<?php foreach ($arr_sales_det->result() as $key) { ?>
			<p><?= $key->item_name; ?></p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<?= $key->qty; ?> <?= $key->unit_name; ?>) - <?= number_format($key->subtotal, 0, ',', '.'); ?></p>
		<?php } ?>
		--------------------------------
		Total <?= number_format($arr_sales->row()->total_transaction, 0, ',', '.'); ?><br />
		Bayar <?= number_format($arr_sales->row()->payment, 0, ',', '.'); ?><br />
		Kembalian <?= number_format($arr_sales->row()->exchange, 0, ',', '.'); ?><br />
		--------------------------------
		<p><?= $arr_company->row()->sales_notes; ?></p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
	</div>
</body>

</html>
