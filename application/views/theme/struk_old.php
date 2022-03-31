<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
</head>

<body onload="window.print();">
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
	<div style="font-size:6px; font-family:'Verdana'; width:100%;">
		<label style="font-size:8px; display:block; width:x; height:y; text-align:center;"><strong><?= $arr_company->row()->company_name; ?></strong></label>
		<p style="text-align:center;"><strong><?= $arr_company->row()->address; ?></strong></p>
		<br>
		<br>
		<table style="width:100%">
			<tr>
				<td style="width:50%"><?= $arr_sales->row()->sales_number; ?></td>
				<td style="width:50%; text-align:right;"><?= $tgl_obj->format('d-m-Y H:i') ?></td>
			</tr>
			<tr>
				<td style="width:50%; vertical-align: top;">
					Pembayaran : <?= $metode_pembayaran; ?>
					<?php if ($arr_sales->row()->payment_type != 1) { ?>
						<br />Bank: <?= $arr_sales->row()->bank_name; ?>
						<br />No Kartu: <?= $arr_sales->row()->card_number; ?>
					<?php } ?>
				</td>
				<td style="width:50%; text-align:right; vertical-align: top;">Kasir : <?= $arr_sales->row()->fullname; ?></td>
			</tr>
		</table>
		<br>
		<table cellpadding="0" style="width:100%;">
			<tr>
				<td colspan="5" style="border:1px solid;"></td>
			</tr>
			<tr>
				<th style="width:6%; text-align:left;">#</th>
				<th style="width:43%; text-align:left;">ITEM</th>
				<th style="width:10%; text-align:right;">QTY</th>
				<th style="width:19%; text-align:right;">HARGA</th>
				<th style="width:22%; text-align:right;">TOTAL</th>
			</tr>
			<tr>
				<td colspan="5" style="border:1px solid;"></td>
			</tr>
			<?php
			$no = 1;
			foreach ($arr_sales_det->result() as $key) :
			?>
				<tr>
					<td style="width:6%; vertical-align: top;">
						<small><?= $no++; ?></small>
					</td>
					<td style="width:43%; vertical-align: top;">
						<small><?= $key->item_name; ?></small>
					</td>
					<td style="width:10%; text-align:right; vertical-align: top;">
						<?= $key->qty; ?> <?= $key->unit_name; ?>
					</td>
					<td style="width:19%; text-align:right; vertical-align: top;">
						<?= number_format($key->price, 0, ',', '.'); ?>
					</td>
					<td style="width:22%; text-align:right; vertical-align: top;">
						<?= number_format($key->subtotal, 0, ',', '.'); ?>
					</td>
				</tr>
			<?php endforeach; ?>
			<tr>
				<td colspan="5" style="border:1px solid;"></td>
			</tr>
		</table>
		<table style="width:100%">
			<tr>
				<td style="width:75%; text-align:right;">TOTAL</td>
				<td style="width:3%; text-align:right;"> : </td>
				<td style="width:22%; text-align:right;"><?= number_format($arr_sales->row()->total_price, 0, ',', '.'); ?></td>
			</tr>
			<tr>
				<td style="width:75%; text-align:right;">DISCOUNT</td>
				<td style="width:3%; text-align:right;"> : </td>
				<td style="width:22%; text-align:right;"><?= number_format($arr_sales->row()->total_disc, 0, ',', '.'); ?></td>
			</tr>
			<tr>
				<td style="width:75%; text-align:right;">GRAND TOTAL</td>
				<td style="width:3%; text-align:right;"> : </td>
				<td style="width:22%; text-align:right;"><?= number_format($arr_sales->row()->total_transaction, 0, ',', '.'); ?></td>
			</tr>
			<tr>
				<td style="width:75%; text-align:right;">BAYAR</td>
				<td style="width:3%; text-align:right;"> : </td>
				<td style="width:22%; text-align:right;"><?= number_format($arr_sales->row()->payment, 0, ',', '.'); ?></td>
			</tr>
			<tr>
				<td style="width:75%; text-align:right;">KEMBALI</td>
				<td style="width:3%; text-align:right;"> : </td>
				<td style="width:22%; text-align:right;"><?= number_format($arr_sales->row()->exchange, 0, ',', '.'); ?></td>
			</tr>
		</table>
		<br />
		<label style="text-align: center;"><?= $arr_company->row()->sales_notes; ?></label>
	</div>
</body>

</html>
