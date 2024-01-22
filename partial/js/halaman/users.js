var table;
var button = [1, 2, 3, 4, 5]

var kolom= [
    {
        data: "id",
        orderable: false,
        searchable: false,
        render: function (data, type, row, meta) {
            return meta.row + meta.settings._iDisplayStart + 1;
        }
    },
    { data: "full_name" },
    { data: "username" },
    { data: "email" },
    { data: "level" },
];

var kolomDef = [
    {
        targets: 4,
        data: "level",
        orderable: false,
        searchable: false,
        render: function(data, type, row, meta) {
            const myArray = data.split(",");
            var kolek = '<div class="text-center">';
            for (let x in myArray) {
                kolek += '<span class="badge bg-secondary">' + myArray[x] + "</span> ";
            }
            kolek += '</div>';
            return kolek;
        }
    },
    {
        targets: 5,
        orderable: false,
        searchable: false,
        title: "Status",
        data: "active",
        render: function(data, type, row, meta) {
            if (data === "1") {
                return `<div class="text-center"><span class="badge bg-success">Active</span></div>`;
            } else {
                return `<div class="text-center"><span class="badge bg-danger">Not Active</span></div>`;
            }
        }
    },
    {
        targets: 6,
        data: "id",
        render: function(data, type, row, meta) {
            if (data === user_id) {
                return `<div class="text-center">
                        <button type="button" class="btn btn-sm bg-primary editUsers" onclick="edit(${data})" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit">
                            <i class="fa fa-cog fa-spin"></i>
                        </button>
                    </div>`;
            } else {
                return `<div class="text-center">
                        <button type="button" class="btn btn-sm btn-warning editUsers" onclick="edit(${data})" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit">
                            <i class="fa fa-edit"></i>
                        </button>
                        <button type="button" class="btn btn-sm btn-danger" onclick="hapus(${data})" data-bs-toggle="tooltip" data-bs-placement="top" title="Hapus">
                            <i class="fa fa-trash"></i>
                        </button>
                    </div>`;
            }
        }
    }
];

$(document).ready(function() {

    default_table_init('users', "users/data/" + user_id, kolom, kolomDef, button)

    $("#show_me").on("change", function() {
        let src = site + "users/data";
        let url = $(this).prop("checked") === true ? src : src + "/" + user_id;
        table.ajax.url(url).load();
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
});

var myModalEl = document.getElementById('myModal')
myModalEl.addEventListener('hide.bs.modal', function (event) {
    $('#userForm')[0].reset();
    $('#userForm input').trigger('change');
    $(".select2").val('').trigger('change');
})
const myModal = new bootstrap.Modal(document.getElementById('myModal'))
$('#tambahUser').on('click', function(){
    myModal.show();
});

$('form#userForm input, form#userForm select').on('change', function(){
    $(this).removeClass('is-invalid');  
    $(this).nextAll('.invalid-feedback').text(''); 
});

_submit('#userForm', function(data, msg){
    setTimeout(function() {
        swal.close()
        if (data.status) {
            myModal.hide()
            swal.fire({
                "title": "Sukses",
                "text": "Data Berhasil " + msg,
                "icon": "success"
            }).then((data) => {
                if (data.value) {
                    reload_ajax('users')
                }
            });
        }else{
            if(data.errors != undefined){
                error_display(data.errors);
            }
        }
    }, 800);
});

$('#saveBtn').on('click', function(){
    $('#userForm').trigger('submit');
});

function edit(id){
    _edit(id, 'users/edit', function(data){
        if(data.status){
            users = data.result;
            fullname = users.first_name + ' ' + users.last_name
            $('#userForm input[name="mode"]').val('edit');
            $('#userForm').append('<input type="hidden" name="id" value="'+ users.id +'"/>');
            $('#userForm input[name="full_name"]').val(fullname);
            $('#userForm input[name="username"]').val(users.username);
            $('#userForm input[name="email"]').val(users.email);
            level = users.level.split(":");
            if(users.active == '0'){
                $('#user_deactive').prop("checked", true);
            }else if(users.active == '1'){
                $('#user_active').prop("checked", true);
            }
            $('#level').val(level).trigger('change');
            setTimeout(function() {
                swal.close();
                myModal.show();
            }, 800);
        }
    });
}

function hapus(id) {
    _hapus(id, 'users/delete',function(){
        setTimeout(function() {
            swal.fire({
                "title": "Sukses",
                "text": "Data Berhasil dihapus",
                "icon": "success"
            }).then((data) => {
                if (data.value) {
                    reload_ajax('users');
                }
            });
        }, 800);
    })
}
