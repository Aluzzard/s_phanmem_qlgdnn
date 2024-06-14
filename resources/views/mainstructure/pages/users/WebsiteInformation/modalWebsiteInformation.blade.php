<div id="modal_1" class="modal fade" role="dialog">
    <div class="modal-dialog" style="max-width: 1700px; width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title">Chỉnh sửa thông tin</h4>
            </div>
            <div class="modal-body">
                <form id="form-action-information" method="post" enctype="multipart/form-data">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Tên đơn vị: <code>*</code></label>
                        <div class="col-sm-10">
                            <input type="text" id="id_input_name" name="name" class="form-control">
                            <input type="hidden" name="action_type" class="form-control" value="edit_website_information">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Địa chỉ: <code>*</code></label>
                        <div class="col-sm-10">
                            <input type="text" id="id_input_address" name="address" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Fax: </label>
                        <div class="col-sm-10">
                            <input type="text" id="id_input_fax" name="fax" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Số điện thoại: </label>
                        <div class="col-sm-10">
                            <input type="text" id="id_input_numberphone" name="numberphone" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Email: </label>
                        <div class="col-sm-10">
                            <input type="text" id="id_input_email" name="email" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Hotline: </label>
                        <div class="col-sm-10">
                            <input type="text" id="id_input_hotline" name="hotline" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Logo: </label>
                        <div class="col-sm-10">
                            <input type="file" id="id_input_logo" name="logo" class="form-control">
                            <img name="logo" src="" width="100px">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>