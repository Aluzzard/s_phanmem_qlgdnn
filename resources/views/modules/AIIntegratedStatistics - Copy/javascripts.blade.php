<script type="text/javascript">
$(document).ready(function() {
    $("select[name=form]").select2();

    $("select[name=form]").on('select2:select', function (e) {
        var selectedValue = e.params.data.id;
        var newURL = '/admin/module/thong-ke-tong-hop?form=' + selectedValue;
        window.location.href = newURL;
    });
});
</script>