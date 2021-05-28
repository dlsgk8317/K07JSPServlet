<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form_ex.jsp</title>
</head>
<body>
    <h4>폼1</h4>
    <script>
        function vali1(f){
            //3.입력상자에 입력된 값이 있는지 확인한다.
            if(f.user_id.value==""){
                alert("아이디 입력하세요");
                f.user_id.focus();
                //4.입력값이 없으면 리스너쪽으로 false를 반환한다. 1
                return false;
            }            
        }
    </script>
    <!-- 
        2.submit이벤트를 onsubmit이벤트리스너가 감지한 후 
        vali1() 함수를 호출한다. 
        5.false가 반환되면 전송이 중단된다. 
    -->
    <form name="frm1" action="http://naver.com" onsubmit="return vali1(this);">
        <input type="text" name="user_id">
        <!-- 1.아래 버튼은 누르는 순간 submit이벤트가 발생한다.  -->
        <input type="submit" value="전송1">
    </form>


    <h4>폼2</h4>
    <script>
        function vali2(f){
            if(f.user_id.value==""){
                alert("아이디를 입력하셈");
                f.user_id.focus();
                return;//해당 함수의 실행을 종료한다.
            }
            //submit이벤트가 없는 상태이므로 함수를 통해 전송한다. 
            f.submit();
        }
    </script>
    <form name="frm2" action="http://daum.net">
        <input type="text" name="user_id">
        <input type="button" value="전송2" onclick="vali2(this.form);">
    </form>




</body>
</html>