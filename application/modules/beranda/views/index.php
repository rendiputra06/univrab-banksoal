<!-- Main content -->
<section class='content'>
  <div class="row">
    <div class="col-md-12">
      <div class="jumbotron" style="padding: 35vh 0; background-color: transparent;">
        <center>
          <h2><b>Dashboard</b> Page</h2>
          <p><?= base_url() . 'Login =>' . $this->ion_auth->logged_in() ?></p>
          <button class="btn btn-primary klik">Test Klik</button>
        </center>
      </div>
    </div>
  </div>
</section>

<script src="<?= base_url() ?>/partial/js/halaman/beranda.js"></script>