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
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"> -->
    
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/bootstrap/bootstrap.min.css') }}">
    <!-- <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/bootstrap/bootstrap-utilities.min.css') }}"> -->
    <!-- Bootstrap CSS
        ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/font-awesome.min.css') }}">
    <!-- adminpro icon CSS
        ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/adminpro-custon-icon.css') }}">
    <!-- meanmenu icon CSS
        ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/meanmenu.min.css') }}">
    <!-- mCustomScrollbar CSS
        ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/jquery.mCustomScrollbar.min.css') }}">
    <!-- animate CSS / Hiệu ứng sidebar
        ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/animate.css') }}">
    <!-- buttons CSS
        ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/buttons.css') }}">
    <!-- notifications CSS
        ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/notifications/Lobibox.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/notifications/notifications.css') }}">
    <!-- Choosen CSS
    ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/chosen/bootstrap-chosen.css') }}">
    <!-- style CSS
        ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/customtheme/style.css') }}">
    <!-- responsive CSS
        ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/responsive.css') }}">
    <!-- util CSS
        ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/util/util.css') }}">
    <!-- modernizr JS / Modernizr sẽ chèn vào các đoạn Class thay thế vào bên trong thẻ HTML khi phát hiện trình duyệt cũ
        ============================================ -->
    <script src="{{ asset('assets/administration/mainstructure/js/vendor/modernizr-2.8.3.min.js') }}"></script>
    <!-- data-table CSS
    ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/data-table/bootstrap-table.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/data-table/bootstrap-editable.css') }}">
    <!-- Preloader CSS
        ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/preloader/preloader-style.css') }}">

    <!-- tree viewer CSS
    ============================================ -->
    <link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/tree-viewer/tree-viewer.css') }}">

    @yield('css')
    <style>
        :root {
            --color-gradient: <?= $information_website->color_gradient ?>;
            --color-background: <?= $information_website->color_background ?>;
            --color-font: <?= $information_website->color_font ?>;
            --color-font-hover: <?= $information_website->color_font_hover ?>;
            --color-font-focus: <?= $information_website->color_font_focus ?>;
        }
    </style>
</head>



