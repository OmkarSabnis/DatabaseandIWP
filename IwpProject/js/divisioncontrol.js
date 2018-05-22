function logout()
{
    window.location.href="index.html";
}

function loadmyinfo(){
    $('#maincontent').load('info.php');
}

function loadmycal(){
    $('#maincontent').load('cal.php');
}

function loadteacherinfo(){
    $('#mainteachercontent').load('teacherinfo.php');
}

function loadteachercal(){
    $('#mainteachercontent').load('teachercal.php');
}

function loadcourse(username_js,course_id_js,course_name_js,course_credit_js, course_slot_js, course_type_js){
    $.post('course.php',{userid:username_js, courseid:course_id_js, coursename: course_name_js,coursecredit: course_credit_js, courseslot: course_slot_js, coursetype:course_type_js},
        function(data){
            $('#maincontent').html(data);
        });
}

function loadteachercourse(username_js,course_id_js,course_name_js,course_credit_js, course_slot_js, course_type_js){
    $.post('courseTeacher.php',{userid:username_js, courseid:course_id_js, coursename: course_name_js,coursecredit: course_credit_js, courseslot: course_slot_js, coursetype:course_type_js},
        function(data){
            $('#mainteachercontent').html(data);
        });
}

function loadproject(course_slot_js,course_credit_js,course_type_js,course_name_js,assignment_id_js, student_id_js, course_id_js)
{
    $.post('projectmanagement.php',{courseslot:course_slot_js, coursecredit:course_credit_js, coursetype:course_type_js, coursename: course_name_js ,assignmentid:assignment_id_js, courseid:course_id_js, userid: student_id_js},
        function(data){
            $('#maincontent').html(data);
        });
}

function loadtheory(course_slot_js,course_credit_js,course_type_js,course_name_js,assignment_id_js, student_id_js, course_id_js)
{
    $.post('theorymanagement.php',{courseslot:course_slot_js, coursecredit:course_credit_js, coursetype:course_type_js, coursename: course_name_js ,assignmentid:assignment_id_js, courseid:course_id_js, userid: student_id_js},
        function(data){
            $('#maincontent').html(data);
        });
}

function loadlab(course_slot_js,course_credit_js,course_type_js,course_name_js,assignment_id_js, student_id_js, course_id_js)
{
    $.post('labmanagement.php',{courseslot:course_slot_js, coursecredit:course_credit_js, coursetype:course_type_js, coursename: course_name_js ,assignmentid:assignment_id_js, courseid:course_id_js, userid: student_id_js},
        function(data){
            $('#maincontent').html(data);
        });
}

function loaddownload(questionpath_js)
{
    $.post('download.php',{questionpath: questionpath_js},
        function(data){
            $('#maincontent').html(data);
        });
}

function loadStudentInfo(student_id,course_id)
{
    $.post('studentFromTeacherInfo.php',{studentid:student_id,courseid:course_id},
        function(data){
            $('#mainteachercontent').html(data);
        });
}

function loadReviewChanger(student_id,course_id,review_no)
{
    $.post('reviewManagement.php',{studentid:student_id,courseid:course_id,reviewno:review_no},
        function(data){
            $('#mainteachercontent').html(data);
        });
}