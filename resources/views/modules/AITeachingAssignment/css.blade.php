<style>
  #external-events {
    position: absolute;
    left: 20px;
    top: 0;
    width: 150px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
    text-align: left;
  }

  #external-events h4 {
    font-size: 16px;
    margin-top: 0;
    padding-top: 1em;
  }

  #external-events .fc-event {
    margin: 3px 0;
    cursor: move;
  }

  #external-events p {
    margin: 1.5em 0;
    font-size: 11px;
    color: #666;
  }

  #external-events p input {
    margin: 0;
    vertical-align: middle;
  }

  #calendar-wrap {
    margin-left: 200px;
    min-height: 500px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>

<style type="text/css">
.left-panel {
    overflow: auto;
    box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
    padding: 20px 10px;
}
.jstree-specialty .jstree-anchor {
    color: #393939; /* Màu cho chuyên ngành đào tạo */
}
.jstree-year .jstree-anchor {
    color: #00b907; /* Màu cho năm */
}
.jstree-course .jstree-anchor {
    color: #2196f3; /* Màu cho khóa học */
}
.jstree-anchor .jstree-icon {
    background-size: contain !important;
    background-position: center center;
    background-repeat: no-repeat;
    width: 16px;
    height: 16px;
}
.jstree-specialty .jstree-clicked,
.jstree-year .jstree-clicked {
    background: none !important;
    box-shadow: none !important;
}
.jstree-course .jstree-clicked {
    background: #ffe0de !important; /* Màu nền khi khóa học được chọn */
}
</style>