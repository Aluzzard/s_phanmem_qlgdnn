<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<script>var route_prefix = "/admin/laravel-filemanager";</script>
<script>
    {!! \File::get(base_path('vendor/unisharp/laravel-filemanager/public/js/stand-alone-button.js')) !!}
</script>
<script>
    // $('#lfm').filemanager('image', {prefix: route_prefix});
$('#lfm').filemanager('file', {prefix: route_prefix});
</script>
<script type="text/javascript">
$(document).ready(function() {
    $('#partialModal').on('hide.bs.modal', function () {
        $('#partialModal .modal-body .right-col').css('display','none')
    });
    func_buttonClick = function(p_type, p_id){
        if( p_type == 'add'){
            $('#actionModal .modal-title').text("Thêm mới văn bản");
            $('#form-action')[0].reset();
            $('#form-action input[name=action_type]').val('add');
        } 
        // else if ( p_type == 'edit') {
        //     $('#modalVideo .modal-title').text("Chỉnh sửa văn bản");
        //     $('#form-action input[name=action_type]').val('edit');
        //     func_view(p_id);
        // }
        else if ( p_type == 'delete') {
            $('#deleteModal input[name=id]').val(p_id);
            $('#deleteModal input[name=action_type]').val('delete');
            $('#deleteModal .modal-header .modal-title').html('Xóa văn bản');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa văn bản không? ');
        }
        else if ( p_type == 'activities') {
            $('#partialModal .modal-title').text("Hoạt động");
            $('#partialModal #form_modal input[name=type]').val('activities');
            func_getDataTable(p_type);
        }
        else if ( p_type == 'types') {
            $('#partialModal .modal-title').text("Loại");
            $('#partialModal #form_modal input[name=type]').val('types');
            func_getDataTable(p_type);
        }
    };

    $("#form-action").on("submit", function( event ) {
        event.preventDefault();
        $data = new FormData(this);
        $url = '{!! route('AIReviewProcess.post.ajaxEvent') !!}';
        func_callAjax($url,'formdata', $data,'submit');
    });

    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_view = function(id) {
        $.ajax({
            type: 'POST',
            url: '{!! route('AIReviewProcess.post.ajaxEvent') !!}',
            data: {
                id: id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                $('#actionModal input[name="id"]').val(data.document.id);
                $('#actionModal input[name="number"]').val(data.document.number);
                $('#actionModal textarea[name="content"]').val(data.document.content);
                $('#actionModal select[name="field_id"]').val(data.document.field_id);
                $('#actionModal select[name="type_id"]').val(data.document.type_id);
                $('#actionModal select[name="organization_id"]').val(data.document.organization_id);
                $('#actionModal input[name="signor"]').val(data.document.signor);
                $('#actionModal input[name="date_issue"]').val(data.document.date_issue);
                $('#actionModal input[name="date_effect"]').val(data.document.date_effect);
                
            },
            error: function(data) { 
                $('.modal').modal('hide');
                if (data.error == false) {
                    show_notify('error', 5000, 'Lỗi', data.message); 
                } 
            }
        });
    };

// Danh mục
/* ----------------------------------------------------------------------------------------*/
    func_buttonModalPartialClick = function(action_type, id_btn){
        if ( action_type == 'addPartial') {
            $('#partialModal .modal-body .right-col').show();
            var old_type = $('#partialModal #form_modal input[name=type]').val();
            $('#form_modal')[0].reset();
            $('#partialModal #form_modal input[name=type]').val(old_type);
            $('#partialModal input[name=action_type]').val('addPartial');
        }
        else if( action_type == 'editPartial') {
            $('#partialModal .modal-body .right-col').show();
            func_viewPartial(id_btn);
        } else if ( action_type == 'deletePartial') {
            $('#deleteModal input[name=id]').val(id_btn);
            $('#deleteModal input[name=action_type]').val('deletePartial');
            $('#deleteModal .modal-header .modal-title').html('Xóa');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa không? ');
        } 
    }
    func_getDataTable = function(type){
        $.ajax({
            type: 'POST',
            url: '{!! route('AIReviewProcess.post.ajaxPartial') !!}',
            data: {
                id_training_specialty: $('select[name=id_training_specialty]').val(),
                type: type,
                action_type: 'listPartial'
            },
            dataType:'JSON',
            success: function(data) {
                $('#table_modal tbody').html(data.html_table);
            },
            error: function(data) { 
            }
        });
    }
 
    //Lấy dữ liệu 1 nhóm module và đổ ra
    func_viewPartial = function(p_id_category){
        $.ajax({
            type: 'POST',
            url: '{!! route('AIReviewProcess.post.ajaxPartial') !!}',
            data: {
                type: $('#partialModal #form_modal input[name=type]').val(),
                id: p_id_category,
                action_type: 'viewPartial'
            },
            dataType:'JSON',
            success: function(data) {
                $('#partialModal input[name=id]').val(data.data.id);
                $('#partialModal input[name=name]').val(data.data.name);
                $('#partialModal input[name=order]').val(data.data.order);
                $('#partialModal input[name=action_type]').val('editPartial');
            },
            error: function(data) { 
            }
        });
    }
    $("#form_modal").on("submit", function( event ) {
        event.preventDefault();
        data = new FormData(this);
        data.append('id_training_specialty', $('select[name=id_training_specialty]').val());

        $.ajax({
            type: 'POST',
            url: '{!! route('AIReviewProcess.post.ajaxPartial') !!}',
            data: data,
            dataType:'JSON',
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                if(data.error == false){
                    show_notify('success', 5000, 'Thành công', data.message); 
                    $('#table_modal tbody').html(data.html_table);
                } else if (data.error == true && data.validate == false){
                    for (var i = 0; i < data.message.length; ++i) {
                        show_notify('warning', false, 'Cảnh báo', data.message[i]);
                    }
                } else {
                    show_notify('error', false, 'Lỗi', data.message); 
                    $(".modal").modal('hide');
                }
            },
            error: function(data) { 
            }
        });
    });
    $('#deleteModal').on('submit', function (event){
        event.preventDefault();
        if( $('#deleteModal input[name=action_type]').val() == 'delete'){
            url = '{!! route('AIReviewProcess.post.ajaxEvent') !!}';
            type = $('#deleteModal input[name=action_type]').val()
        } else if( $('#deleteModal input[name=action_type]').val() == 'deletePartial'){
            url = '{!! route('AIReviewProcess.post.ajaxPartial') !!}';
            type = $('#partialModal input[name=type]').val();
        }
        
        $.ajax({
            type: 'POST',
            url: url,
            data: {
                type: type,
                action_type: $('#deleteModal input[name=action_type]').val(),
                id: $('#deleteModal input[name=id]').val()
            },
            dataType:'JSON',
            success: function(data) {
                if(data.error == false){
                    show_notify('success', 5000, 'Thành công', data.message); 
                    $('#table_modal tbody').html(data.html_table);
                    $("#deleteModal.modal").modal('hide');
                } else {
                    show_notify('error', false, 'Lỗi', data.message); 
                    $("#deleteModal.modal").modal('hide');
                }
            },
            error: function(data) { 
            }
        });
    });
/* ------------------------------------------ Handle ------------------------------------------*/
    $("#form-action").on("submit", function( event ) {
        event.preventDefault();
        data = new FormData(this);
        url = '{!! route('AIManageStudents.post.ajax') !!}';
        data.append('id_training_specialty', $('select[name=id_training_specialty]').val());
        data.append('id_course', $('select[name=id_course]').val());
        data.append('type_1', $('select[name=type_1]').chosen().val());
        data.append('type_2', $('select[name=type_2]').chosen().val());
        data.append('type_3', $('select[name=type_3]').chosen().val());
        func_callAjax(url,'formdata', data,'submit');
    });
    $('select[name=id_training_specialty]').on('change', function(){
        $.ajax({
            type: 'POST',
            url: '{!! route('AIManageStudents.post.ajax') !!}',
            data: {
                id: $(this).val(),
                action_type: 'course'
            },
            dataType:'JSON',
            success: function(data) {
                if(data.courses.length == 0) {
                    html = '<option value="">Không có khóa học</option>';

                } else {
                    html = '<option value="0">-- Chọn khóa học --</option>';
                    for(i=0; i<data.courses.length;i++){
                        html += '<option value="'+data.courses[i].id+'">Khóa '+data.courses[i].name+'/'+data.courses[i].year+'</option>';
                    }
                }
                $('select[name=id_course]').html(html);
            },
            error: function(data) { 
                
            }
        });
    })
    $('select[name=id_training_specialty],select[name=id_course]').on('change', function(){
        func_loaddt();
    })
    func_loaddt = function() {
        if ( $('select[name=id_training_specialty]').val() == 0 || $('select[name=id_course]').val() == 0) {

        } else {
            data = { 
                action_type: 'loaddt',
                id_training_specialty: $('select[name=id_training_specialty]').val(),
                id_course: $('select[name=id_course]').val()
            };
            url = '{!! route('AIManageStudents.post.ajax') !!}';
            func_callAjax(url,'data', data,'submit');
        }
        
    };
    func_loaddt();
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewCategory = function(id) {     
        $.ajax({
            type: 'POST',
            url: '{!! route('AIManageStudents.post.ajax') !!}',
            data: {
                id: id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                console.log(data)
                $('#actionModal input[name=action_type]').val('edit');
                $('#actionModal input[name=id]').val(data.item.id);

                $('#actionModal input[name="name"]').val(data.item.name);
                $('#actionModal input[name="date_of_birth"]').val(data.item.date_of_birth);
                $('#actionModal input[name="numberphone"]').val(data.item.numberphone);
                $('#actionModal input[name="identification_id_card"]').val(data.item.identification_id_card);
                $('#actionModal input[name="date_of_issue"]').val(data.item.date_of_issue);
                $('#actionModal input[name="department_of_issue"]').val(data.item.department_of_issue);
                $('#actionModal select[name="educational_level"]').val(data.item.educational_level);
                $('#actionModal select[name="teaching_level"]').val(data.item.teaching_level);
                $('#actionModal input[name="permanent_residence"]').val(data.item.permanent_residence);
                $('#actionModal input[name="place_of_live"]').val(data.item.place_of_live);
                $('#actionModal select[name="id_ethnic"]').val(data.item.id_ethnic);
                $('#actionModal select[name="region"]').val(data.item.region);
                $('#actionModal input[name="email"]').val(data.item.email);
                $('#actionModal select[name="state_of_health"]').val(data.item.state_of_health);
                $('#actionModal select[name="blood_group"]').val(data.item.blood_group);
                $('#actionModal input[name="height"]').val(data.item.height);
                $('#actionModal input[name="weight"]').val(data.item.weight);
                $('#actionModal select[name="gender"]').val(data.item.gender);

                data.item.status == 1 ? $('input[name="status"]').iCheck('check') : $('input[name="status"]').iCheck('uncheck');

                $('#actionModal select[name="type_1"]').val(data.item.type_1.split(',')).trigger('chosen:updated');
                $('#actionModal select[name="type_2"]').val(data.item.type_2.split(',')).trigger('chosen:updated');
                $('#actionModal select[name="type_3"]').val(data.item.type_3.split(',')).trigger('chosen:updated');


            },
            error: function(data) { 
                $('.modal').modal('hide');
            }
        });
    };

});

</script>
