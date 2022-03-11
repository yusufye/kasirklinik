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
	<link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,300;0,500;0,700;1,300;1,500;1,700&display=swap" rel="stylesheet">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<?= base_url('assets/css/bootstrap.css'); ?>">

	<!-- fontawesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<!-- login css -->
	<link rel="stylesheet" href="assets/css/login.css">

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

	<title>Login Kasir | <?= APP_NAME; ?></title>
</head>

<body>
	<div class="login-dark">
		<form id="form" method="post">
			<h2 class="sr-only">Login Form</h2>
			<?php if ($this->session->flashdata('expired')) { ?>
				<div class="alert alert-success alert-dismissible fade show" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong><?= $this->session->flashdata('expired'); ?></strong>
				</div>
			<?php } ?>
			<div class="illustration">
				<img src="<?= base_url('assets/img/logo swr frozen food.jpeg'); ?>" alt="Logo SWR Frozen Food" class="img-fluid" />
			</div>
			<div class="form-group">
				<input class="form-control" type="text" id="username" name="username" placeholder="Username" required>
			</div>
			<div class="form-group">
				<input class="form-control" type="password" id="password" name="password" placeholder="Password" autocomplete="new-password" required>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block" id="submit">Masuk</button>
			</div>
			<div class="div d-flex justify-content-center">
				<small><?= APP_NAME; ?> <?= APP_YEAR; ?> <?= APP_VERSION; ?></small>
			</div>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="<?= base_url('assets/js/jquery.blockUI.js'); ?>"></script>
</body>

</html>


<script>
	$(document).ready(() => {
		$('#form').on('submit', e => {
			e.preventDefault()
			checkLogin()
		})
	})

	function checkLogin() {
		let username = $('#username').val()
		let password = $('#password').val()

		$.ajax({
			url: `<?= base_url('login/auth'); ?>`,
			type: 'post',
			dataType: 'json',
			data: {
				username: username,
				password: password
			},
			beforeSend: () => $('#submit').block({
				message: `<i class="fas fa-spinner fa-spin"></i>`
			}).attr('disabled', true)
		}).fail(e => Swal.fire({
			icon: 'warning',
			html: e.responseText,
		})).done(e => {
			if (e.code == 500) {
				Swal.fire({
					position: 'top-end',
					icon: 'error',
					title: e.msg,
					showConfirmButton: false,
					timer: 1500,
					toast: true
				}).then(() => {
					$('#username').focus()
					$('#submit').unblock().attr('disabled', false)
				})
			} else if (e.code == 200) {
				Swal.fire({
					position: 'top-end',
					icon: 'success',
					title: e.msg,
					showConfirmButton: false,
					timer: 1500,
					toast: true
				}).then(() => {
					$('#submit').unblock().attr('disabled', true)
					window.location.replace('<?= base_url('kasir'); ?>')
				})
			}
		})
	}
</script>
