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
	                            		<label class="col-md-2">Năm: </label>
		                                <div class="col-md-4">
		                                    <div class="chosen-select-single mg-b-20">
		                                    	<select class="chosen-select2 form-control" name="year" data-width="100%">
			                                        @foreach($years as $year)
		                                            <option value="{{$year->year}}">{{$year->year}}</option>
		                                        	@endforeach
			                                    </select>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="row">
	                            		<button type="button" class="btn btn-success" data-action="preview"><i class="fa fa-eye pr-2"></i>Xem trước</button>
	                            		<button type="button" class="btn btn-warning" data-action="export"><i class="fa fa-file-text-o pr-2"></i>Xuất excel</button>
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
@section('javascript')
<!-- chosen JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/select2/select2.full.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/select2/select2-active.js') }}"></script>
@include('modules.AIIntegratedStatistics.javascripts')
@include('modules.AIIntegratedStatistics.form_1.javascripts')

@endsection