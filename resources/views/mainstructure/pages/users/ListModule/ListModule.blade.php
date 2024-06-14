@extends('mainstructure.layouts.admins.layout')
@section('title','Danh sách module')

@section('css')
<style type="text/css">
	.module {
		padding: 0 5px;
	}
	.module:hover {
	    background: linear-gradient(45deg, #ffebb2, #ffbfad);
	    transform: scale(1.1);
	    transition: 0.5s;
	    border-radius: 10px;
/*	    border: 1px solid #f1f1f1;*/
	    box-shadow: rgba(0, 0, 0, 0.15) 0px 3px 3px 0px;
	}
</style>
@endsection

@section('content')
<div class="breadcome-area mg-b-15 small-dn">
	<div class="breadcome-list shadow-reset">
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="breadcome-heading">
					<input type="text" id="search_module" placeholder="Tìm kiếm module..." class="form-control">
					<i class="fa fa-search"></i>
	            </div>
	        </div>
	        
	    </div>
	</div>
</div>
<div class="card">
	<div id="list_module" style="display: flow-root;">
		{!! $htmlListModule !!}
	</div>
</div>
@endsection

@section('javascript')
    @include('mainstructure.pages.users.ListModule.javascripts')
@endsection

