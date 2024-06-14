<!-- jquery
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/vendor/jquery-1.11.3.min.js') }}"></script>
<!-- bootstrap JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/bootstrap.min.js') }}"></script>
<!-- meanmenu JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/jquery.meanmenu.js') }}"></script>
<!-- mCustomScrollbar JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/jquery.mCustomScrollbar.concat.min.js') }}"></script>
<!-- sticky JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/jquery.sticky.js') }}"></script>
<!-- Slug JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/slug/slug.js') }}"></script>
<!-- data table JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/data-table/bootstrap-table.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/data-table/tableExport.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/data-table/data-table-active.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/data-table/bootstrap-table-editable.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/data-table/bootstrap-editable.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/data-table/bootstrap-table-resizable.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/data-table/colResizable-1.5.source.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/data-table/bootstrap-table-export.js') }}"></script>

<!-- Global javascripts
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>

<!-- jquery UI
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/vendor/jquery-ui.min.js') }}"></script>
<!-- Sweetalert JS
    ============================================ -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- notification JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/notifications/Lobibox.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/notifications/notification-active.js') }}"></script>
<!-- main JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/main.js') }}"></script>

<!-- CKEditor init -->
<script src="{{ asset('assets/administration/mainstructure/js/ckeditor/ckeditor.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/ckeditor/config.js') }}"></script>


<!-- icheck JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/icheck/icheck-active.js') }}"></script>
<!-- Tree Viewer JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/tree-line/jstree.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/tree-line/jstree.active.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/tree-line/jstree.checkbox.js') }}"></script>
<!-- Choosen JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/chosen/chosen.jquery.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/chosen/chosen-active.js') }}"></script>

<script type="text/javascript">
$(document).ready(function() {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
});
</script>

@yield('javascript')
