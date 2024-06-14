<?php

namespace App\Models\Modules;
use Illuminate\Database\Eloquent\Model;

class ModuleCertificationList extends Model{
	protected $fillable = [
		'name', 
		'description', 
		'path', 
		'id_course',
	];
	public function course() {
        return $this->belongsTo('App\Models\Modules\ModuleTypeOfCourses','id_course');
    }
}