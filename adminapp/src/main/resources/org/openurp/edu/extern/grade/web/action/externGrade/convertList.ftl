[#ftl]
[@b.head/]
  [@b.toolbar title = "<span style=\"color:blue\">" + externGrade.std.user.name + "（<span style=\"padding-left: 1px; padding-right: 1px\">" + externGrade.std.user.code + "</span>）于" + externGrade.acquiredOn?string("yyyy-MM-dd") +"获得“"+ externGrade.courseName + "”</span>课程及认定认定明细"]
    bar.addItem("返回", function() {
      bg.form.submit(document.searchForm);
    }, "backward.png");
  [/@]
  [@b.grid items=externGrade.grades?sort_by(["course", "code"]) var="courseGrade" sortable="false"]
    [@b.gridbar]
      bg.form.addInput(action.getForm(), "externGrade.id", "${externGrade.id}");
      bar.addItem("取消", action.single("undistribute", "确认要取消认定吗？"), "action-edit-delete");
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="课程代码" property="course.code"/]
      [@b.col title="课程名称" property="course.name"/]
      [@b.col title="课程类别" property="courseType.name"/]
      [@b.col title="学分" property="course.credits"/]
      [@b.col title="成绩" property="score"]${courseGrade.score?string("0.#")}${("（" + courseGrade.scoreText + "）")!}[/@]
      [@b.col title="绩点" property="gp"]${courseGrade.gp?string("0.#")}[/@]
      [@b.col title="修读类别" property="courseTakeType.name"/]
      [@b.col title="考核方式" property="examMode.name"/]
      [@b.col title="是否免听" property="freeListening"]${courseGrade.freeListening?string("是", "否")}[/@]
    [/@]
  [/@]

 [@b.toolbar title = "添加新的认定课程"]
    bar.addItem("认定", function() {
      var fillSize = 0;
      var planCourseIds = "";

      var form = document.externGradeDistributeForm;
      $(form).find("[name^=scoreText]").each(function() {
        if ($(this).val().trim().length) {
          planCourseIds += (planCourseIds.length > 0 ? "," : "") + $(this).prev().val();
        }
      });

      bg.form.addInput(form, "planCourseIds", planCourseIds);
      bg.form.submit(form, "${b.url("!convert")}");
    }, "action-new");
  [/@]
  [@b.form name="externGradeDistributeForm" action="!convert" target="externGrades"]
  <table class="gridtable">
    <thead class="gridhead">
      <tr>
        <th width="10%">课程代码</th>
        <th width="20%">课程名称</th>
        <th width="15%">课程类别</th>
        <th width="50px">学分</th>
        <th width="150px">成绩记录方式</th>
        <th width="150px">成绩(分数)</th>
        <th>修读类别</th>
        <th>考核方式</th>
        <th>是否免听</th>
      </tr>
    </thead>
    <tbody><input type="hidden" name="externGrade.id" value="${externGrade.id}"/>
      [#list planCourses?sort_by(["course","name"]) as planCourse]
      <tr class="${(0 == planCourse_index % 2)?string("griddata-even", "griddata-odd")}">
        <td>${planCourse.course.code}</td>
        <td>${planCourse.course.name}</td>
        <td>${planCourse.group.courseType.name}</td>
        <td>${planCourse.course.credits}</td>
        <td>
          <select name="gradingMode.id${planCourse.id}" style="width: 130px" onchange="displayScore(this.value,${planCourse.id})">
            [#list gradingModes as gradingMode]
            <option value="${gradingMode.id}"[#if 1 == gradingMode.id] selected[/#if]>${gradingMode.name}</option>
            [/#list]
          </select>
        </td>
        <td>
          <input type="hidden" name="planCourse.id${planCourse.id}" value="${planCourse.id}"/><input type="text" name="scoreText${planCourse.id}" value="" maxlength="5" style="width: 50px"/>
          <div id="score${planCourse.id}" style="display:none">
                          （<input type="text" name="score${planCourse.id}" value="" maxlength="10" style="width: 50px"/>）
          </div>
        </td>
        <td>正常</td>
        <td>${planCourse.course.examMode.name}</td>
        <td>是</td>
      </tr>
      [/#list]
    </tbody>
  </table>
  [/@]

  <script>
    var gradingModes={};
    [#list gradingModes as gradingMode]
      gradingModes['g${gradingMode.id}']=${gradingMode.numerical?string('1','0')}
    [/#list]
    function displayScore(gradingModeId,planCourseId){
      if(gradingModes['g'+gradingModeId]=='1'){
        document.getElementById('score'+planCourseId).style.display="none";
      }else{
        document.getElementById('score'+planCourseId).style.display="";
      }
    }
  </script>
[@b.foot/]
