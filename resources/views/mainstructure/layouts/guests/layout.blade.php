<!doctype html>
<html class="no-js" lang="en">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="x-ua-compatible" content="ie=edge">
	    <title>@yield('title')</title>
	    <meta name="description" content="">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="csrf-token" id="csrf-token" content="{{ csrf_token() }}">
	    <base href="{{ asset('') }}"></base>
	    <!-- favicon
	        ============================================ -->
	    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
	    <!-- Bootstrap CSS
        ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/guests/default/css/bootstrap.css') }}">
	</head>

<body>
    
	@yield('content')
    <!-- javascript -->
    @yield('javascript')
</body>

</html>