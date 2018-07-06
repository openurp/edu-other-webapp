[#ftl]
[@b.head/]
[@b.toolbar title="校外考试"]
    bar.addItem("报名","signup(document.stdExamSignupForm)");

    function signup(form){
        bg.form.submit(form);
    }
[/@]
[@b.form name="stdExamSignupForm" action="!configList"]
    [@b.div style="margin-top:10px;text-align:center;font-weight:bold;"]校外考试报名记录[/@]
    [@b.grid items=signups var="signup" ]
        [@b.row]
            [@b.col title="报名科目"]${(signup.subject.name)!}[/@]
            [@b.col title="报名费"][#if (signup.feeOfSignup)??]#{signup.feeOfSignup;m2M2}[/#if][/@]
            [@b.col title="考纲费"][#if (signup.feeOfOutline)??]#{signup.feeOfOutline;m2M2}[/#if][/@]
            [@b.col title="材料费"][#if (signup.feeOfMaterial)??]#{signup.feeOfMaterial;m2M2}[/#if][/@]
            [@b.col title="报名时间"]${(signup.signupAt?string("yyyy-MM-dd HH:mm:ss"))?if_exists}[/@]
            [@b.col title="考试校区"]${(signup.campus.name)!}[/@]
        [/@]
    [/@]
    [@b.div style="margin-top:10px;text-align:center;font-weight:bold;"]校外考试成绩[/@]
    [@b.grid items=grades var="examGrade"]
        [@b.row]
            [@b.col title="科目名称"]${(examGrade.subject.name)!}[/@]
            [@b.col title="成绩"]${(examGrade.score)!}[/@]
            [@b.col title="是否通过"]${(examGrade.passed?string("通过","不通过"))!}[/@]
            [@b.col title="common.semester"]${examGrade.semester.schoolYear}学年${examGrade.semester.name}学期[/@]
        [/@]
    [/@]
[/@]
[@b.foot/]
