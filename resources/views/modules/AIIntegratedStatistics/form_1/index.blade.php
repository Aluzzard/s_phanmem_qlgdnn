@extends('mainstructure.layouts.admins.layout')
@section('title','Báo cáo số liệu tuyển sinh, đào tạo, giải quyết việc làm sau đào tạo')

@section('css')
<style type="text/css">
	table {
		margin-top: 30px;
	}
    table th {
    	text-align: center;
    	padding: 10px 5px;
    	background: #fff7e0;
    }
</style>
<!-- tree viewer CSS
    ============================================ -->
<link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/tree-viewer/tree-viewer.css') }}">
<!-- chosen CSS
    ============================================ -->
<link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/select2/select2.min.css') }}">
@endsection

@section('content')
<div class="container-fluid">
    <div class="card">
        <div class="admin-dashone-data-table-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="sparkline8-list">
                            <h4>Báo cáo số liệu tuyển sinh, đào tạo, giải quyết việc làm sau đào tạo</h4>
                            <div class="sparkline8-graph">
                            	<form id="form-action" class="text-left">
                            		<div class="row">
	                                	<label class="col-md-2">Chọn biểu mẫu: </label>
		                                <div class="col-md-4">
		                                    @include('modules.AIIntegratedStatistics.select-choose-statistics')
		                                </div>
		                            </div>
		                            <div class="row">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#chooseCoursesModal"><i class="fa fa-book pr-2"></i>Chọn khóa học</button>
	                            		<button type="button" class="btn btn-warning" data-action="export" id="btn_export"><i class="fa fa-file-text-o pr-2"></i>Xuất excel</button>
		                            </div>
                            	</form>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="datatable-dashv1-list custom-datatable-overright">
                                        	@if(request()->input())
                                            @include('modules.AIIntegratedStatistics.form_1.table')
                                            @endif
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
    @include('modules.AIIntegratedStatistics.form_1.tree-courses')
@endsection
@section('javascript')
<!-- chosen JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/select2/select2.full.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/select2/select2-active.js') }}"></script>
@include('modules.AIIntegratedStatistics.javascripts')
@include('modules.AIIntegratedStatistics.form_1.javascripts')

@endsection