<!doctype html>
<html class="no-js" lang="en">

@include('mainstructure.partials.head')

<body class="materialdesign">
    <div class="wrapper-pro">
        @include('mainstructure.partials.sidebar')
        <!-- Header top area start-->
        <div class="content-inner-all">
            @include('mainstructure.partials.header')
            <!-- Header top area end-->
            <!-- Mobile Menu start -->
            @include('mainstructure.partials.sidebar-mobile')
            <!-- Mobile Menu end -->
            <div class="content-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 content-module">
                            @include('mainstructure.partials.preloader')
                            @yield('content')
                            @yield('modal')
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <!-- Footer Start-->
    @include('mainstructure.partials.footer')
    <!-- Footer End-->
    @include('mainstructure.partials.javascript')
</body>

</html>