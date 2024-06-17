<?php

namespace App\Models\MainStructure;
use Illuminate\Database\Eloquent\Model;

class SysThemes extends Model{
	public $timestamps = false;
	protected $fillable = [
		'name', 
		'code', 
	];
}