@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý lịch sử log')

@section('css')

@endsection

@section('content')
<div class="card">
	<div class="admin-dashone-data-table-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sparkline8-list">
                        <h4>Danh sách log</h4>
                        <div class="sparkline8-graph">
                            <div class="datatable-dashv1-list custom-datatable-overright">
                                <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="false" data-show-toggle="true" data-resizable="false" data-cookie="false" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="false">
                                    <thead>
                                        <tr>
                                        	<th>ID</th>
                                            <th>Username</th>
                                            <th>Chức năng</th>
                                            <th>Hành động</th>
                                            <th>Chi tiết</th>
                                            <th>Thời gian</th>
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
