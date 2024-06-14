@extends('mainstructure.layouts.admins.layout')
@section('title','Báo cáo số liệu tuyển sinh, đào tạo, giải quyết việc làm sau đào tạo')

@section('css')
<style>
        .modal-content {
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
	    table th {
	    	text-align: center;
	    	border: 1px solid;
	    }
        @media print {
            @page {
                size: A4 landscape;
                margin: 0;
            }
            body * {
                visibility: hidden;
            }
            #modal-content-to-print, #modal-content-to-print * {
                visibility: visible;
            }
            #modal-content-to-print {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                padding: 10mm;
                box-sizing: border-box;
                background: white;
            }
            .underline {
	            display: inline-block;
	            border-bottom: 1px solid #000;
	            width: 100px;
	            margin-top: 10px; /* Thêm khoảng cách nếu cần */
	        }
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
            <div class="row">
                <label class="col-md-2">Chọn mẫu văn bản: </label>
                <div class="col-md-4">
                    @include('modules.AIPrintDocuments.global.select-choose-statistics')
                </div>
            </div>
            @if(request()->get('type') == 1)
            <div class="row">
                <div class="col-md-12">
                    @include('modules.AIPrintDocuments.type_1.filter')
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <button type="button" id="btn_filter" class="btn btn-success" data-action="choosen">
                        <i class="fa fa-eye pr-2"></i>Chọn</button>
                </div>
            </div>
            @endif
        </form>
    </div>
</div>
@isset($data)
<div class="card">
    <div class="admin-dashone-data-table-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <button type="button" class="btn btn-warning" id="btn_preview" data-action="preview" data-toggle="modal" data-target="#previewModal">
                        <i class="fa fa-file-text-o pr-2"></i>Xem trước</button>
                </div>
                <div class="col-lg-12">
                    <textarea id="id_textarea_content">
                        {{$data}}
                    </textarea>
                </div>
            </div>
        </div>
    </div>
    <!-- Data table area End-->
</div>
@endif
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