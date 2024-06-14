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
                        <div class="row" style="position: relative;">
                           <div id='external-events'>
                              <h4>Giáo viên</h4>
                              <div id='external-events-list'>
                                 @foreach($teachers as $teacher)
                                 <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event' data-id='{{$teacher->id}}'>
                                    <div class='fc-event-main'>{{$teacher->name}}</div>
                                 </div>
                                 @endforeach
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
      <!-- Data table area End-->
   </div>
</div>
@endsection

@section('modal')
    
@endsection

@section('javascript')
    @include('modules.AITeachingAssignment.javascripts')
@endsection