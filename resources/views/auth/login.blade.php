<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Đăng nhập</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<base href="{{ asset('') }}"></base>
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i,800" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/bootstrap/bootstrap.min.css') }}">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/font-awesome.min.css') }}">
    <!-- adminpro icon CSS
		============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/adminpro-custon-icon.css') }}">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/animate.css') }}">
    <!-- form CSS
		============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/form/form.css') }}">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/customtheme/style.css') }}">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/responsive.css') }}">

    <style>
    	.login-form-area {
		    height: 100vh;
		    background: url(assets/administration/mainstructure/img/bg-login.webp) no-repeat;
		    background-size: cover;
		    background-position: bottom;
    		display: flex;
    		align-items: center;
    	}
    	.login-bg {
    		max-width: 100vw;
		    background: rgba(255, 255, 255, 0.2);
            border-radius: 16px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
/*            text-shadow: 2px 0 #000;*/
    	}
        .login-bg input {
            background: transparent;
            border: 0 !important;
            border-bottom: 1px solid !important;
        }
        .login-input-area .login-user {
            color: white;
            border-left: 0;
        }
        ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
          color: white;
          opacity: 1; /* Firefox */ }
        :-ms-input-placeholder { /* Internet Explorer 10-11 */
          color: white; }
        ::-ms-input-placeholder { /* Microsoft Edge */
          color: white; }
        input:-webkit-autofill,
        input:-webkit-autofill:focus {
            transition: background-color 0s 600000s, color 0s 600000s;
        }
        input:focus {
            outline: none;
        }
        /*------------------------------------------------------------------
        [ Button ]*/
        .container-btn-gradient {
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 13px;
        }

        .wrap-btn-gradient {
            /*width: 50%;*/
            display: block;
            position: relative;
            z-index: 1;
            border-radius: 25px;
            overflow: hidden;
            margin: 0 auto;
        }

        .bgbtn-gradient {
            position: absolute;
            z-index: -1;
            width: 300%;
            background: -webkit-linear-gradient(90deg, #ff3800, #ffbd00, #ff3800, #ffbd00);
            background: -moz-linear-gradient(90deg, #ff3800, #ffbd00, #ff3800, #ffbd00);
            background: -o-linear-gradient(90deg, #ff3800, #ffbd00, #ff3800, #ffbd00);
            background: linear-gradient(90deg, #ff3800, #ffbd00, #ff3800, #ffbd00);
            height: 100%;
            top: 0;
            left: -100%;

            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
            transition: all 0.4s;
        }

        .btn-gradient {
            font-size: 15px;
            color: #fff;
            line-height: 1.2;
            text-transform: uppercase;

            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 20px;
            width: 100%;
            height: 40px;

            background: transparent;
            border: none;
            font-weight: bold;
        }

        .wrap-btn-gradient:hover .bgbtn-gradient {
            left: 0;
        }

        .wrap-btn-gradient:hover a {
            color:  white;
        }
    </style>
</head>

<body class="materialdesign">
	<div class="login-form-area">
	    <div class="login-form-box container-fluid">
            <form id="adminpro-form" class="adminpro-form" method="POST" action="{!!route('auth.post.login')!!}">
                <div class="login-bg">
                	{{ csrf_field() }}
                    <div class="row">
                        <div class="col-lg-12 text-center" style="color: #00f2fc; text-shadow: 2px 0 #000;">
                            <h3>PHẦN MỀM QUẢN LÝ</h3>
                            <h3>GIÁO DỤC NGHỀ NGHIỆP</h3>
                            <h3>GIÁO DỤC THƯỜNG XUYÊN</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="login-title text-dark">
                                <h1>Đăng nhập</h1>
                            </div>
                        </div>
                    </div>
                    @if (session()->has('message'))
                    <div class="alert alert-danger alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        {{ session()->get('message') }}
                    </div>
                    @endif
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="login-input-area">
                                <input type="text" name="account" placeholder="Tên đăng nhập" />
                                <i class="fa fa-user login-user" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="login-input-area">
                                <input type="password" name="password" placeholder="Mật khẩu" />
                                <i class="fa fa-lock login-user"></i>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="container-btn-gradient">
                            <div class="wrap-btn-gradient">
                                <div class="bgbtn-gradient"></div>
                                <button type="submit" class="btn-gradient btn-primary-gradient">Đăng nhập</button>
                                
                            </div>
                        </div>
                        
                    </div>
                    <!-- <div class="row">
		                <div class="col-lg-12 text-center">
		                    <img src="assets/administration/mainstructure/img/logo/logo-vnpt.png" width="100" />
		                </div>
		            </div> -->
                </div>

            </form>
            
	    </div>
	</div>
	    <!-- jquery
		============================================ -->
    <script src="{{ asset('assets/administration/mainstructure/js/vendor/jquery-1.11.3.min.js') }}"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="{{ asset('assets/administration/mainstructure/js/bootstrap.min.js') }}"></script>
    <!-- form validate JS
		============================================ -->
    <script src="{{ asset('assets/administration/mainstructure/js/jquery.form.min.js') }}"></script>
    <script src="{{ asset('assets/administration/mainstructure/js/jquery.validate.min.js') }}"></script>
    <script src="{{ asset('assets/administration/mainstructure/js/form-active.js') }}"></script>
</body>

</html>