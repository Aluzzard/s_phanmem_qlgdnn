@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý phân quyền chức năng')

@section('css')

@endsection

@section('content')
<div class="card">
	<div class="admin-dashone-data-table-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sparkline8-list">
                        <h4>Danh sách quyền module quản trị viên</h4>
                        <div class="sparkline8-graph">
                            <div class="datatable-dashv1-list custom-datatable-overright">
                                <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="false" data-show-toggle="true" data-resizable="false" data-cookie="false" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="false">
                                    <thead>
                                        <tr>
                                            <th>User</th>
                                            <th>Chức năng</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	{!! $table_html !!}
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
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form id="form-action" enctype="multipart/form-data">
                    <input type="hidden" id="action_type" name="action_type" class="form-control">
                    <input type="hidden" id="id" name="id" class="form-control">
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
@endsection

@section('javascript')
    @include('mainstructure.pages.users.ModulePermission.javascripts')
@endsection