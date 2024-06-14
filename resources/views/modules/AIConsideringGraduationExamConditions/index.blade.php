@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý danh sách điều kiện dự thi tốt nghiệp')

@section('css')
<style>
    .fixed-table-container {
        overflow: auto;
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
                            <h4>Danh sách điều kiện dự thi tốt nghiệp</h4>
                            <div class="sparkline8-graph">
                                <div class="row">
                                    <div class="col-md-2">
                                        <select class="form-control" name="id_training_specialty">
                                            <option value="0">------ Chọn ngành ------</option>
                                            @foreach($training_specialties as $training_specialty)
                                            <option value="{{$training_specialty->id}}">{{$training_specialty->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <select class="form-control" name="id_course">
                                            <option value="0">------ Chọn khóa ------</option>
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
                                                        <th data-field="time">Thời gian</th>

                                                        <th data-field="status">Tình trạng</th>
                                                        
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

@section('javascript')
    @include('modules.AIConsideringGraduationExamConditions.javascripts')
@endsection