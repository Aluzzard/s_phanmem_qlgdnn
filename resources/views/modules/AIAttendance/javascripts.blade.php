<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    //Khởi tạo cây
    $('#jstree_course').jstree({
        'core' : {
            'check_callback' : true
        },
        "plugins" : ["types"],
        "types" : {
            "training_specialty" : {
                "icon" : "/assets/administration/mainstructure/img/badge.png"
            },
            "year" : {
                "icon" : "/assets/administration/mainstructure/img/calendar.png"
            },
            "course" : {
                "icon" : "/assets/administration/mainstructure/img/course.png"
            }
        }
    });
    $('#jstree_course').on("select_node.jstree", function (e, data) {
        if (data.node.type !== "course") {
            $('#jstree_course').jstree("deselect_node", data.node);
        } else {
            // Trích xuất ID của khóa học từ ID nút
            func_loadTableAttendance();
        }
    });

    $('#jstree_course').on("hover_node.jstree", function (e, data) {
        if (data.node.type !== "course") {
            $('#jstree_course').jstree("dehover_node", data.node);
        }
    });
//End khởi tạo cây

    /* ------------------------------------------ Handle ------------------------------------------*/
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_loadTableAttendance = function() {     
        $.ajax({
            type: 'POST',
            url: '{!! route('AIAttendance.post.ajax') !!}',
            data: {
                id_course: $('#jstree_course').jstree("get_selected", true)[0]['id'].split('_').pop(),
                action_type: 'loadTableAttendance'
            },
            dataType:'JSON',
            success: function(data) {
                if(data.error == false) {
                    $('.right-panel').show();
                    $('.right-panel').html(data.html);
                } else if(data.validate == false) {
                    show_notify('warning', 5000, 'Cảnh báo', data.message);
                    $('.right-panel').hide();
                }
            },
            error: function(data) { 
                $('.modal').modal('hide');
            }
        });
    };

    // Update attendance on click
    function updateAttendance(element) {
        if(element.text() == '') {
            element.text('K');
        } else if(element.text() == 'K') {
            element.text('P');
        } else {
            element.text('');
        }

        var id_student = element.closest('tr').attr('data-id-student');
        var id_course = $('#jstree_course').jstree("get_selected", true)[0]['id'].split('_').pop();
        var attendance = '';
        element.closest('tr').find('.box-attendance').each(function() {
            if($(this).text() == "") {
                attendance += ',0';
            } else {
                attendance += ','+$(this).text();
            }
        });
        attendance = attendance.substring(1);

        $.ajax({
            type: 'POST',
            url: '{!! route('AIAttendance.post.ajax') !!}',
            data: {
                action_type: 'edit',
                array_is_checked: [{
                    id_student: id_student,
                    attendance: attendance
                }],
                id_course: id_course
            },
            dataType: 'JSON',
            success: function(data) {
                if (data.error) {
                    show_notify('warning', 5000, 'Cảnh báo', data.message);
                } else {
                    func_loadTableAttendance();
                    show_notify('success', 5000, 'Thành công', data.message);
                }
            },
            error: function(data) {
                show_notify('error', 5000, 'Cảnh báo', 'Vui lòng chọn khóa học');
            }
        });
    }

    // Initial bind of click event
    $(document).on("click", ".box-attendance", function(){
        updateAttendance($(this));
    });
    
});
</script>