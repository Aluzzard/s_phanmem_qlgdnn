@extends('mainstructure.layouts.admins.layout')
@section('title','Thông tin Website')

@section('css')
<!-- colorpicker CSS
	============================================ -->
<link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/colorpicker/colorpicker.css') }}">
<style type="text/css">
.div_background {
    width:20px;
    height: 20px;
    border:1px solid #000;
}
</style>
@endsection

@section('content')
<div class="card">
	<div class="admin-dashone-data-table-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sparkline13-list">
                        <h4>Thông tin Website</h4>
                        <div class="sparkline13-graph">
                            <div class="text-right">
                                <button type="button" class="btn btn-custon-four btn-warning" data-toggle="modal" data-target="#modal_1"><i class="fa fa-edit"></i><span class="ml-2">Sửa</span></button>
                            </div>
                            <div class="row">
                            	<div class="col-md-4 text-center">
                            		<img id="logo" src="{!! $information_website->logo !!}" width="100%" style="max-width: 150px;">
                            	</div>
                            	<div class="col-md-8 text-left">
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Tên đơn vị: </label>
                        				<span class="col-md-9 col-sm-12" id="span_name">{{$information_website->name}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Địa chỉ: </label>
                        				<span class="col-md-9 col-sm-12" id="span_address">{{$information_website->address}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Fax: </label>
                        				<span class="col-md-9 col-sm-12" id="span_fax">{{$information_website->fax}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Số điện thoại: </label>
                        				<span class="col-md-9 col-sm-12" id="span_numberphone">{{$information_website->numberphone}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Email: </label>
                        				<span class="col-md-9 col-sm-12" id="span_email">{{$information_website->email}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Hotline: </label>
                        				<span class="col-md-9 col-sm-12" id="span_hotline">{{$information_website->hotline}}</span>
                        			</div>
                            	</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('modal')
    @include('mainstructure.pages.users.WebsiteInformation.modalWebsiteInformation')
@endsection
@section('javascript')
<!-- colorpicker JS
	============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/colorpicker/jquery.spectrum.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/colorpicker/color-picker-active.js') }}"></script>
	@include('mainstructure.pages.users.WebsiteInformation.javascripts')
@endsection