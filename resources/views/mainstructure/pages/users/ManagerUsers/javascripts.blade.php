<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<!-- icheck JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck-active.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    
    func_buttonClick = function(p_type, p_id){
        if( p_type == 'add'){
            $('#actionModal .modal-title').text("Thêm mới người dùng");
            $('#form-action #id_input_action_type').val('add');
            $('#form-action #password').addClass('required');
            $('#form-action .password code').text('*');
            $('#form-action #account').attr('disabled', false);
            func_formReset();
        } 
        else if ( p_type == 'edit') {
            $('#actionModal .modal-title').text("Chỉnh sửa người dùng");
            $('#form-action #id_input_action_type').val('edit');
            $('#form-action #password').removeClass('required');
            $('#form-action #account').attr('disabled', true);
            $('#form-action .password code').text('');
            func_view(p_id);
        }
        else if ( p_type == 'delete') {
            $('#deleteModal #id_input_id').val(p_id);
            $('#deleteModal #id_input_type_del').val('delete');
            $('#deleteModal .modal-header .modal-title').html('Xóa tài khoản');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa tài khoản không? ');
        }
    };

    func_formReset = function(){
        $('#form-action')[0].reset();
        $('input[name="status"]').attr('checked', true); $('input[name="status"]').parent().addClass('checked');
    }
    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#form-action").on("submit", function( event ) {
        event.preventDefault();
        if ( func_checkValidate() == true ) {
            $data = new FormData(this);
            $url = '{!! route('user.post.ajax') !!}';
            func_callAjax($url,'formdata', $data,'submit');
        }
    });

    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_view = function(id) {     
        $.ajax({
            type: 'POST',
            url: '{!! route('user.post.ajax') !!}',
            data: {
                id: id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                func_formReset();
            	$('input[name="id"]').val(data.user.id);
	            $('input[name="name"]').val(data.user.name);
	          	$('input[name="account"]').val(data.user.account);
	            $('input[name="email"]').val(data.user.email);
	            $('input[name="numberphone"]').val(data.user.numberphone);
	            data.user.active == 1 ? $('input[name="status"]').attr('checked', true) : $('input[name="status"]').attr('checked', false);
                data.user.active == 1 ? $('input[name="status"]').parent().addClass('checked') : $('input[name="status"]').parent().removeClass('checked');
            },
            error: function(data) { 
                $('.modal').modal('hide');
                if (data.error == false) {
                    swal({ icon: "error", text: data.message, timer: 3000, buttons: false });
                } 
            }
        });
    };

// Modal xóa chung
/* ----------------------------------------------------------------------------------------*/
    $('#deleteModal').on('submit', function (event){
        event.preventDefault();
        $data = {
            action_type: $('#deleteModal #id_input_type_del').val(),
            id: $('#deleteModal #id_input_id').val()
        };
        $url = '{!! route('user.post.ajax') !!}';
        func_callAjax($url,'data', $data,'submit');
    });


});

</script>