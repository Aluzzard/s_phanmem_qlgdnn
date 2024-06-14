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
    $("#form-action").on("submit", function( event ) {
        event.preventDefault();
        data = {
            action_type: $('#form-action input[name=action_type]').val(),
            id_course: $("#form-action input[name=id]").val(),
            array_is_checked: func_checkRole()
            
        };
        url = '{!! route('AIAttendance.post.ajax') !!}';
        func_callAjax(url,'data', data,'submit');
    });
    $('select[name=id_training_specialty]').on('change', function(){
        func_loaddt();
    });
    func_loaddt = function() {
        data = { 
            action_type: 'loaddt',
            id_training_specialty: $('select[name=id_training_specialty]').val(),
        };
        url = '{!! route('AIAttendance.post.ajax') !!}';
        func_callAjax(url,'data', data,'submit');
    };
    func_loaddt();
    func_checkRole = function(){
        var id_student = '';
        var array_is_checked = []; 

        $("#form-action table tbody tr").each(function() {
            var index = $(this).index();
            id_student = $(this).attr('data-id-student');
            var string_checked = '';
            $(this).find('.box-attendance').each(function() {
                if( $(this).text() == "") {
                    string_checked += ',0'
                } else {
                    string_checked += ','+$(this).text()
                }
            });
            array_is_checked.push({
                id_student: id_student,
                attendance: string_checked.substring(1)
            });
        });
        
        return array_is_checked;
    }//
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewListCourse = function(id) {     
        $.ajax({
            type: 'POST',
            url: '{!! route('AIAttendance.post.ajax') !!}',
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

    $(document).on("click",".box-attendance", function(){
        if( $(this).text() == '' ) {
            $(this).text('K');
        } else if( $(this).text() == 'K' ) {
            $(this).text('P');
        } else {
            $(this).text('');
        }
    });
    
});
</script>