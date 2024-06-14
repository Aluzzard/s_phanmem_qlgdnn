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
            func_viewCategory(p_id);
        }
    };
    func_formReset = function(){
        $('#form-action')[0].reset();
    }
    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#form-action").on("submit", function( event ) {
        event.preventDefault();
        data = new FormData(this);
        url = '{!! route('AIGraduationScoreInformations.post.ajax') !!}';
        func_callAjax(url,'formdata', data,'submit');
    });
    $('select[name=id_training_specialty]').on('change', function(){
        $.ajax({
            type: 'POST',
            url: '{!! route('AIGraduationScoreInformations.post.ajax') !!}',
            data: {
                id: $(this).val(),
                action_type: 'course'
            },
            dataType:'JSON',
            success: function(data) {
                html = '<option value="0">Tất cả</option>';
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
        data = { 
            action_type: 'loaddt',
            id_training_specialty: $('select[name=id_training_specialty]').val(),
            id_course: $('select[name=id_course]').val()
        };
        url = '{!! route('AIGraduationScoreInformations.post.ajax') !!}';
        func_callAjax(url,'data', data,'submit');
    };
    func_loaddt();
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewCategory = function(id) {     
        $.ajax({
            type: 'POST',
            url: '{!! route('AIGraduationScoreInformations.post.ajax') !!}',
            data: {
                id: id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                console.log(data)
                $('#actionModal input[name=action_type]').val('edit');
                $('#actionModal input[name=id]').val(data.item.id);

                $('#actionModal input[name="subject_1"]').val(data.item.subject_1);
                $('#actionModal input[name="subject_2"]').val(data.item.subject_2);
                $('#actionModal input[name="subject_3"]').val(data.item.subject_3);
                $('#actionModal input[name="subject_4"]').val(data.item.subject_4);
                $('#actionModal input[name="subject_5"]').val(data.item.subject_5);
                $('#actionModal input[name="subject_6"]').val(data.item.subject_6);
                $('#actionModal input[name="theory"]').val(data.item.theory);
                $('#actionModal input[name="practice"]').val(data.item.practice);
                $('#actionModal input[name="final_score"]').val(data.item.final_score);
                $('#actionModal input[name="average"]').val(data.item.average);
                $('#actionModal input[name="classification"]').val(data.item.classification);
                $('#actionModal textarea[name="note"]').val(data.item.note);

            },
            error: function(data) { 
                $('.modal').modal('hide');
            }
        });
    };
});
</script>