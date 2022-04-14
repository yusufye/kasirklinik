<nav class="navbar navbar-expand-lg fixed-bottom navbar-dark bg-dark">
	<div class="navbar-brand">
		<img src="<?= base_url('assets/img/logo swr frozen food.jpeg'); ?>" alt="LOGO <?= APP_NAME; ?>" class="img-fluid" style="width: 50px;" />
		<!-- <a href="https://trijayasolution.co.id/" target="_blank" class="text-white" style="font-size: 14px;"><i class="fas fa-copyright fa-fw"></i> CV. Trijaya Solution — <?= APP_VERSION; ?></a> -->
	</div>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		<div class="navbar-nav mr-auto">
			<a class="nav-link <?= ($this->uri->segment(1) == "kasir") ? "active" : null; ?>" href="#">
				<i class="fas fa-cash-register fa-fw"></i> Kasir
			</a>
			<a class="nav-link <?= ($this->uri->segment(1) == "laporan") ? "active" : null; ?>" href="#" onclick="modalLaporan()">
				<i class="fas fa-file-alt fa-fw"></i> Laporan Penjualan
			</a>
			<a class="nav-link <?= ($this->uri->segment(1) == "akun") ? "active" : null; ?>" onclick="modalPassword()" role="button">
				<i class="fas fa-user fa-fw"></i> Ganti Password
			</a>
			<a class="nav-link" href="<?= base_url('logout'); ?>">
				<i class="fas fa-sign-out-alt fa-fw"></i> <?= $this->session->userdata(APP_ABBR . 'name'); ?> Keluar
			</a>
		</div>
		<div class="navbar-nav ml-auto">
			<div id="jam" class="jam" onload="showTime()"></div>
			<!-- <span class="text-white" id="jam">
				Monday, 31-12-2021 88:88:88
			</span> -->
		</div>
	</div>
</nav>
