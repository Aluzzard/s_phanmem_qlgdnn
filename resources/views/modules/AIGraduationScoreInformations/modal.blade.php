<div id="actionModal" class="modal fade" role="dialog">
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-title"></h4>
            </div>
            <div class="modal-body">
                <form id="form-action" enctype="multipart/form-data">
                    <input type="hidden" name="id" class="form-control">
                    <input type="hidden" name="action_type" class="form-control">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Điểm môn 1 </label>
                        <div class="col-sm-4">
                            <input type="number" name="subject_1" class="form-control">
                        </div>
                        <label class="col-sm-2 col-form-label">Điểm môn 2 </label>
                        <div class="col-sm-4">
                            <input type="number" name="subject_2" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Điểm môn 3 </label>
                        <div class="col-sm-4">
                            <input type="number" name="subject_3" class="form-control">
                        </div>
                        <label class="col-sm-2 col-form-label">Điểm môn 4 </label>
                        <div class="col-sm-4">
                            <input type="number" name="subject_4" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Điểm môn 5 </label>
                        <div class="col-sm-4">
                            <input type="number" name="subject_5" class="form-control">
                        </div>
                        <label class="col-sm-2 col-form-label">Điểm môn 6 </label>
                        <div class="col-sm-4">
                            <input type="number" name="subject_6" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Lý thuyết </label>
                        <div class="col-sm-4">
                            <input type="number" name="theory" class="form-control">
                        </div>
                        <label class="col-sm-2 col-form-label">Thực hành </label>
                        <div class="col-sm-4">
                            <input type="number" name="practice" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Điểm cuối kỳ </label>
                        <div class="col-sm-4">
                            <input type="number" name="final_score" class="form-control">
                        </div>
                        <label class="col-sm-2 col-form-label">Điểm trung bình </label>
                        <div class="col-sm-4">
                            <input type="number" name="average" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Xếp loại </label>
                        <div class="col-sm-4">
                            <input type="text" name="classification" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Ghi chú </label>
                        <div class="col-sm-10">
                            <textarea type="number" name="note" class="form-control" rows="3"></textarea>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Đóng</button>
                </form>
            </div>
        </div>
    </div>
</div>