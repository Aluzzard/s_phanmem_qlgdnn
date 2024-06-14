<!-- Modal câu trả lời -->
<!-- ---------------------------------------------------------------------------------------- -->
<div id="actionModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" style="max-width: 1700px; width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Danh sách quá trình đào tạo chuyên môn nghiệp vụ</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-9">
                        <div align="right">
                            <button type="button" class="btn btn-success" onclick="func_buttonClick(`add`,0)">Thêm</button>
                        </div>
                        <table id="table_action" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Tên trường</th>
                                    <th>Chuyên ngành đào tạo</th>
                                    <th>Từ thời điểm</th>
                                    <th>Đến thời điểm</th>
                                    <th>Hình thức đào tạo</th>
                                    <th>Văn bằng, chứng chỉ, trình độ</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <div class="right-col col-sm-3">
                        <h4 id="form_title"></h4>
                        <form id="form_action">
                            <input type="hidden" name="id" class="form-control">
                            <input type="hidden" name="action_type" class="form-control">
                            <input type="hidden" name="id_officer" class="form-control">
                            <div class="form-group">
                                <label class="col-form-label">Tên trường <code>*</code></label>
                                <input type="text" name="school_name" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Chuyên ngành đào tạo, bồi dưỡng <code>*</code></label>
                                <input type="text" name="specialized" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Từ thời điểm </label>
                                <input type="date" name="from_the_time" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Đến thời điểm </label>
                                <input type="date" name="till_the_time" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Hình thức đào tạo <code>*</code></label>
                                <select name="id_training_form" class="form-control">
                                    @foreach($training_forms as $form)
                                    <option value="{{$form->id}}">{{$form->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Văn bằng chứng chỉ, trình độ <code>*</code></label>
                                <select name="id_certificate" class="form-control">
                                    @foreach($certificates as $form)
                                    <option value="{{$form->id}}">{{$form->name}}</option>
                                    @endforeach
                                </select>
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