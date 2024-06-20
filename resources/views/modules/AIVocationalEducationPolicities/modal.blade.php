<div id="actionModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel"></h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 id="form_group_modules_title"></h4>
                        <form id="form-action">
                        	<input type="hidden" name="id" class="form-control">
                        	<input type="hidden" name="action_type" class="form-control">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Tên danh mục chính sách <code>*</code></label>
                                <div class="col-sm-8">
                                	<textarea type="text" name="name" class="form-control" rows="3"></textarea>	
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Thứ tự hiển thị <code>*</code></label>
                                <div class="col-sm-8">
                                    <input type="text" name="order" class="form-control"></textarea> 
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Nhóm chính sách <code>*</code></label>
                                <div class="col-sm-8">
                                	<select name="type" class="form-control mb-3">
	                                	<option value="1">Nhóm 1</option>
	                                	<option value="2">Nhóm 2</option>
                                        <option value="3">Nhóm 3</option>
	                                </select>
	                            </div>
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
                    <input type="hidden" name="id">
                    <input type="hidden" name="action_type">
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