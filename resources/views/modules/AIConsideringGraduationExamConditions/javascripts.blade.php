<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<!-- icheck JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck-active.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    func_buttonClick = function(p_type, p_id){
        if ( p_type == 'edit') {
            $('#actionModal .modal-title').text("Điểm học viên");
            func_formReset();
            func_viewListCourse(p_id);
            $('#actionModal input[name=id]').val(p_id);
        }
    };
    func_formReset = function(){
        $('#form-action')[0].reset();
    }
    /* ------------------------------------------ Handle ------------------------------------------*/
    $('select[name=id_training_specialty]').on('change', function(){
        $.ajax({
            type: 'POST',
            url: '{!! route('AIConsideringGraduationExamConditions.post.ajax') !!}',
            data: {
                id: $(this).val(),
                action_type: 'course'
            },
            dataType:'JSON',
            success: function(data) {
                html = '<option value="0">------ Chọn khóa ------</option>';
                for(i=0; i<data.courses.length;i++){
                    html += '<option value="'+data.courses[i].id+'">Khóa '+data.courses[i].name+'/'+data.courses[i].year+'</option>';
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
        $.ajax({
            type: 'POST',
            url: '{!! route('AIConsideringGraduationExamConditions.post.ajax') !!}',
            data: {
                action_type: 'loaddt',
                id_training_specialty: $('select[name=id_training_specialty]').val(),
                id_course: $('select[name=id_course]').val()
            },
            dataType:'JSON',
            success: function(data) {
                $('[data-toggle="table"]').bootstrapTable('destroy');
                $('#table').html(data.table_html);
                $('[data-toggle="table"]').bootstrapTable();
            },
            error: function(data) { 
            }
        });
    };
    func_loaddt();
    
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewListCourse = function(id) {     
        $.ajax({
            type: 'POST',
            url: '{!! route('AIConsideringGraduationExamConditions.post.ajax') !!}',
            data: {
                id: id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                console.log(data)
                $('#actionModal input[name=action_type]').val('edit');
                $('#actionModal table').html(data.html);
            },
            error: function(data) { 
                $('.modal').modal('hide');
            }
        });
    };
});
</script>