<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<!-- icheck JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck-active.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    func_buttonClick = function(p_type, p_id){
        if ( p_type == 'edit') {
            $('#actionModal .modal-title').text("Phân quyền chức năng người dùng");
            $('#form-action #action_type').val('edit');
            $('#form-action #id').val(p_id);
            func_formReset();
            func_view(p_id);
        }
    };
    $(':checkbox').click(function() {
        console.log(1235)
    });

    func_formReset = function(){
        $('#form-action')[0].reset();
        $('input[type="checkbox"]').iCheck('update');
    }
    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#form-action").on("submit", function( event ) {
        event.preventDefault();
        $data = {
            action_type: $('#form-action #action_type').val(),
            array_function_permissions: func_checkRole(),
            user_id: $('#form-action #id').val()
        };
        $url = '{!! route('user.action.function.permission') !!}';
        func_callAjax($url,'data', $data,'submit');
    });
    func_checkRole = function(){
        var array_view_is_checked = '';
        var array_edit_is_checked = '';
        var array_delete_is_checked = '';
        var array_function_permissions = [];

        $("#form-action input[type=checkbox]").each( function () {
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
    func_view = function(user_id) { 
        $.ajax({
            type: 'POST',
            url: '{!! route('user.action.function.permission') !!}',
            data: {
                user_id: user_id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                if (data.error == false) {
                    if( data.list.length > 0 ) {
                        for (var i = 0; i < data.list.length; i++) {
                            if(data.list[i].function_permissions != null) {
                                for (var j = 0; j < data.list[i].function_permissions.split(',').length; j++) {
                                    $('#form-action input[value='+data.list[i].action+'][data-id-module='+data.list[i].function_permissions.split(',')[j]+']').iCheck('check');
                                }
                            } else {
                                $('#form-action input[value='+data.list[i].action+']').each( function () {
                                    $('#form-action input[value='+data.list[i].action+']').iCheck('uncheck');
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