<script type="text/javascript">
$(document).ready(function() {
    $('#documentType').change(function() {
        var selectedValue = $(this).val();
        var filterContainer = $('#filterContainer > div');
        filterContainer.empty(); // Xóa nội dung cũ nếu có

        $('#id_div_ckeditor').hide();
        if (selectedValue == '1') {
            filterContainer.html(`
                @include('modules.AIPrintDocuments.type_1.filter')
            `);
            $('select[name=id_course]').select2();
            $('#id_div_filter').show();
        } 
        
        else {
            $('#id_div_filter').hide();
        }
    });
    $('#btn_preview').click(function() {
        console.log(445)
        $('#previewModal .modal-body').html( CKEDITOR.instances['id_textarea_content'].getData() );
    });
    // Hàm lấy tham số từ URL
    // Lấy toàn bộ URL
    CKEDITOR.replace('id_textarea_content', option);
    
});
</script>