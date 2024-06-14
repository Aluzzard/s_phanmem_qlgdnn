<!-- icheck JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck-active.js') }}"></script>

<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<!-- chosen JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/chosen/chosen.jquery.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/chosen/chosen-active.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    func_loaddt = function() {
        data = { 
            action_type: 'loaddt'
        };
        url = '{!! route('AIOfficerAssessmentProcess.post.ajax') !!}';
        func_callAjax(url,'data', data,'submit');
    };
    func_loaddt();
    $('#actionModal').on('show.bs.modal', function () {
        $('#actionModal .modal-body .right-col').hide();
    });
// Work process
/* ----------------------------------------------------------------------------------------*/
    func_buttonClick = function(action_type, id_btn){
        if ( action_type == 'viewList') {
            temp_id_officer = $('#actionModal input[name=id_officer]').val();
            
            $('#form_category')[0].reset();
            $('h4#form_category_title').html('Thêm mới lựa chọn');
            $('#actionModal input[name=action_type]').val('add');
            console.log(temp_id_officer)
            $('#actionModal input[name=id_officer]').val(temp_id_officer);
        }
        else if( action_type == 'editList') {
            $('#form_action')[0].reset();
            $('h4#form_category_title').html('Quản lý quá trình đánh giá xếp loại giáo viên');
            $('#actionModal input[name=id_officer]').val(id_btn);
            func_viewList(id_btn);
        }
        else if( action_type == 'add') {
            $("#actionModal h4#form_title").html('Thêm mới');
            temp_id_officer = $('#actionModal input[name=id_officer]').val();
            $('#actionModal .modal-body .right-col').show();
            $('#form_action')[0].reset();
            $('#actionModal input[name=action_type]').val('add');
            $('#actionModal input[name=id_officer]').val(temp_id_officer);
        }
        else if( action_type == 'edit') {
            $('#actionModal .modal-body .right-col').show();
            func_viewWorkProcess(id_btn);
        }
        else if( action_type == 'delete') {
            $("#deleteModal h5.modal-title").html('Xóa quá trình đánh giá xếp loại giáo viên');
            $('#deleteModal input[name=id]').val(id_btn);
            $('#deleteModal input[name=action_type]').val('delete');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa không? ');
        }
    }
    //Lấy dữ liệu các function của 1 module và đổ ra trong config
    func_viewList = function(p_id) {   
        console.log(333)
        $.ajax({
            type: 'POST',
            url: '{!! route('AIOfficerAssessmentProcess.post.ajax') !!}',
            data: {
                id: p_id,
                action_type: 'viewList'
            },
            dataType:'JSON',
            success: function(data) {
                console.log(data)
                $('#actionModal #table_action tbody').html(data.table_html);
            },
            error: function(data) { 
            }
        });
    };
    
    //Click chọn 1 work process, Lấy dữ liệu 1  work process và đổ ra
    func_viewWorkProcess = function(p_id){
        $.ajax({
            type: 'POST',
            url: '{!! route('AIOfficerAssessmentProcess.post.ajax') !!}',
            data: {
                id: p_id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                console.log(data)
                $("#actionModal h4#form_title").html('Chỉnh sửa');
                $("#actionModal input[name=action_type]").val('edit');
                $("#actionModal input[name=id]").val(data.officer.id);
                $("#actionModal select[name=health_assessment]").val(data.officer.health_assessment);
                $("#actionModal select[name=moral_assessment]").val(data.officer.moral_assessment);
                $("#actionModal select[name=professional_assessment]").val(data.officer.professional_assessment);
                $("#actionModal select[name=general_assessment]").val(data.officer.general_assessment);
                $("#actionModal select[name=id_course]").val(data.officer.id_course);
                $("#actionModal select[name=id_semester]").val(data.officer.id_semester);
                $("#actionModal textarea[name=note]").val(data.officer.note);
            },
            error: function(data) { 
            }
        });
    }
    $("#actionModal #form_action").on("submit", function( event ) {
        event.preventDefault();
        $.ajax({
            type: 'POST',
            url: '{!! route('AIOfficerAssessmentProcess.post.ajax') !!}',
            data:new FormData(this),
            dataType:'JSON',
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                console.log(data.html)
                if (data.error == false) {
                    show_notify('success', 5000, 'Thành công', data.message);
                    $('#actionModal #table_action tbody').html(data.html);
                    $('#actionModal .modal-body .right-col').hide();
                } 
                else if (data.error == true && data.validate == false){
                    for (var i = 0; i < data.message.length; ++i) {
                        show_notify('warning', 5000, 'Cảnh báo', data.message[i]);
                    }
                } 
                else {
                    show_notify('error', false, 'Lỗi', data.message); 
                    $(".modal").modal('hide');
                }
            },
            error: function(data) { 
                console.log(data)
            }
        });
    });
    $('#deleteModal #form-delete').on('submit', function (event){
        event.preventDefault();
        $.ajax({
            type: 'POST',
            url: '{!! route('AIOfficerAssessmentProcess.post.ajax') !!}',
            data:new FormData(this),
            dataType:'JSON',
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                console.log(data)
                if (data.error == false) {
                    show_notify('success', 5000, 'Thành công', data.message);
                    $('#actionModal #table_action tbody').html(data.html);
                    $('#actionModal .modal-body .right-col').hide();
                    $('#deleteModal').modal('hide');
                } 
                else {
                    show_notify('error', false, 'Lỗi', data.message); 
                    $(".modal").modal('hide');
                }
            },
            error: function(data) { 
                console.log(data)
            }
        });
    });

});

</script>