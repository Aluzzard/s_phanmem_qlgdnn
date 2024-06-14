<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    func_buttonClick = function(p_type, p_id){
        if( p_type == 'add'){
            $('#actionModal .modal-title').text("Thêm mới danh mục khóa học");
            $('#form-action')[0].reset();
            $('#actionModal input[name=action_type]').val('add');
        } 
        else if ( p_type == 'edit') {
            $('#actionModal .modal-title').text("Chỉnh sửa danh mục khóa học");
            $('#actionModal input[name=action_type]').val('edit');
            $('#actionModal input[name=id]').val(p_id);
            func_viewCategory(p_id);
        }
        else if ( p_type == 'delete') {
            $('#deleteModal input[name=id]').val(p_id);
            $('#deleteModal input[name=action_type]').val('delete');
            $('#deleteModal .modal-header .modal-title').html('Xóa danh mục khóa học');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa danh mục khóa học không? ');
        }
    };
    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#form-action").on("submit", function( event ) {
        event.preventDefault();
        $data = new FormData(this);
        $url = '{!! route('AITypeOfCourses.post.ajax') !!}';
        func_callAjax($url,'formdata', $data,'submit');
    });
    func_loaddt = function() {
        data = { 
            action_type: 'loaddt'
        };
        url = '{!! route('AITypeOfCourses.post.ajax') !!}';
        func_callAjax(url,'data', data,'submit');
    };
    func_loaddt();
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewCategory = function(id) {     
        $.ajax({
            type: 'POST',
            url: '{!! route('AITypeOfCourses.post.ajax') !!}',
            data: {
                id: id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                $('#actionModal select[name=id_training_specialty]').val(data.item.id_training_specialty);
                $('#actionModal select[name=year]').val(data.item.year);
                $('#actionModal input[name=name]').val(data.item.name);
                $('#actionModal input[name=from_the_time]').val(data.item.from_the_time);
                $('#actionModal input[name=till_the_time]').val(data.item.till_the_time);
                $('#actionModal input[name=exam_date]').val(data.item.exam_date);

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
        $url = '{!! route('AITypeOfCourses.post.ajax') !!}';
        func_callAjax($url,'data', $data,'submit');
    });
});
</script>