@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý danh sách quản trị viên')

@section('css')

@endsection

@section('content')
<div class="card">
	<div class="admin-dashone-data-table-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sparkline8-list">
                        <h4>Danh sách quản trị viên</h4>
                        <div class="sparkline8-graph">
                            @if($check_add == true )
                            <div class="text-right">
                                <button type="button" class="btn btn-sm btn-custon-four btn-success" data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick('add',0)"><i class="fa big-icon fa-plus"></i><span class="ml-2">Thêm quản trị viên</span></button>
                            </div>
                            @endif
                            <div class="datatable-dashv1-list custom-datatable-overright">
                                <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="false" data-show-toggle="true" data-resizable="false" data-cookie="false" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="false">
                                    <thead>
                                        <tr>
                                            <th>User</th>
                                            <th>Họ tên</th>
                                            <th>Email</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	{!! $html_table !!}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Data table area End-->
</div>
@endsection

@section('modal')
<div id="actionModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form id="form-action" enctype="multipart/form-data">
                    <input type="hidden" id="id_input_action_type" name="action_type" class="form-control">
                    <input type="hidden" id="id" name="id" class="form-control">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tài khoản <code>*</code></label>
                        <div class="col-sm-9">
                            <input type="text" id="account" name="account" class="form-control required" data-notify="Vui lòng nhập tài khoản!" placeholder="Nhập tài khoản">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tên quản trị viên <code>*</code></label>
                        <div class="col-sm-9">
                            <input type="text" id="name" name="name" class="form-control required" data-notify="Vui lòng nhập tên quản trị viên!" placeholder="Nhập tên quản trị viên">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label password">Mật khẩu <code>*</code></label>
                        <div class="col-sm-9">
                            <input type="password" id="password" name="password" class="form-control required" data-notify="Vui lòng nhập mật khẩu!" placeholder="Nhập mật khẩu">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Email </label>
                        <div class="col-sm-9">
                            <input type="text" id="email" name="email" class="form-control" placeholder="Nhập email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Số điện thoại </label>
                        <div class="col-sm-9">
                            <input type="text" id="numberphone" name="numberphone" class="form-control" placeholder="Nhập số điện thoại">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Hoạt động</label>
                        <div class="i-checks pull-left">
                            <input type="checkbox" name="status" value="1">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
                </form>
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
                    <input type="hidden" name="id" id="id_input_id">
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
@endsection

@section('javascript')
    @include('mainstructure.pages.users.ManagerUsers.javascripts')
@endsection