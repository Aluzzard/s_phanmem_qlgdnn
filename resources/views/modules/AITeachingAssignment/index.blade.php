@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý phân công giảng dạy')

@section('css')
@include('modules.AITeachingAssignment.css')
@endsection

@section('content')
<div class="container-fluid">
    <div class="card">
        <div class="admin-dashone-data-table-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="sparkline8-list">
                            <h4>Danh sách phân công giảng dạy</h4>
                            <div class="sparkline8-graph" style="position: relative;">
                                <div class="row mb-5">
                                    <div class="col-md-4 left-panel">
                                        <div id="jstree_course">
                                            <?php
                                            // Hàm đệ quy để xây dựng cây danh mục với biểu tượng khác nhau và chỉ định khóa học có thể nhấn chọn
                                            function buildCategoryTree($training_specialties) {
                                                $html = '<ul>';
                                                foreach ($training_specialties as $training_specialty) {
                                                    $html .= '<li id="node_specialty_' . htmlspecialchars($training_specialty->id) . '" class="jstree-specialty jstree-open" data-jstree=\'{"type":"training_specialty"}\'>';
                                                    $html .= htmlspecialchars($training_specialty->name);

                                                    // Nhóm các khóa học theo năm
                                                    $years = $training_specialty->courses->groupBy('year');

                                                    if ($years->isNotEmpty()) {
                                                        $html .= '<ul>';
                                                        foreach ($years as $year => $courses) {
                                                            $html .= '<li id="node_specialty_' . htmlspecialchars($training_specialty->id) . '_year_' . htmlspecialchars($year) . '" class="jstree-year jstree-open" data-jstree=\'{"type":"year"}\'>';
                                                            $html .= 'Năm ' . htmlspecialchars($year);

                                                            $html .= '<ul>';
                                                            foreach ($courses as $course) {
                                                                $html .= '<li id="node_specialty_' . htmlspecialchars($training_specialty->id) . '_year_' . htmlspecialchars($year) . '_course_' . htmlspecialchars($course->id) . '" class="jstree-course jstree-open" data-jstree=\'{"type":"course"}\'>';
                                                                $html .= 'Khóa ' . htmlspecialchars($course->name);
                                                                $html .= '</li>';
                                                            }
                                                            $html .= '</ul>';

                                                            $html .= '</li>';
                                                        }
                                                        $html .= '</ul>';
                                                    }

                                                    $html .= '</li>';
                                                }
                                                $html .= '</ul>';
                                                return $html;
                                            }
                                            // Sử dụng hàm để tạo cây danh mục
                                            echo buildCategoryTree($training_specialties);
                                            ?>
                                        </div>
                                    </div>
                                    <div class="col-md-8 right-panel" style="display: none;">
                                        <div id='external-events'>
                                            <h4>Giáo viên</h4>
                                            <div id='external-events-list'>
                                                @if($teachers && count($teachers) > 0)
                                                @foreach($teachers as $teacher)
                                                <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' data-id='{{$teacher->id}}'>
                                                    <div class='fc-event-main'>{{$teacher->name}}</div>
                                                </div>
                                                @endforeach
                                                @else
                                                Không có giáo viên, vui lòng thêm giáo viên trước!
                                                @endif
                                            </div>
                                        </div>

                                        <div id='calendar-wrap'>
                                            <div>Đã phân công: <strong id="number_assign"></strong></div>
                                            <div id='calendar'></div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Data table area End-->
    </div>
</div>
@endsection

@section('modal')

@endsection

@section('javascript')
@include('modules.AITeachingAssignment.javascripts')
@endsection