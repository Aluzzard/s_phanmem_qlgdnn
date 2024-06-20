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
            var courseId = data.node.id.split('_').pop();
            func_loaddt(courseId);
            $('#actionModal input[name=id_course]').val(courseId);
            $('#importModal input[name=id_course]').val(courseId);
        }
    });

    $('#jstree_course').on("hover_node.jstree", function (e, data) {
        if (data.node.type !== "course") {
            $('#jstree_course').jstree("dehover_node", data.node);
        }
    });
//End khởi tạo cây

    //Load danh sách học sinh
    func_loaddt = function(courseId) {
        $('.temp_hidden').show();
        $('.plz-choose-course').hide();
        data = { 
            action_type: 'loaddt',
            id_course: courseId
        };
        url = '{!! route('AIManageStudents.post.ajax') !!}';
        func_callAjax(url,'data', data,'submit');
    };
//End load học sinh

    $('#importModal').on('show.bs.modal', function () {
        $('#importModal .table').hide();
        $('#importModal button[data-action=preview]').show();
        $('#importModal button[data-action=upload]').hide();
    });
    func_buttonClick = function(p_type, p_id){
        if( p_type == 'import'){
            $('#importModal .modal-title').text("Upload file danh sách");
        } 
        else if( p_type == 'add'){
            $('#actionModal .modal-title').text("Thêm mới học viên");
            func_formReset();
            $('#form-action input[name=action_type]').val('add');
        } 
        else if ( p_type == 'edit') {
            $('#actionModal .modal-title').text("Chỉnh sửa học viên");
            func_formReset();
            func_viewCategory(p_id);
        }
        else if ( p_type == 'delete') {
            $('#deleteModal input[name=id]').val(p_id);
            $('#deleteModal input[name=action_type]').val('delete');
            $('#deleteModal .modal-header .modal-title').html('Xóa học viên');
            $('#deleteModal .question-to-confirm').html('Bạn có chắc muốn xóa học viên không? ');
        }
    };
    func_formReset = function(){
        $('#form-action')[0].reset();
        $('input[name="is_active"]').iCheck('check');
    }
    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#form-action").on("submit", function( event ) {
        event.preventDefault();
        var formData = new FormData(this);
        formData.append('id_course', $('#jstree_course').jstree("get_selected", true)[0]['id'].split('_').pop() );
        url = '{!! route('AIManageStudents.post.ajax') !!}';
        func_callAjax(url,'formdata', formData,'submit');
    }); 
    
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
                $('#actionModal input[name=action_type]').val('edit');
                $('#actionModal input[name=id]').val(data.item.id);

                $('#actionModal input[name="name"]').val(data.item.last_name+' '+data.item.first_name);
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
                // $('#actionModal select[name="state_of_health"]').val(data.item.state_of_health);
                // $('#actionModal select[name="blood_group"]').val(data.item.blood_group);
                // $('#actionModal input[name="height"]').val(data.item.height);
                // $('#actionModal input[name="weight"]').val(data.item.weight);
                $('#actionModal select[name="gender"]').val(data.item.gender);
                $('#actionModal input[name="class"]').val(data.item.class);
                $('#actionModal textarea[name="note"]').val(data.item.note);


                data.item.is_active == 1 ? $('input[name="is_active"]').iCheck('check') : $('input[name="is_active"]').iCheck('uncheck');

                // $('#actionModal select[name="type_1"]').val(data.item.type_1.split(',')).trigger('chosen:updated');
                // $('#actionModal select[name="type_2"]').val(data.item.type_2.split(',')).trigger('chosen:updated');
                // $('#actionModal select[name="type_3"]').val(data.item.type_3.split(',')).trigger('chosen:updated');
                $('#actionModal select[name="policy"]').val(data.item.policy);
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
        $.ajax({
            type: 'POST',
            url: '{!! route('AIManageStudents.post.ajax') !!}',
            data: {
                action_type: $('#deleteModal input[name=action_type]').val(),
                id: $('#deleteModal input[name=id]').val(),
            },
            dataType:'JSON',
            success: function(data) {
                if (data.error == 1) {
                    show_notify('warning', 0, 'Cảnh báo', data.message);
                } else {
                    show_notify('success', 5000, 'Thành công', data.message);
                    $('.modal').modal('hide');
                    func_loaddt( $('#importModal input[name=id_course]').val() );
                }
            },
            error: function(data) { 
                $('.modal').modal('hide');
            }
        });
    });

// Upload
/* ----------------------------------------------------------------------------------------*/
    $('#form-import-action button').on('click', function() {
        $('#form-import-action input[name=action_type]').val( $(this).attr('data-action') );
    });
    $('#form-import-action').submit(function(e) {
        e.preventDefault(); // Ngăn chặn hành vi mặc định của form

        // Tạo một FormData object từ form data
        var formData = new FormData(this);
        // Gửi request AJAX lên server
        $.ajax({
            type: "POST",
            url: "{!! route('AIManageStudents.post.ajaxImports') !!}",
            data: formData,
            processData: false,
            contentType: false,
            success: function(data) {
                if ($('#form-import-action input[name=action_type]').val() == 'preview') {
                    if (data.error == 1) {
                        show_notify('warning', 0, 'Cảnh báo', data.message);
                    } else {
                        let check = 0;
                        let html = '';
                        data.array.forEach((row) => {
                            html += '<tr>';
                            row.forEach((item, index) => {
                                if (index == 0 || index == 1 || index == 4 || index == 9 || index == 10 || index == 11 || index == 12 || index == 13) {
                                    if (item == '' || item == null) {
                                        check += 1;
                                        html += '<td class="text-danger">Bắt buộc</td>';
                                    } else {
                                        // Định dạng ngày tháng cho các cột Ngày sinh và Ngày cấp
                                        if (index == 1 || index == 5) {
                                            if (item == '' || item == null) {
                                                html += '<td></td>';
                                            } else {
                                                const formattedDate = formatInputDate(item); // Sử dụng hàm mới
                                                html += '<td>' + formattedDate + '</td>';
                                            }
                                        } else {
                                            html += (item != null) ? ('<td>' + item + '</td>') : ('<td></td>');
                                        }
                                    }
                                } else {
                                    html += (item != null) ? ('<td>' + item + '</td>') : ('<td></td>');
                                }
                            });
                            html += '</tr>';
                        });
                        if (check > 0) {
                            $('#form-import-action button[data-action=preview]').attr('style', '');
                            $('#form-import-action button[data-action=upload]').attr('style', 'display: none');
                        } else {
                            $('#form-import-action button[data-action=preview]').attr('style', 'display: none');
                            $('#form-import-action button[data-action=upload]').attr('style', '');
                        }
                        $('#importModal table tbody').html(html);
                        $('#importModal table').show();
                    }
                } else if ($('#form-import-action input[name=action_type]').val() == 'upload') {
                    if (data.error == 1) {
                        show_notify('warning', 0, 'Cảnh báo', data.message);
                    } else {
                        show_notify('success', 5000, 'Thành công', data.message);
                        $('.modal').modal('hide');
                        func_loaddt( $('#importModal input[name=id_course]').val() );
                    }
                }
            },
            error: function(error) {
                // Xử lý lỗi
                console.log(error);
            }
        });
    });

    function excelSerialDateToJSDate(serial) {
        const excelEpoch = new Date(1900, 0, -1); // Excel's epoch starts on Jan 1, 1900
        const jsDate = new Date(excelEpoch.getTime() + serial * 86400000); // 86400000 ms per day
        return jsDate;
    }

    function formatDate(date) {
        const d = new Date(date),
            day = ('0' + d.getDate()).slice(-2),
            month = ('0' + (d.getMonth() + 1)).slice(-2),
            year = d.getFullYear();
        return `${day}/${month}/${year}`;
    }

    function formatInputDate(input) {
        let date;
        // Kiểm tra định dạng và chuyển đổi
        if (/^\d{2}-\d{2}-\d{2}$/.test(input)) { // dd-mm-yy
            const [day, month, year] = input.split('-').map(Number);
            date = new Date(year < 50 ? 2000 + year : 1900 + year, month - 1, day);
        } else if (/^\d{4}$/.test(input)) { // yyyy
            date = new Date(input, 0, 1);
        } else if (/^\d{2}-\d{2}-\d{4}$/.test(input)) { // dd-mm-yyyy
            const [day, month, year] = input.split('-').map(Number);
            date = new Date(year, month - 1, day);
        } else {
            // Xử lý trường hợp khác nếu cần
            date = new Date(input);
        }
        return formatDate(date);
    }




});
</script>