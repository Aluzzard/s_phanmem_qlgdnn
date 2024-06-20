@extends('mainstructure.layouts.admins.layout')
@section('title','Báo cáo số liệu tuyển sinh, đào tạo, giải quyết việc làm sau đào tạo')

@section('css')
<style>
    .modal-body {
        font-family: 'Times New Roman', Times, serif;
    }
    .underline {
        display: inline-block;
        border-bottom: 1px solid #000;
        width: 100px;
        margin-top: 10px; /* Thêm khoảng cách nếu cần */
    }
    table {
        margin-top: 30px;
        width: 100%;
    }
    table th, table td {
        text-align: center;
        border: 1px solid;
    }
</style>
<!-- chosen CSS
    ============================================ -->
<link rel="stylesheet" href="{{ asset('assets/administration/mainstructure/css/select2/select2.min.css') }}">
@endsection

@section('content')
<div class="card">
    <div class="container-fluid">
        <h4>Mẫu văn bản</h4>
        <form id="form-filter" class="text-left">
            @include('modules.AIPrintDocuments.global.select-choose-statistics')
            <div class="row" id="filterContainer">
                <div class="col-md-12">
                </div>
            </div>
            <div class="row" id="id_div_filter" style="display: none;">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-success" data-action="choosen">
                        <i class="fa fa-eye pr-2"></i>Chọn
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="id_div_ckeditor" class="card" style="display: none;">
    <div class="admin-dashone-data-table-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <button type="button" class="btn btn-warning" id="btn_preview" data-action="preview" data-toggle="modal" data-target="#previewModal">
                        <i class="fa fa-file-text-o pr-2"></i>Xem trước</button>
                </div>
                <div class="col-lg-12">
                    <textarea id="id_textarea_content">
                    </textarea>
                </div>
            </div>
        </div>
    </div>
    <!-- Data table area End-->
</div>
@endsection

@section('modal')
@include('modules.AIPrintDocuments.global.modal')

@endsection
@section('javascript')
<!-- chosen JS
    ============================================ -->
<script src="{{ asset('assets/administration/mainstructure/js/select2/select2.full.min.js') }}"></script>
<script src="{{ asset('assets/administration/mainstructure/js/select2/select2-active.js') }}"></script>
@include('modules.AIPrintDocuments.global.javascripts')
@include('modules.AIPrintDocuments.type_1.javascripts')

@endsection