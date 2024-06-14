<div id="actionModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
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
                                <label class="col-sm-4 col-form-label">Ngành đào tạo <code>*</code></label>
                                <div class="col-sm-8">
                                	<select class="form-control" name="id_training_specialty">
                                		@foreach($training_specialties as $training_specialty)
                                		<option value="{{$training_specialty->id}}">{{$training_specialty->name}}</option>
                                		@endforeach
                                	</select>
                                </div>
                            </div>
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
                                <label class="col-sm-4 col-form-label">Chương trình đào tạo <code>*</code></label>
                                <div class="col-sm-8">
                                	<input type="text" name="name" class="form-control">	
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
                    <input type="text" name="id">
                    <input type="text" name="action_type">
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
<!-- Modal View Image -->
<div class="modal fade" id="fileModal" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel">
    <div class="modal-dialog modal-xl" role="document" style="width: 70%; max-width: 1200px;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12 list-files-library"></div>
                    <div class="col-md information-file" style="display: none;">
                        <form id="form-edit-file">
                            {{ csrf_field() }}
                            <input id="id_input_id_file" type="hidden" name="id">
                            <input type="hidden" name="action_type" value="edit">
                            <div class="form-group">
                                <label class="form-label">Tên file <code>*</code></label>
                                <input type="text" class="form-control" id="id_input_name_file" name="name">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Mô tả</label>
                                <textarea name="description" id="id_input_description_file" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="text-right">
                                <button type="submit" class="btn btn-success">Sửa</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <form id="form-add-file" enctype="multipart/form-data">
                    <input type="hidden" name="id_course">
                    <input type="hidden" name="action_type" value="add">
                    <input type="file" id="addfiles[]" name="addfiles[]" multiple>
                    <button type="submit" class="btn btn-success">Thêm file</button>
                </form>
            </div>
        </div>
    </div>
</div>