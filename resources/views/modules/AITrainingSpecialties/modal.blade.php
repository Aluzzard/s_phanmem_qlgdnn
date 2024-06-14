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
                                <label class="col-sm-4 col-form-label">Tên danh mục ngành đào tạo <code>*</code></label>
                                <div class="col-sm-8">
                                	<textarea type="text" name="name" class="form-control" rows="3"></textarea>	
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Loại đào tạo <code>*</code></label>
                                <div class="col-sm-8">
                                	<select name="type_1" class="form-control mb-3">
	                                	<option value="1">Đào tạo trình độ dưới 03 tháng</option>
	                                	<option value="2">Đào tạo trình độ sơ cấp</option>
	                                </select>
	                                <select name="type_2" class="form-control">
	                                	<option value="1">Phi nông nghiệp</option>
	                                	<option value="2">Nông nghiệp</option>
	                                </select>
	                            </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Thời gian đào tạo (tháng)</label>
                                <div class="col-sm-2">
                                    <input type="text" name="duration_by_month" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label pr-3">Thời gian đào tạo (ngày)</label>
                                <div class="col-sm-2">
                                    <input type="number" name="duration_by_day" class="form-control">
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