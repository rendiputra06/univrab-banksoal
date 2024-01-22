$(document).ready(function() {
    columns = [
        {
            data: "id",
            orderable: false,
            searchable: false,
            render: function (data, type, row, meta) {
                return meta.row + meta.settings._iDisplayStart + 1;
            }
        },
        { data: "name" },
        { data: "description" }
    ];
    columnDefs = [
        {
            targets: 3,
            data: "id",
            render: function(data, type, row, meta) {
                return `<div class="text-center">
                        <button class="btn btn-sm btn-warning" onclick="edit(${data})">
                            <i class="fa fa-edit"></i>
                        </button>
                        <button type="button" class="btn btn-sm btn-danger" onclick="hapus(${data})">
                            <i class="fa fa-trash"></i>
                        </button>
                    </div>`;
            }
        }
    ];
    default_table_init('group', 'users/data_group', columns, columnDefs);
});

var myModalEl = document.getElementById('myModal')
myModalEl.addEventListener('hide.bs.modal', function (event) {
    $('#groupForm')[0].reset();
    $('#groupForm input').trigger('change');
})

const myModal = new bootstrap.Modal(document.getElementById('myModal'))
$('#tambahGroup').on('click', function(){
    $('#groupForm [name="mode"]').val('add');
    myModal.show();
});

_submit('#groupForm', function(data, msg){
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
                    reload_ajax('group')
                }
            });
        }else{
            if(data.errors != undefined){
                error_display(data.errors);
            }
        }
    }, 800);
});

$('form#groupForm input').on('change', function(){
    $(this).removeClass('is-invalid');
    $(this).nextAll('.invalid-feedback').text(''); 
});
$('#saveBtn').on('click', function(){
    $('#groupForm').trigger('submit');
});

function edit(id){
    _edit(id, 'users/edit_group', function(data){
        if(data.status){
            group = data.data;
            $('#groupForm [name="mode"]').val('edit');
            $('#groupForm [name="id"]').val(group.id)
            $('#groupForm [name="name"]').val(group.name)
            $('#groupForm [name="description"]').val(group.description)
            setTimeout(function() { 
                swal.close()
                myModal.show();
            }, 800);
        }
    })
}

function hapus(id) {
    _hapus(id, 'users/delete_group',function(data){
        setTimeout(function() {
            swal.fire({
                "title": "Sukses",
                "text": "Data Berhasil dihapus",
                "icon": "success"
            }).then((data) => {
                if (data.value) {
                    reload_ajax('group');
                }
            });
        }, 800);
    })
}