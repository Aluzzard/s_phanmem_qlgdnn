@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý danh sách học viên')

@section('css')
<style type="text/css">
.left-panel {
    overflow: auto;
    box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
    padding: 20px 10px;
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
<div class="card">
    <div class="admin-dashone-data-table-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sparkline8-list">
                        <h4>Danh sách học viên</h4>
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

                                <div class="col-md-8">
                                    <div class="plz-choose-course">
                                        Vui lòng chọn một khóa học!
                                    </div>
                                    <div class="temp_hidden" style="display: none;">
                                        @if($check_add == true)
                                        <a class="btn btn-warning" href="{!! route('AIManageStudents.get.downloadTemplate') !!}"><i class="fa big-icon fa-cloud" target="_blank"></i><span class="ml-2">Tải file mẫu</span></a>
                                        <button type="button" id="btn_import" class="btn btn-primary" data-toggle="modal" data-target="#importModal" onclick="func_buttonClick('import',0)">
                                            <i class="fa big-icon fa-upload"></i>
                                            <span class="ml-2">Upload bằng file</span>
                                        </button>
                                        <button type="button" id="btn_add" class="btn btn-success" data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick('add',0)">
                                            <i class="fa big-icon fa-plus"></i>
                                            <span class="ml-2">Thêm</span>
                                        </button>
                                        @endif
                                        <div class="datatable-dashv1-list custom-datatable-overright">
                                            <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="false" data-show-toggle="true" data-resizable="false" data-cookie="false" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="false">
                                                <thead>
                                                    <tr>
                                                        <th data-field="name">Tên</th>
                                                        <th data-field="is_active">Tình trạng</th>
                                                        <th data-field="gender">Giới tính</th>
                                                        <th data-field="date_of_birth">Ngày sinh</th>
                                                        <th data-field="ethnic">Dân tộc</th>
                                                        <th data-field="action">Hành động</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
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
@endsection

@section('modal')
    @include('modules.AIManageStudents.modal')
@endsection
@section('javascript')
    @include('modules.AIManageStudents.javascripts')
@endsection