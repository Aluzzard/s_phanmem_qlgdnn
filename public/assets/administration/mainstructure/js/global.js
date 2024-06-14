// // Example starter JavaScript for disabling form submissions if there are invalid fields
// (function() {
//     'use strict';
//     window.addEventListener('load', function() {
//         // Fetch all the forms we want to apply custom Bootstrap validation styles to
//         var forms = document.getElementsByClassName('needs-validation');
//         // Loop over them and prevent submission
//         var validation = Array.prototype.filter.call(forms, function(form) {
//             form.addEventListener('submit', function(event) {
//                 if (form.checkValidity() === false) {
//                     event.preventDefault();
//                     event.stopPropagation();
//                 }
//                 form.classList.add('was-validated');
//             }, false);
//         });
//     }, false);
// })();

function func_checkValidate () {
    $temp = true;
    $( ".required" ).each(function() {
      if( $(this).val() == '' ) {
        show_notify('warning', false, 'Cảnh báo', $(this).attr('data-notify')); 
        $temp = false;
      }
    });
    return $temp;
}

function show_notify(status, time, title, massage){
	Lobibox.notify(status, {
        delay: time,
        title: title,
        msg: massage
    });
}

function func_callAjax (url,formdata,data,typeaction){
	if(formdata == 'formdata'){
		if($('select[name=language]').length > 0) data.append('language_id', $('select[name=language]').val());
		$.ajax({
	        type: 'POST',
	        url: url,
	        data: data,
	        dataType:'JSON',
	        contentType: false,
	        cache: false,
	        processData: false,
	        beforeSend: function () {
            $('.ts_preloading_box').show();
          },
	        success: function(datas) {
						func_successAjax(datas,typeaction);
	        },
	        complete: function () {
            $('.ts_preloading_box').hide();
          },
	        error: function(data) { 
	        	show_notify('error', false, 'Lỗi', data.message);
	        }
	    });
	} else if(formdata == 'data'){
		if($('select[name=language]').length > 0) data['language_id'] = $('select[name=language]').val();
		$.ajax({
	        type: 'POST',
	        url: url,
	        data: data,
	        dataType:'JSON',
	        beforeSend: function () {
            $('.ts_preloading_box').show();
          },
	        success: function(datas) {
						func_successAjax(datas,typeaction);
	        },
	        complete: function () {
            $('.ts_preloading_box').hide();
          },
	        error: function(data) { 
	        	show_notify('error', false, 'Lỗi', data.message);
	        }
	    });
	}
}

function func_successAjax (data,action){
	console.log(data)
	if(action == 'submit') {
		if (data.error == false) {
			if( data.table_html || data.table_html == ''){
				$('[data-toggle="table"]').bootstrapTable('destroy');
        $('#table tbody').html(data.table_html);
        $('[data-toggle="table"]').bootstrapTable();
			} 
			else if ( data.option_response_private ){
				function_response_private(data);
			}
			if(data.message){
	      	show_notify('success', 5000, 'Thành công', data.message); 
	      	$(".modal").modal('hide');
	      }
    } 
    else if (data.error == true && data.validate == false){
			for (var i = 0; i < data.message.length; ++i) {
			    show_notify('warning', 5000, 'Cảnh báo', data.message[i]);
			}
    } 
    else {
    	show_notify('error', false, 'Lỗi', data.message); 
    	$(".modal").modal('hide');
    }
	} 
	else if(action == 'submitnotload') {
		if (data.error == false) {
			if( data.table_html || data.table_html == ''){
				$('[data-toggle="table"]').bootstrapTable('destroy');
        $('#table tbody').html(data.table_html);
        $('[data-toggle="table"]').bootstrapTable();
        if(data.message){
	      	show_notify('success', 5000, 'Thành công', data.message); 
	      	$(".modal").modal('hide');
	      }
			} 
			else if ( data.option_response_private ){
				function_response_private(data);
			}
    } 
    else if (data.error == true && data.validate == false){
			for (var i = 0; i < data.message.length; ++i) {
			    show_notify('warning', 5000, 'Cảnh báo', data.message[i]);
			}
    } 
    else {
    	show_notify('error', false, 'Lỗi', data.message); 
    	$(".modal").modal('hide');
    }
	}
	else if(action == 'view') {
		if (data.error == false) {
			$('div.modal').on('shown.bs.modal', function () {
					if(data.result){
						var modal_id = $(this).attr('id');
				    $.each(data.result, function(key1, value){
				    	//input text
							if( $('#'+modal_id+' input[name='+key1+'][type!=file][type!=checkbox][type!=datetime-local]').length > 0 ) {
								$('#'+modal_id+' input[name='+key1+'][type!=file]').val(value);
								if( $('#'+modal_id+' input[name='+key1+'][id=thumbnail]').length > 0 && value) {
									$('#holder').html('<img src="'+value+'" style="height: 5rem;">');
								}
							} 
							//input img
							else if( $('#'+modal_id+' img[name='+key1+']').length > 0 ) {
								$('#'+modal_id+' img[name='+key1+']').attr('src', value);
							} 
							// input textarea
							else if( $('#'+modal_id+' textarea[name='+key1+']').length > 0 ) {
								$('#'+modal_id+' textarea[name='+key1+']').val('test');
								var textarea_id = $('#'+modal_id+' textarea[name='+key1+']').attr('id');
								if ( CKEDITOR.instances[textarea_id] ){
									CKEDITOR.instances[textarea_id].setData(value); 
								}
							}
							//input select
							else if( $('#'+modal_id+' select[name='+key1+']').length > 0 ) {
								$('#'+modal_id+' select[name='+key1+']').val(value);
							} 
							// else if( $('#'+modal_id+' input[name='+key1+'][type="datetime-local"]').length > 0 ) {
								
							// }
							//input checkbox
							else if( $('#'+modal_id+' input[name='+key1+'][type="checkbox"]').length > 0 ) {
								if(value == 1) {
									$('input[name='+key1+'][type=checkbox]').attr('checked', true)
									$('input[name='+key1+'][type=checkbox]').parent().addClass('checked')
								} else {
									$('input[name='+key1+'][type=checkbox]').attr('checked', false);
									$('input[name='+key1+'][type=checkbox]').parent().removeClass('checked');
								}
							}
						});
					}
			});
			// 
		}
	} 
}
var route_prefix = "/admin/laravel-filemanager";
var option = {
    language: 'vi',
    height: 1000,
}