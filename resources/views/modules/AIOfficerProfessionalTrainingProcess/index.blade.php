@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý quá trình đào tạo chuyên môn nghiệp vụ')

@section('css')
<style type="text/css">
    #table_action tbody tr:hover {
        background: #ddd;
        cursor: pointer; }
</style>
</style>
<!-- chosen CSS
    ============================================ -->
<link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/chosen/bootstrap-chosen.css') }}">
@endsection

@section('content')
<div class="card">
    <div class="admin-dashone-data-table-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sparkline8-list">
                        <h4>Quá trình đào tạo chuyên môn nghiệp vụ</h4>
                        <div class="sparkline8-graph">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="datatable-dashv1-list custom-datatable-overright">
                                        <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="false" data-key-events="false" data-show-toggle="true" data-resizable="false" data-cookie="false" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="false">
                                            <thead>
                                                <tr>
                                                    <th data-field="name">Tên cán bộ</th>
                                                    <th data-field="professional_training_process">Quá trình đào tạo</th>
                                                    <th data-field="action" data-sortable="false"></th>
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
@endsection

@section('modal')
    @include('modules.AIOfficerProfessionalTrainingProcess.modal')
@endsection
@section('javascript')
    @include('modules.AIOfficerProfessionalTrainingProcess.javascripts')
@endsection