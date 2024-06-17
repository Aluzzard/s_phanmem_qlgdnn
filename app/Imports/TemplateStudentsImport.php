<?php

namespace App\Imports;
use Illuminate\Support\Facades\Auth;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\SkipsEmptyRows;

use App\Models\Modules\ModuleManageStudents;

class TemplateStudentsImport implements ToModel, WithStartRow, SkipsEmptyRows {


    public function startRow(): int {
        return 2;
    }

    public function model(array $row) {
        if (!$row[0] || !$row[9] || !$row[10]) {
            return;
        }
        preg_match_all('/\((\d+)\)/', $row[16], $matches);
        $numbers = $matches[1];
        $newString1 = implode(',', $numbers);
        preg_match_all('/\((\d+)\)/', $row[17], $matches1);
        $numbers1 = $matches1[1];
        $newString2 = implode(',', $numbers1);
        preg_match_all('/\((\d+)\)/', $row[18], $matches2);
        $numbers2 = $matches2[1];
        $newString3 = implode(',', $numbers2);

        return new ModuleManageStudents([
            'id_district'                           => Auth::guard('user')->user()->id_district,
            'name'                                  => $row[0],
            'date_of_birth'                         => $row[1],
            'numberphone'                           => $row[2],
            'email'                                 => $row[3],
            'identification_id_card'                => $row[4],
            'date_of_issue'                         => $row[5],
            'department_of_issue'                   => $row[6],
            'permanent_residence'                   => $row[7],
            'place_of_live'                         => $row[8],
            'id_ethnic'                             => $row[9],
            'region'                                => $row[10],
            'gender'                                => $row[11] == "Nam" ? "nam" : "nu",
            'status'                                => '2',
            'type_1'                                => $newString1,
            'type_2'                                => $newString2,
            'type_3'                                => $newString3,
            'id_training_specialty'                 => $this->id_training_specialty,
            'id_course'                             => $this->id_course
        ]);
    }
}