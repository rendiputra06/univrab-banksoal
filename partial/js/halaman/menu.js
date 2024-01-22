$(document).ready(function(){
    $('#nestable').nestable({
        group: 1
    });
    $('.select2').each(function(index, element) {
        var initValue = element.dataset.value != undefined ? element.dataset.value : false;
        var item = $(element);
        if (item.data('url')) {
            CustomInitSelect2(item, {
                url: item.data('url'),
                initialValue: initValue,
            }, myModalEl);
        } else {
            item.select2();
        }
    });

    // Activate tabs on click
    $('#v-pills-tab a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });

    // Store the currently selected tab in the hash value
    $('#v-pills-tab a').on('shown.bs.tab', function(e) {
        var id = $(e.target).attr('href').substr(1);
        window.location.hash = id;
    });

    // Activate the tab based on the hash value in the URL
    var hash = window.location.hash;
    if (hash) {
        $('#v-pills-tab a[href="' + hash + '"]').tab('show');
    }
});

var myModalEl = document.getElementById('myModal')
myModalEl.addEventListener('hide.bs.modal', function (event) {
    $('#menuForm')[0].reset();
    $(".select2").val('').trigger('change') ;
})

const myModal = new bootstrap.Modal(document.getElementById('myModal'))
$('.tambah-menu').on('click', function(){
    myModal.show();
    typeID = $(this).data('type')
    console.log(typeID);
    $('input[name="menu_type_id"]').val(typeID)
});

$('.addchildBtn').on('click', function(){
    var id = $(this).data('id')
    $('#parent').val(id).trigger('change');
    myModal.show();
});
    
$('form#menuForm input, form#menuForm select').on('change', function(){
    $(this).removeClass('is-invalid');  
    $(this).nextAll('.invalid-feedback').text(''); 
});

_submit('#menuForm', function(data, msg){
    setTimeout(function() {
        swal.close()
        if (data.status) {
            myModal.hide();
            swal.fire({
                "title": "Sukses",
                "text": "Data Berhasil " + msg,
                "icon": "success"
            }).then((data) => {
                if (data.value) {
                    window.location.href = base+'menu';
                }
            });
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
});

$('#saveBtn').on('click', function(){
    $('#menuForm').trigger('submit');
});

$('.editMenu').on('click', function(){
    id = $(this).data('id');
    _edit(id, 'menu/editMenu', function(data){
        if(data.status){
            $('#menuForm input[name="mode"]').val('edit');
            // append input for id
            $('#menuForm').append('<input type="hidden" name="id" value="'+ data.menu.id +'"/>');
            $('#menuForm input[name="icon"]').val(data.menu.icon).trigger('change');
            $('#menuForm input[name="label"]').val(data.menu.label).trigger('change');
            $('#menuForm input[name="link"]').val(data.menu.link).trigger('change');
            $('#parent').val(data.menu.parent).trigger('change');
            level = data.menu.level.split(":");
            $('#group').val(level).trigger('change');
            $("input[name=type_menu][value=" + data.menu.type + "]").prop('checked', true);
            setTimeout(function() {
                swal.close()
                myModal.show();
            }, 800);
            console.log(data);
        }
    });
});

$('.removeMenu').click(function() {
    id = $(this).data('id');
    _hapus(id, 'menu/delete',function(data){
        setTimeout(function() {
            if(data.status){
                Swal.fire("Terhapus!", "Menu Berhasil dihapus.", "success").then((data) => {
                    if (data.value) {
                        window.location.href = base+'menu';
                    }
                });;
            }
        }, 800);
    })
}); /*end remove data click*/

$('#reloadBtn').on('click', function(){
    window.location.href = base+'menu';
})

$('.dd').on('change', function() {
    setTimeout(updateOrderMenu, 2000);
});


function updateOrderMenu(ignoreMessage) {
    var shownotif = true;
    var menu = $('.dd').nestable('serialize');

    if (typeof ignoreMessage == 'undefined') {
        var ignoreMessage = false;
    }
    ajaxcsrf();
    $.ajax({
        url: site + 'menu/save_ordering',
        type: 'POST',
        dataType: 'JSON',
        data: {'menu': menu},
    })
    .done(function(res) {
        if (res.success) {
            $('#side-menu').html(res.menu);
            $("#side-menu").metisMenu();
            feather.replace()   
            if(shownotif) {
                if (!ignoreMessage) {
                  alertify.success(res.message);
                }
            }
        } else {
            if (shownotif) {
                if (!ignoreMessage) {
                  alertify.error(res.message);
                }
            }
        }
    })
    .fail(function() {
        if (!ignoreMessage) {
            alertify.error('Error save data please try again later');
        }
    })
}
