<div class="card">
    <div class="card-header">
        <?= $model_info->template_name ?>
    </div>
    <div class="card-body">
        <?= form_open('settings/save_template', array('id' => 'templateForm'), array('mode' => 'add', 'id' => $model_info->id)) ?>
        <div class="mb-3">
            <label for="email_subject">Email Subject</label>
            <?php
            echo form_input(array(
                "id" => "email_subject",
                "name" => "email_subject",
                "value" => $model_info->email_subject,
                "class" => "form-control",
                "placeholder" => 'Subject',
            ));
            ?>
        </div>
        <div class="mb-3">
            <?php
            echo form_textarea(array(
                "id" => "custom_message",
                "name" => "custom_message",
                "value" => $model_info->custom_message ? $model_info->custom_message : $model_info->default_message,
                "class" => "form-control"
            ));
            ?>
        </div>
        <?= form_close() ?>
    </div>
    <div class="card-footer">
        <div>
            <strong>Variable Yang Tersedia</strong>:
            <?php
            foreach ($variables as $variable) {
                echo "{" . $variable . "}, ";
            }
            ?>
        </div>
        <hr />
        <div class="m-0">
            <button type="button" id="submitTemplate" class="btn btn-primary mr15"><span class="fa fa-check-circle"></span> Simpan</button>
            <button type="button" id="restore_to_default" class="btn btn-danger" data-toggle="popover" data-id="<?php echo $model_info->id; ?>" data-placement="top"><span class="fa fa-refresh"></span> Restore To Default</button>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#custom_message').summernote();
    });

    _submit('#templateForm', function(data, msg) {
        setTimeout(function() {
            swal.close()
            console.log(data);
            if (data.status) {
                swal.fire({
                    "title": "Sukses",
                    "text": "Berhasil Menyimpan Template",
                    "icon": "success"
                })
            }
        }, 800);
    });

    $('#submitTemplate').on('click', function() {
        var subject = $('#templateForm input[name="email_subject"]').val();
        // validasi manual aja dulu soalnya inputannya cuman 1
        if (subject == '') {
            $('[name="email_subject"]').addClass('is-invalid');
            $('[name="email_subject"]').nextAll('.invalid-feedback').text('Masih Kosong Mohon diisi!');
        } else {
            $('#templateForm').trigger('submit');
        }
    });
    $('#restore_to_default').on('click', function() {
        var id = $('#templateForm input[name="id"]').val();
        Swal.fire({
            title: "Anda yakin?",
            text: "ingin mengembalikan ke default?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Ya!",
            cancelButtonText: "Batal"
        }).then(result => {
            if (result.value) {
                ajaxcsrf();
                $.ajax({
                    url: site + 'settings/restore_template',
                    data: {
                        id: id
                    },
                    method: 'POST',
                    dataType: 'JSON',
                    beforeSend: function() {
                        swal.fire({
                            title: 'Menunggu',
                            html: 'Memproses data',
                            didOpen: () => {
                                swal.showLoading()
                            }
                        })
                    },
                    success: function(data) {
                        setTimeout(function() {
                            swal.close()
                            if (data.status) {
                                swal.fire({
                                    "title": "Sukses",
                                    "text": "Berhasil Mengembalikan Template Bawaan",
                                    "icon": "success"
                                })
                                $('#custom_message').summernote('code', data.default);
                            }
                        }, 800);

                    },
                    error: function(data) {
                        console.log(data.responseText);
                        ask_to_reload()
                    }
                });
            }
        });
    })
</script>