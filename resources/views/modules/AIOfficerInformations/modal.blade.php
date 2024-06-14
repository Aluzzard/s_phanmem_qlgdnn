<div id="actionModal" class="modal fade" role="dialog">
    <div class="modal-dialog" style="max-width: 1700px; width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form id="form-action" enctype="multipart/form-data">
                    <input type="hidden" name="id" class="form-control">
                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label">Họ và tên <code>*</code></label>
                        <div class="col-sm-5">
                            <input type="text" name="name" class="form-control" placeholder="Nhập tên cán bộ, giáo viên ">
                        </div>
                        <label class="col-sm-1 col-form-label">Dân tộc </label>
                        <div class="col-sm-1">
                            <select class="form-control" name="ethnic">
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
                        <label class="col-sm-1 col-form-label">Ngày sinh <code>*</code></label>
                        <div class="col-sm-2">
                            <input type="date" name="date_of_birth" class="form-control">
                        </div>
                        <label class="col-sm-1 col-form-label">CCCD/CMND <code>*</code></label>
                        <div class="col-sm-2">
                            <input type="text" name="identification_id_card" class="form-control">
                        </div>
                        <label class="col-sm-1 col-form-label">Ngày cấp <code>*</code></label>
                        <div class="col-sm-2">
                            <input type="date" name="date_of_issue" class="form-control">
                        </div>
                        <label class="col-sm-1 col-form-label">Nơi cấp <code>*</code></label>
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
                        <label class="col-sm-1 col-form-label">Thành phần gia đình </label>
                        <div class="col-sm-5">
                            <select name="family_composition" class="form-control">
                                @foreach($family_compositions as $family_composition)
                                <option class="{{$family_composition->id}}">{{$family_composition->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <!-- <label class="col-sm-1 col-form-label">Trình độ chuyên môn </label>
                        <div class="col-sm-3">
                            <input type="text" name="educational_level" class="form-control">
                        </div> -->
                        <label class="col-sm-1 col-form-label">Trình độ giảng dạy </label>
                        <div class="col-sm-5">
                            <select name="teaching_level" class="form-control">
                                @foreach($teaching_levels as $teaching_level)
                                <option class="{{$teaching_level->id}}">{{$teaching_level->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
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
                    </div>
                    <input type="hidden" id="id_input_action_type" name="action_type" class="form-control">
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="moveModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title">Di chuyển bài viết</h4>
            </div>
            <div class="modal-body">
                <form id="form-move">
                    <input type="hidden" name="after_category_id">
                    <input type="hidden" name="list_article">
                    <input type="hidden" name="action_type" value="move">
                    <div class="tree-viewer-area mg-b-15">
                        <div class="sparkline9-list">
                            <div class="sparkline9-graph">
                                <div class="adminpro-content res-tree-ov">
                                    <div id="jstree_move">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <input type="checkbox" name="is_move" value="1"><span> Xóa các mục tin được chọn sau khi sao chép</span>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-success" disabled>Lưu</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
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
                    <input type="hidden" name="input_id" id="id_input_id">
                    <input type="hidden" id="id_input_type_del">
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