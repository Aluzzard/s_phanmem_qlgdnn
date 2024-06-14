<div id="modal_2" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title">Cấu hình hiển thị thông tin</h4>
            </div>
            <div class="modal-body">
                <form id="form-action-config" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action_type" class="form-control" value="edit_website_config">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="colorpicker-inner ts-forms mg-b-23">
                                <div class="tsbox">
                                    <label class="label">
                                        Màu gradient: </label>
                                    <label class="color-group" for="color_gradient">
                                        <input type="text" id="color_gradient" name="color_gradient">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="colorpicker-inner ts-forms mg-b-23">
                                <div class="tsbox">
                                    <label class="label">
                                        Màu nền: </label>
                                    <label class="color-group" for="color_background">
                                        <input type="text" id="color_background" name="color_background">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="colorpicker-inner ts-forms mg-b-23">
                                <div class="tsbox">
                                    <label class="label">
                                        Màu chữ: </label>
                                    <label class="color-group" for="color_font">
                                        <input type="text" id="color_font" name="color_font">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="colorpicker-inner ts-forms mg-b-23">
                                <div class="tsbox">
                                    <label class="label">
                                        Màu chữ hover: </label>
                                    <label class="color-group" for="color_font_hover">
                                        <input type="text" id="color_font_hover" name="color_font_hover">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="colorpicker-inner ts-forms mg-b-23">
                                <div class="tsbox">
                                    <label class="label">
                                        Màu chữ focus: </label>
                                    <label class="color-group" for="color_font_focus">
                                        <input type="text" id="color_font_focus" name="color_font_focus">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>