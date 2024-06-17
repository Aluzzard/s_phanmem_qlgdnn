<?php

namespace App\Models\MainStructure;
use Illuminate\Database\Eloquent\Model;

class SysLogs extends Model{

	public function user() {
        return $this->belongsTo('App\Models\MainStructure\AccountUsers', 'user_id', 'id');
    }
}