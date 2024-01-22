function CustomInitSelect2(element, options, parent = null) {
    ajaxcsrf();
    var dropdownParent = parent != null ? parent : $(document.body);
    if (options.url) {
        $.ajax({
            type: 'POST',
            url: site+options.url,
            dataType: 'json',
        }).then(function(data) {
            element.select2({
                data: data,
                dropdownParent: dropdownParent
            });
            if (options.initialValue) {
                element.val(options.initialValue).trigger('change');
            }
        });
    }
}

function reload_ajax(tableId) {
    if ($.fn.DataTable.isDataTable( '#'+tableId ) ) {
        $('#'+tableId).DataTable().ajax.reload(null, false);
    }
}

function _submit(form,success_function)
{
    $(form).submit(function(e){
        var mode = $(this).find('input[name="mode"]').val();
        var msg = mode == 'add' ? 'disimpan' : 'diedit';
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
                success_function(data, msg);
            },
            error: function(data) {
                console.log(data.responseText);
                ask_to_reload();
            }
        })
    });
}

function error_display(errors)
{
    $.each(errors, function(key, value) {
        $('[name="' + key + '"]').addClass('is-invalid');
        $('[name="' + key + '"]').nextAll('.invalid-feedback').text(value); 
        if (value == "") {
            $('[name="' + key + '"]').removeClass('is-invalid');
            $('[name="' + key + '"]').addClass('is-valid');
        }
    });
}

function _edit(id, url, success_function)
{
    ajaxcsrf();
    $.ajax({
        url: site+url,
        data : {id:id},method:'POST',dataType:'JSON',
        beforeSend: function() {
            swal.fire({title: 'Menunggu',html: 'Memproses data',didOpen: () => {swal.showLoading()}})
        },
        success: function(data){
            success_function(data)
        },
        error: function(data)
        {
            console.log(data.responseText);
            ask_to_reload();
        }
    });
}

function _hapus(id, url, success_function)
{
    Swal.fire({
        title: "Anda yakin?",
        text: "ingin menghapus data ini?",
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
                url: site+url,
                data : {id:id},method:'POST',dataType:'JSON',
                beforeSend: function() {
                    swal.fire({title: 'Menunggu',html: 'Memproses data',didOpen: () => {swal.showLoading()}})
                },
                success: function(data){
                    success_function(data)
                },
                error: function(data)
                {
                    console.log(data.responseText);
                    ask_to_reload()
                }
            });
        }
    });
}

// berguna untuk fungsi ajax yang hanya mengirimkan id dan mengirimkan view
function _ajax_wid(id, url, success_function)
{
    ajaxcsrf();
    $.ajax({
        url: site+url,
        data : {id:id},method:'POST',
        beforeSend: function() {
            swal.fire({title: 'Menunggu',html: 'Memproses data',didOpen: () => {swal.showLoading()}})
        },
        success: function(data){
            success_function(data)
        },
        error: function(data)
        {
            console.log(data.responseText);
            ask_to_reload();
        }
    });
}

function ask_to_reload()
{
    Swal.fire({
        title: "Terjadi Kesalahan / Jaringan Error!?",
        text: "Refresh halaman???",
        icon: "error",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Ya!",
        cancelButtonText: "Batal"
    }).then(result => {
        if (result.value) {
            location.reload();
           console.log('refresh');
        }
    });
}

function default_table_init(table_id, url, columns = [], columnDefs = [], button = [], order = [1, 'asc'], filter = false){
    if ( ! $.fn.DataTable.isDataTable( '#'+table_id ) ) {
        // Setup datatables
        $.fn.dataTableExt.oApi.fnPagingInfo = function(oSettings)
        {
            return {
                "iStart": oSettings._iDisplayStart,
                "iEnd": oSettings.fnDisplayEnd(),
                "iLength": oSettings._iDisplayLength,
                "iTotal": oSettings.fnRecordsTotal(),
                "iFilteredTotal": oSettings.fnRecordsDisplay(),
                "iPage": Math.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength),
                "iTotalPages": Math.ceil(oSettings.fnRecordsDisplay() / oSettings._iDisplayLength)
            };
        };

        table = $("#" + table_id).dataTable({
            initComplete: function() {
                var api = this.api();
                $('#mytable_filter input')
                    .off('.DT')
                    .on('input.DT', function() {
                        api.search(this.value).draw();
                });
            },
            dom: "<'row'<'col-sm-3'l><'col-sm-6 text-center'B><'col-sm-3'f>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-5'i><'col-sm-7'p>>",
            buttons: [
                {
                    extend: "copy",
                    exportOptions: { columns: button }
                },
                {
                    extend: "print",
                    exportOptions: { columns: button }
                },
                {
                    extend: "excel",
                    exportOptions: { columns: button }
                },
                {
                    extend: "pdf",
                    exportOptions: { columns: button }
                }
            ],
            oLanguage: {
                sProcessing: "Memproses Data..."
            },
            processing: true,
            serverSide: true,
            ajax: {
                url: site + url,
                type: "POST",
                data: function(data){
                    var value = $.cookie('csrf_cookie_name');
                    data[csrfname] = value
                },
            },
            columns: columns,
            columnDefs: columnDefs,
            order: [order],
            rowCallback: function(row, data, iDisplayIndex) {
                var info = this.fnPagingInfo();
                var page = info.iPage;
                var length = info.iLength;
                $('td:eq(0)', row).html();
            }
        });
        try {
            table.buttons().container().appendTo("#"+table_id+"_wrapper .col-md-6:eq(0)");
        }
        catch(err) {
            console.log(err);
        }

    }else{
        $('#' + table_id).DataTable().ajax.reload();
    }
}

function simple_datatables(table_id, url, columns = []){
    if ( ! $.fn.DataTable.isDataTable( '#'+table_id ) ) {
        return $("#" + table_id).dataTable({
            oLanguage: {
                sProcessing: "loading..."
            },
            processing: true,
            serverSide: true,
            searching: false,
            paging: false,
            ordering: false,
            info: false,
            ajax: {
                url: site + url,
                type: "POST",
                data: function(data){
                    var value = $.cookie('csrf_cookie_name');
                    data[csrfname] = value
                },
            },
            columns: columns,     
        });
    }else{
        $('#' + table_id).DataTable().ajax.reload();
    }
}
function init_dropify(element, link = ''){
    let drop = $(element);
    drEvent = drop.data('dropify');
    if(drEvent == undefined){
        console.log('saya if = ' + link);
        drop.dropify({
            defaultFile: link,
            messages: {
                default: 'Drag atau drop untuk memilih File',
                replace: 'Ganti',
                remove: 'Hapus',
                error: 'error'
            }
        });
    }else{
        console.log('saya else');
        drEvent.destroy();
        drEvent.settings.defaultFile = link;
        drEvent.init();
    }
}

function load_unseen_notification(view = '')
{
    console.log('i run ..');
    ajaxcsrf();
    $.ajax({
        url:site+"profile/notif",
        method:"POST",
        data:{view:view},
        dataType:"json",
        success:function(data)
        {
            console.log(data);
            $('#show_notif').html(data.notification);
            if(data.unseen_notification > 0){
                $('#new_notif').html(data.unseen_notification);
            }
        }
    });
}

