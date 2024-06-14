@extends('mainstructure.layouts.admins.layout')
@section('title','Sites')

@section('content')
<div class="card">
    <div class="admin-dashone-data-table-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sparkline8-list">
                        <h4>Danh sách site</h4>
                        <div class="sparkline8-graph">
                            <div class="text-right">
                                <button type="button" id="btn_add" class="btn btn-success" data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick('add',0)"><i class="fa big-icon fa-plus"></i><span class="ml-2">Thêm</span></button>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="datatable-dashv1-list custom-datatable-overright">
                                        <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="false" data-show-toggle="true" data-resizable="false" data-cookie="false" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="false">
                                            <thead>
                                                <tr>
                                                    <th data-field="is_active">Kích hoạt</th>
                                                    <th data-field="name">Tên site</th>
                                                    <th data-field="till_the_time">Thời hạn đến</th>
                                                    <th data-field="account">Tài khoản</th>
                                                    <th data-field="action">Hành động</th>
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
        </div>
    </div>
    <!-- Data table area End-->
</div>
@endsection

@section('modal')
    @include('mainstructure.pages.admins.Site.modal')
@endsection

@section('javascript')
    @include('mainstructure.pages.admins.Site.javascript')
@endsection