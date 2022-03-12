<?php
$tgl_obj = new DateTime($arr_sales->row()->created_date);
if ($arr_sales->row()->payment_type == 1) {
	$metode_pembayaran = "TUNAI";
} elseif ($arr_sales->row()->payment_type == 2) {
	$metode_pembayaran = "DEBIT";
} elseif ($arr_sales->row()->payment_type == 3) {
	$metode_pembayaran = "KREDIT";
} elseif ($arr_sales->row()->payment_type == 4) {
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

	.h8 {
		font-size: 6px;
		font-weight: 200;
	}

	table {
		width: 100%;
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	}

	table tr th {
		font-size: 8px;
	}

	table.keranjang tbody tr th {
		font-size: 8px;
		padding: 2px;
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
	<div class="h5"><?= $arr_company->row()->company_name; ?></div>
	<div class="h8"><?= $arr_company->row()->address; ?></div>
	<div class="h8">
		<?= $arr_company->row()->phone; ?>
		<hr />
	</div>
	<div class="h8 text-center"><?= $tgl_obj->format('d-m-Y H:i') ?></div>
	<table class="no-border">
		<tr>
			<th class="text-center h8"><?= $arr_sales->row()->sales_number; ?></th>
		</tr>
		<tr>
			<th class="text-center h8"><?= $arr_sales->row()->fullname; ?></th>
		</tr>
		<tr>
			<th class="text-center h8"><?= $metode_pembayaran; ?></th>
		</tr>
		<tr>
			<th class="text-center h8">
				<?php if ($arr_sales->row()->payment_type != 1) {
					echo $arr_sales->row()->bank_name . "<br />" . $arr_sales->row()->card_number;
				}
				?>
			</th>
		</tr>
	</table>
	<hr />
	<table class="keranjang" style="border: 1px solid black">
		<?php
		$no = 1;
		foreach ($arr_sales_det->result() as $key) {
		?>
			<tr>
				<th class="text-left">
					<?= $no++; ?>. <?= $key->item_name; ?><br /><span class="h8"><?= $key->qty; ?> <?= $key->unit_name; ?></span>
				</th>
				<th class="text-right" style="vertical-align: top;"><?= number_format($key->subtotal, 0, ',', '.'); ?></th>
			</tr>
		<?php } ?>
	</table>
	<hr />
	<table class="no-border">
		<tr>
			<th class="text-left h7">Total</th>
			<th class="text-right h7"><?= number_format($arr_sales->row()->total_transaction, 0, ',', '.'); ?></th>
		</tr>
		<tr>
			<th class="text-left h7">Bayar</th>
			<th class="text-right h7"><?= number_format($arr_sales->row()->payment, 0, ',', '.'); ?></th>
		</tr>
		<tr>
			<th class="text-left h7">Kembalian</th>
			<th class="text-right h7"><?= number_format($arr_sales->row()->exchange, 0, ',', '.'); ?></th>
		</tr>
	</table>
	<hr />
	<div class="h8"><?= $arr_company->row()->sales_notes; ?></div>
	<br />.
</div>

<script>
	window.print()

	window.onafterprint = function() {
		// window.close()
	}
</script>
