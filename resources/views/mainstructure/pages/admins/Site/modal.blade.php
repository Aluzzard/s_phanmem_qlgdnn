<div id="actionModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form id="form-action" enctype="multipart/form-data">
                    <input type="hidden" name="action_type" class="form-control">
                    <input type="hidden" name="id" class="form-control">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Tên site <code>*</code></label>
                        <div class="col-sm-8">
                            <input type="text" name="name" class="form-control" placeholder="Nhập tên site">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Địa chỉ </label>
                        <div class="col-sm-8">
                            <input type="text" name="address" class="form-control" placeholder="Nhập địa chỉ">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Email </label>
                        <div class="col-sm-8">
                            <input type="text" name="email" class="form-control" placeholder="Nhập email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Số điện thoại </label>
                        <div class="col-sm-8">
                            <input type="text" name="numberphone" class="form-control" placeholder="Nhập số điện thoại">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Domain 1 </label>
                        <div class="col-sm-8">
                            <input type="text" name="domain_1" class="form-control" placeholder="Nhập domain 1">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Domain 2 </label>
                        <div class="col-sm-8">
                            <input type="text" name="domain_2" class="form-control" placeholder="Nhập domain 2">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Thư mục lưu trữ </label>
                        <div class="col-sm-8">
                            <input type="text" name="folder_for_save" class="form-control" placeholder="Nhập thư mục lưu trữ">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Dung lượng </label>
                        <div class="col-sm-8">
                            <input type="text" name="storage" class="form-control" placeholder="Dung lượng lưu trữ">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Thời hạn kết thúc </label>
                        <div class="col-sm-8">
                            <input type="date" name="till_the_time" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Mẫu giao diện </label>
                        <div class="col-sm-8">
                            <select class="form-control" name="theme">
                                @foreach($themes as $theme)
                                <option value="{{$theme->id}}">{{$theme->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Ghi chú </label>
                        <div class="col-sm-8">
                            <textarea type="text" name="note" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Logo </label>
                        <div class="col-sm-8">
                            <input type="file" name="logo" class="form-control">
                            <img name="logo" src="" width="100px">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Kích hoạt </label>
                        <div class="col-sm-8">
                            <div class="i-checks pull-left">
                                <input type="checkbox" name="is_active" value="1">
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="accountModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form id="form-action" enctype="multipart/form-data">
                    <input type="hidden" name="action_type" class="form-control">
                    <input type="hidden" name="id_site" class="form-control">

                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Tên đăng nhập </label>
                        <div class="col-sm-8">
                            <input type="text" name="account" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Mật khẩu </label>
                        <div class="col-sm-8">
                            <input type="text" name="password" class="form-control">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="functionModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form id="form-action" enctype="multipart/form-data">
                    <input type="hidden" name="action_type" class="form-control">
                    <input type="hidden" name="id_site" class="form-control">
                    <table class="table">
                        <thead>
                            <th>Quyền</th>
                            <th class="text-center" width="70">Xem</th>
                            <th class="text-center" width="70">Sửa</th>
                            <th class="text-center" width="70">Xoá</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Thông tin website </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="view" data-id-module="100">
                                    </div>
                                </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="edit" data-id-module="100">
                                    </div>
                                </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="delete" data-id-module="100">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Danh sách module</td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="view" data-id-module="200">
                                    </div>
                                </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="edit" data-id-module="200">
                                    </div>
                                </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="delete" data-id-module="200">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Danh sách người dùng</td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="view" data-id-module="300">
                                    </div>
                                </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="edit" data-id-module="300">
                                    </div>
                                </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="delete" data-id-module="300">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Phân quyền chức năng người dùng </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="view" data-id-module="301">
                                    </div>
                                </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="edit" data-id-module="301">
                                    </div>
                                </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="delete" data-id-module="301">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Phân quyền module </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="view" data-id-module="302">
                                    </div>
                                </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="edit" data-id-module="302">
                                    </div>
                                </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="delete" data-id-module="302">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Danh sách người dùng khách </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="view" data-id-module="400">
                                    </div>
                                </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="edit" data-id-module="400">
                                    </div>
                                </td>
                                <td>
                                    <div class="col-sm-2 i-checks pull-left">
                                        <input type="checkbox" value="delete" data-id-module="400">
                                    </div>
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                    <button type="submit" class="btn btn-sm btn-success">Lưu</button>
                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="moduleModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form id="form-action" enctype="multipart/form-data">
                    <input type="hidden" name="action_type" class="form-control">
                    <input type="hidden" name="id_site" class="form-control">
                    @if($list_modules)
                        @foreach ($list_modules as $group_modules => $modules)
                        <h5 class="text-danger">{{ $group_modules }}</h5>
                        <table class="table border-table">
                            <thead class="thead-light">
                                <th>Tên module</th>
                                <th class="text-center" width="70">Xem</th>
                                <th class="text-center" width="70">Thêm</th>
                                <th class="text-center" width="70">Sửa</th>
                                <th class="text-center" width="70">Xoá</th>
                            </thead>
                            <tbody>
                                @foreach($modules->sortBy('order') as $module)
                                <tr>
                                    <td>{{$module->name}}</td>
                                    <td>
                                        <div class="col-sm-2 i-checks pull-left">
                                            <input type="checkbox" value="view" data-id-module="{{$module->id}}">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-sm-2 i-checks pull-left">
                                            <input type="checkbox" value="add" data-id-module="{{$module->id}}">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-sm-2 i-checks pull-left">
                                            <input type="checkbox" value="edit" data-id-module="{{$module->id}}">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-sm-2 i-checks pull-left">
                                            <input type="checkbox" value="delete" data-id-module="{{$module->id}}">
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                            
                        </table>
                        @endforeach
                    @endif
                    <button type="submit" class="btn btn-sm btn-success">Lưu</button>
                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>