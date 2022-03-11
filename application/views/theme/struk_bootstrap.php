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
<style>
	@page {
		margin: 0mm;
	}

	* {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 14px;
	}

	.h1 {
		font-size: 18px;
		font-weight: 300;
	}

	.h5 {
		font-size: 12px;
		font-weight: 300;
	}

	.h6 {
		font-size: 10px;
		font-weight: 300;
	}

	.h7 {
		font-size: 8px;
		font-weight: 300;
	}

	table {
		width: 100%;
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	}

	table tr th {
		font-size: 10px;
	}

	table.keranjang tbody tr th {
		font-size: 10px;
		padding: 5px;
	}

	.no-border {
		border: 0px solid black;
	}

	.text-left {
		text-align: left;
	}

	.text-center {
		text-align: center;
	}

	.text-right {
		text-align: right;
	}
</style>
<div class="text-center">
	<div class="h1"><?= $arr_company->row()->company_name; ?></div>
	<div class="h7"><?= $arr_company->row()->address; ?></div>
	<div class="h6">
		<?= $arr_company->row()->phone; ?>
		<hr />
	</div>
	<div class="h6 text-left"><?= $tgl_obj->format('d-m-Y H:i') ?></div>
	<table class="no-border">
		<tr>
			<th class="text-left" style="width: 50%;"><?= $arr_sales->row()->sales_number; ?></th>
			<th class="text-right" style="width: 50%;"><?= $arr_sales->row()->fullname; ?></th>
		</tr>
		<tr>
			<th class="text-left"><?= $metode_pembayaran; ?></th>
			<th class="text-right">
				<?php if ($arr_sales->row()->payment_type != 1) {
					echo $arr_sales->row()->bank_name . " " . $arr_sales->row()->card_number;
				}
				?>
			</th>
		</tr>
	</table>
	<hr />
	<table class="keranjang" style="border: 1px solid black">
		<?php foreach ($arr_sales_det->result() as $key) { ?>
			<tr>
				<th class="text-left"><?= $key->item_name; ?> - <?= $key->qty; ?> <?= $key->unit_name; ?></th>
				<th class="text-right" style="vertical-align: top;"><?= number_format($key->subtotal, 0, ',', '.'); ?></th>
			</tr>
		<?php } ?>
	</table>
	<hr />
	<table class="no-border">
		<tr>
			<th class="text-left">Total</th>
			<th class="text-right"><?= number_format($arr_sales->row()->total_transaction, 0, ',', '.'); ?></th>
		</tr>
		<tr>
			<th class="text-left">Bayar</th>
			<th class="text-right"><?= number_format($arr_sales->row()->payment, 0, ',', '.'); ?></th>
		</tr>
		<tr>
			<th class="text-left">Kembalian</th>
			<th class="text-right"><?= number_format($arr_sales->row()->exchange, 0, ',', '.'); ?></th>
		</tr>
	</table>
	<hr />
	<div class="h6"><?= $arr_company->row()->sales_notes; ?></div>
	<br />.
</div>

<script>
	window.print()

	window.onafterprint = function() {
		// window.close()
	}
</script>
