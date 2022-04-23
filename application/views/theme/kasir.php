<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Aplikasi Kasir <?= APP_NAME; ?>" />
	<meta name="author" content="Adam PM@2022-02-01" />
	<meta name="msapplication-TileColor" content="#2C489B">
	<meta name="msapplication-TileImage" content="<?= base_url('assets/img/favicon/ms-icon-144x144.png'); ?>">
	<meta name="theme-color" content="#2C489B">

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<!-- <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,300;0,500;0,700;1,300;1,500;1,700&display=swap" rel="stylesheet"> -->
	<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"> -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@700&display=swap" rel="stylesheet">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<?= base_url('assets/css/bootstrap.css'); ?>">

	<!-- fontawesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<!-- Select2 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" integrity="sha512-nMNlpuaDPrqlEls3IX/Q56H36qvBASwb3ipuo3MxeWbsQB1881ox0cRv7UPTgBlriqoynt35KjEwgGUeUXIPnw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- <link rel="stylesheet" href="<?= base_url('assets/css/select2-bootstrap4.min.css'); ?>" /> -->

	<!-- Background Css -->
	<link rel="stylesheet" href="<?= base_url('assets/css/bg.css'); ?>" />

	<!-- favicon -->
	<link rel="apple-touch-icon" sizes="57x57" href="<?= base_url(); ?>assets/img/favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="<?= base_url(); ?>assets/img/favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="<?= base_url(); ?>assets/img/favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="<?= base_url(); ?>assets/img/favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="<?= base_url(); ?>assets/img/favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="<?= base_url(); ?>assets/img/favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="<?= base_url(); ?>assets/img/favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="<?= base_url(); ?>assets/img/favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="<?= base_url(); ?>assets/img/favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192" href="<?= base_url(); ?>assets/img/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="<?= base_url(); ?>assets/img/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="<?= base_url(); ?>assets/img/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="<?= base_url(); ?>assets/img/favicon/favicon-16x16.png">
	<link rel="manifest" href="<?= base_url('assets/img/favicon/manifest.json'); ?>">

	<title>Kasir | <?= APP_NAME; ?></title>

	<style>
		.grand_total_view {
			font-size: 1.4rem;
			font-family: 'Orbitron';
			color: white;
		}

		.swal2-title {
			font-size: .9rem !important;
		}

		body.swal2-toast-shown .swal2-container {
			box-sizing: border-box !important;
			width: 300px !important;
			max-width: 100% !important;
			background-color: transparent !important;
			pointer-events: none !important;
		}

		.swal2-popup.swal2-toast {
			padding: .6em !important;
		}

		.swal2-html-container {
			font-size: .8em !important;
		}

		.select2-selection__rendered {
			line-height: 31px !important;
		}

		.select2-container .select2-selection--single {
			height: 35px !important;
		}

		.select2-selection__arrow {
			height: 34px !important;
		}
	</style>
</head>

<body class="bg-primary" style="padding-bottom:0px;">
	<div class="container-fluid">
		<?php $this->load->view('theme/navbar'); ?>
		<?php $this->load->view('app/' . $content); ?>
	</div>



	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js" integrity="sha512-2ImtlRlf2VVmiGZsjm9bEyhjGW4dU7B6TNwh/hx/iSByxNENtj3WVE6o/9Lj4TJeVXPi4bnOIMXFIJJAeufa0A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js" integrity="sha512-rCjfoab9CVKOH/w/T6GbBxnAH5Azhy4+q1EXW5XEURefHbIkRbQ++ZR+GBClo3/d3q583X/gO4FKmOFuhkKrdA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/id.min.js" integrity="sha512-he8U4ic6kf3kustvJfiERUpojM8barHoz0WYpAUDWQVn61efpm3aVAD8RWL8OloaDDzMZ1gZiubF9OSdYBqHfQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- 
		autonumeric
		https://github.com/autoNumeric/autoNumeric
	-->
	<script src="https://cdn.jsdelivr.net/npm/autonumeric@4.5.4"></script>
	<script src="<?= base_url('assets/js/jquery.blockUI.js'); ?>"></script>
</body>

</html>

<?php $this->load->view('app/' . $vitamin); ?>

<script>
	$(document).on('select2:open', () => {
		document.querySelector('.select2-search__field').focus();
	});

	$(document).ready(() => {
		showTime()
	})

	function showTime() {
		moment.locale()
		let dateTime = moment().format('LLLL');

		$('#jam').text(dateTime)

		setTimeout(showTime, 1000);
	}

	function setInputFilter(textbox, inputFilter) {
		["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function(event) {
			textbox.addEventListener(event, function() {
				if (inputFilter(this.value)) {
					this.oldValue = this.value;
					this.oldSelectionStart = this.selectionStart;
					this.oldSelectionEnd = this.selectionEnd;
				} else if (this.hasOwnProperty("oldValue")) {
					this.value = this.oldValue;
					this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
				} else {
					this.value = "";
				}
			});
		});
	}

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
	}

	function comingSoon() {
		Swal.fire({
			icon: 'warning',
			title: `Coming Soon`,
			toast: true,
			position: 'top-end',
			showConfirmButton: false,
			timer: 3000
		})
	}
</script>