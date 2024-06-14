<div id="actionModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Nhóm các module</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 id="form_group_modules_title"></h4>
                        <form id="form-action">
                        	<input type="hidden" name="id" class="form-control">
                        	<input type="hidden" name="action_type" class="form-control">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Năm học <code>*</code></label>
                                <div class="col-sm-8">
                                	<select class="form-control" name="year">
                                		<?php for($i=date('Y'); $i>=2010; $i--) { ?>
                                		<option value="{{$i}}">{{$i}}</option>
                                		<?php } ?>
                                	</select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Khóa học <code>*</code></label>
                                <div class="col-sm-8">
                                	<input type="number" name="name" class="form-control">	
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Thời gian từ <code>*</code></label>
                                <div class="col-sm-8">
                                	<input type="date" name="from_the_time" class="form-control">	
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Đến thời gian <code>*</code></label>
                                <div class="col-sm-8">
                                	<input type="date" name="till_the_time" class="form-control">	
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

<div id="partialModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Danh sách chủ đề</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div align="right">
                            <button type="button" class="btn btn-success" onclick="func_buttonModalPartialClick(`addPartial`,0)">Thêm</button>
                        </div>
                        <table id="table_modal" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Tên chủ đề</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <div class="right-col col-sm-6">
                        <h4 id="form_modal_title"></h4>
                        <form id="form_modal">
                            <input type="hidden" name="id" class="form-control">
                            <input type="hidden" name="action_type" class="form-control">
                            <input type="hidden" name="type" class="form-control">
                            <div class="form-group">
                                <label class="col-form-label">Tên</label>
                                <input type="text" name="name" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Số thứ tự</label>
                                <input type="text" name="order" class="form-control" value="0">
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