<!-- Modal câu trả lời -->
<!-- ---------------------------------------------------------------------------------------- -->
<div id="actionModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" style="max-width: 1700px; width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Danh sách quá trình đánh giá xếp loại giáo viên</h5>
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
                                    <th>Khóa học</th>
                                    <th>Học kỳ</th>
                                    <th>Xếp loại sức khỏe</th>
                                    <th>Xếp loại đạo đức</th>
                                    <th>Xếp loại chuyên môn</th>
                                    <th>Xếp loại chung</th>
                                    <th>Ghi chú</th>
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
                                <label class="col-form-label">Khóa học <code>*</code></label>
                                <select name="id_course" class="form-control">
                                    @foreach($courses as $course)
                                    <option value="{{$course->id}}">{{$course->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Học kỳ <code>*</code></label>
                                <select name="id_semester" class="form-control">
                                    @foreach($semesters as $semester)
                                    <option value="{{$semester->id}}">{{$semester->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Xếp loại sức khỏe <code>*</code></label>
                                <select name="health_assessment" class="form-control">
                                    <option value="1">Tốt</option>
                                    <option value="2">Khá</option>
                                    <option value="3">Trung bình</option>
                                    <option value="4">Kém</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Xếp loại đạo đức <code>*</code></label>
                                <select name="moral_assessment" class="form-control">
                                    <option value="1">Tốt</option>
                                    <option value="2">Khá</option>
                                    <option value="3">Trung bình</option>
                                    <option value="4">Kém</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Xếp loại chuyên môn <code>*</code></label>
                                <select name="professional_assessment" class="form-control">
                                    <option value="1">Giỏi</option>
                                    <option value="2">Khá</option>
                                    <option value="3">Trung bình</option>
                                    <option value="4">Yếu</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Xếp loại chung <code>*</code></label>
                                <select name="general_assessment" class="form-control">
                                    <option value="1">Tốt</option>
                                    <option value="2">Khá</option>
                                    <option value="3">Trung bình</option>
                                    <option value="4">Kém</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Ghi chú </label>
                                <textarea name="note" class="form-control" rows="3"></textarea>
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