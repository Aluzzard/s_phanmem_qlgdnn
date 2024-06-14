
(function ($) {
 "use strict";
			
	
$('#jstree').jstree({
    'core' : {
        'check_callback' : true
    },
    'plugins' : [ 'types', 'dnd' ],
    'types' : {
        'default' : {
            // 'icon' : 'fa fa-folder'
            // 'icon' : 'none'
        },
        'html' : {
            'icon' : 'fa fa-file-code-o'
        },
        'svg' : {
            'icon' : 'fa fa-file-picture-o'
        },
        'css' : {
            'icon' : 'fa fa-file-code-o'
        },
        'img' : {
            'icon' : 'fa fa-file-image-o'
        },
        'js' : {
            'icon' : 'fa fa-file-text-o'
        },
        'none' : {
            'icon' : 'none'
        },
        'folder' : {
            'icon' : 'fa fa-folder'
        }

    }
});
$('#jstree_post').jstree({
    'core' : {
        'check_callback' : true
    },
});
$('#jstree_move').jstree({
    'core' : {
        'check_callback' : true
    },
});
})(jQuery); 

