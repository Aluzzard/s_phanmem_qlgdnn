<div class="left-sidebar-pro">
    <nav id="sidebar">
        <div class="sidebar-header">
            <a href="#"><img src="" alt="" />
            </a>
            <h3 style="background: var(--color-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: bold;">
                VNPT Sóc Trăng
            </h3>
            <p>Trung tâm Công nghệ thông tin</p>
            <strong style="background: var(--color-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">VNPT</strong>
        </div>
        <div class="left-custom-menu-adp-wrap">
            <ul class="nav navbar-nav left-sidebar-menu-pro">
            @if(Auth::guard('admin')->check())
                <li class="nav-item">
                    <a href="{!! route('admin.website.information.index') !!}" class="nav-link">
                        <i class="fa big-icon fa-info-circle"></i>
                        <span class="mini-dn">Thông tin website</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{!! route('admin.get.dashboard') !!}" class="nav-link">
                        <i class="fa big-icon fa-home"></i>
                        <span class="mini-dn">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{!! route('admin.get.logs.index') !!}" class="nav-link">
                        <i class="fa big-icon fa-clock-o"></i>
                        <span class="mini-dn">Lịch sử logs</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><i class="fa big-icon fa-home"></i> <span class="mini-dn">Tuỳ biến giao diện</span> <span class="indicator-right-menu mini-dn"><i class="fa indicator-mn fa-angle-left"></i></span></a>
                    <div role="menu" class="dropdown-menu left-menu-dropdown animated flipInX">
                        <a href="{!! route('user.custominterface.get.layout') !!}" class="dropdown-item">Quản lý layout</a>
                        <a href="dashboard-2.html" class="dropdown-item">Dashboard v.2</a>
                        <a href="analytics.html" class="dropdown-item">Analytics</a>
                        <a href="widgets.html" class="dropdown-item">Widgets</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><i class="fa big-icon fa-home"></i> <span class="mini-dn">Danh mục</span> <span class="indicator-right-menu mini-dn"><i class="fa indicator-mn fa-angle-left"></i></span></a>
                    <div role="menu" class="dropdown-menu left-menu-dropdown animated flipInX">
                        <a href="{!! route('user.custominterface.get.theme') !!}" class="dropdown-item">Mẫu giao diện</a>
                        <a href="analytics.html" class="dropdown-item">Analytics</a>
                        <a href="widgets.html" class="dropdown-item">Widgets</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><i class="fa big-icon fa-gears"></i> <span class="mini-dn">Hệ thống</span> <span class="indicator-right-menu mini-dn"><i class="fa indicator-mn fa-angle-left"></i></span></a>
                    <div role="menu" class="dropdown-menu left-menu-dropdown animated flipInX">
                        <a href="{!! route('admin.get.site') !!}" class="dropdown-item">Quản lý site</a>
                        <a href="{!! route('admin.get.module') !!}" class="dropdown-item">Quản lý module</a>
                    </div>
                </li>
            @elseif(Auth::guard('user')->check())
                <li class="nav-item <?php echo (request()->segment(2) == 'dashboard' ? 'active' : ''); ?>">
                    <a href="{!! route('user.get.dashboard') !!}" class="nav-link">
                        <i class="fa big-icon fa-home"></i>
                        <span class="mini-dn">Dashboard</span>
                    </a>
                </li>
                @if($function_permissions_according_to_user) 
                    @if(in_array(100, $function_permissions_according_to_user))
                        <li class="nav-item <?php echo (request()->segment(1) == 'website-information' ? 'active' : ''); ?>">
                            <a href="{!! route('admin.website.information.index') !!}" class="nav-link">
                                <i class="fa big-icon fa-info-circle"></i>
                                <span class="mini-dn">Thông tin website</span>
                            </a>
                        </li>
                    @endif
                    @if(in_array(200, $function_permissions_according_to_user))
                        <li class="nav-item <?php echo (request()->segment(2) == 'module' ? 'active' : ''); ?>">
                            <a href="{!! route('user.get.list.module') !!}" class="nav-link">
                                <i class="fa big-icon fa-puzzle-piece"></i>
                                <span class="mini-dn">Danh sách module</span>
                            </a>
                        </li>
                    @endif
                    @if(in_array(300, $function_permissions_according_to_user) || in_array(301, $function_permissions_according_to_user) || in_array(302, $function_permissions_according_to_user))
                        <li class="nav-item <?php  if(request()->segment(2)=='users'||request()->segment(2)=='function-permission'||request()->segment(2)=='module-permission') echo 'active'; ?>">
                            <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><i class="fa big-icon fa-users"></i> <span class="mini-dn">Quản trị viên</span> <span class="indicator-right-menu mini-dn"><i class="fa indicator-mn fa-angle-left"></i></span></a>
                            <div role="menu" class="dropdown-menu left-menu-dropdown animated flipInX">
                                @if(in_array(300, $function_permissions_according_to_user))
                                <a href="{!! route('user.get.index') !!}" class="dropdown-item">Danh sách</a>
                                @endif
                                @if(in_array(301, $function_permissions_according_to_user))
                                <a href="{!! route('user.get.function.permission') !!}" class="dropdown-item">Phân quyền chức năng</a>
                                @endif
                                @if(in_array(302, $function_permissions_according_to_user))
                                <a href="{!! route('user.get.module.permission') !!}" class="dropdown-item">Phân quyền module</a>
                                @endif
                            </div>
                        </li>
                    @endif
                    
                    @if(in_array(400, $function_permissions_according_to_user))
                        <li class="nav-item">
                            <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><i class="fa big-icon fa-user-md"></i> <span class="mini-dn">Người dùng khách</span> <span class="indicator-right-menu mini-dn"><i class="fa indicator-mn fa-angle-left"></i></span></a>
                            <div role="menu" class="dropdown-menu left-menu-dropdown animated flipInX">
                                @if(in_array(400, $function_permissions_according_to_user))
                                <a href="{!! route('internal.guests.get.index') !!}" class="dropdown-item">Danh sách</a>
                                @endif
                            </div>
                        </li>
                    @endif
                    @if(in_array(500, $function_permissions_according_to_user))
                        <li class="nav-item">
                            <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><i class="fa big-icon fa-gears"></i> <span class="mini-dn">Thiết lập</span> <span class="indicator-right-menu mini-dn"><i class="fa indicator-mn fa-angle-left"></i></span></a>
                            <div role="menu" class="dropdown-menu left-menu-dropdown animated flipInX">
                                @if(in_array(500, $function_permissions_according_to_user))
                                <a href="{!! route('user.get.interface.setting') !!}" class="dropdown-item">Điều chỉnh giao diện</a>
                                @endif
                            </div>
                        </li>
                    @endif
                @endif 
            @endif
            </ul>
        </div>
    </nav>
</div>
