<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleOfficerAssessmentProcess extends Model{
	protected $fillable = [
		'id_officer',
		'health_assessment', 
		'moral_assessment', 
		'professional_assessment',
		'general_assessment',
		'id_course',
		'id_semester'
	];
	public function course() {
        return $this->belongsTo('App\Models\Modules\ModuleTypeOfCourses','id_course','id');
    }
    public function semester() {
        return $this->belongsTo('App\Models\Modules\ModuleTypeOfSemesters','id_semester','id');
    }
}