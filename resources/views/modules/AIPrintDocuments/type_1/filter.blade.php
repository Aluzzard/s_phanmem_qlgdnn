<div class="row pb-2">
	<label class="col-md-2">
		Tên đơn vị
	</label>
	<div class="col-md-4">
		<input name="name_department" class="form-control">
	</div>
	<label class="col-md-2">
		Tên đơn vị trực thuộc
	</label>
	<div class="col-md-4">
		<input name="name_department_sub" class="form-control">
	</div>
</div>
<div class="row pb-2">
	<label class="col-md-2">
		Quyết định đi kèm
	</label>
	<div class="col-md-4">
		<input name="decision_name" class="form-control">
	</div>
	<label class="col-md-2">
		Ngày ban hành
	</label>
	<div class="col-md-4">
		<input name="date_issue" class="form-control">
	</div>
</div>
<div class="row pb-2">
	<label class="col-md-2">
		Người ký quyết định
	</label>
	<div class="col-md-4">
		<input name="decision_signer" class="form-control">
	</div>
</div>
<div class="row pb-2">
	<label class="col-md-2">
		Người lập bảng
	</label>
	<div class="col-md-4">
		<input name="tabular_creator" class="form-control">
	</div>
	<label class="col-md-2">
		Người ký
	</label>
	<div class="col-md-4">
		<input name="signer" class="form-control">
	</div>
</div>
<div class="row pb-2">
	<label class="col-md-2">
		Chọn lớp
	</label>
	<div class="col-md-4">
	    <select class="chosen-select2 form-control" name="id_course">
	    	<option value="">--- Chọn khóa học ---</option>
	        @foreach($courses as $course)
			<option value="{{$course->id}}">{{$course->training_specialty->name}} - {{$course->year}} - Khóa {{$course->name}}</option>
			@endforeach
	    </select>
	</div>
</div>
