<script type="text/javascript">
$(document).ready(function() {
	$('#search_module').on('keyup', function(){
		$.ajax({
            type: 'POST',
            url: '{!! route('user.ajax.list.module') !!}',
            data: {
                text: $(this).val()
            },
            dataType:'JSON',
            success: function(data) {
                $('#list_module').html(data.htmlListModule);
            },
            error: function(data) { 
                
            }
        });
	})

});
</script>