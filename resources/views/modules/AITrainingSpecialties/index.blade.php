@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý danh mục ngành đào tạo')

@section('content')
<div class="container-fluid">
    <div class="card">
        <div class="admin-dashone-data-table-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="sparkline8-list">
                            <h4>Danh sách danh mục ngành đào tạo</h4>
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
                                                        <th data-field="name">Tên ngành đào tạo</th>
                                                        <th data-field="type_1">Loại đào tạo</th>
                                                        <th data-field="type_2">Loại dào tạo</th>
                                                        <th data-field="duration_by_month">Thời gian đào tạo (tháng)</th>
                                                        <th data-field="duration_by_day">Thời gian đào tạo (ngày)</th>
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
    @include('modules.AITrainingSpecialties.modal')
@endsection
@section('javascript')
    @include('modules.AITrainingSpecialties.javascripts')
@endsection