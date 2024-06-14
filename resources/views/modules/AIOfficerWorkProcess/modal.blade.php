<!-- Modal câu trả lời -->
<!-- ---------------------------------------------------------------------------------------- -->
<div id="actionModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" style="max-width: 1700px; width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Danh sách quá trình công tác</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-8">
                        <div align="right">
                            <button type="button" class="btn btn-success" onclick="func_buttonClick(`add`,0)">Thêm</button>
                        </div>
                        <table id="table_action" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Quá trình công tác</th>
                                    <th>Từ thời điểm</th>
                                    <th>Đến thời điểm</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <div class="right-col col-sm-4">
                        <h4 id="form_title"></h4>
                        <form id="form_action">
                            <input type="hidden" name="id" class="form-control">
                            <input type="hidden" name="action_type" class="form-control">
                            <input type="hidden" name="id_officer" class="form-control">
                            <div class="form-group">
                                <label class="col-form-label">Chức danh, chức vụ, đơn vị công tác <code>*</code></label>
                                <input type="text" name="information" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Từ thời điểm <code>*</code></label>
                                <input type="date" name="from_the_time" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Đến thời điểm <code>*</code></label>
                                <input type="date" name="till_the_time" class="form-control">
                            </div>
                            <div>
                                <button type="submit" class="btn btn-success">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Delete-->
<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel"></h5>
            </div>
            <div class="modal-body">
                <form id="form-delete">
                    <input type="hidden" name="id" id="id">
                    <input type="hidden" name="action_type" id="action_type">
                    <div class="question-to-confirm"></div>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-danger" id="delete">Xóa</button>
                    </div>
                </form> 
            </div>
        </div>
    </div>
</div>