<script type="text/javascript">
$(document).ready(function(){
    $('#printButton').on('click', function() {
        var printContents = document.getElementById('modal-content-to-print').innerHTML;
        var printWindow = window.open('', '', 'height=700,width=900');
        printWindow.document.write('<html><head><title>In nội dung</title>');
        printWindow.document.write('<style>');
        printWindow.document.write('body { font-family: "Times New Roman", Times, serif; }');
        printWindow.document.write('table { margin-top: 30px; width: 100%; border-collapse: collapse; }');
        printWindow.document.write('table th { text-align: center; border: 1px solid; }');
        printWindow.document.write('table th, table td { text-align: center; border: 1px solid; }');
        printWindow.document.write('.underline { display: inline-block; border-bottom: 1px solid #000; width: 100px; margin-top: 0px; }');
        printWindow.document.write('@page { size: A4 landscape; margin: 10mm; }');
        printWindow.document.write('body { margin: 0; padding: 0; }');
        printWindow.document.write('table { page-break-inside: auto; }');
        printWindow.document.write('tr { page-break-inside: avoid; page-break-after: auto; }');
        printWindow.document.write('thead { display: table-header-group; }');
        printWindow.document.write('tfoot { display: table-footer-group; }');
        printWindow.document.write('</style>');
        printWindow.document.write('</head><body>');
        printWindow.document.write('<div id="content-to-print">');
        printWindow.document.write(printContents);
        printWindow.document.write('</div>');
        printWindow.document.write('</body></html>');
        printWindow.document.close();
        printWindow.print();
    });




    $('#form-filter').on('submit', function(event){
        event.preventDefault();
        $.ajax({
            type: 'POST',
            url: '{!! route('AIPrintDocuments.post.ajax') !!}',
            data: new FormData(this),
            dataType:'JSON',
            contentType: false,
            cache: false,
            processData: false,
            beforeSend: function () {
                $('.ts_preloading_box').show();
            },
            success: function(data) {
                if(data.warning){
                    show_notify('warning', false, 'Cảnh báo', data.message);
                } else {
                    CKEDITOR.instances['id_textarea_content'].setData(data.html);
                    $('#id_div_ckeditor').show();
                }
            },
            complete: function () {
                $('.ts_preloading_box').hide();
            },
            error: function(data) { 
                show_notify('error', false, 'Lỗi', data.message);
            }
        });
    });
});

</script>