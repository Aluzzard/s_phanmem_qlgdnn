<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleTypeOfCourses extends Model {
    protected $fillable = [
        'id_site',
        'id_training_specialty',
        'year',
        'name', 
        'from_the_time',
        'till_the_time',
        'exam_date',
        'address'
    ];

    public function students() {
        return $this->hasMany('App\Models\Modules\ModuleManageStudents','id_course','id');
    }
    public function training_specialty() {
        return $this->belongsTo('App\Models\Modules\ModuleTrainingSpecialties','id_training_specialty','id');
    }
    public function countStudents() {
        return $this->students()->count();
    }
}