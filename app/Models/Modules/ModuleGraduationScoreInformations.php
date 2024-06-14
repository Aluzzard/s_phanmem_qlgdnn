<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleGraduationScoreInformations extends Model{
	protected $fillable = [
		'id_site',
        'id_student',
        'id_course',

        'subject_1',
        'subject_2',
        'subject_3',
        'subject_4',
        'subject_5',
        'subject_6',
        'theory',
        'practice',
        'final_score',
        'average',
        'classification',
        'note'
	];
    public function student() {
        return $this->belongsTo('App\Models\Modules\ModuleManageStudents','id_student','id');
    }
    public function training_specialty() {
        return $this->belongsTo('App\Models\Modules\ModuleTrainingSpecialties','id_training_specialty','id');
    }
    public function course() {
        return $this->belongsTo('App\Models\Modules\ModuleTypeOfCourses','id_course','id');
    }
}