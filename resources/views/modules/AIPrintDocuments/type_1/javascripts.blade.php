<script type="text/javascript">
$(document).ready(function(){
    $('#printButton').on('click', function() {
        window.print();
    });

    var urlParams = new URLSearchParams(window.location.search);
    
    // Tự động điền vào các trường input của form
    $('#form-filter input[name=name_department]').val(urlParams.get('name_department'));
    $('#form-filter input[name=name_department_sub]').val(urlParams.get('name_department_sub'));
    $('#form-filter input[name=decision_name]').val(urlParams.get('decision_name'));
    $('#form-filter input[name=date_issue]').val(urlParams.get('date_issue'));
    $('#form-filter input[name=decision_signer]').val(urlParams.get('decision_signer'));
    $('#form-filter input[name=tabular_creator]').val(urlParams.get('tabular_creator'));
    $('#form-filter input[name=signer]').val(urlParams.get('signer'));
    
    if ( urlParams.get('id_course') && urlParams.get('id_course') !== '') {
        if( $('select[name=id_course]').select2('val') != urlParams.get('id_course')) {
            $('select[name=id_course]').select2('val', urlParams.get('id_course'));
        }
    }
});
</script>