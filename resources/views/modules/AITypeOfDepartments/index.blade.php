@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý danh mục khoa/phòng')

@section('content')
<div class="container-fluid">
    <div class="card">
        <div class="admin-dashone-data-table-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="sparkline8-list">
                            <h4>Danh sách danh mục khoa/phòng</h4>
                            <div class="sparkline8-graph">
                                <div class="text-right">
                                    @if($check_add == true)
                                    <button type="button" id="btn_add" class="btn btn-success" data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick('add',0)"><i class="fa big-icon fa-plus"></i><span class="ml-2">Thêm</span></button>
                                    @endif
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="datatable-dashv1-list custom-datatable-overright">
                                            <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="false" data-show-toggle="true" data-resizable="false" data-cookie="false" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="false">
                                                <thead>
                                                    <tr>
                                                        <th data-field="code">Mã khoa</th>
                                                        <th data-field="name">Tên khoa</th>
                                                        <th data-field="founding_date">Ngày thành lập</th>
                                                        <th data-field="numberphone">Điện thoại</th>
                                                        <th data-field="email">Email</th>
                                                        <th data-field="action">Hành động</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Data table area End-->
    </div>
</div>
@endsection

@section('modal')
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
                            <input type="hidden" id="id_input_id" name="id" class="form-control">
                            <input type="hidden" id="id_input_action_type" name="action_type" class="form-control">
                            <div class="form-group">
                                <label class="col-form-label">Mã khoa/phòng <code>*</code></label>                                
                                <input type="text" name="code" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Tên khoa phòng <code>*</code></label>
                                <input type="text" name="name" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Tên viết tắt </label>
                                <input type="text" name="short_name" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Ngày thành lập </label>
                                <input type="date" name="founding_date" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Địa chỉ </label>
                                <input type="text" name="address" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Điện thoại </label>
                                <input type="text" name="numberphone" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Email </label>
                                <input type="text" name="email" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Ghi chú</label>
                                <textarea type="text" name="note" class="form-control" rows="3"></textarea>
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
    @include('modules.AITypeOfDepartments.javascripts')
@endsection