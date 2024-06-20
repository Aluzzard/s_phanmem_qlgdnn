@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý danh sách điểm danh')

@section('css')
<style type="text/css">
.box-attendance:hover {
    background: #ffe6c2;
    cursor: pointer;
    user-select: none;
}
table th, table td {
    border: 1px solid #ccc;
    padding: 5px;
}
</style>
<style type="text/css">
.left-panel {
    overflow: auto;
    box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
    padding: 20px 10px;
}
.right-panel {
    overflow: auto;
}
.jstree-specialty .jstree-anchor {
    color: #393939; /* Màu cho chuyên ngành đào tạo */
}
.jstree-year .jstree-anchor {
    color: #00b907; /* Màu cho năm */
}
.jstree-course .jstree-anchor {
    color: #2196f3; /* Màu cho khóa học */
}
.jstree-anchor .jstree-icon {
    background-size: contain !important;
    background-position: center center;
    background-repeat: no-repeat;
    width: 16px;
    height: 16px;
}
.jstree-specialty .jstree-clicked,
.jstree-year .jstree-clicked {
    background: none !important;
    box-shadow: none !important;
}
.jstree-course .jstree-clicked {
    background: #ffe0de !important; /* Màu nền khi khóa học được chọn */
}
</style>
@endsection
@section('content')
<div class="container-fluid">
    <div class="card">
        <div class="admin-dashone-data-table-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="sparkline8-list">
                            <h4>Danh sách điểm danh học viên</h4>
                            <div class="sparkline8-graph">
                                <div class="row">
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
                                    <div class="col-md-8 right-panel">

                                        
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
    @include('modules.AIAttendance.modal')
@endsection
@section('javascript')
    @include('modules.AIAttendance.javascripts')
@endsection