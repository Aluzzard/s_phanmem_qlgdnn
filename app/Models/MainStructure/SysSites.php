<?php

namespace App\Models\MainStructure;
use Illuminate\Database\Eloquent\Model;

class SysSites extends Model{
	public $timestamps = false;
	protected $fillable = [
		'is_active',
		'name', 
		'address', 
		'email',
		'numberphone',
		'domain_1',
		'domain_2',
		'folder_for_save',
		'storage',
		'till_the_time',
		'theme',
		'note',
		'logo'
	];
}