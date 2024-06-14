<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    func_buttonClick = function(p_type, p_id){
        if( p_type == 'file' ){
            $('#fileModal #modal-title').text('Danh sách file chương trình học');
            $('.list-images-library').removeClass('col-md-8');
            $('.information-image').hide();
            func_valFilesLibrary(p_id);
            $('#fileModal input[name=id_program]').val(p_id);
        }
        else if( p_type == 'add'){
            $('#actionModal .modal-title').text("Thêm mới danh mục chương trình đào tạo");
            $('#form-action')[0].reset();
            $('#actionModal input[name=action_type]').val('add');
        } 
        else if ( p_type == 'edit') {
            $('#actionModal .modal-title').text("Chỉnh sửa danh mục chương trình đào tạo");
            $('#actionModal input[name=action_type]').val('edit');
            $('#actionModal input[name=id]').val(p_id);
            func_viewCategory(p_id);
        }
        else if ( p_type == 'delete') {
            $('#deleteModal input[name=id]').val(p_id);
            $('#deleteModal input[name=action_type]').val('delete');
            $('#deleteModal .modal-header .modal-title').html('Xóa danh mục chương trình đào tạo');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa danh mục chương trình đào tạo không? ');
        }
    };
    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#form-action").on("submit", function( event ) {
        event.preventDefault();
        $data = new FormData(this);
        $url = '{!! route('AITrainingProgramInformations.post.ajax') !!}';
        func_callAjax($url,'formdata', $data,'submit');
    });
    func_loaddt = function() {
        data = { 
            action_type: 'loaddt'
        };
        url = '{!! route('AITrainingProgramInformations.post.ajax') !!}';
        func_callAjax(url,'data', data,'submit');
    };
    func_loaddt();
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewCategory = function(id) {     
        $.ajax({
            type: 'POST',
            url: '{!! route('AITrainingProgramInformations.post.ajax') !!}',
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
        $url = '{!! route('AITrainingProgramInformations.post.ajax') !!}';
        func_callAjax($url,'data', $data,'submit');
    });

// /* ------------------------------------------ Function File ------------------------------------------ */
    $('#form-add-file').on('submit', function(){
        event.preventDefault();
        $.ajax({
            type: 'POST',
            url: '{!! route('AITrainingProgramInformations.post.ajaxFile') !!}',
            data:new FormData(this),
            dataType:'JSON',
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                if(data.error == false){
                    show_notify('success', 5000, 'Thành công', data.message); 
                } else {
                    show_notify('error', 5000, 'Lỗi', data.message); 
                }
                $('.list-files-library').html(data.html);
            },
            error: function(data) {
                show_notify('error', 5000, 'Lỗi', data.message); 
                $('#delModal .close').click();
            }
        });
    });
    //Function get information file after click choose file
    func_getInformationFile = function(p_id_file) {
        $('.list-files-library').addClass('col-md-8');
        $('.information-file').addClass('col-md-4');
        $('.item-file.selected').removeClass('selected'); $('#file_'+p_id_file).parent().addClass('selected');
        $('.information-file').show();
        $('#id_input_id_file').val(p_id_file);
        
        $.ajax({
            type: 'POST',
            url: '{!! route('AITrainingProgramInformations.post.ajaxFile') !!}',
            data: {
                action_type: 'file',
                id: p_id_file
            },
            dataType:'JSON',
            success: function(data) {
                $('#id_input_description_file').val(data.file.description);
                $('#id_input_name_file').val(data.file.name);
            },
            error: function(data) {
                show_notify('error', 5000, 'Lỗi', data.message); 
                $('#delModal .close').click();
            }
        });
    }
    // Function edit file
    $('#form-edit-file').on('submit', function(){
        event.preventDefault();
        $.ajax({
            type: 'POST',
            url: '{!! route('AITrainingProgramInformations.post.ajaxFile') !!}',
            data:new FormData(this),
            dataType:'JSON',
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                console.log(data)
                if(data.error == false){
                    show_notify('success', 5000, 'Thành công', data.message); 
                } else {
                    show_notify('error', 5000, 'Lỗi', data.message); 
                }
                $('.list-files-library').html(data.html);
            },
            error: function(data) {
                show_notify('error', 5000, 'Lỗi', data.message);
                $('#delModal .close').click();
            }
        });
    });
    func_valFilesLibrary = function(p_idbtn){
        $.ajax({
            type: 'POST',
            url: '{!! route('AITrainingProgramInformations.post.ajaxFile') !!}',
            data: {
                id: p_idbtn,
                action_type: 'list'
            },
            dataType: 'json',
            success: function(data) {
                $('.list-files-library').html(data.html)
            },
            error: function(data) {
            }
        });
    }
    func_deleteFileInLibrary = function(p_id_file){
        $.ajax({
            type: 'POST',
            url: '{!! route('AITrainingProgramInformations.post.ajaxFile') !!}',
            data: {
                action_type: 'delete',
                id: p_id_file
            },
            dataType: 'json',
            success: function(data) {
                if(data.error == false){
                    show_notify('success', 5000, 'Thành công', data.message); 
                } else {
                    show_notify('error', 5000, 'Lỗi', data.message); 
                }
                $('.list-files-library').html(data.html);
            },
            error: function(data) {
                show_notify('error', 5000, 'Lỗi', data.message); 
                $('#delModal .close').click();
            }
        });
    }
});
</script>