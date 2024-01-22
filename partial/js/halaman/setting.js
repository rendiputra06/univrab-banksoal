$(document).ready(function(){
    $('.dropify').dropify({
        messages: {
            default: 'Drag atau drop untuk memilih gambar',
            replace: 'Ganti',
            remove: 'Hapus',
            error: 'error'
        }
    });

    // Activate tabs on click
    $('#myTabs a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });

    // Store the currently selected tab in the hash value
    $('#myTabs a').on('shown.bs.tab', function(e) {
        var id = $(e.target).attr('href').substr(1);
        window.location.hash = id;
    });

    // Activate the tab based on the hash value in the URL
    var hash = window.location.hash;
    if (hash) {
        $('#myTabs a[href="' + hash + '"]').tab('show');
    }

     /*load a template details*/
     $(".email-template-row").click(function () {
        //don't load this message if already has selected.
        var template_name = $(this).attr("data-name");
        _ajax_wid(template_name, 'settings/form', function(result){
            setTimeout(function() {
                swal.close();
                $("#template-details-section").html(result);
            }, 800);
        })
    });

});
$('form#settingForm input').on('keydown', function(){
    $('#saveBtn').prop('disabled', false);
}); 

$('form#settingForm input').on('change', function(){
    $(this).removeClass('is-invalid');  
    $(this).nextAll('.invalid-feedback').text(''); 
});
$('#settingForm').submit(function(e){
    $(this).find('input[name="'+csrfname+'"]').val($.cookie('csrf_cookie_name'));
    e.preventDefault();
    $.ajax({
        url: $(this).attr('action'),
        data: new FormData(this),
        type: 'post', dataType: 'json',
        processData: false,
        contentType: false,
        cache: false,
        async: false,
        beforeSend: function() {
            swal.fire({title: 'Menunggu',html: 'Memproses data',didOpen: () => {swal.showLoading()}})
        },
        success: function(data) {
            console.log(data);
            setTimeout(function() {
                swal.close()
                if (data.status) {
                    swal.fire({
                        "title": "Sukses",
                        "text": "Data Berhasil disimpan",
                        "icon": "success"
                    })
                }else{
                    $.each(data.errors, function(key, value) {
                        $('[name="' + key + '"]').addClass('is-invalid');
                        $('[name="' + key + '"]').nextAll('.invalid-feedback').text(value); 
                        if (value == "") {
                            $('[name="' + key + '"]').removeClass('is-invalid');
                            $('[name="' + key + '"]').addClass('is-valid');
                        }
                    });
                }
               
            }, 800);
        },
        error: function(data) {
            swal.close()
            console.log(data.responseText);
        }
    })
});

$('form#uploadForm input').on('change', function(){
    $('#uploadBtn').prop('disabled', false);
    console.log('foto udah tukar');
});

$('#uploadForm').submit(function(e){
    $(this).find('input[name="'+csrfname+'"]').val($.cookie('csrf_cookie_name'));
    e.preventDefault();
    $.ajax({
        url: $(this).attr('action'),
        data: new FormData(this),
        type: 'post', dataType: 'json',
        processData: false,cache: false,
        contentType: false,async: false,
        beforeSend: function() {
            swal.fire({title: 'Menunggu',html: 'Memproses data',didOpen: () => {swal.showLoading()}})
        },
        success: function(data) {
            console.log(data);
            setTimeout(function() {
                swal.close()
                if (data.status) {
                    swal.fire({
                        "title": "Sukses","icon": "success",
                        "text": "Data Berhasil merubah foto",
                    }).then((data) => {
                        if (data.value) {
                            window.location.href = base+'settings';
                        }
                    });
                }else{
                    swal.fire({
                        "title": "Gagal","icon": "error",
                        "html": data.pesan,
                    });
                    console.log('gagal upload');
                }
            }, 800);
        },
        error: function(data) {
            swal.close()
            console.log(data.responseText);
        }
    })
});

$('#submitEmail').on('click', function(){
    $('#emailForm').trigger('submit');
});

_submit('#emailForm', function(data, msg){
    setTimeout(function() {
        swal.close()
        if (data.status) {
            if(data.test != undefined){
                if(data.test.success){
                    swal.fire({
                        "title": "Sukses",
                        "text": data.test.message,
                        "icon": "success"
                    })
                }else{
                    swal.fire({
                        "title": "Gagal",
                        "text": data.test.message,
                        "icon": "warning"
                    })
                }
            }else{
                swal.fire({
                    "title": "Sukses",
                    "text": "Data Berhasil " + msg,
                    "icon": "success"
                }).then((res) => {
                    if (res.value) {
                        // reload_ajax('jenis');
                        console.log(data);
                        window.location.href = base+'settings#email';
                    }
                });
            }
        }else{
            if(data.errors != undefined){
                $.each(data.errors, function(key, value) {
                    $('[name="' + key + '"]').addClass('is-invalid');
                    $('[name="' + key + '"]').nextAll('.invalid-feedback').text(value); 
                    if (value == "") {
                        $('[name="' + key + '"]').removeClass('is-invalid');
                        $('[name="' + key + '"]').addClass('is-valid');
                    }
                });
            }
        }
    }, 800);
});

$("#use_smtp").click(function() {
    if ($(this).is(":checked")) {
        $("#smtp_settings").removeClass("hide");
    } else {
        $("#smtp_settings").addClass("hide");
    }
});

$('form#emailForm input').on('change', function(){
    $(this).removeClass('is-invalid');  
    $(this).nextAll('.invalid-feedback').text(''); 
});