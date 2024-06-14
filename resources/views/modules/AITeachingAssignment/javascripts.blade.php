<script src="{{ asset('assets/administration/mainstructure/js/global.js') }}"></script>

<script src="{{ asset('assets/administration/mainstructure/js/fullcalendar/index.global.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/fullcalendar/vi.global.min.js') }}"></script>

<script type="text/javascript">
$(document).ready(function() {
    $('select[name=id_training_specialty]').on('change', function(){
        $.ajax({
            type: 'POST',
            url: '{!! route('AIManageStudents.post.ajax') !!}',
            data: {
                id: $(this).val(),
                action_type: 'course'
            },
            dataType:'JSON',
            success: function(data) {
                html = '';
                if(data.courses.length == 0) {
                    html = '<option value="0" selected>Không có khóa học</option>';
                } else {
                    for(i=0; i<data.courses.length;i++){
                        html += '<option value="'+data.courses[i].id+'"'+(i==0 ? " selected":"")+'>Khóa '+data.courses[i].name+'/'+data.courses[i].year+'</option>';
                    }
                }
                $('select[name=id_course]').html(html);
                loadCalendar();

            },
            error: function(data) { 

            }
        });
    })
    $('select[name=id_course]').on('change', function(){
        loadCalendar();
    })
    new FullCalendar.Draggable( document.getElementById('external-events-list'), {
        itemSelector: '.fc-event',
        eventData: function(eventEl) {
            return {
                title: eventEl.innerText.trim()
            }
        }
    });
    var calendar = new FullCalendar.Calendar(document.getElementById('calendar') , {
        timeZone: 'local', // the default (unnecessary to specify)
        locale: 'vi',
        editable: true,
        droppable: true, // this allows things to be dropped onto the calendar
        drop: function(event) {
            console.log(event)
            var date = new Date(event.dateStr);
            var endDate = new Date(date.getTime() + 86400000); // 86400000 là 24 giờ trong mili giây
            var endDateStr = endDate.toISOString().substring(0, 10);
            func_submitCalender('add', event.draggedEl.dataset.id, event.draggedEl.innerText, event.dateStr, endDateStr, $('select[name=id_training_specialty]').val(), $('select[name=id_course]').val())
        },
        eventReceive: function(info) { // called when a proper external event is dropped
            var evt = info.event;
            evt.remove();
            var newEvent = {};
            //clone the object - doesn't work if we just pass evt straight to the addEvent method
            for (prop in evt) {
                newEvent[prop] = evt[prop];
            }
         calendar.addEvent(newEvent,'planificacion');
        },
        eventAllow: function(dropInfo, draggedEvent) {
            if($('select[name=id_course]').val() == 0) {
                show_notify('warning', 5000, 'Cảnh báo', 'Vui lòng chọn khóa học');
                return false;
            } else {
                return true;
            }
        },
        eventClick: function(event) {
            console.log(event)
            if (confirm('Bạn có chắc muốn xóa lịch dạy?')) {
                func_submitCalender('delete', event.event._def.publicId, event.event._def.title, event.event._instance.range.start, event.event._instance.range.end, $('select[name=id_training_specialty]').val(), $('select[name=id_course]').val())
            }
        },
        // eventDragStart: function(event) {
        //     console.log(111)
        // },
        eventDrop: function(event) {
            func_submitCalender('edit', event.event._def.publicId, event.event._def.title, event.event._instance.range.start, event.event._instance.range.end, $('select[name=id_training_specialty]').val(), $('select[name=id_course]').val())
            console.log(event)
        },
        eventLeave: function(info) {
            console.log('event left!', info);
        },
        eventResize: function(event) {
            func_submitCalender('edit', event.event._def.publicId, event.event._def.title, event.event._instance.range.start, event.event._instance.range.end, $('select[name=id_training_specialty]').val(), $('select[name=id_course]').val())
            console.log(event);

        }

    });
    calendar.render();
    loadCalendar = function(){
        $.ajax({
            url: '{!! route('AITeachingAssignment.post.ajax') !!}',
            type: 'POST',
            data: {
                action_type: 'loaddt',
                id_training_specialty: $('select[name=id_training_specialty]').val(),
                id_course: $('select[name=id_course]').val()
            },
            dataType:'JSON',
            beforeSend: function () {
                $('.ts_preloading_box').show();
            },
            success: function(data){
                //Gọi tất cả các sự kiện
                var eventSources = calendar.getEventSources(); 
                //Đếm và xóa tất cả sự kiện
                var len = eventSources.length;
                for (var i = 0; i < len; i++) { 
                    eventSources[i].remove(); 
                }
                //Khởi tạo source mới từ data ajax
                var source = [];
                for (var i = 0; i < data.items.length; i++) {
                    source.push({
                        id: data.items[i].id,
                        title: data.items[i].name,
                        start: data.items[i].start_time,
                        end: data.items[i].end_time
                    });
                }
                //Gán source vào lịch
                calendar.addEventSource( source )
                $('#number_assign').text(data.number_of_days+'/'+data.number_days_specialty+' buổi');
            },
            complete: function () {
                $('.ts_preloading_box').hide();
            }
        });
    }
    loadCalendar();

// -------------------------- Handle --------------------------
    function func_submitCalender(action_type, id, name, start, end){
        $.ajax({
            url: '{!! route('AITeachingAssignment.post.ajax') !!}',
            type: 'POST',
            data: {
                action_type: action_type,
                id: id,
                name: name,
                start_time: start,
                end_time: end,
                id_training_specialty: $('select[name=id_training_specialty]').val(),
                id_course: $('select[name=id_course]').val()
            },
            dataType:'JSON',
            beforeSend: function () {
                $('.ts_preloading_box').show();
            },
            success: function(data){
                console.log(data)
                if(data.error == false) {
                    show_notify('success', 5000, 'Thành công', data.message);
                } else {
                    show_notify('warning', 5000, 'Cảnh báo', data.message);
                }
                loadCalendar();                

            },
            complete: function () {
                $('.ts_preloading_box').hide();
            }
        });
    }
});
</script>