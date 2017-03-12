[#ftl/]
[@b.head/]
[@b.toolbar title="开关维护详细信息"]
    bar.addItem("${b.text("action.edit")}","bg.Go('config!edit.action','otherExamSignUpConfigList');");
    bar.addBack("${b.text("action.back")}");
[/@]
[#assign labInfo]${b.text("ui.building.info")}[/#assign]
<table class="infoTable" width="100%" >
     <tr>
          <td class="title" width="15%">考试类型</td>
        <td class="content" width="35%">${(otherExamSignUpConfig.category.name)!}</td>
          <td class="title" width="15%">是否开放</td>
          <td class="content" width="35%">${otherExamSignUpConfig.opened?string("是","否")}</td>
     </tr>
     <tr>
          <td class="title" width="15%">学期</td>
          <td class="content" width="85%" colspan='3'>${otherExamSignUpConfig.semester.schoolYear}-${(otherExamSignUpConfig.semester.name)!}</td>
     </tr>
     <tr>
          <td class="title">开关代码</td>
        <td class="content">${(otherExamSignUpConfig.code)!}</td>
          <td class="title">开关名称</td>
          <td class="content">${(otherExamSignUpConfig.name)!}</td>
    </tr>
     <tr>
          <td class="title">开始日期</td>
          <td class="content">${(otherExamSignUpConfig.beginAt?string("yyyy-MM-dd HH:mm"))?if_exists}</td>
          <td class="title">结束日期</td>
          <td class="content">${(otherExamSignUpConfig.endAt?string("yyyy-MM-dd HH:mm"))?if_exists}</td>
     </tr>
     <tr>
          <td class="title" width="15%">承诺书</td> 
          <td class="content" width="85%" colspan="3"><pre>${otherExamSignUpConfig.notice?default("")}</pre></td>
     </tr>
     <tr>
          <td class="title" width="15%">报名冲突科目</td>
          <td class="content" colspan="3" width="85%">[#list (otherExamSignUpConfig.exclusiveSubjects)! as exclusiveSubject]${(exclusiveSubject.subjectOne.name)!}--${(exclusiveSubject.subjectTwo.name)!}<br>[/#list]</td>
     </tr>
     <tr>
          <td class="title" width="15%">考试校区</td> 
          <td class="content" colspan="3" width="85%">
          [#if otherExamSignUpConfig.campuses?exists]
              [#list otherExamSignUpConfig.campuses as ampus]${(ampus.name)!}&nbsp;[/#list]
          [/#if]
          </td>
     </tr>
     <tr>
          <td class="title" width="15%">备注</td>
          <td class="content" colspan="3" width="85%">${(otherExamSignUpConfig.remark?html)!}</td>
     </tr>
</table>
[@b.grid items=otherExamSignUpConfig.settings var="setting" sortable="false"]
    [@b.form name="otherExamSignUpConfigInfoForm" action="!search"]
        [@b.row]
            [@b.col property="subject.name" title="报名科目"/]
            [@b.col property="subject.code" title="科目代码"/]
            [@b.col property="feeOfSignUp" title="要求报名费"/]
            [@b.col property="feeOfMaterial" title="要求材料费"/]
            [@b.col property="feeOfOutline" title="要求考纲费"/]
            [@b.col property="maxStd" title="最大学生数"/]
            [@b.col property="grade" title="年级"/]
            [@b.col property="superSubject.name" title="必须通过的科目(条件)"/]
            [@b.col property="config.campuses.name" title="考试地点"]
               [#if setting.config.campuses?exists]
                  [#list setting.config.campuses as ampus]${(ampus.name)!}&nbsp;[/#list]
                 [/#if]
            [/@]
        [/@]
    [/@]
[/@]
[@b.foot/]