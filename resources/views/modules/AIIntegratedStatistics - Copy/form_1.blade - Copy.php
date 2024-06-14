@extends('mainstructure.layouts.admins.layout')
@section('title','Báo cáo số liệu tuyển sinh, đào tạo, giải quyết việc làm sau đào tạo')

@section('css')
<style type="text/css">
    .fixed-table-body {
    	overflow: auto;
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
                            <h4>Báo cáo số liệu tuyển sinh, đào tạo, giải quyết việc làm sau đào tạo</h4>
                            <div class="sparkline8-graph">
                            	<form class="text-left">
                            		<div class="row">
	                                	<label class="col-md-2">Chọn biểu mẫu: </label>
		                                <div class="col-md-2">
		                                    <div class="chosen-select-single mg-b-10">
		                                        <select onchange="location = this.value;" class="chosen-select" tabindex="-1">
		                                            <option value="/admin/module/thong-ke-tong-hop?form=1" selected>Biểu mẫu 1</option>
		                                            <option value="/admin/module/thong-ke-tong-hop?form=2">Biểu mẫu 2</option>
		                                        </select>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="row">
	                            		<label class="col-md-2">Năm: </label>
		                                <div class="col-md-2">
		                                    <div class="chosen-select-single mg-b-20">
		                                        <select onchange="location = this.value;" class="chosen-select" tabindex="-1">
		                                        	@foreach($years as $year)
		                                            <option value="{{$year->year}}">{{$year->year}}</option>
		                                        	@endforeach
		                                        </select>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="row">
	                            		<button class="btn submit btn-success"><i class="fa fa-filter pr-2"></i>Lọc điều kiện</button>
	                            		<button class="btn submit btn-warning"><i class="fa fa-file-text-o pr-2"></i>Xuất excel</button>
		                            </div>
                            	</form>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="datatable-dashv1-list custom-datatable-overright">
                                            <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="false" data-show-toggle="true" data-resizable="false" data-cookie="false" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="false">
                                                <thead>
                                                    <tr>
                                                        <th data-sortable="false" rowspan="2">Số thứ tự</th>
                                                        <th data-sortable="false" rowspan="2">Nội dung</th>
                                                        <th data-sortable="false" colspan="6">Tổng số tuyển sinh (người)</th>
                                                        <th data-sortable="false" colspan="6">Tổng số tốt nghiệp (người)</th>
                                                        <th data-sortable="false" colspan="5">Tổng số có việc làm sau đào tạo (người)</th>
                                                        <th data-sortable="false" rowspan="2">Tổng số có việc làm sau đào tạo (người)</th>
                                                        <th data-sortable="false" rowspan="2">Tổng số có việc làm sau đào tạo (người)</th>
                                                    </tr>
                                                    <tr>
                                                    	<!-- <th data-sortable="false" ></th> -->
                                                        <th data-sortable="false">Tổng số</th>
                                                        <th data-sortable="false">Cao đẳng</th>
                                                        <th data-sortable="false">Trung cấp</th>
                                                        <th data-sortable="false">Sơ cấp</th>
                                                        <th data-sortable="false">Dưới 3 tháng</th>
                                                        <th data-sortable="false">Thường xuyên</th>
                                                        <th data-sortable="false">Tổng số</th>
                                                        <th data-sortable="false">Cao đẳng</th>
                                                        <th data-sortable="false">Trung cấp</th>
                                                        <th data-sortable="false">Sơ cấp</th>
                                                        <th data-sortable="false">Dưới 3 tháng</th>
                                                        <th data-sortable="false">Thường xuyên</th>
                                                        <th data-sortable="false">Việc làm trong tỉnh</th>
                                                        <th data-sortable="false">Việc làm ngoài tỉnh</th>
                                                        <th data-sortable="false">Xuất khẩu lao động</th>
                                                        <th data-sortable="false">Tự mở DN/HTX/THT/...</th>
                                                        <th data-sortable="false">Tự tạo việc làm</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<tr>
                                                		<td rowspan="5">1</td>
                                                		<td>Lĩnh vực nông nghiệp</td>
														<td></td>
                                                		<td></td>
														<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Nữ</td>
														<td></td>
                                                		<td></td>
														<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Khmer</td>
														<td></td>
                                                		<td></td>
														<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Hoa</td>
														<td></td>
                                                		<td></td>
														<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Dân tộc ít người khác</td>
														<td></td>
                                                		<td></td>
														<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td rowspan="5">2</td>
                                                		<td>Lĩnh vực phi nông nghiệp</td>
														<td></td>
                                                		<td></td>
														<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Nữ</td>
														<td></td>
                                                		<td></td>
														<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Khmer</td>
														<td></td>
                                                		<td></td>
														<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Hoa</td>
														<td></td>
                                                		<td></td>
														<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
                                                	</tr>
                                                	<tr>
                                                		<td>Dân tộc ít người khác</td>
														<td></td>
                                                		<td></td>
														<td></td>
                                                		<td></td>
                                                		<td></td>
                                                		<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
                                                	</tr>
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
@section('javascript')
<!-- chosen JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/chosen/chosen.jquery.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/chosen/chosen-active.js') }}"></script>
@endsection