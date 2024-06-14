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
                            	<div class="col-md-4">
                            		<img id="logo" src="{!! $information_website->logo !!}" width="100%" style="max-width: 150px;">
                            	</div>
                            	<div class="col-md-8 text-left">
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Tên doanh nghiệp: </label>
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
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Mã số doanh nghiệp: </label>
                        				<span class="col-md-9 col-sm-12" id="span_bussiness_code">{{$information_website->bussiness_code}}</span>
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
<div class="card">
	<div class="admin-dashone-data-table-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sparkline13-list">
                        <h4>Cấu hình hiển thị</h4>
                        <div class="sparkline13-graph">
                            <div class="text-right">
                                <button type="button" class="btn btn-custon-four btn-warning" data-toggle="modal" data-target="#modal_2"><i class="fa fa-edit"></i><span class="ml-2">Sửa</span></button>
                            </div>
                            <div class="row">
                            	<div class="col-md-6 text-left">
                                    <div class="row d-flex">
                                        <label class="col-md-4 mr-5">Màu gradient: </label>
                                        <div class="col-md-8 div_background" id="id_div_gradient" style="background: <?php echo $information_website->color_gradient ?>;"></div>
                                    </div>
                            		<div class="row d-flex">
                                        <label class="col-md-4 mr-5">Màu nền: </label>
                                        <div class="col-md-8 div_background" id="id_div_background" style="background: <?php echo $information_website->color_background ?>;"></div>
                                    </div>
                            	</div>
                            	<div class="col-md-6 text-left">
                                    <div class="row d-flex">
                                        <label class="col-md-4 mr-5">Màu chữ: </label>
                                        <div class="col-md-8 div_background" id="id_div_font_color" style="background: <?php echo $information_website->color_font ?>;"></div>
                                    </div>
                                    <div class="row d-flex">
                                        <label class="col-md-4 mr-5">Màu chữ hover: </label>
                                        <div class="col-md-8 div_background" id="id_div_font_color_hover" style="background: <?php echo $information_website->color_font_hover ?>;"></div>
                                    </div>
                                    <div class="row d-flex">
                                        <label class="col-md-4 mr-5">Màu chữ focus: </label>
                                        <div class="col-md-8 div_background" id="id_div_font_color_focus" style="background: <?php echo $information_website->color_font_focus ?>;"></div>
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
<div class="card">
	<div class="admin-dashone-data-table-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sparkline13-list">
                        <h4>SEO</h4>
                        <div class="sparkline13-graph">
                            <div class="text-right">
                                <button type="button" class="btn btn-custon-four btn-warning" data-toggle="modal" data-target="#modal_3"><i class="fa fa-edit"></i><span class="ml-2">Sửa</span></button>
                            </div>
                            <div class="row text-left">
                            	<div class="col-md-6">
                            		<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Tiêu đề (meta_title): </label>
                        				<span class="col-md-9 col-sm-12" id="span_meta_title">{{$information_website->meta_title}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Mô tả (meta_description): </label>
                        				<span class="col-md-9 col-sm-12" id="span_meta_description">{{$information_website->meta_description}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Từ khoá (keywords): </label>
                        				<span class="col-md-9 col-sm-12" id="span_keywords">{{$information_website->keywords}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Tác giả (author): </label>
                        				<span class="col-md-9 col-sm-12" id="span_author">{{$information_website->author}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Quốc gia (country): </label>
                        				<span class="col-md-9 col-sm-12" id="span_country">{{$information_website->country}}</span>
                        			</div>
                            	</div>
                            	<div class="col-md-6">
                        			<div class="row mt-3">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Meta DC.title: </label>
                        				<span class="col-md-9 col-sm-12" id="span_DC_title">{{$information_website->DC_title}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Meta geo.region: </label>
                        				<span class="col-md-9 col-sm-12" id="span_meta_geo_region">{{$information_website->meta_geo_region}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Meta geo.placename: </label>
                        				<span class="col-md-9 col-sm-12" id="span_meta_geo_placename">{{$information_website->meta_geo_placename}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Meta geo.position: </label>
                        				<span class="col-md-9 col-sm-12" id="span_meta_geo_position">{{$information_website->meta_geo_position}}</span>
                        			</div>
                        			<div class="row">
                        				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Meta ICBM: </label>
                        				<span class="col-md-9 col-sm-12" id="span_ICBM">{{$information_website->ICBM}}</span>
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
    @include('mainstructure.pages.admins.WebsiteInformation.modalWebsiteInformation')
    @include('mainstructure.pages.admins.WebsiteInformation.modalWebsiteConfig')
    @include('mainstructure.pages.admins.WebsiteInformation.modalWebsiteSEO')

@endsection
@section('javascript')
<!-- colorpicker JS
	============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/colorpicker/jquery.spectrum.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/colorpicker/color-picker-active.js') }}"></script>
	@include('mainstructure.pages.admins.WebsiteInformation.javascripts')
@endsection
