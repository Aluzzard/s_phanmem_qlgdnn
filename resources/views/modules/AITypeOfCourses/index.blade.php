@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý danh mục khóa học')

@section('content')
<div class="container-fluid">
    <div class="card">
        <div class="admin-dashone-data-table-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="sparkline8-list">
                            <h4>Danh sách danh mục khóa học</h4>
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
                                                        <th data-field="status">Tình trạng</th>
                                                        <th data-field="id_training_specialty">Ngành đào tạo</th>
                                                        <th data-field="name">Khóa học</th>
                                                        <th data-field="year">Năm học</th>
                                                        <th data-field="from_the_time">Từ ngày</th>
                                                        <th data-field="till_the_time">Đến ngày</th>
                                                        <th data-field="address">Địa điểm lớp học</th>
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
    @include('modules.AITypeOfCourses.modal')
@endsection

@section('javascript')
    @include('modules.AITypeOfCourses.javascripts')
@endsection