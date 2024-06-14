<style>
/* Ẩn checkbox cho tất cả các nút */
.jstree_guests .jstree-anchor > .jstree-checkbox {
    display: none;
}

/* Hiển thị checkbox cho các nút loại "course" */
.jstree_guests .jstree-leaf .jstree-anchor > .jstree-checkbox {
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
                            <ul class="nav nav-tabs custom-menu-wrap custon-tab-menu-style1">
                                <li class="active"><a data-toggle="tab" href="#TabProject"><span class="adminpro-icon adminpro-analytics tab-custon-ic pr-2"></span>Tuyển sinh</a></li>
                                <li><a data-toggle="tab" href="#TabDetails"><span class="adminpro-icon adminpro-analytics-arrow tab-custon-ic pr-2"></span>Tốt nghiệp</a></li>
                            </ul>
                            <div class="tab-content pt-3">
                                <div id="TabProject" class="tab-pane in active custon-tab-style1">
                                    <div id="jstree_admission" class="jstree_guests">
                                        @isset($list_courses)
                                        <ul>
                                            @php $currentYear = null; $currentSpecialty = null; @endphp
                                            @foreach($list_courses as $course)
                                                @if($currentYear != $course->year)
                                                    @if($currentYear !== null)
                                                        </ul></li></ul> <!-- Close the previous year and specialty list -->
                                                    @endif
                                                    <li id="node_year_{{ $course->year }}" class="jstree-open">{{ $course->year }}<ul>
                                                    @php $currentYear = $course->year; $currentSpecialty = null; @endphp
                                                @endif

                                                @if($currentSpecialty != $course->training_specialty->name)
                                                    @if($currentSpecialty !== null)
                                                        </ul></li> <!-- Close the previous specialty list -->
                                                    @endif
                                                    <li id="node_specialty_{{ $course->training_specialty->id }}" class="jstree-open">{{ $course->training_specialty->name }}<ul>
                                                    @php $currentSpecialty = $course->training_specialty->name; @endphp
                                                @endif
                                                
                                                <li id="node_course_{{ $course->id }}" data-jstree='{"type":"course"}'>Khóa {{ $course->name }}</li>
                                            @endforeach
                                            @if(isset($course)) <!-- Close the last opened tags -->
                                                </ul></li></ul></li>
                                            @endif
                                        </ul>
                                        @endif
                                    </div>
                                </div>
                                <div id="TabDetails" class="tab-pane custon-tab-style1">
                                    <div id="jstree_graduation" class="jstree_guests">
                                        @isset($list_courses)
                                        <ul>
                                            @php $currentYear = null; $currentSpecialty = null; @endphp
                                            @foreach($list_courses as $course)
                                                @if($currentYear != $course->year)
                                                    @if($currentYear !== null)
                                                        </ul></li></ul> <!-- Close the previous year and specialty list -->
                                                    @endif
                                                    <li id="node_year_{{ $course->year }}" class="jstree-open">{{ $course->year }}<ul>
                                                    @php $currentYear = $course->year; $currentSpecialty = null; @endphp
                                                @endif

                                                @if($currentSpecialty != $course->training_specialty->name)
                                                    @if($currentSpecialty !== null)
                                                        </ul></li> <!-- Close the previous specialty list -->
                                                    @endif
                                                    <li id="node_specialty_{{ $course->training_specialty->id }}" class="jstree-open">{{ $course->training_specialty->name }}<ul>
                                                    @php $currentSpecialty = $course->training_specialty->name; @endphp
                                                @endif
                                                
                                                <li id="node_course_{{ $course->id }}" data-jstree='{"type":"course"}'>Khóa {{ $course->name }}</li>
                                            @endforeach
                                            @if(isset($course)) <!-- Close the last opened tags -->
                                                </ul></li></ul></li>
                                            @endif
                                        </ul>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-success" data-action="preview"><i class="fa fa-eye pr-2"></i>Xem trước</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
