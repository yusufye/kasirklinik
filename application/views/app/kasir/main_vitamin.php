<script>
	let category_id = 'default';

	let numeric_nominal_bayar = new AutoNumeric('#nominal_bayar', {
		digitGroupSeparator: '.',
		decimalCharacter: ',',
		allowDecimalPadding: false,
		decimalPlaces: 0,
		minimumValue: 0,
		modifyValueOnWheel: false,
		saveValueToSessionStorage: false,
		emptyInputBehavior: 0
	});

	let numeric_diskon_persen = new AutoNumeric('#diskon_persen', {
		digitGroupSeparator: '.',
		decimalCharacter: ',',
		allowDecimalPadding: false,
		decimalPlaces: 0,
		minimumValue: 0,
		modifyValueOnWheel: false,
		saveValueToSessionStorage: false,
		emptyInputBehavior: 0
	});

	let numeric_diskon_idr = new AutoNumeric('#diskon_idr', {
		digitGroupSeparator: '.',
		decimalCharacter: ',',
		allowDecimalPadding: false,
		decimalPlaces: 0,
		minimumValue: 0,
		modifyValueOnWheel: false,
		saveValueToSessionStorage: false,
		emptyInputBehavior: 0
	});

	let numeric_laporan_total = new AutoNumeric('#v_laporan_total', {
		digitGroupSeparator: '.',
		decimalCharacter: ',',
		allowDecimalPadding: false,
		decimalPlaces: 0,
		minimumValue: 0,
		modifyValueOnWheel: false,
		saveValueToSessionStorage: false,
		emptyInputBehavior: 0
	});

	$(document).ready(() => {
		resetData()

		setInputFilter(document.getElementById("no_kartu"), function(value) {
			return /^[0-9]*$/.test(value);
		});

		$('#item_code').select2({
			placeholder: 'Cari Item',
			allowClear: true
		})

		$('#bank').select2({
			placeholder: 'Pilih Bank',
			allowClear: true
		})

		$('#item_code').on('change', e => {
			e.preventDefault()
			let item_code = $('#item_code :selected').val()

			if (item_code != '') {
				tambahKeranjang(item_code)
			}
		})

		$('#barcode').on('change', e => {
			e.preventDefault()
			let barcode = $('#barcode').val()
			if (barcode.length > 0) {
				tambahKeranjang(barcode)
			}
		})

		$('#metode_pembayaran').on('change', e => {
			e.preventDefault()
			let metode = $('#metode_pembayaran').val()

			if (metode != "tunai") {
				$('.non_tunai_group').fadeIn()
			} else {
				$('.non_tunai_group').fadeOut()
			}
		})

		$('#nominal_bayar').on('change keyup', e => {
			e.preventDefault()
			let grand_total = window.localStorage.getItem('grand_total')
			let nominal_bayar = numeric_nominal_bayar.getNumber()
			if (nominal_bayar > 0) {
				let kembalian = parseInt(nominal_bayar) - parseInt(grand_total)
				$('#kembalian').text("Rp." + numberWithCommas(kembalian))

				if (kembalian >= 0) {
					if (grand_total > 0) {
						$('#btn_pembayaran').attr('disabled', false)
					} else {
						$('#btn_pembayaran').attr('disabled', true)
					}
				} else {
					$('#btn_pembayaran').attr('disabled', true)
				}
			} else {
				$('#kembalian').text("Rp." + 0)
				$('#btn_pembayaran').attr('disabled', true)
			}
		})

		$('#btn_pembayaran').on('click', e => {
			e.preventDefault()
			simpanTransaksi()
		})

		$('#btn_print').on('click', e => {
			e.preventDefault()
			let sales_number_prev = window.localStorage.getItem('sales_number_prev')

			if (sales_number_prev != false || sales_number_prev != undefined) {
				printStruk(sales_number_prev)
			}
		})

		$('#btn_transaksi_baru').on('click', e => {
			e.preventDefault()
			resetData()
		})

		$('#form_password').on('submit', e => {
			e.preventDefault()
			updatePassword()
		})

		$('#form_laporan').on('submit', e => {
			e.preventDefault()
			let tanggal = $('#tanggal').val()
			getLaporan(tanggal)
		})

		$('#diskon_persen').on('change keyup', e => {
			e.preventDefault()
			renderDiskonIDR()
		})

		$('#diskon_idr').on('change keyup', e => {
			e.preventDefault()
			renderDiskonPersen()
		})
	})
</script>

<script>
	function tambahKeranjang(barcode) {
		$.ajax({
			url: `<?= base_url(); ?>kasir/get_item/${barcode}`,
			type: 'get',
			dataType: 'json',
			beforeSend: () => {
				// $.blockUI({
				// 	message: `<i class="fas fa-spinner fa-spin"></i>`
				// })
				$('#item_code').val('').trigger('change')
			}
		}).fail(e => {
			Swal.fire({
				icon: 'warning',
				html: e.responseText,
			}).then(() => {
				$.unblockUI()
			})
		}).done(e => {
			if (e.code == 403) {
				Swal.fire({
					icon: 'error',
					title: 'Sesi Berakhir',
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 2000
				}).then(() => {
					window.location.replace('<?= base_url('logout'); ?>')
				})
			} else if (e.code == 200) {
				if (e.data.length == 0) {
					$.unblockUI()
					Swal.fire({
						icon: 'warning',
						title: 'Barcode Tidak Ditemukan',
						toast: true,
						position: 'top-end',
						showConfirmButton: false,
						timer: 2000
					})
					$('#barcode').val('').focus()
				} else if (e.data[0].qty <= 0) {
					$.unblockUI()
					Swal.fire({
						icon: 'warning',
						title: `Stock ${e.data[0].item_name} Kosong!`,
						toast: true,
						position: 'top-end',
						showConfirmButton: false,
						timer: 3000
					})
					$('#barcode').val('').focus()
				} else {
					$.unblockUI()
					$.each(e.data, (i, k) => {
						let item_id = k.item_id
						let item_name = k.item_name
						let selling_price = k.selling_price
						let selling_price_idr = k.selling_price_idr
						let unit_name = k.unit_name
						let qty = k.qty
						let foto_filename = k.foto_filename

						let keranjang = JSON.parse(window.localStorage.getItem('keranjang'))
						let hasil_pencarian = keranjang.find(keranjang => keranjang.item_id == item_id)
						if (hasil_pencarian === undefined) {
							let isian = {
								item_id: item_id,
								item_name: item_name,
								qty: 1,
								satuan: unit_name,
								selling_price: selling_price,
								selling_price_idr: selling_price_idr,
								sub_total: selling_price,
								sub_total_idr: selling_price_idr,
								foto_filename: foto_filename,
							}
							keranjang.push(isian)
							window.localStorage.setItem('keranjang', JSON.stringify(keranjang))
							renderKeranjang()
							Swal.fire({
								icon: 'success',
								title: 'Tambah Item Berhasil',
								toast: true,
								position: 'top-end',
								showConfirmButton: false,
								timer: 1000
							})
						} else {
							if (qty < (parseInt(hasil_pencarian.qty) + 1)) {
								Swal.fire({
									icon: 'warning',
									title: `Stock ${e.data[0].item_name} Tidak Mencukupi!`,
									toast: true,
									position: 'top-end',
									showConfirmButton: false,
									timer: 3000
								})
							} else {
								hasil_pencarian.qty += 1
								hasil_pencarian.sub_total = parseInt(hasil_pencarian.sub_total) + parseInt(selling_price)
								hasil_pencarian.sub_total_idr = new Intl.NumberFormat('id-ID', {
									minimumFractionDigits: 0
								}).format(hasil_pencarian.sub_total)

								window.localStorage.setItem('keranjang', JSON.stringify(keranjang))
								renderKeranjang()
								Swal.fire({
									icon: 'success',
									title: 'Tambah Item Berhasil',
									toast: true,
									position: 'top-end',
									showConfirmButton: false,
									timer: 2000
								})
							}
						}
					})

				}
			}
		})
	}

	function renderKeranjang() {
		let keranjang = JSON.parse(window.localStorage.getItem('keranjang'))
		let total = 0

		let htmlnya = ``;
		$('#v_keranjang').html(htmlnya)

		if (keranjang.length > 0) {
			$.each(keranjang.reverse(), (i, k) => {
				htmlnya += `
				<div class="d-flex justify-content-between">
					<div class="align-self-center">
						<img src="${k.foto_filename}" class="img-thumbnail rounded" style="width: 80px; height: 80px;" />
					</div>
					<div class="align-self-center" style="max-width: 300px;">
						<p>
							${k.item_name}<br />
							<small>Rp.${k.selling_price_idr}</small>
						</p>
					</div>
					<div class="align-self-center">
						<div class="input-group input-group-xs" style="width: 150px;">
							<div class="input-group-prepend">
								<button type="button" class="btn btn-danger btn-sm" onClick="decreseQty('qty_keranjang_${k.item_id}');"><i class="fas fa-minus"></i></button>
							</div>
							<input type="text" min="1" onkeypress="return isNumberKey(event)" class="form-control qty_keranjang nonly" id="qty_keranjang_${k.item_id}" value="${k.qty}" onChange="updateQty('qty_keranjang_${k.item_id}', ${k.item_id});" />
							<div class="input-group-append">
								<span class="input-group-text">${k.satuan}</span>
								<button type="button" class="btn btn-success btn-sm" onClick="increaseQty('qty_keranjang_${k.item_id}');"><i class="fas fa-plus"></i></button>
							</div>
						</div>
					</div>
					<div class="align-self-center">
						<p>Rp.${k.sub_total_idr}</p>
					</div>
					<div class="align-self-center">
						<button type="button" class="btn btn-danger mr-2" onClick="hapusKeranjang(${k.item_id}, '${k.item_name}')"><i class="fas fa-trash"></i></button>
					</div>
				</div>
				<hr />
				`

				total += parseInt(k.sub_total)
				window.localStorage.setItem('total', total)
			})
			$('#v_keranjang').html(htmlnya)
			renderTotal()
		} else {
			window.localStorage.setItem('total', 0)
			renderTotal()
		}
		$('#barcode').val(null).focus()
	}

	function renderTotal() {
		let total = JSON.parse(window.localStorage.getItem('total'))
		$('.grand_total').text(new Intl.NumberFormat('id-ID', {
			style: 'currency',
			currency: 'IDR',
			minimumFractionDigits: 0
		}).format(total))
		renderDiskonIDR()
	}

	function hapusKeranjang(item_id, item_name) {
		Swal.fire({
			icon: 'warning',
			title: 'Apakah kamu yakin?',
			html: `Item <strong>${item_name}</strong> akan dihapus dari keranjang`,
			showCancelButton: true,
			confirmButtonColor: '#375AC3',
			cancelButtonColor: '#F99723',
			confirmButtonText: 'Ya, Hapus Item!'
		}).then((result) => {
			if (result.isConfirmed) {
				let keranjang = JSON.parse(window.localStorage.getItem('keranjang'))
				let hasil_pencarian = keranjang.find(keranjang => keranjang.item_id == item_id)
				if (hasil_pencarian != undefined) {
					let newKeranjang = remove_item_id(item_id, keranjang)
					window.localStorage.setItem('keranjang', JSON.stringify(newKeranjang))
					renderKeranjang()
					Swal.fire({
						icon: 'success',
						title: 'Hapus Item Berhasil',
						toast: true,
						position: 'top-end',
						showConfirmButton: false,
						timer: 2000
					})
				}
			}
		})
	}

	function remove_item_id(item_id, keranjang) {
		let newKeranjang = []
		$.each(keranjang, (i, k) => {
			if (k.item_id != item_id) {
				let isian = {
					item_id: k.item_id,
					item_name: k.item_name,
					qty: k.qty,
					satuan: k.satuan,
					selling_price: k.selling_price,
					selling_price_idr: k.selling_price_idr,
					sub_total: k.sub_total,
					sub_total_idr: k.sub_total_idr,
					foto_filename: k.foto_filename,
				}
				newKeranjang.push(isian)
			}
		})

		return newKeranjang
	}

	function simpanTransaksi() {
		let total = window.localStorage.getItem('total')
		let grand_total = window.localStorage.getItem('grand_total')
		let diskon_persen = numeric_diskon_persen.getNumber()
		let diskon_idr = numeric_diskon_idr.getNumber()
		let keranjang = JSON.parse(window.localStorage.getItem('keranjang'))
		let metode = $('#metode_pembayaran').val()
		let bank = $('#bank :selected').val()
		let nama_pemegang = $('#nama_pemegang').val()
		let no_kartu = $('#no_kartu').val()
		let bayar = numeric_nominal_bayar.getNumber()
		let catatan = $('#catatan').val()

		if (metode != 'tunai') {
			if (bank.length == 0) {
				Swal.fire({
					icon: 'warning',
					title: `Pilih Bank`,
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 2000
				})
			} else if (no_kartu.length == 0) {
				Swal.fire({
					icon: 'warning',
					title: `Silahkan Isi No Kartu`,
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 2000
				})
			} else if (nama_pemegang.length == 0) {
				Swal.fire({
					icon: 'warning',
					title: `Silahkan Isi Nama Pemegang`,
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 2000
				})
			} else {
				prosesSimpan(keranjang, total, grand_total, diskon_persen, diskon_idr, metode, bank, nama_pemegang, no_kartu, bayar, catatan)
			}
		} else {
			prosesSimpan(keranjang, total, grand_total, diskon_persen, diskon_idr, metode, bank, nama_pemegang, no_kartu, bayar, catatan)
		}
	}

	function prosesSimpan(keranjang, total, grand_total, diskon_persen, diskon_idr, metode, bank, nama_pemegang, no_kartu, bayar, catatan) {
		$.ajax({
			url: `<?= base_url(); ?>kasir/simpan`,
			type: 'post',
			dataType: 'json',
			data: {
				keranjang: keranjang,
				total: total,
				grand_total: grand_total,
				diskon_persen: diskon_persen,
				diskon_idr: diskon_idr,
				metode: metode,
				bank: bank,
				nama_pemegang: nama_pemegang,
				no_kartu: no_kartu,
				bayar: bayar,
				catatan: catatan,
			},
			beforeSend: () => {
				$.blockUI({
					message: `<i class="fas fa-spinner fa-spin"></i>`
				})
				$('#btn_pembayaran').attr('disabled', true)
			}
		}).fail(e => {
			Swal.fire({
				icon: 'warning',
				html: e.responseText,
			}).then(() => {
				$.unblockUI()
				$('#btn_pembayaran').attr('disabled', true)
			})
		}).done(e => {
			if (e.code == 403) {
				Swal.fire({
					icon: 'error',
					title: 'Sesi Berakhir',
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 2000
				}).then(() => {
					$('#btn_pembayaran').attr('disabled', true)
					window.location.replace('<?= base_url('logout'); ?>')
				})
			} else if (e.code == 500) {
				Swal.fire({
					icon: 'error',
					title: e.msg,
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 3000
				}).then(() => {
					// $('#btn_pembayaran').attr('disabled', true)
					$('#btn_pembayaran').attr('disabled', false)
					// window.location.reload()
					$.unblockUI()
				})
			} else if (e.code == 200) {
				window.localStorage.setItem('sales_number_prev', e.sales_number)
				$('#btn_pembayaran').attr('disabled', true)
				Swal.fire({
					icon: 'success',
					title: `Transaksi ${e.sales_number} Berhasil`,
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 2000
				}).then(() => {
					$('#btn_transaksi_baru').attr('disabled', false)
					$('#btn_print').attr('disabled', false)
					$.unblockUI()
				})
			}
		})
	}

	function resetData() {
		window.localStorage.clear();
		window.localStorage.setItem('keranjang', JSON.stringify([]))
		window.localStorage.setItem('total', 0)
		window.localStorage.setItem('grand_total', 0)
		window.localStorage.setItem('sales_number_prev', false)
		renderKeranjang()
		$('#metode_pembayaran').val('tunai')
		$('#bank').val('').trigger('change')
		$('#no_kartu').val('')
		$('#nama_pemegang').val('')
		$('#catatan').val('')
		$('.non_tunai_group').fadeOut()
		numeric_nominal_bayar.set(0)
		numeric_diskon_persen.set(0)
		numeric_diskon_idr.set(0)
		$('#kembalian').text("Rp.0")
		$('#btn_pembayaran').attr('disabled', true)
		$('#btn_print').attr('disabled', true)
		$('#btn_transaksi_baru').attr('disabled', true)
	}

	function printStruk(sales_number) {
		window.open(`<?= base_url(); ?>kasir/print/${sales_number}`)
		// printPage(`<?= base_url(); ?>kasir/print/${sales_number}`)
	}

	function closePrint() {
		document.body.removeChild(this.__container__);
	}

	function setPrint() {
		this.contentWindow.__container__ = this;
		this.contentWindow.onbeforeunload = closePrint;
		this.contentWindow.onafterprint = closePrint;
		this.contentWindow.focus(); // Required for IE
		this.contentWindow.print();
	}

	function printPage(sURL) {
		var oHideFrame = document.createElement("iframe");
		oHideFrame.onload = setPrint;
		oHideFrame.style.position = "fixed";
		oHideFrame.style.right = "0";
		oHideFrame.style.bottom = "0";
		oHideFrame.style.width = "0";
		oHideFrame.style.height = "0";
		oHideFrame.style.border = "0";
		oHideFrame.src = sURL;
		document.body.appendChild(oHideFrame);
	}

	function updateQty(selector, item_id) {
		let new_qty = $(`#${selector}`).val()
		$.ajax({
			url: `<?= base_url(); ?>kasir/check_stock/${item_id}`,
			type: 'get',
			dataType: 'json',
			beforeSend: () => {
				// $.blockUI({
				// 	message: `<i class="fas fa-spinner fa-spin"></i>`
				// })
			}
		}).fail(e => {
			Swal.fire({
				icon: 'warning',
				html: e.responseText,
			}).then(() => {
				$.unblockUI()
			})
		}).done(e => {
			if (parseInt(e.data.length) == 0) {
				$.unblockUI()
				Swal.fire({
					icon: 'warning',
					title: 'Item Tidak Ditemukan',
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 2000
				})
			} else if (parseInt(e.data[0].qty) <= 0) {
				$.unblockUI()
				Swal.fire({
					icon: 'warning',
					title: `Stock ${e.data[0].item_name} Kosong!`,
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 3000
				})
			} else if (parseInt(e.data[0].qty) < parseInt(new_qty)) {
				let keranjang = JSON.parse(window.localStorage.getItem('keranjang'))
				let hasil_pencarian = keranjang.find(keranjang => keranjang.item_id == item_id)

				if (hasil_pencarian !== undefined) {
					$(`#${selector}`).val(hasil_pencarian.qty)
					renderKeranjang()
				}
				$.unblockUI()
				Swal.fire({
					icon: 'warning',
					title: `Stock ${e.data[0].item_name} Tidak Mencukupi!`,
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 3000
				})
			} else {
				$.unblockUI()
				let keranjang = JSON.parse(window.localStorage.getItem('keranjang'))
				let hasil_pencarian = keranjang.find(keranjang => keranjang.item_id == item_id)

				if (hasil_pencarian !== undefined) {
					hasil_pencarian.qty = parseInt(new_qty)
					hasil_pencarian.sub_total = parseInt(hasil_pencarian.selling_price) * parseInt(new_qty)
					hasil_pencarian.sub_total_idr = new Intl.NumberFormat('id-ID', {
						minimumFractionDigits: 0
					}).format(parseInt(hasil_pencarian.selling_price) * parseInt(new_qty))
					window.localStorage.setItem('keranjang', JSON.stringify(keranjang))
					renderKeranjang()
				}
			}
		})
	}

	function modalPassword() {
		$('#modal_password').modal('show')
	}

	function updatePassword() {
		$.ajax({
			url: `<?= base_url(); ?>kasir/update_password`,
			type: 'post',
			dataType: 'json',
			data: $('#form_password').serialize(),
			beforeSend: () => {
				$.blockUI({
					message: `<i class="fas fa-spinner fa-spin"></i>`
				})
			}
		}).fail(e => {
			Swal.fire({
				icon: 'warning',
				html: e.responseText,
			}).then(() => {
				$.unblockUI()
			})
		}).done(e => {
			$.unblockUI()
			if (e.code == 404) {
				Swal.fire({
					icon: 'warning',
					title: e.msg,
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 3000
				})
			} else if (e.code == 200) {
				Swal.fire({
					icon: 'success',
					title: e.msg,
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 3000
				}).then(() => {
					$('#modal_password').modal('hide')
					window.location.reload()
				})
			}
		})
	}

	function modalLaporan() {
		$('#tanggal').val('')
		$('#v_laporan').html(``)
		numeric_laporan_total.set(0)
		$('#modal_laporan').modal('show')
	}

	function getLaporan(tanggal) {
		$.ajax({
			url: `<?= base_url(); ?>kasir/get_laporan_penjualan`,
			type: 'post',
			dataType: 'json',
			data: {
				tanggal: tanggal
			},
			beforeSend: () => {
				$.blockUI({
					message: `<i class="fas fa-spinner fa-spin"></i>`
				})
			}
		}).fail(e => {
			Swal.fire({
				icon: 'warning',
				html: e.responseText,
			}).then(() => {
				$.unblockUI()
			})
		}).done(e => {
			$.unblockUI()
			if (e.data.length == 0) {
				$('#v_laporan').html(`
				<tr>
					<th class="text-center" colspan="3">-Tidak ada data-</th>
				</tr>
				`)
				numeric_laporan_total.set(0)
			} else {
				let grand_total = 0
				let htmlnya = ``
				$.each(e.data, (i, k) => {
					let sales_number = k.sales_number
					let total_transaction = parseInt(k.total_transaction)
					let arr_detail = k.detail
					grand_total += total_transaction

					htmlnya += `
					<tr>
						<th colspan="3">Sales Number: ${sales_number}</th>
					</tr>
					`

					$.each(arr_detail, (ii, kk) => {
						let item_name = kk.item_name
						let qty = kk.qty
						let unit_name = kk.unit_name
						let subtotal_idr = kk.subtotal_idr

						htmlnya += `
						<tr>
							<td>${item_name}</th>
							<td>${qty} ${unit_name}</td>
							<td>Rp.${subtotal_idr}</td>
						</tr>
						`
					})
				})
				$('#v_laporan').html(htmlnya)
				numeric_laporan_total.set(grand_total)
			}
		})
	}

	function renderDiskonIDR() {
		let diskon_persen = numeric_diskon_persen.getNumber()
		if (diskon_persen > 0) {
			let total = window.localStorage.getItem('total')
			let diskon_idr = (parseFloat(total) * parseFloat(diskon_persen)) / 100
			numeric_diskon_idr.set(diskon_idr)
			// $('#diskon_idr').val(diskon_idr)
		} else {
			numeric_diskon_idr.set(0)
		}

		renderTotalFinale()
	}

	function renderDiskonPersen() {
		let diskon_idr = numeric_diskon_idr.getNumber()
		if (diskon_idr > 0) {
			let total = window.localStorage.getItem('total')
			let diskon_persen = (parseFloat(diskon_idr) / parseFloat(total)) * 100
			// $('#diskon_persen').val(diskon_persen)
			numeric_diskon_persen.set(diskon_persen)
		} else {
			// $('#diskon_persen').val(0)
			numeric_diskon_persen.set(0)
		}

		renderTotalFinale()
	}

	function renderTotalFinale() {
		let total = window.localStorage.getItem('total')
		let diskon_idr = numeric_diskon_idr.getNumber()
		let grand_total_finale = total - diskon_idr

		window.localStorage.setItem('grand_total', grand_total_finale)

		$('.grand_total').text(new Intl.NumberFormat('id-ID', {
			style: 'currency',
			currency: 'IDR',
			minimumFractionDigits: 0
		}).format(grand_total_finale))
	}

	function isNumberKey(evt) {
		var charCode = (evt.which) ? evt.which : evt.keyCode
		if (charCode > 31 && (charCode < 48 || charCode > 57))
			return false;
		return true;
	}

	function decreseQty(selector) {
		let a = $(`#${selector}`).val();
		let b = ((parseInt(a) - 1) < 0) ? 0 : parseInt(a) - 1;
		$(`#${selector}`).val(b).trigger('change');
	}

	function increaseQty(selector) {
		let a = $(`#${selector}`).val();
		let b = parseInt(a) + 1
		$(`#${selector}`).val(b).trigger('change');
	}
</script>