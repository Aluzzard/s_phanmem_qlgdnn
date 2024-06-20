<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    func_buttonClick = function(p_type, p_id){
        if( p_type == 'add'){
            $('#actionModal .modal-title').text("Thêm mới chính sách");
            $('#form-action')[0].reset();
            $('#form-action input[name=action_type]').val('add');
        } 
        else if ( p_type == 'edit') {
            $('#actionModal .modal-title').text("Chỉnh sửa chính sách");
            $('#form-action input[name=action_type]').val('edit');
            $('#form-action input[name=id]').val(p_id);
            func_viewCategory(p_id);
        }
        else if ( p_type == 'delete') {
            $('#deleteModal input[name=id]').val(p_id);
            $('#deleteModal input[name=action_type]').val('delete');
            $('#deleteModal .modal-header .modal-title').html('Xóa chính sách');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa chính sách không? ');
        }
    };
    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#form-action").on("submit", function( event ) {
        event.preventDefault();
        $data = new FormData(this);
        $url = '{!! route('AIVocationalEducationPolicities.post.ajax') !!}';
        func_callAjax($url,'formdata', $data,'submit');
    });
    func_loaddt = function() {
        data = { 
            action_type: 'loaddt'
        };
        url = '{!! route('AIVocationalEducationPolicities.post.ajax') !!}';
        func_callAjax(url,'data', data,'submit');
    };
    func_loaddt();
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewCategory = function(id) {     
        $.ajax({
            type: 'POST',
            url: '{!! route('AIVocationalEducationPolicities.post.ajax') !!}',
            data: {
                id: id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                $('#actionModal textarea[name=name]').val(data.item.name);
                $('#actionModal select[name=type]').val(data.item.type);
                $('#actionModal input[name=order]').val(data.item.input);
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
            action_type: $('#deleteModal input[name=action_type]').val(),
            id: $('#deleteModal input[name=id]').val()
        };
        $url = '{!! route('AIVocationalEducationPolicities.post.ajax') !!}';
        func_callAjax($url,'data', $data,'submit');
    });
});
</script>