<?php

namespace App\Models\MainStructure;
use Illuminate\Database\Eloquent\Model;

class SysFunctionPermissionsAccordingToUser extends Model{
	public $timestamps = false;
	public function user() {
        return $this->belongsTo('App\Models\MainStructure\AccountUsers');
	}
}