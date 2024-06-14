<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    func_buttonClick = function(p_type, p_id){
        if( p_type == 'add'){
            $('#actionModal .modal-title').text("Thêm mới danh mục khoa/phòng");
            $('#form-action')[0].reset();
            $('#form-action #id_input_action_type').val('add');
        } 
        else if ( p_type == 'edit') {
            $('#actionModal .modal-title').text("Chỉnh sửa danh mục khoa/phòng");
            $('#form-action #id_input_action_type').val('edit');
            $('#form-action #id_input_id').val(p_id);
            func_viewCategory(p_id);
        }
        else if ( p_type == 'delete') {
            $('#deleteModal #id_input_id').val(p_id);
            $('#deleteModal #id_input_type_del').val('delete');
            $('#deleteModal .modal-header .modal-title').html('Xóa danh mục khoa/phòng');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa danh mục khoa/phòng không? ');
        }
    };
    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#form-action").on("submit", function( event ) {
        event.preventDefault();
        $data = new FormData(this);
        $url = '{!! route('AITypeOfDepartments.post.ajax') !!}';
        func_callAjax($url,'formdata', $data,'submit');
    });
    func_loaddt = function() {
        data = { 
            action_type: 'loaddt'
        };
        url = '{!! route('AITypeOfDepartments.post.ajax') !!}';
        func_callAjax(url,'data', data,'submit');
    };
    func_loaddt();
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewCategory = function(id) {     
        $.ajax({
            type: 'POST',
            url: '{!! route('AITypeOfDepartments.post.ajax') !!}',
            data: {
                id: id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                $('#actionModal input[name=name]').val(data.people.name);
                $('#actionModal input[name=code]').val(data.people.code);
                $('#actionModal input[name=short_name]').val(data.people.short_name);
                $('#actionModal input[name=address]').val(data.people.address);
                $('#actionModal input[name=founding_date]').val(data.people.founding_date);
                $('#actionModal input[name=numberphone]').val(data.people.numberphone);
                $('#actionModal input[name=email]').val(data.people.email);
                $('#actionModal textarea[name=note]').val(data.people.note);
            },
            error: function(data) { 
                $('.modal').modal('hide');
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
        $url = '{!! route('AITypeOfDepartments.post.ajax') !!}';
        func_callAjax($url,'data', $data,'submit');
    });
});
</script>