<script type="text/javascript">
$(document).ready(function() {
    // Hàm để lấy giá trị tham số từ URL
    function getParameterByName(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }
    if ( getParameterByName('form') !== null) {
        if( $('select[name=form]').select2('val') != getParameterByName('form')) {
            $('select[name=form]').select2('val', getParameterByName('form'));
        }
    }
    if ( getParameterByName('year') !== null) 
        $('select[name="year"]').select2('val', getParameterByName('year'));
    if ( getParameterByName('month') !== null)
        $('select[name="month"]').select2('val', getParameterByName('month'));
    /* ------------------------------------------ Handle ------------------------------------------*/
    $("#form-action button").on("click", function( event ) {
        event.preventDefault();
        url_original = '/admin/module/thong-ke-tong-hop';
        if($(this).attr('data-action') == 'preview') {
            console.log(113)
        	window.location.href = url_original+'?form=2&year=' + $('select[name=year]').val() + '&month=' + $('select[name=month]').val();
        } 
        else if( $(this).attr('data-action') == 'export' ) {
            window.location.href = url_original+'?form=1&year=' + $('select[name=year]').val() + '&month=' + $('select[name=month]').val() + '&export=true';
        }
    });
    $('button[data-action="export"]').prop('disabled', !new URLSearchParams(window.location.search).get('year') && !new URLSearchParams(window.location.search).get('month'));

    func_loaddt = function() {
        data = { 
            action_type: 'loaddt'
        };
        url = '{!! route('AITypeOfCourses.post.ajax') !!}';
        func_callAjax(url,'data', data,'submit');
    };
    func_loaddt();
    //Lấy dữ liệu 1 module và đổ ra trong edit
    func_viewCategory = function(id) {     
        $.ajax({
            type: 'POST',
            url: '{!! route('AITypeOfCourses.post.ajax') !!}',
            data: {
                id: id,
                action_type: 'view'
            },
            dataType:'JSON',
            success: function(data) {
                $('#actionModal select[name=id_training_specialty]').val(data.item.id_training_specialty);
                $('#actionModal select[name=year]').val(data.item.year);
                $('#actionModal input[name=name]').val(data.item.name);
                $('#actionModal input[name=from_the_time]').val(data.item.from_the_time);
                $('#actionModal input[name=till_the_time]').val(data.item.till_the_time);
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
            action_type: $('#deleteModal input[name=action_type]').val(),
            id: $('#deleteModal input[name=id]').val()
        };
        $url = '{!! route('AITypeOfCourses.post.ajax') !!}';
        func_callAjax($url,'data', $data,'submit');
    });
});
</script>