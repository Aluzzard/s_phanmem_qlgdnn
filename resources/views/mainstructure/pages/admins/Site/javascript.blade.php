<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<!-- icheck JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck-active.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    func_buttonClick = function(p_type, p_id){
        if( p_type == 'add'){
            $('#actionModal .modal-title').text("Thêm mới site");
            func_formReset();
            $('#actionModal #form-action input[name=action_type]').val('add');
        } 
        else if ( p_type == 'edit') {
            $('#actionModal .modal-title').text("Chỉnh sửa site");
            $('#actionModal #form-action input[name=action_type]').val('edit');
            func_viewAction(p_id);
        }
        else if ( p_type == 'addAccount') {
            $('#accountModal #form-action')[0].reset();
            $('#accountModal .modal-title').text("Cấp tài khoản");
            $('#accountModal #form-action input[name=action_type]').val('addAccount');
            $('#accountModal #form-action input[name=id_site]').val(p_id);
        }
        else if ( p_type == 'editAccount') {
            $('#accountModal input[name=account]').parent().parent().hide();
            func_formReset();
            $('#accountModal .modal-title').text("Reset tài khoản");
            $('#accountModal #form-action input[name=action_type]').val('editAccount');
            $('#accountModal #form-action input[name=id_site]').val(p_id);
        }
        else if ( p_type == 'editFunction') {
            $('#functionModal .modal-title').text("Phân quyền chức năng");
            func_formReset();
            $('#functionModal #form-action input[name=action_type]').val('editFunction');
            $('#functionModal #form-action input[name=id_site]').val(p_id);
            func_viewFunction(p_id);
        }
        else if ( p_type == 'editModule') {
            $('#moduleModal .modal-title').text("Phân quyền module");
            func_formReset();
            $('#moduleModal #form-action input[name=action_type]').val('editModule');
            $('#moduleModal #form-action input[name=id_site]').val(p_id);
            func_viewModule(p_id);
        }
        
    };

    func_formReset = function(){
        $('#actionModal #form-action')[0].reset();
        $('#functionModal #form-action')[0].reset();
        $('#moduleModal #form-action')[0].reset();

        $('input[type="checkbox"]').iCheck('update');
        $('#actionModal input[name=account]').attr('disabled', false);
    }

    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#actionModal #form-action").on("submit", function( event ) {
        event.preventDefault();
        data = new FormData(this);
        url = '{!! route('admin.ajax.site') !!}';
        func_callAjax(url,'formdata', data,'submit');
    });

    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewAction = function(id) {
        $.ajax({
            type: 'POST',
            url: '{!! route('admin.ajax.site') !!}',
            data: {
                id: id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                console.log(data)
            	$('#actionModal input[name=id]').val(data.site.id);
                $('#actionModal input[name=name]').val(data.site.name);
                $('#actionModal input[name=address]').val(data.site.address);
                
                $('#actionModal input[name=email]').val(data.site.email);
                $('#actionModal input[name=numberphone]').val(data.site.numberphone);
                $('#actionModal input[name=domain_1]').val(data.site.domain_1);
                $('#actionModal input[name=domain_2]').val(data.site.domain_2);
                $('#actionModal input[name=folder_for_save]').val(data.site.folder_for_save);
                $('#actionModal input[name=storage]').val(data.site.storage);

                $('#actionModal input[name=till_the_time]').val(data.site.till_the_time);
                $('#actionModal input[name=theme]').val(data.site.theme);
                $('#actionModal input[name=note]').val(data.site.note);

                $('#actionModal img[name=logo]').attr('src', data.site.logo);

                data.site.is_active == 1 ? $('input[name="is_active"]').iCheck('check') : $('input[name="is_active"]').iCheck('uncheck');
            },
            error: function(data) { 
                $('.modal').modal('hide');
                if (data.error == false) {
                    show_notify('error', false, 'Lỗi', data.message); 
                } 
            }
        });
    };
//Account

    $("#accountModal #form-action").on("submit", function( event ) {
        event.preventDefault();
        data = new FormData(this);
        url = '{!! route('admin.ajax.site') !!}';
        func_callAjax(url,'formdata', data,'submit');
    });
    
//Function

    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#functionModal #form-action").on("submit", function( event ) {
        event.preventDefault();
        data = {
            action_type: 'editFunction',
            array_function_permissions: func_checkRoleFunction(),
            id_site: $('#functionModal #form-action input[name=id_site]').val()
        };
        url = '{!! route('admin.ajax.site') !!}';
        func_callAjax(url,'data', data,'submit');
    });
    func_checkRoleFunction = function(){
        var array_view_is_checked = '';
        var array_edit_is_checked = '';
        var array_delete_is_checked = '';
        var array_function_permissions = [];

        $("#functionModal #form-action input[type=checkbox]").each( function () {
            if( $(this).parent().hasClass('checked') ){
                if( $(this).val() == 'view'){
                    array_view_is_checked += ','+$(this).attr('data-id-module')
                } else if( $(this).val() == 'edit'){
                    array_edit_is_checked += ','+$(this).attr('data-id-module')
                } else if( $(this).val() == 'delete'){
                    array_delete_is_checked += ','+$(this).attr('data-id-module')
                }
            } 
        });
        array_function_permissions.push(
            {
                function_permission: array_view_is_checked.substring(1),
                action: 'view',
            },
            {
                function_permission: array_edit_is_checked.substring(1),
                action: 'edit',
            },
            {
                function_permission: array_delete_is_checked.substring(1),
                action: 'delete',
            },
        );
        return array_function_permissions;
    }//
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewFunction = function(id_site) { 
        $.ajax({
            type: 'POST',
            url: '{!! route('admin.ajax.site') !!}',
            data: {
                id_site: id_site,
                action_type: 'viewFunction'
            },
            dataType:'JSON',
            success: function(data) {
                if (data.error == false) {
                    if( data.list.length > 0 ) {
                        for (var i = 0; i < data.list.length; i++) {
                            if(data.list[i].function_permissions != null) {
                                for (var j = 0; j < data.list[i].function_permissions.split(',').length; j++) {
                                    $('#functionModal #form-action input[value='+data.list[i].action+'][data-id-module='+data.list[i].function_permissions.split(',')[j]+']').iCheck('check');
                                }
                            } else {
                                $('#functionModal #form-action input[value='+data.list[i].action+']').each( function () {
                                    $('#form-action input[value='+data.list[i].action+'][data-id-module='+data.list[i].function_permissions.split(',')[j]+']').iCheck('uncheck');
                                });
                            }
                        }
                    } else {
                        func_formReset();
                    }
                } else {
                    show_notify('error', false, 'Lỗi', data.message); 
                }
            },
            error: function(data) { 
                // if (data.error == false) {
                //     swal({ icon: "error", text: data.message, timer: 3000, buttons: false });
                // } 
            }
        });
    };
//Module
    $("#moduleModal #form-action").on("submit", function( event ) {
        event.preventDefault();
        data = {
            action_type: 'editModule',
            array_module_permissions: func_checkRoleModule(),
            id_site: $('#moduleModal #form-action input[name=id_site]').val()
        };
        url = '{!! route('admin.ajax.site') !!}';
        func_callAjax(url,'data', data,'submit');
        
    });
    func_checkRoleModule = function(){
        var array_view_is_checked = '';
        var array_add_is_checked = '';
        var array_edit_is_checked = '';
        var array_delete_is_checked = '';
        var array_module_permissions = [];

        $("#moduleModal #form-action input[type=checkbox]").each( function () {
            if( $(this).parent().hasClass('checked') ) {
                if( $(this).val() == 'view'){
                    array_view_is_checked += ','+$(this).attr('data-id-module')
                } else if( $(this).val() == 'add'){
                    array_add_is_checked += ','+$(this).attr('data-id-module')
                } else if( $(this).val() == 'edit'){
                    array_edit_is_checked += ','+$(this).attr('data-id-module')
                } else if( $(this).val() == 'delete'){
                    array_delete_is_checked += ','+$(this).attr('data-id-module')
                }
            } 
        });
        array_module_permissions.push(
            {
                module_permission: array_view_is_checked.substring(1),
                action: 'view',
            },
            {
                module_permission: array_add_is_checked.substring(1),
                action: 'add',
            },
            {
                module_permission: array_edit_is_checked.substring(1),
                action: 'edit',
            },
            {
                module_permission: array_delete_is_checked.substring(1),
                action: 'delete',
            },
        );
        return array_module_permissions;
    }//
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewModule = function(id_site) { 
        $.ajax({
            type: 'POST',
            url: '{!! route('admin.ajax.site') !!}',
            data: {
                id_site: id_site,
                action_type: 'viewModule'
            },
            dataType:'JSON',
            success: function(data) {
                console.log(data)
                if (data.error == false) {
                    if( data.list.length > 0 ) {
                        for (var i = 0; i < data.list.length; i++) {
                            if(data.list[i].module_permissions != null) {
                                for (var j = 0; j < data.list[i].module_permissions.split(',').length; j++) {
                                    $('#moduleModal #form-action input[value="'+data.list[i].action+'"][data-id-module="'+data.list[i].module_permissions.split(',')[j]+'"]').iCheck('check');
                                }
                            } 
                            else {
                                $('#form-action input[value='+data.list[i].action+']').each( function () {
                                    $('#moduleModal #form-action input[value="'+data.list[i].action+'"][data-id-module="'+data.list[i].module_permissions.split(',')[j]+'"]').iCheck('uncheck');
                                });
                            }
                        }
                    } else {
                        func_formReset();
                    }
                } else {
                    show_notify('error', false, 'Lỗi', data.message); 
                }
            },
            error: function(data) { 
                // if (data.error == false) {
                //     swal({ icon: "error", text: data.message, timer: 3000, buttons: false });
                // } 
            }
        });
    };
});

</script>