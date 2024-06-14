<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    func_buttonClick = function(p_type, p_id){
        if( p_type == 'add'){
            $('#actionModal .modal-title').text("Thêm mới thông tin cán bộ, giáo viên");
            $('#form-action')[0].reset();
            $('#form-action #id_input_action_type').val('add');
        } 
        else if ( p_type == 'edit') {
            $('#actionModal .modal-title').text("Chỉnh sửa thông tin cán bộ, giáo viên");
            $('#form-action #id_input_action_type').val('edit');
            $('#form-action input[name=id]').val(p_id);
            func_viewCategory(p_id);
        }
        else if ( p_type == 'delete') {
            $('#deleteModal #id_input_id').val(p_id);
            $('#deleteModal #id_input_type_del').val('delete');
            $('#deleteModal .modal-header .modal-title').html('Xóa thông tin cán bộ, giáo viên');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa thông tin cán bộ, giáo viên không? ');
        }
    };
    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#form-action").on("submit", function( event ) {
        event.preventDefault();
        $data = new FormData(this);
        $url = '{!! route('AIOfficerInformations.post.ajax') !!}';
        func_callAjax($url,'formdata', $data,'submit');
    });
    func_loaddt = function() {
        data = { 
            action_type: 'loaddt'
        };
        url = '{!! route('AIOfficerInformations.post.ajax') !!}';
        func_callAjax(url,'data', data,'submit');
    };
    func_loaddt();
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewCategory = function(id) {     
        $.ajax({
            type: 'POST',
            url: '{!! route('AIOfficerInformations.post.ajax') !!}',
            data: {
                id: id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                console.log(data)
                $('#actionModal input[name="name"]').val(data.people.name);
                $('#actionModal input[name="date_of_birth"]').val(data.people.date_of_birth);
                $('#actionModal input[name="numberphone"]').val(data.people.numberphone);
                $('#actionModal input[name="identification_id_card"]').val(data.people.identification_id_card);
                $('#actionModal input[name="date_of_issue"]').val(data.people.date_of_issue);
                $('#actionModal input[name="department_of_issue"]').val(data.people.department_of_issue);
                $('#actionModal select[name="educational_level"]').val(data.people.educational_level);
                $('#actionModal select[name="teaching_level"]').val(data.people.teaching_level);
                $('#actionModal input[name="permanent_residence"]').val(data.people.permanent_residence);
                $('#actionModal input[name="place_of_live"]').val(data.people.place_of_live);
                $('#actionModal select[name="ethnic"]').val(data.people.ethnic);
                $('#actionModal select[name="region"]').val(data.people.region);
                $('#actionModal input[name="email"]').val(data.people.email);
                $('#actionModal select[name="state_of_health"]').val(data.people.state_of_health);
                $('#actionModal select[name="blood_group"]').val(data.people.blood_group);
                $('#actionModal input[name="height"]').val(data.people.height);
                $('#actionModal input[name="weight"]').val(data.people.weight);
                $('#actionModal select[name="gender"]').val(data.people.gender);
                $('#actionModal select[name="family_composition"]').val(data.people.family_composition);
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
        $url = '{!! route('AIOfficerInformations.post.ajax') !!}';
        func_callAjax($url,'data', $data,'submit');
    });
});
</script>