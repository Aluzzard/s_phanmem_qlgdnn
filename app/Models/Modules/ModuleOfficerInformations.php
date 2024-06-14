<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleOfficerInformations extends Model{
	protected $fillable = [
		'id_site',
		'name', #
		'date_of_birth', #
		'numberphone',#
		'identification_id_card',#
		'date_of_issue',#
		'department_of_issue',#
		'educational_level',#
		'teaching_level',#
		'permanent_residence',#
		'place_of_live',#
		'ethnic',
		'region',
		'email',
		'state_of_health',
		'blood_group',
		'height',
		'weight',
		'gender',
		'family_composition'
	];

	public function work_process() {
        return $this->hasMany('App\Models\Modules\ModuleOfficerWorkProcess','id_officer','id') ;
    }
    public function professional_training_process() {
        return $this->hasMany('App\Models\Modules\ModuleOfficerProfessionalTrainingProcess','id_officer','id') ;
    }
}