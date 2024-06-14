@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý danh mục chương trình đào tạo')

@section('css')
<style type="text/css">

.item-file {
    position: relative;
    display: inline-block;
    margin: 10px 20px;
    border: 1px solid #49505740;
    border-radius: 10px;
    width: 120px;
    overflow-wrap: anywhere;
    text-align: center; }
    .file-in-view-form {
        max-width: 100px;
        height: 100px;
        border-radius: 10px;
        object-fit: cover;
        /*box-shadow: 3px 3px #88888859;*/ }
    .item-file.selected{
        border: 4px solid #d92550; }
        .delete-file {
            position: absolute;
            top: 0;
            right: 0;
            cursor: pointer;
            background: #00000066;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white; }
            .disabled {
                opacity: 0.3;
            }
.information-file {
    border-left: 1px solid #ddd;
}
</style>
<!-- chosen CSS
    ============================================ -->
<link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/chosen/bootstrap-chosen.css') }}">
@endsection

@section('content')
<div class="container-fluid">
    <div class="card">
        <div class="admin-dashone-data-table-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="sparkline8-list">
                            <h4>Danh sách danh mục chương trình đào tạo</h4>
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
                                                        <th data-field="year">Năm</th>
                                                        <th data-field="id_training_specialty">Ngành đào tạo</th>
                                                        <th data-field="name">Chương trình đào tạo</th>
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
    @include('modules.AITrainingProgramInformations.modal')
@endsection

@section('javascript')
    @include('modules.AITrainingProgramInformations.javascripts')
@endsection