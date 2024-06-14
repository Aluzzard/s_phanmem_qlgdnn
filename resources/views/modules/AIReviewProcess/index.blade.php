@extends('mainstructure.layouts.admins.layout')
@section('title','Quản lý xét tiến độ')

@section('css')
    @include('modules.AIReviewProcess.css')
@endsection

@section('content')
<div class="container-fluid">
    <div class="card">
        <div class="admin-dashone-data-table-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="sparkline8-list">
                            <h4>Danh sách xét tiến độ</h4>
                            <div class="sparkline8-graph" style="position: relative;">
                                <div class="row mb-5">
                                    <div class="col-md-2">
                                        <select class="form-control" name="id_training_specialty">
                                            @foreach($training_specialties as $training_specialty)
                                            <option value="{{$training_specialty->id}}">{{$training_specialty->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <select class="form-control" name="id_course">
                                            @if(count($courses) == 0)
                                            <option value="0">Không có khóa học</option>
                                            @else
                                            @foreach($courses as $course)
                                            <option value="{{$course->id}}">Khóa {{$course->name}}/{{$course->year}}</option>
                                            @endforeach
                                            @endif
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-5">
                                    <div class="col-md-2">
                                        <button type="button" id="btn_add" class="btn btn-primary" data-toggle="modal" data-target="#partialModal" onclick="func_buttonClick('activities',0)"><span>Hoạt động</span></button>
                                        <button type="button" id="btn_add" class="btn btn-primary" data-toggle="modal" data-target="#partialModal" onclick="func_buttonClick('types',0)"><span>Loại sự kiện</span></button>
                                    </div>
                                    <div class="col-md-10 text-right">
                                        <button class="btn btn-success btn-add-event" data-toggle="modal" data-target="#actionModal" onclick="func_buttonClick('add',0)" disabled>Thêm sự kiện</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="false" data-show-toggle="true" data-resizable="false" data-cookie="false" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="false">
                                        <thead>
                                            <tr>
                                                <th data-sortable="false" rowspan="3">Số TT</th>
                                                <th data-sortable="false" rowspan="3">Nội dung hoạt động</th>
                                                <th data-sortable="false">Tháng</th>
                                                <th data-sortable="false" colspan="13">08 - 10</th>
                                                <th data-sortable="false" rowspan="3">Ghi chú</th>

                                            </tr>
                                            <tr>
                                                <th data-sortable="false">Tuần</th>
                                                <th data-sortable="false">31</th>
                                                <th data-sortable="false">32</th>
                                                <th data-sortable="false">33</th>
                                                <th data-sortable="false">34</th>
                                                <th data-sortable="false">35</th>
                                                <th data-sortable="false">36</th>
                                                <th data-sortable="false">37</th>
                                                <th data-sortable="false">38</th>
                                                <th data-sortable="false">39</th>
                                                <th data-sortable="false">40</th>
                                                <th data-sortable="false">41</th>
                                                <th data-sortable="false">42</th>
                                                <th data-sortable="false">43</th>
                                            </tr>
                                            <tr>
                                                <th data-sortable="false">Từ ngày </br> Đến ngày</th>
                                                <th data-sortable="false">30/7-5/8</th>
                                                <th data-sortable="false">6/8-12/8</th>
                                                <th data-sortable="false">13/8-19/8</th>
                                                <th data-sortable="false">20/8-26/8</th>
                                                <th data-sortable="false">27/8-2/9</th>
                                                <th data-sortable="false">3/9-9/9</th>
                                                <th data-sortable="false">10/9-16/9</th>
                                                <th data-sortable="false">17/9-23/9</th>
                                                <th data-sortable="false">24/9-30/9</th>
                                                <th data-sortable="false">1/10-7/10</th>
                                                <th data-sortable="false">8/10-14/10</th>
                                                <th data-sortable="false">15/10-21/10</th>
                                                <th data-sortable="false">22/10-28/10</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($review_process_categories->where('type', 'activities') as $key=>$item)
                                            <tr>
                                                <td>{{$key}}</td>
                                                <td colspan="2" class="text-left">{{$item->name}}</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
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
    @include('modules.AIReviewProcess.modal')
@endsection

@section('javascript')
    @include('modules.AIReviewProcess.javascripts')
@endsection