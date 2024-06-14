<!-- Tree Viewer JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/tree-line/jstree.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/tree-line/jstree.active.js') }}"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('.jstree_guests').jstree({
        'core' : {
            'check_callback' : true
        },
        'types' : {
            'default' : {
                // 'icon' : 'fa fa-folder'
            },
            'course' : {
                // 'icon' : 'fa fa-file',
                'li_attr': {
                    'class': 'jstree-course'  // Thêm class này cho nút có type là "course"
                }
            }
        },
        'checkbox' : {
            'keep_selected_style' : false,
            'three_state': false,  // Ngăn chặn jstree tự động check/uncheck nút con/nút cha
            'tie_selection': false
        },
        'plugins' : ['types', 'checkbox']
    });
    function getUrlParameter(name) {
        name = name.replace(/[\[\]]/g, '\\$&');
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)');
        var results = regex.exec(window.location.href);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    }

    var admissionIds = getUrlParameter('admissionIds');
    var graduationIds = getUrlParameter('graduationIds');

    if (admissionIds !== null && graduationIds !== null) {
        $('#btn_export').show();
    } else {
        $('#btn_export').hide();
    }

    $('.btn-success').click(function() {
        var admissionIds = $('#jstree_admission').jstree("get_checked"); // Lấy IDs của các nút đã check trong Tuyển sinh
        var graduationIds = $('#jstree_graduation').jstree("get_checked"); // Lấy IDs của các nút đã check trong Tốt nghiệp

        admissionIds = admissionIds.map(id => id.replace('node_course_', ''));
        graduationIds = graduationIds.map(id => id.replace('node_course_', ''));

        var url = '/admin/module/thong-ke-tong-hop?form=1&admissionIds=' + admissionIds + '&graduationIds=' + graduationIds;
        window.location.href = url; // Điều hướng người dùng tới URL này
        
    });
    $("#form-action button").on("click", function( event ) {
        if( $(this).attr('data-action') == 'export' ) {
            var url_original = window.location.href; // Define the original URL
            window.location.href = url_original+'&export=true';
        }
    });

});
</script>