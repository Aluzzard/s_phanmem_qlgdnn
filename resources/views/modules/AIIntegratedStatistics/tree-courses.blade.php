<style>
/* Ẩn checkbox cho tất cả các nút */
#jstree_guests .jstree-anchor > .jstree-checkbox {
    display: none;
}

/* Hiển thị checkbox cho các nút loại "course" */
#jstree_guests .jstree-leaf .jstree-anchor > .jstree-checkbox {
    display: inline-block;
}
</style>

<div id="chooseCoursesModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Chọn khóa học</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 id="form_group_modules_title"></h4>
                        <form id="form-action">                            
                            <div id="jstree_guests">
                                @isset($list_courses)
                                <ul>
                                    @php $currentYear = null; @endphp
                                    @foreach($list_courses as $course)
                                    @if($currentYear != $course->year)
                                        @if($currentYear !== null)
                                            </ul></li></ul></li> <!-- Close the previous year and specialty list -->
                                        @endif
                                        <li id="node_year_{{ $course->year }}" class="jstree-open">{{ $course->year }}
                                            <ul>
                                    @endif

                                    @php $currentSpecialty = null; @endphp
                                    @if($currentSpecialty != $course->training_specialty->name)
                                        @if($currentSpecialty !== null)
                                            </ul></li> <!-- Close the previous specialty list -->
                                        @endif
                                        <li id="node_specialty_{{ $course->training_specialty->id }}" class="jstree-open">{{ $course->training_specialty->name }}
                                            <ul>
                                    @endif
                                    
                                    <li id="node_course_{{ $course->id }}" data-jstree='{"type":"course"}'>Khóa {{ $course->name }}</li>

                                    @php
                                        $currentYear = $course->year;
                                        $currentSpecialty = $course->training_specialty->name;
                                    @endphp
                                    @endforeach
                                    <!-- Close the last opened tags -->
                                    @if(isset($course))
                                        </ul></li></ul></li>
                                    @endif
                                </ul>
                                @endif
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
