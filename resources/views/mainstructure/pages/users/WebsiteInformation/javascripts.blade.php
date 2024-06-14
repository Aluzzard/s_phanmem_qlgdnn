<script>var route_prefix = "/admin/laravel-filemanager";</script>

<script>
    {!! \File::get(base_path('vendor/unisharp/laravel-filemanager/public/js/stand-alone-button.js')) !!}
</script>
<script>
    $('#lfm').filemanager('image', {prefix: route_prefix});
// $('#lfm').filemanager('file', {prefix: route_prefix});
</script>

<script type="text/javascript">
$(document).ready(function() {
    $("#modal_1").on('show.bs.modal', function (e) {  
        data = {
            action_type : 'view_website_information'
        };
        url = '{!! route('admin.website.information.ajax') !!}';
        func_callAjax(url,'data', data,'view');
    });
    $("#form-action-information").on("submit", function( event ) {
        event.preventDefault();
        for ( instance in CKEDITOR.instances ) { //input dữ liệu ckeditor
            CKEDITOR.instances[instance].updateElement();
        }
        data = new FormData(this);
        url = '{!! route('admin.website.information.ajax') !!}';
        func_callAjax(url,'formdata', data,'submit');
    });
    function_response_private = function (data) {
        $('#span_name').text(data.data.name);
        $('#span_address').text(data.data.address);
        $('#span_fax').text(data.data.fax);
        $('#span_numberphone').text(data.data.numberphone);
        $('#span_email').text(data.data.email);
        $('#span_hotline').text(data.data.hotline);
        $('#span_bussiness_code').text(data.data.bussiness_code);
        $('#logo').attr('src',data.data.logo);

        $('#id_div_gradient').attr('style','background: '+data.data.color_gradient);
        $('#id_div_background').attr('style','background: '+data.data.color_background);
        $('#id_div_font_color').attr('style','background: '+data.data.color_font);
        $('#id_div_font_color_hover').attr('style','background: '+data.data.color_font_hover);
        $('#id_div_font_color_focus').attr('style','background: '+data.data.color_font_focus);
        
        $('#span_meta_title').text(data.data.meta_title);
        $('#span_meta_description').text(data.data.meta_description);
        $('#span_keywords').text(data.data.keywords);
        $('#span_author').text(data.data.author);
        $('#span_country').text(data.data.country);
        $('#span_DC_title').text(data.data.meta_dc_title);
        $('#span_meta_geo_region').text(data.data.meta_geo_region);
        $('#span_meta_geo_placename').text(data.data.meta_geo_placename);
        $('#span_meta_geo_position').text(data.data.meta_geo_position);
        $('#span_ICBM').text(data.data.meta_icbm);
    }
});

</script>