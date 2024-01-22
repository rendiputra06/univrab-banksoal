<div class="card">
    <div class="card-header">
        <h4 class="card-title">Pengaturan Menu</h4>
        <p class="card-title-desc">Atur menu sesuai jenis posisi / tipe</p>
    </div><!-- end card header -->

    <div class="card-body">
        <div class="row">
            <div class="col-md-3">
                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="nav-link mb-2 active" data-bs-toggle="pill" href="#v-pills-side" role="tab" aria-controls="v-pills-side">Side Menu</a>
                    <a class="nav-link mb-2" data-bs-toggle="pill" href="#v-pills-top" role="tab" aria-controls="v-pills-top">Top Menu</a>
                </div>
            </div><!-- end col -->
            <div class="col-md-9 border-start">
                <div class="tab-content text-muted mt-4 mt-md-0" id="v-pills-tabContent">
                    <div class="tab-pane fade active show" id="v-pills-side" role="tabpanel" aria-labelledby="v-pills-side-tab">
                        <div class="mb-3">
                            <button type="button" class="btn btn-primary tambah-menu" data-type="1"><i class="fa fa-add"></i> Tambah</button>
                        </div>
                        <div class="dd" id="nestable" style="width: 100%;">
                            <?php
                            if (empty($menu)) : ?>
                                <div class="box-no-data">No data menu</div>
                            <?php else :
                                echo $menu;
                            endif; ?>
                        </div>
                        <div class="nestable-output"></div>
                    </div>
                    <!-- end tab -->
                    <div class="tab-pane fade" id="v-pills-top" role="tabpanel" aria-labelledby="v-pills-top-tab">
                        <div class="mb-3">
                            <button type="button" class="btn btn-primary tambah-menu" data-type="2"><i class="fa fa-add"></i> Tambah</button>
                        </div>
                        <div class="dd" id="nestable" style="width: 100%;">
                            <?php
                            if (empty($topMenu)) : ?>
                                <div class="box-no-data">No data menu</div>
                            <?php else :
                                echo $topMenu;
                            endif; ?>
                        </div>
                        <div class="nestable-output"></div>
                    </div>
                    <!-- end tab -->
                </div>
            </div><!--  end col -->
        </div><!-- end row -->
    </div><!-- end card-body -->
</div>
<style>
    .select2-container--default .select2-selection--single {
        padding: 6px;
        height: 37px;
        font-size: 1em;
    }

    .is-invalid .select2-container--default .select2-selection--single {
        border-color: rgb(185, 74, 72) !important;
    }
</style>
<div id="myModal" class="modal fade" tabindex="-1" data-bs-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Tambah Menu</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <?= form_open('menu/save', array('id' => 'menuForm'), array('mode' => 'add', 'menu_type_id' => 1)) ?>
                <div class="mb-3">
                    <label for="example-text-input" class="form-label">Icon</label>
                    <small class="info help-block">(Contoh Icon bisa dilihat disini : <a target="_black" href="https://feathericons.com/">https://feathericons.com/</a>)</small>
                    <input class="form-control" type="text" value="" name="icon">
                    <div class="invalid-feedback"></div>
                </div>
                <div class="mb-3">
                    <label for="example-text-input" class="form-label">Parent</label>
                    <select name="parent" id="parent" class="form-control select2" data-url="menu/cari_parent_select2" style="width: 100%;">
                        <option value="">Pilih Parent</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="example-text-input" class="form-label">Nama</label>
                    <input class="form-control" type="text" value="" name="label">
                    <div class="invalid-feedback"></div>
                </div>
                <div class="mb-3">
                    <label for="example-text-input" class="form-label">Link</label>
                    <input class="form-control" type="text" value="" name="link">
                    <div class="invalid-feedback"></div>
                </div>
                <div class="mb-3">
                    <label for="example-text-input" class="form-label">Menu Tipe</label>
                    <div class="row">
                        <div class="col-6">
                            <input class="form-check-input" type="radio" name="type_menu" id="menu_type" value="menu" checked>
                            <label class="form-check-label" for="menu_type">
                                Menu
                            </label>
                        </div>
                        <div class="col-6">
                            <input class="form-check-input" type="radio" name="type_menu" id="menu_type2" value="label">
                            <label class="form-check-label" for="menu_type2">
                                Label
                            </label>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="example-text-input" class="form-label">Diakses Oleh</label>
                    <select name="group[]" id="group" class="form-control select2" data-url="menu/cari_group_select2" style="width: 100%;" multiple="multiple">
                    </select>
                    <div class="invalid-feedback"></div>
                </div>
                <?= form_close() ?>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">Tutup</button>
                <button type="button" class="btn btn-primary waves-effect waves-light" id="saveBtn">Simpan</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->