@extends('mainstructure.layouts.admins.layout')
@section('title','Đổi mật khẩu')

@section('css')
<link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/form/form.css') }}">
@endsection

@section('content')
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 card">
			<h4>Đổi mật khẩu</h4>
			<form id="form-action">
				<div class="form-group row">
					<div class="col-md-4 login-input-head">
                        <p>Nhập mật khẩu cũ <code>*</code></p>
                    </div>
					<div class="col-md-8">
						<div class="row">
							<div class="col-lg-6">
                                <div class="login-input-area register-mg-rt">
                                    <input type="password" name="old_password" class="required" data-notify="Vui lòng nhập mật khẩu cũ!" />
                                    <i class="fa fa-eye login-user"></i>
                                </div>
                            </div>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-4 login-input-head">
                        <p>Nhập mật khẩu mới <code>*</code></p>
                    </div>
					<div class="col-md-8">
						<div class="row">
							<div class="col-lg-6">
                                <div class="login-input-area register-mg-rt">
                                    <input type="password" name="new_password" class="required" data-notify="Vui lòng nhập mật khẩu mới!" />
                                    <i class="fa fa-eye login-user"></i>
                                </div>
                            </div>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-4 login-input-head">
                        <p>Nhập lại mật khẩu mới <code>*</code></p>
                    </div>
					<div class="col-md-8">
						<div class="row">
							<div class="col-lg-6">
                                <div class="login-input-area register-mg-rt">
                                    <input type="password" name="confirm_password" class="required" data-notify="Vui lòng nhập lại mật khẩu mới!" />
                                    <i class="fa fa-eye login-user"></i>
                                </div>
                            </div>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
			</form>
		</div>
	</div>
</div>
@endsection

@section('javascript')
<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.login-user').on('click', function(){
		$(this).toggleClass('fa-eye-slash');
		$(this).toggleClass('fa-eye');
		if( $(this).hasClass('fa-eye') ) {
			$(this).prev().attr( 'type', 'password' );
		} else {
			$(this).prev().attr( 'type', 'text' );
		}
		
	});
	$("#form-action").on("submit", function( event ) {
		event.preventDefault();
	    if ( func_checkValidate() == true ) {
            $data = new FormData(this);
            $url = '{!! route('user.post.changepassword') !!}';
            func_callAjax($url,'formdata', $data,'submit');
        }
	});
});
</script>
@endsection