@extends('mainstructure.layouts.admins.layout')
@section('title','Thông tin tài khoản')

@section('content')
<div class="container-fluid">
	<div class="card">
		<div class="admin-dashone-data-table-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="sparkline13-list">
                            <h4>Thông tin tài khoản</h4>
                            <div class="sparkline13-graph">
                                <div class="text-right">
                                    <button type="button" class="btn btn-custon-four btn-warning" data-toggle="modal" data-target="#actionModal"><i class="fa fa-edit"></i><span class="ml-2">Sửa</span></button>
                                </div>
                                <div class="row">
                                	<div class="col-md-4">
                                		<img id="logo" src="{{Auth::user()->avatar_path}}" width="100%" style="max-width: 150px;">
                                		<p><h5>Ảnh đại diện</h5></p>
                                	</div>
                                	<div class="col-md-8 text-left">
                            			<div class="row">
                            				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Tài khoản: </label>
                            				<span class="col-md-9 col-sm-12" id="span_account">{{Auth::user()->account}}</span>
                            			</div>
                            			<div class="row">
                            				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Họ tên: </label>
                            				<span class="col-md-9 col-sm-12" id="span_name">{{Auth::user()->name}}</span>
                            			</div>
                            			<div class="row">
                            				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Email: </label>
                            				<span class="col-md-9 col-sm-12" id="span_email">{{Auth::user()->email}}</span>
                            			</div>
                            			<div class="row">
                            				<label class="col-md-3 col-sm-12"><i class="fa fa-star mr-2"></i>Số điện thoại: </label>
                            				<span class="col-md-9 col-sm-12" id="span_numberphone">{{Auth::user()->numberphone}}</span>
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
</div>
@endsection
@section('modal')
<div id="actionModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title">Chỉnh sửa thông tin</h4>
            </div>
            <div class="modal-body">
                <form id="form-action" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="action_type" class="form-control" value="edit">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Họ tên: <code>*</code></label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Email: </label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Số điện thoại: </label>
                        <div class="col-sm-10">
                            <input type="text" name="numberphone" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Ảnh đại diện: </label>
                        <div class="col-sm-10">
                            <input type="file" name="avatar" class="form-control">
                            <img name="avatar_path" src="" width="100px">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@section('javascript')
<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#actionModal').on('shown.bs.modal', function () {
        data = {
        	action_type : 'view'
        };
        url = '{!! route('account.post.ajax') !!}';
        func_callAjax(url,'data', data,'view');
    });
    $('#form-action').on('submit', function () {
    	event.preventDefault();
        data = new FormData(this);
        url = '{!! route('account.post.ajax') !!}';
        func_callAjax(url,'formdata', data,'submit');
    });
    function_response_private = function (data) {
    	$('#logo').attr('src',data.data.avatar_path);
    	$('#span_name').text(data.data.name);
    	$('#span_email').text(data.data.email);
    	$('#span_numberphone').text(data.data.numberphone);
    }
});
</script>
@endsection