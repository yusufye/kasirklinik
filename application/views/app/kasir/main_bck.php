<form id="form">
	<div class="row mt-2">
		<div class="col-sm-12 col-md-12">
			<div class="row">
				<div class="col-sm-12 col-md-4">
					<div class="form-group">
						<input type="text" class="form-control" id="barcode" name="barcode" placeholder="Scan Barcode" accesskey="b" title="Alt + B" autofocus />
					</div>
					</row>
					<div class="row">
						<div class="form-group">
							<select class="form-control" id="item_code" name="item_code" accesskey="c" title="Alt + C">
								<option value=""></option>
								<?php foreach ($arr_list_item['results'] as $key) { ?>
									<optgroup label="<?= $key['text']; ?>">
										<?php foreach ($key['children'] as $key_children) { ?>
											<option value="<?= $key_children['id']; ?>"><?= $key_children['text']; ?></option>
										<?php } ?>
									</optgroup>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="col-sm-12 col-md-4">

					</div>
				</div>
				<div class="row">
					<div class="col-12" id="group_category">
						<button type="button" class="btn btn-primary btn-sm mr-2 mb-2 active" id="category_default" onclick="renderItemByCategory('default')">Semua Kategori</button>
						<?php foreach ($arr_kategori->result() as $key) { ?>
							<button type="button" class="btn btn-info btn-sm mb-2" id="category_<?= $key->stock_category_id; ?>" onclick="renderItemByCategory(<?= $key->stock_category_id; ?>)"><?= $key->stock_category_name; ?></button>
						<?php } ?>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="row row-cols-2" id="group_card">
							<!-- <div class="col col-md-3 my-2">
						<div class="card mh-100 h-100">
							<img class="card-img-top img-fluid" src="" alt="Item PP">
							<div class="card-body" style="font-size: 0.9rem;">
								<h5 class="card-title" style="font-size: 1rem;">-</h5>
								<p class="card-text">Rp.0</p>
							</div>
						</div>
					</div> -->
						</div>
					</div>
					<div class="col-12 mt-2 mb-0">
						<div id="pagination"></div>
						<!-- <nav>
					<ul class="pagination pagination-lg justify-content-center">
						<li class="page-item disabled">
							<a class="page-link">Previous</a>
						</li>
						<li class="page-item active" aria-current="page"><a class="page-link" href="#">1</a></li>
						<li class="page-item">
							<a class="page-link" href="#">2</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item">
							<a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</nav> -->
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-md-6">
				<div class="card mt-1 bg-dark mh-100">
					<div class="card-header text-white text-center">
						<h5 style="font-size: 0.9rem;">Keranjang Belanja</h5>
					</div>
					<div class="card-body text-white pt-1 pr-0 pb-0 pl-0">
						<div class="table-responsive" style="height: 24vh;">
							<table id="v_keranjang" class="table table-borderless table-striped text-white" style="font-size: 0.7rem;">
								<tbody>
									<?php //for ($i = 0; $i < 10; $i++) { 
									?>
									<!-- <tr>
									<th>Lorem ipsum dolor sit amet.</th>
									<th>1 PCS</th>
									<th class="text-right">Rp.10,000,000</th>
								</tr> -->
									<?php //} 
									?>
								</tbody>
							</table>
						</div>
						<hr />
						<table class="table table-borderless text-white">
							<tbody>
								<tr>
									<th>Metode Pembayaran</th>
									<th class="d-flex justify-content-end">
										<select class="form-control form-control-sm" id="metode_pembayaran" name="metode_pembayaran" accesskey="m" title="Alt + M" style="width: 100px;">
											<option value="tunai">Tunai</option>
											<option value="debit">Debit</option>
											<option value="kredit">Kredit</option>
											<option value="transfer">Transfer</option>
										</select>
									</th>
								</tr>
								<tr class="non_tunai_group" style="display: none;">
									<th>Bank</th>
									<th>
										<select class="form-control w-100" id="bank" name="bank" data-placeholder="Pilih Bank">
											<option value=""></option>
											<?php foreach ($arr_bank->result() as $key) { ?>
												<option value="<?= $key->bank_id; ?>"><?= $key->bank_name; ?></option>
											<?php } ?>
										</select>
									</th>
								</tr>
								<tr class="non_tunai_group" style="display: none;">
									<th>No Kartu</th>
									<th>
										<input type=" text" class="form-control" id="no_kartu" name="no_kartu" />
									</th>
								</tr>
								<tr class="non_tunai_group" style="display: none;">
									<th>Nama Pemegang</th>
									<th>
										<input type=" text" class="form-control" id="nama_pemegang" name="nama_pemegang" />
									</th>
								</tr>
								<tr class="non_tunai_group" style="display: none;">
									<th>Catatan</th>
									<th>
										<textarea class=" form-control" id="catatan" name="catatan"></textarea>
									</th>
								</tr>
								<tr>
									<th>
										Total
									</th>
									<th class="text-right">
										<h5 id="grand_total"></h5>
									</th>
								</tr>
								<tr>
									<th>
										Diskon
									</th>
									<th class="d-flex justify-content-end">
										<div class="input-group" style="width: 200px;">
											<input type="text" class="form-control form-control-sm" id="diskon_persen" name="diskon_persen" placeholder="%" accesskey="5" title="Alt + 5" />
											<div class="input-group-append">
												<span class="input-group-text">%</span>
												<span class="input-group-text bg-dark">&nbsp;</span>
												<span class="input-group-text">Rp.</span>
											</div>
											<input type="text" class="form-control form-control-sm" id="diskon_idr" name="diskon_idr" placeholder="Rp" accesskey="6" title="Alt + 6" />
										</div>
									</th>
								</tr>
								<tr>
									<th>
										Grand Total
									</th>
									<th class="text-right">
										<h5 id="grand_total_finale"></h5>
									</th>
								</tr>
								<tr>
									<th>
										Bayar
									</th>
									<th class="d-flex justify-content-end">
										<input type="text" class="form-control form-control-sm" id="nominal_bayar" name="nominal_bayar" placeholder="Nominal Bayar" accesskey="u" title="Alt + U" style="width: 100px;" />
									</th>
								</tr>
								<tr>
									<th>
										Kembalian
									</th>
									<th class="text-right">
										<h5 id="kembalian">Rp.0</h5>
									</th>
								</tr>
								<tr>
									<th colspan="2" class="px-3 py-0">
										<button type="button" class="btn btn-primary btn-sm btn-block" id="btn_pembayaran" accesskey="s" title="Alt + S" disabled>
											<i class="fas fa-file-invoice-dollar fa-fw"></i> Pembayaran
										</button>
										<button type="button" class="btn btn-success btn-sm btn-block" id="btn_print" accesskey="p" title="Alt + P" disabled>
											<i class="fas fa-print fa-fw"></i> Print Struk
										</button>
										<button type="button" class="btn btn-info btn-sm btn-block" id="btn_transaksi_baru" accesskey="n" title="Alt + N" disabled>
											<i class="fas fa-cart-plus fa-fw"></i> Transaksi Baru
										</button>
									</th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
</form>

<!-- Modal Password -->
<form id="form_password">
	<div class="modal fade" id="modal_password" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Ganti Password</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="password_lama">Password Lama</label>
						<input type="text" class="form-control" id="password_lama" name="password_lama" required />
					</div>
					<div class="form-group">
						<label for="password_baru">Password Baru</label>
						<input type="text" class="form-control" id="password_baru" name="password_baru" minlength="4" required />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
		</div>
	</div>
</form>

<!-- Modal Laporan -->
<form id="form_laporan">
	<div class="modal fade" id="modal_laporan" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Laporan Penjualan</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<div class="input-group-prepend">
							<label for="tanggal" class="input-group-text">Tanggal</label>
						</div>
						<input type="date" class="form-control" id="tanggal" name="tanggal" required />
						<div class="input-group-append">
							<button class="btn btn-outline-success" type="submit" id="btn_laporan">Tampilkan</button>
						</div>
					</div>
					<hr />
					<div class="table-responsive" id="v_laporan_responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th colspan="2">Grand Total</th>
									<th>RP.<span id="v_laporan_total">0</span></th>
								</tr>
							</thead>
							<tbody id="v_laporan">
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</form>