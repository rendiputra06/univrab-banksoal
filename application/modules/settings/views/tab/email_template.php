<div class="row">
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Email Template</h4>
            </div><!-- end card header -->

            <div class="card-body">
                <div class="accordion accordion-flush" id="accordionFlushExample">
                    <?php foreach ($templates as $template => $value) :
                        //collapse the selected template tab panel
                        $collapse_in = "";
                        $collapsed_class = "collapsed";
                    ?>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingOne">
                                <button class="accordion-button fw-medium <?= $collapsed_class ?>" type="button" data-bs-toggle="collapse" data-bs-target="#flush-<?= $template ?>" aria-expanded="true" aria-controls="flush-<?= $template ?>">
                                    <?= $template ?>
                                </button>
                            </h2>
                            <div id="flush-<?= $template ?>" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body text-muted">
                                    <div class="nav flex-column nav-pills" id="<?= $template ?>-tab" role="tablist" aria-orientation="vertical">
                                        <?php foreach ($value as $sub_template_name => $sub_template) :  ?>
                                            <span class="nav-link email-template-row clickable mb-2" data-bs-toggle="pill" data-name="<?= $sub_template_name ?>" role="tab"><?= $sub_template_name ?></span>
                                        <?php endforeach ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endforeach ?>
                </div><!-- end accordion -->
                <div class="mt-3">
                    <button class="btn btn-info" id="test">Test Send Email</button>
                </div>
            </div><!-- end card-body -->
        </div>
    </div>
    <!-- end col -->
    <div class="col-xl-9 col-lg-8 col-md-6">
        <div id="template-details-section">
            <div id="empty-template" class="text-center p15 card">
                <div class="card-body" style="vertical-align: middle; height: 100%">
                    <div>Pilih Template untuk diedit</div>
                    <span class="fa fa-code" style="font-size: 1450%; color:#f6f8f8"></span>
                </div>
            </div>
        </div>
    </div>
</div>