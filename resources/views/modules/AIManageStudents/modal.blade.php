<div id="actionModal" class="modal fade" role="dialog">
    <div class="modal-dialog" style="max-width: 1700px; width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form id="form-action" enctype="multipart/form-data">
                    <input type="hidden" name="id" class="form-control">
                    <input type="hidden" name="action_type" class="form-control">
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label">Họ và tên <code>*</code></label>
                        <div class="col-sm-5">
                            <input type="text" name="name" class="form-control" placeholder="Nhập tên học viên ">
                        </div>
                        <label class="col-sm-1 col-form-label">Dân tộc </label>
                        <div class="col-sm-1">
                            <select class="form-control" name="id_ethnic">
                                @foreach($ethnics as $ethnic)
                                <option value="{{$ethnic->id}}">{{$ethnic->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <label class="col-sm-1 col-form-label">Tôn giáo </label>
                        <div class="col-sm-1">
                            <select class="form-control" name="region">
                                @foreach($regions as $region)
                                <option value="{{$region->id}}">{{$region->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <label class="col-sm-1 col-form-label">Giới tính </label>
                        <div class="col-sm-1">
                            <select class="form-control" name="gender">
                                <option value="nam">Nam</option>
                                <option value="nu">Nữ</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label">Ngày sinh </label>
                        <div class="col-sm-2">
                            <input type="date" name="date_of_birth" class="form-control">
                        </div>
                        <label class="col-sm-1 col-form-label">CCCD/CMND <code>*</code></label>
                        <div class="col-sm-2">
                            <input type="text" name="identification_id_card" class="form-control">
                        </div>
                        <label class="col-sm-1 col-form-label">Ngày cấp </label>
                        <div class="col-sm-2">
                            <input type="date" name="date_of_issue" class="form-control">
                        </div>
                        <label class="col-sm-1 col-form-label">Nơi cấp </label>
                        <div class="col-sm-2">
                            <input type="text" name="department_of_issue" class="form-control">
                        </div>
                        
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label">Địa chỉ thường trú </label>
                        <div class="col-sm-5">
                            <input type="text" name="permanent_residence" class="form-control">
                        </div>
                        <label class="col-sm-1 col-form-label">Nơi ở hiện tại </label>
                        <div class="col-sm-5">
                            <input type="text" name="place_of_live" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label">Số điện thoại </label>
                        <div class="col-sm-5">
                            <input type="text" name="numberphone" class="form-control">
                        </div>
                        <label class="col-sm-1 col-form-label">Email </label>
                        <div class="col-sm-5">
                            <input type="text" name="email" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label">Trình độ học vấn (Lớp) </label>
                        <div class="col-sm-5">
                            <input type="number" name="class" class="form-control">
                        </div>
                    </div>
                    <!-- <div class="form-group row">
                        <label class="col-sm-1 col-form-label">Tình trạng sức khỏe </label>
                        <div class="col-sm-2">
                            <select name="state_of_health" class="form-control">
                                <option value="0">---</option>
                                <option value="kha">Khá</option>
                                <option value="kem">Kém</option>
                                <option value="tot">Tốt</option>
                                <option value="trungbinh">Trung bình</option>
                            </select>
                        </div>
                        <label class="col-sm-1 col-form-label">Nhóm máu </label>
                        <div class="col-sm-2">
                            <select name="blood_group" class="form-control">
                                <option value="0">---</option>
                                <option value="a">A</option>
                                <option value="b">B</option>
                                <option value="ab">AB</option>
                                <option value="o">O</option>
                            </select>
                        </div>
                        <label class="col-sm-1 col-form-label">Chiều cao </label>
                        <div class="col-sm-2">
                            <input type="text" name="height" class="form-control" placeholder="cm">
                        </div>
                        <label class="col-sm-1 col-form-label">Cân nặng </label>
                        <div class="col-sm-2">
                            <input type="text" name="weight" class="form-control" placeholder="kg">
                        </div>
                    </div> -->
                    <div class="form-group row">
                        <div class="col-sm-4 col-lg-2 d-flex">
                            <label class="col-form-label pr-3">Đang học</label>
                            <div class="i-checks pull-left">
                                <input type="checkbox" name="is_active" value="1"> <i></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="chosen-select-single">
                            <label>Chính sách</label>
                            <select class="form-control" name="policy">
                                @foreach($vocational_education_policities as $policy)
                                <option value="{{$policy->id}}">{{$policy->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    
                    <!-- <div class="form-group">
                        <div class="chosen-select-single">
                            <label>Chính sách nhóm 1</label>
                            <select data-placeholder="Chọn chính sách" class="chosen-select" multiple="" tabindex="-1" name="type_1">
                                @foreach($vocational_education_policities->where('type', 1) as $policy)
                                <option value="{{$policy->id}}">{{$policy->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="chosen-select-single">
                            <label>Chính sách nhóm 2</label>
                            <select data-placeholder="Chọn chính sách" class="chosen-select" multiple="" tabindex="-1" name="type_2">
                                @foreach($vocational_education_policities->where('type', 2) as $policy)
                                <option value="{{$policy->id}}">{{$policy->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="chosen-select-single">
                            <label>Chính sách nhóm 3</label>
                            <select data-placeholder="Chọn chính sách" class="chosen-select" multiple="" tabindex="-1" name="type_3">
                                @foreach($vocational_education_policities->where('type', 3) as $policy)
                                <option value="{{$policy->id}}">{{$policy->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div> -->
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="importModal" class="modal fade" role="dialog">
    <div class="modal-dialog" style="max-width: 1700px; width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form id="form-import-action" enctype="multipart/form-data">
                    <input type="hidden" name="id_course" class="form-control">
                    <input type="hidden" name="action_type" class="form-control">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Chọn file tải lên </label>
                        <div class="col-sm-10">
                            <input type="file" name="file_import" class="form-control">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success" data-action="preview">Xem trước</button>
                    <button type="submit" class="btn btn-success" data-action="upload" style="display: none;">Upload</button>
                </form>
                <table class="w-100 table table-striped">
                    <thead>
                        <tr class="table-primary">
                            <th>Tên học viên <code>*</code></th>
                            <th>Ngày sinh <code>*</code></th>
                            <th>Số điện thoại</th>
                            <th>Email</th>
                            <th>CCCD/CMND <code>*</code></th>
                            <th>Ngày cấp</th>
                            <th>Nơi cấp</th>
                            <th>Địa chỉ thường trú</th>
                            <th>Nơi ở hiện tại</th>
                            <th>Dân tộc <code>*</code></th>
                            <th>Tôn giáo <code>*</code></th>
                            <th>Giới tính</th>
                            <th>Trình độ</th>
                            <th>Chính sách</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
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