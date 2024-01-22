<!DOCTYPE html>
<html lang="en">

<head>
    <title><?php echo $this->template->title->default("Default title"); ?> | <?= $this->config->item('system_title'); ?></title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="<?php echo $this->template->description; ?>">
    <meta name="author" content="">
    <?php echo $this->template->meta; ?>
    <!-- App favicon -->
    <link rel="shortcut icon" href="<?= base_url() ?>partial/images/favicon.ico">
    <link href="<?= base_url() ?>partial/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- preloader css -->
    <link rel="stylesheet" href="<?= base_url() ?>partial/css/preloader.min.css" type="text/css" />
    <!-- Bootstrap Css -->
    <link href="<?= base_url() ?>partial/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="<?= base_url() ?>partial/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="<?= base_url() ?>partial/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <link href="<?= base_url() ?>partial/libs/sweetalert2/sweetalert2.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <link href="<?= base_url() ?>partial//libs/alertifyjs/build/css/alertify.min.css" id="app-style" rel="stylesheet" type="text/css" />

    <?php echo $this->template->stylesheet; ?>
</head>

<!--All Vertical Pages-->

<body <?= $this->config->item('theme') == 'dark' ? 'data-layout-mode="dark" data-topbar="dark" data-sidebar="dark"' : '' ?>>

    <!-- Begin page -->
    <div id="layout-wrapper">

        <!-- if you select vertical Menu then comment Horizontal Menu and uncomment this-->
        <header id="page-topbar">
            <?= $this->template->widget("admin_navbar"); ?>
        </header>

        <!-- /.navbar -->
        <!-- ========== Left Sidebar Start ========== -->
        <?= $this->template->widget("admin_menu"); ?>
        <!-- Left Sidebar End -->

        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->
        <div class="main-content">

            <div class="page-content">
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0 font-size-18"><?php echo $this->template->title->default("Default title"); ?></h4>
                                <?= $this->breadcrumbs->show(); ?>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <?= $this->template->content; ?>
                </div>
                <!-- container-fluid -->
            </div>
            <!-- End Page-content -->

            <footer class="footer">
                <?= $this->template->widget("admin_footer"); ?>
            </footer>
        </div>
        <!-- end main content-->

    </div>
    <!-- END layout-wrapper -->

    <!-- JAVASCRIPT -->
    <script src="<?= base_url() ?>partial/libs/jquery/jquery.min.js"></script>
    <script src="<?= base_url() ?>partial/libs/jquery/jquery.cookie.min.js"></script>
    <script src="<?= base_url() ?>partial/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<?= base_url() ?>partial/libs/metismenu/metisMenu.min.js"></script>
    <script src="<?= base_url() ?>partial/libs/simplebar/simplebar.min.js"></script>
    <script src="<?= base_url() ?>partial/libs/node-waves/waves.min.js"></script>
    <script src="<?= base_url() ?>partial/libs/feather-icons/feather.min.js"></script>
    <script src="<?= base_url() ?>partial/libs/sweetalert2/sweetalert2.min.js"></script>
    <script src="<?= base_url() ?>partial/libs/alertifyjs/build/alertify.min.js"></script>
    <!-- pace js -->
    <script src="<?= base_url() ?>partial/libs/pace-js/pace.min.js"></script>
    <!-- apexcharts -->
    <script src="<?= base_url() ?>partial/libs/apexcharts/apexcharts.min.js"></script>
    <!-- App js -->
    <script src="<?= base_url() ?>partial/js/app.js?v=0.0.1"></script>

    <script>
        site = "<?= site_url() ?>"
        base = "<?= base_url() ?>"

        var csrfname = '<?= $this->security->get_csrf_token_name() ?>';

        function ajaxcsrf() {
            var csrf = {};
            csrf[csrfname] = $.cookie('csrf_cookie_name');
            $.ajaxSetup({
                "data": csrf
            });
        }
    </script>
    <script src="<?= base_url() ?>partial/js/index.js?v=0.0.1"></script>
    <script src="<?= base_url() ?>partial/js/start.js?v=0.0.1"></script>
    <?php echo $this->template->javascript; ?>

</body>

</html>