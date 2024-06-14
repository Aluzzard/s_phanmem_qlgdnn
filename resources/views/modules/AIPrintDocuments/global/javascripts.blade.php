<script type="text/javascript">
$(document).ready(function() {
    $('#btn_filter').click(function() {
        var form = $('#form-filter');
        var formData = form.serialize();
        var url = '/admin/module/in-van-ban?edit=true&' + formData;
        console.log(url); // For debugging

        // Redirect to the constructed URL
        window.location.href = url;
    });

    $("select[name=type]").on('select2:select', function (e) {
        var selectedValue = e.params.data.id;
        var newURL = '/admin/module/in-van-ban?type=' + selectedValue;
        window.location.href = newURL;
    });
    $('#btn_preview').click(function() {
        $('#previewModal .modal-body').html( CKEDITOR.instances['id_textarea_content'].getData() );
    });
    // Hàm lấy tham số từ URL
    // Lấy toàn bộ URL
    var urlParams = new URLSearchParams(window.location.search);
    if(urlParams.get('edit') == 'true' && urlParams.get('id_course') !== '') {
        CKEDITOR.replace('id_textarea_content', option);
    };
    if ( urlParams.get('type') !== null) {
        if( $('select[name=type]').select2('val') != urlParams.get('type')) {
            $('select[name=type]').select2('val', urlParams.get('type'));
        }
    }
});
</script>