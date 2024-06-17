<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleManageStudents extends Model{
	protected $fillable = [
		'id_site',
        'last_name',
        'first_name',
        'date_of_birth', 
        'numberphone',
        'identification_id_card',
        'date_of_issue',
        'department_of_issue',
        'permanent_residence',
        'place_of_live',
        'id_ethnic',
        'region',
        'email',
        // 'state_of_health',
        // 'blood_group',
        // 'height',
        // 'weight',
        'gender',
        'is_active',
        'id_course',
        'class',
        'policy'
	];
    public function ethnic() {
        return $this->belongsTo('App\Models\Modules\ModuleTypeOfEthnics','id_ethnic','id');
    }
    public function course() {
        return $this->belongsTo('App\Models\Modules\ModuleTypeOfCourses','id_course','id');
    }
}