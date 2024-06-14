<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleAttendance extends Model{
	protected $fillable = [
		'id_site',
        'id_student',
        'id_course',
        'attendance'
	];
    public function student() {
        return $this->belongsTo('App\Models\Modules\ModuleManageStudents','id_student','id');
    }
    public function course() {
        return $this->belongsTo('App\Models\Modules\ModuleTypeOfCourses','id_course','id');
    }
}