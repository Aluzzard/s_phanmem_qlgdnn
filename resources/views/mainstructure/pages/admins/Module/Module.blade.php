@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý module')

@section('css')
<style type="text/css">
    #table_function_module tbody tr:hover, #table_group_modules tbody tr:hover {
        background: #ddd;
        cursor: pointer; }
    #configModule .modal-body .right-col, #groupModules .modal-body .right-col {
        display: none; }
</style>
@endsection

@section('content')
<div class="card">
	<div class="admin-dashone-data-table-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sparkline8-list">
                        <h4>Danh sách các module</h4>
                        <div class="sparkline8-graph">
                            <div class="text-right">
                                <button type="button" class="btn btn-custon-four btn-success" data-toggle="modal" data-target="#ActionModule" onclick="func_buttonClick('addModule',0)"><i class="fa big-icon fa-plus"></i><span class="ml-2">Thêm module</span></button>
                                <button type="button" class="btn btn-custon-four btn-primary" data-toggle="modal" data-target="#groupModules" onclick="func_buttonClick('groupModules',0)"><i class="fa big-icon fa-cubes"></i><span class="ml-2">Nhóm module</span></button>
                            </div>
                            <div class="datatable-dashv1-list custom-datatable-overright">
                                <table id="table_module" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="false" data-show-toggle="true" data-resizable="false" data-cookie="false" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="false">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên module</th>
                                            <th>Mô tả</th>
                                            <th>Trạng thái</th>
                                            <th>Loại</th>
                                            <th>Tên controller</th>
                                            <th>Tên nhóm</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	{!! $table_module !!}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Data table area End-->
</div>
@endsection
@section('modal')
<div id="ActionModule" class="modal fade" role="dialog">
    <div class="modal-dialog" style="max-width: 1700px; width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form id="form-action-module" method="post" enctype="multipart/form-data">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Tên module <code>*</code></label>
                        <div class="col-sm-10">
                            <input type="text" id="id_input_name" name="input_name" class="form-control" placeholder="Nhập tên module" required>
                            <input type="hidden" id="id_input_slug" name="input_slug" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Loại module <code>*</code></label>
                        <div class="col-sm-10">
                            <select class="form-control" id="id_input_type" name="input_type">
                                <option value="1">Module cho quản lý</option>
                                <option value="2">Module cho người dùng</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Mô tả module</label>
                        <textarea id="id_textarea_description" name="textarea_description" class="form-control" rows="3"></textarea>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Tên controller <code>*</code></label>
                        <div class="col-sm-10">
                            <input type="text" id="id_input_name_controller" name="input_name_controller" class="form-control" placeholder="Nhập tên module" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Đường dẫn thư mục controller <code>*</code></label>
                        <div class="col-sm-10">
                            <input type="text" id="id_input_path_controller" name="input_path_controller" class="form-control" placeholder="Ví dụ: Modules\AIArticles\AIArticles" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Đường dẫn file blade <code>*</code></label>
                        <div class="col-sm-10">
                            <input type="text" id="id_input_name_blade" name="input_name_blade" class="form-control" placeholder="Ví dụ: test" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Nhóm module</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="id_input_group_module" name="input_group_module">
                                @foreach($groups as $group)
                                    <option value="{{ $group->id }}">{{$group->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Cấu hình hiển thị</label>
                        <div class="border-table p-5">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label pr-3">Tắt / Mở</label>
                                <div class="col-sm-1 i-checks pull-left">
                                    <input type="checkbox" id="id_input_active" name="input_active" value="1"> <i></i>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Thứ tự hiển thị module</label>
                                <div class="col-sm-1">
                                    <input type="number" id="id_input_order" name="input_order" class="form-control" placeholder="0" value="0">
                                </div>
                            </div>
                            <div class="form-group d-flex row align-items-flex-end">
                                <label class="col-sm-2 col-form-label">Ảnh đại diện</label>
                                <div class="col-sm-1">
                                    <img id="id_img_module" src="" width="50px">
                                    <input type="file" id="id_input_avatar" name="input_avatar" accept="image/png, image/jpg, image/jpeg">
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="id_input_action_type" name="input_action_type" class="form-control">
                    <input type="hidden" id="id_input_id_module" name="input_id_module" class="form-control">
                    
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Cấu hình các function trong module -->
<!-- ---------------------------------------------------------------------------------------- -->

<div id="configModule" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" style="max-width: 1700px; width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Cấu hình các function được sử dụng trong module</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-7">
                        <h4>Danh sách các chức năng trong module</h4>
                        <div align="right">
                            <button type="button" class="btn btn-success" onclick="func_buttonModalConfigClick(`addFunction`,0)">Thêm</button>
                        </div>
                        <table id="table_function_module" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Phương thức</th>
                                    <th>Tên function</th>
                                    <th>Mô tả chức năng</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <div class="right-col col-sm-5">
                        <h4 id="form_config_module_title"></h4>
                        <form id="form_config_module">
                            <div class="form-group">
                                <label class="col-form-label">Tên function</label>
                                <input type="text" id="id_input_name_function" name="input_name_function" class="form-control">
                                <input type="hidden" id="id_input_id_function" name="input_id_function" class="form-control">
                                <input type="hidden" id="id_input_action_type_function" name="input_action_type" class="form-control">
                                <input type="hidden" id="id_input_id_module" name="input_id_module" class="form-control">

                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Mô tả function</label>
                                <input type="text" id="id_input_description_function" name="input_description_function" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Phương thức</label>
                                <select class="form-control" id="id_input_method_function" name="input_method_function">
                                    <option value="1">GET</option>
                                    <option value="2">POST</option>
                                </select>
                            </div>
                            <div>
                                <button type="submit" class="btn btn-success">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Nhóm module -->
<!-- ---------------------------------------------------------------------------------------- -->
<div id="groupModules" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Nhóm các module</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div align="right">
                            <button type="button" class="btn btn-success" onclick="func_buttonModalGroupsModuleClick(`addGroupModules`,0)">Thêm</button>
                        </div>
                        <table id="table_group_modules" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Tên nhóm</th>
                                    <th>Thứ tự</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <div class="right-col col-sm-6">
                        <h4 id="form_group_modules_title"></h4>
                        <form id="form_group_modules">
                            <div class="form-group">
                                <label class="col-form-label">Tên nhóm</label>
                                <input type="hidden" id="id_input_id_group_modules" name="input_id_group_modules" class="form-control">
                                <input type="text" id="id_input_name_group_modules" name="input_name_group_modules" class="form-control">
                                <input type="hidden" id="id_input_action_type_group_modules" name="input_action_type" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Thứ tự</label>
                                <input type="number" id="id_input_order_group_modules" name="input_order_group_modules" class="form-control">
                            </div>
                            <div>
                                <button type="submit" class="btn btn-success">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal Delete-->
<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel"></h5>
            </div>
            <div class="modal-body">
                <form id="form-delete">
                    <input type="hidden" name="input_id_module" id="id_input_id_module">
                    <input type="hidden" id="id_input_type_del">
                    <div class="question-to-confirm"></div>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-danger" id="delete">Xóa</button>
                    </div>
                </form> 
            </div>
        </div>
    </div>
</div>

@endsection
@section('javascript')
<!-- icheck JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck-active.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $('#id_input_name').on('input',function(event) {
        var title = $('#id_input_name').val();
        var slug = ChangeToSlug(title);
        $('#id_input_slug').val(slug);
    });
    $('#form-action-module #id_input_name_controller').on('input', function(){
        var name_controller = $('#form-action-module #id_input_name_controller').val();
        $('#form-action-module #id_input_path_controller').val('Modules\\'+ name_controller+'\\'+name_controller+'Controller');
        $('#form-action-module #id_input_name_blade').val('modules.'+ name_controller);
    });
    func_buttonClick = function(p_type,id_btn){
        if( p_type == 'addModule'){
            $('#ActionModule .modal-title').text("Thêm mới module");
            func_resetform(p_type);
            $('#form-action-module #id_input_action_type').val('addModule');
        } 
        else if ( p_type == 'editModule') {
            func_viewModule(id_btn);
        }
        else if ( p_type == 'delModule') {
            $('#deleteModal #id_input_id_module').val(id_btn);
            $('#deleteModal #id_input_type_del').val('delModule');
            $('#deleteModal .modal-header .modal-title').html('Xóa module');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa module không? ');
        }
        else if ( p_type == 'configModule') {
            func_viewFunctionsModule(id_btn);
        }
        else if ( p_type == 'groupModules') {
            func_managergroupsModules();
        }
    };
    func_resetform = function(action_type) {
        $('#form-action-module')[0].reset();
        $('#id_img_module').attr('src','');
        $('input[name="input_active"]').attr('checked', false); $('input[name="input_active"]').parent().removeClass('checked');
    };
    
    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#form-action-module").on("submit", function( event ) {
        event.preventDefault();
        $.ajax({
            type: 'POST',
            url: '{!! route('admin.action.module') !!}',
            data:new FormData(this),
            dataType:'JSON',
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                $('.modal').modal('hide');
                if (data.error == false) {
                    swal({ icon: "success", text: data.message, timer: 3000, buttons: false });
                    $('[data-toggle="table"]').bootstrapTable('destroy');
                    $('#table_module tbody').html(data.table_module);
                    $('[data-toggle="table"]').bootstrapTable();
                } 
            },
            error: function(data) {
                $('.modal').modal('hide');
                if (data.error == false) {
                    swal({ icon: "error", text: data.message, timer: 3000, buttons: false });
                } 
            }
        });
    });

    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewModule = function(p_id_module) {     
        $.ajax({
            type: 'POST',
            url: '{!! route('admin.action.module') !!}',
            data: {
                id_module: p_id_module,
                input_action_type: 'viewModule'
            },
            dataType:'JSON',
            success: function(data) {
                $('#ActionModule .modal-title').text("Chỉnh sửa module: " + data.module.name);
                $('#id_input_action_type').val('editModule');
                $('#id_input_name').val(data.module.name);
                $('#id_input_slug').val(data.module.slug);
                $('#id_input_type').val(data.module.type);
                $('#id_textarea_description').val(data.module.description);
                $('#id_input_name_controller').val(data.module.controller);
                $('#id_input_path_controller').val(data.module.path_controller);
                $('#id_input_name_blade').val(data.module.path_view);
                $('#id_input_group_module').val(data.module.id_group);
                $('#id_input_order').val(data.module.order);
                $('#id_img_module').attr('src',data.module.avatar);
                $('#id_input_id_module').val(data.module.id); 
                data.module.active == 1 ? $('input[name="input_active"]').attr('checked', true) : $('input[name="input_active"]').attr('checked', false);
                data.module.active == 1 ? $('input[name="input_active"]').parent().addClass('checked') : $('input[name="input_active"]').parent().removeClass('checked');
            },
            error: function(data) { 
            }
        });
    };


// Function module
/* ----------------------------------------------------------------------------------------*/

    //Lấy dữ liệu các function của 1 module và đổ ra trong config
    func_viewFunctionsModule = function(p_id_module) {   
        $.ajax({
            type: 'POST',
            url: '{!! route('admin.action.module') !!}',
            data: {
                id_module: p_id_module,
                input_action_type: 'viewFunctionModule'
            },
            dataType:'JSON',
            success: function(data) {
                $('#form_config_module #id_input_id_module').val(data.id_module);
                $('#table_function_module tbody').html(data.html);
            },
            error: function(data) { 
            }
        });
    };
    func_buttonModalConfigClick = function(action_type, id_btn){
        if( action_type == 'editFunction') {
            $('#configModule .modal-body .right-col').show();
            func_viewFunctionModule(id_btn);
        } else if ( action_type == 'delFunction') {
            $('#deleteModal #id_input_id_module').val(id_btn);
            $('#deleteModal #id_input_type_del').val('delFunction');
            $('#deleteModal .modal-header .modal-title').html('Xóa chức năng');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa chức năng không? ');
        } else if ( action_type == 'addFunction') {
            $('#configModule .modal-body .right-col').show();
            var temp_id_module = $('#form_config_module #id_input_id_module').val();
            $('#form_config_module')[0].reset();
            $('#form_config_module #id_input_id_module').val(temp_id_module);
            $('h4#form_config_module_title').html('Thêm mới chức năng');
            $('#id_input_action_type_function').val('addFunction');
        }
    }
    //Click chọn 1 function, Lấy dữ liệu 1 function và đổ ra trong config
    func_viewFunctionModule = function(p_id_module){
        $.ajax({
            type: 'POST',
            url: '{!! route('admin.action.function') !!}',
            data: {
                id_module: p_id_module,
                input_action_type: 'viewFunction'
            },
            dataType:'JSON',
            success: function(data) {
                $('h4#form_config_module_title').html('Chỉnh sửa chức năng: <span style="color: red;">'+data.function.function+'</span>');
                $('#id_input_id_function').val(data.function.id);
                $('#id_input_name_function').val(data.function.function);
                $('#id_input_description_function').val(data.function.description);
                $('#id_input_method_function').val(data.function.method);
                $('#id_input_action_type_function').val('editFunction');
            },
            error: function(data) { 
            }
        });
    }
    $("#form_config_module").on("submit", function( event ) {
        event.preventDefault();
        $.ajax({
            type: 'POST',
            url: '{!! route('admin.action.function') !!}',
            data:new FormData(this),
            dataType:'JSON',
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                if (data.error == false) {
                    swal({ icon: "success", text: data.message, timer: 3000, buttons: false });
                    $('#table_function_module tbody').html(data.datatable);
                    $('#configModule .modal-body .right-col').hide();
                } 
            },
            error: function(data) { 
            }
        });
    });
//End Function module


// Nhóm modules
/* ----------------------------------------------------------------------------------------*/

    func_managergroupsModules = function() {
        $.ajax({
            type: 'POST',
            url: '{!! route('admin.action.module') !!}',
            data: {
                input_action_type: 'viewGroupsModule'
            },
            dataType:'JSON',
            success: function(data) {
                $('#table_group_modules tbody').html(data.html);
            },
            error: function(data) { 
            }
        });
    }

    func_buttonModalGroupsModuleClick = function(action_type, id_btn){
        if( action_type == 'editGroupModules') {
            $('#groupModules .modal-body .right-col').show();
            func_viewGroupModule(id_btn);
        } else if ( action_type == 'delGroupModules') {
            $('#deleteModal #id_input_id_module').val(id_btn);
            $('#deleteModal #id_input_type_del').val('delGroupModules');
            $('#deleteModal .modal-header .modal-title').html('Xóa nhóm module');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa nhóm module không? ');
        } else if ( action_type == 'addGroupModules') {
            $('#groupModules .modal-body .right-col').show();
            $('#form_group_modules')[0].reset();
            $('h4#form_group_modules_title').html('Thêm mới nhóm module');
            $('#id_input_action_type_group_modules').val('addGroupModules');
        }
    }
    //Lấy dữ liệu 1 nhóm module và đổ ra
    func_viewGroupModule = function(p_id_group_modules){
        $.ajax({
            type: 'POST',
            url: '{!! route('admin.action.group.modules') !!}',
            data: {
                id_group_module: p_id_group_modules,
                input_action_type: 'viewGroupModules'
            },
            dataType:'JSON',
            success: function(data) {
                $('h4#form_group_modules_title').html('Chỉnh sửa nhóm module: <span style="color: red;">'+data.group_modules.name+'</span>');
                $('#id_input_id_group_modules').val(data.group_modules.id);
                $('#id_input_name_group_modules').val(data.group_modules.name);
                $('#id_input_order_group_modules').val(data.group_modules.order);
                $('#id_input_action_type_group_modules').val('editGroupModules');
            },
            error: function(data) { 
            }
        });
    }
    $("#form_group_modules").on("submit", function( event ) {
        event.preventDefault();
        $.ajax({
            type: 'POST',
            url: '{!! route('admin.action.group.modules') !!}',
            data:new FormData(this),
            dataType:'JSON',
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                if (data.error == false) {
                    swal({ icon: "success", text: data.message, timer: 3000, buttons: false });
                    $('#table_group_modules tbody').html(data.html_group_modules);
                    $('#groupModules .modal-body .right-col').hide();
                } 
            },
            error: function(data) { 
            }
        });
    });

// Modal xóa chung
/* ----------------------------------------------------------------------------------------*/

    $('#deleteModal').on('submit', function (event){
        if( $('#deleteModal #id_input_type_del').val() == 'delModule' ) {
            var route = '{!! route('admin.action.module') !!}';
        } else if( $('#deleteModal #id_input_type_del').val() == 'delFunction' ) {
            var route = '{!! route('admin.action.function') !!}';
        } else if( $('#deleteModal #id_input_type_del').val() == 'delGroupModules' ) {
            var route = '{!! route('admin.action.group.modules') !!}';
        }
        event.preventDefault();
        $.ajax({
            type: 'POST',
            url: route,
            data: {
                input_action_type: $('#deleteModal #id_input_type_del').val(),
                input_id_module: $('#deleteModal #id_input_id_module').val()
            },
            dataType: 'json',
            success: function(data) {
                $('#deleteModal').modal('hide');
                if (data.error == false) {
                    swal({ icon: "success", text: data.message, timer: 3000, buttons: false });
                    if(data.type == 'delModule'){
                        $('[data-toggle="table"]').bootstrapTable('destroy');
                        $('#table_module tbody').html(data.datatable);
                        $('[data-toggle="table"]').bootstrapTable();
                    } else if(data.type == 'delFunction'){
                        $('#table_function_module tbody').html(data.datatable);
                    } else if(data.type == 'delGroupModules'){
                        $('#table_group_modules tbody').html(data.datatable);
                    }
                    
                } 
            },
            error: function(data) {
            }
        });
    });
});
</script>
@endsection