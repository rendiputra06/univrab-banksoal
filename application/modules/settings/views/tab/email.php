<div class="row">
    <div class="col-lg-9">
        <div class="card">
            <div class="card-body">
                <?= form_open('settings/save_email', array('id' => 'emailForm'), array('mode' => 'add')) ?>
                <div class="row mb-4">
                    <label for="email_sent_from_address" class="col-sm-3 col-form-label">Email Pengirim</label>
                    <div class="col-sm-9">
                        <?php
                        echo form_input(array(
                            "id" => "email_sent_from_address",
                            "name" => "email_sent_from_address",
                            "value" => get_setting('email_sent_from_address'),
                            "class" => "form-control",
                            "placeholder" => "somemail@somedomain.com",
                        ));
                        ?>
                    </div>
                </div>

                <div class="row mb-4">
                    <label for="email_sent_from_name" class="col-sm-3 col-form-label">Email Atas Nama</label>
                    <div class="col-sm-9">
                        <?php
                        echo form_input(array(
                            "id" => "email_sent_from_name",
                            "name" => "email_sent_from_name",
                            "value" => get_setting('email_sent_from_name'),
                            "class" => "form-control",
                            "placeholder" => "Email Atas Nama",
                        ));
                        ?>
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="use_smtp" class="col-sm-3 col-form-label">Menggunakan SMTP</label>
                    <div class="col-sm-9">
                        <?php
                        echo form_checkbox(
                            "email_protocol",
                            "smtp",
                            get_setting('email_protocol') === "smtp" ? true : false,
                            "id='use_smtp'"
                        );
                        ?>
                    </div>
                </div>
                <div id="smtp_settings" class="<?php echo get_setting('email_protocol') === "smtp" ? "" : "hide"; ?>">
                    <div class="row mb-4">
                        <label for="email_smtp_host" class="col-sm-3 col-form-label">SMTP Host</label>
                        <div class="col-sm-9">
                            <?php
                            echo form_input(array(
                                "id" => "email_smtp_host",
                                "name" => "email_smtp_host",
                                "value" => get_setting('email_smtp_host'),
                                "class" => "form-control",
                                "placeholder" => 'SMTP Host',
                            ));
                            ?>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <label for="email_smtp_user" class="col-sm-3 col-form-label">SMTP User</label>
                        <div class="col-sm-9">
                            <?php
                            echo form_input(array(
                                "id" => "email_smtp_user",
                                "name" => "email_smtp_user",
                                "value" => get_setting('email_smtp_user'),
                                "class" => "form-control",
                                "placeholder" => 'SMTP User',
                            ));
                            ?>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <label for="email_smtp_pass" class="col-sm-3 col-form-label">SMTP Password</label>
                        <div class="col-sm-9">
                            <?php
                            echo form_password(array(
                                "id" => "email_smtp_pass",
                                "name" => "email_smtp_pass",
                                "value" => "",
                                "class" => "form-control",
                                "placeholder" => 'SMTP Password',
                            ));
                            ?>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <label for="email_smtp_port" class="col-sm-3 col-form-label">SMTP Port</label>
                        <div class="col-sm-9">
                            <?php
                            echo form_input(array(
                                "id" => "email_smtp_port",
                                "name" => "email_smtp_port",
                                "value" => get_setting('email_smtp_port'),
                                "class" => "form-control",
                                "placeholder" => 'SMTP Port',
                            ));
                            ?>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <label for="email_smtp_security_type" class="col-sm-3 col-form-label">Security Type</label>
                        <div class="col-sm-9">
                            <?php
                            echo form_dropdown(
                                "email_smtp_security_type",
                                array(
                                    "" => "-",
                                    "tls" => "TLS",
                                    "ssl" => "SSL"
                                ),
                                get_setting('email_smtp_security_type'),
                                "class='form-control select2 mini'"
                            );
                            ?>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <label for="send_test_mail_to" class="col-sm-3 col-form-label">Test Kirim</label>
                        <div class="col-sm-9">
                            <?php
                            echo form_input(array(
                                "id" => "send_test_mail_to",
                                "name" => "send_test_mail_to",
                                // "value" => get_setting('send_test_mail_to'),
                                "value" => 'rendisaputra@univrab.ac.id',
                                "class" => "form-control",
                                "placeholder" => "Kosongkan jika tidak ingin melakukan test pengiriman",
                            ));
                            ?>
                        </div>
                    </div>
                </div>
                <!-- end smtp_setting -->
                <?= form_close() ?>
            </div>
            <!-- end card-body -->
            <div class="card-footer">
                <button class="btn btn-primary float-end" id="submitEmail"><span class="fa fa-check-circle"></span> Simpan</button>
            </div>
        </div>
        <!-- end card -->
    </div>
</div>

<script>

</script>