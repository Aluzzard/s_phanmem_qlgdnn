@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý danh sách học viên')

@section('content')
<div class="container-fluid">
    <div class="card">
        <div class="admin-dashone-data-table-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="sparkline8-list">
                            <h4>Danh sách điểm học viên</h4>
                            <div class="sparkline8-graph">
                                <div class="row">
                                    <div class="col-md-2">
                                        <select class="form-control" name="id_training_specialty">
                                            <option value="0">Tất cả</option>
                                            @foreach($training_specialties as $training_specialty)
                                            <option value="{{$training_specialty->id}}">{{$training_specialty->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <select class="form-control" name="id_course">
                                            <option value="0">Tất cả</option>
                                            @foreach($courses as $course)
                                            <option value="{{$course->id}}">Khóa {{$course->name}}/{{$course->year}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="datatable-dashv1-list custom-datatable-overright">
                                            <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="false" data-show-toggle="true" data-resizable="false" data-cookie="false" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="false">
                                                <thead>
                                                    <tr>
                                                        <th data-field="training_specialty">Ngành</th>
                                                        <th data-field="course">Khóa</th>
                                                        <th data-field="name">Tên</th>
                                                        <th data-field="subject_1">Điểm 1</th>
                                                        <th data-field="subject_2">Điểm 2</th>
                                                        <th data-field="subject_3">Điểm 3</th>
                                                        <th data-field="subject_4">Điểm 4</th>
                                                        <th data-field="subject_5">Điểm 5</th>
                                                        <th data-field="subject_6">Điểm 6</th>
                                                        <th data-field="theory">Lý thuyết</th>
                                                        <th data-field="practice">Thực hành</th>
                                                        <th data-field="final_score">Điểm cuối khóa</th>
                                                        <th data-field="average">Điểm TB</th>
                                                        <th data-field="classification">Xếp loại</th>
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
        <!-- Data table area End-->
    </div>
</div>
@endsection

@section('modal')
    @include('modules.AIGraduationScoreInformations.modal')
@endsection
@section('javascript')
    @include('modules.AIGraduationScoreInformations.javascripts')
@endsection