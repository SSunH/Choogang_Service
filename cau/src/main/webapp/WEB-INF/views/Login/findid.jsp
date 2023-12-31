<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<script
  src="https://code.jquery.com/jquery-3.6.4.js"
  integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
  crossorigin="anonymous"></script>
<html>

<head>
<meta charset="UTF-8">
<title>user</title>
<link rel="stylesheet" type="text/css" href="/css/IdFind.css">

<style>
 .warning {
    color: red;
margin: auto;
  }

</style>
</head>





	
	<body>
	  <div class="session">
	    <div class="left">
	      <?xml version="1.0" encoding="UTF-8"?>
	      <svg enable-background="new 0 0 300 302.5" version="1.1" viewBox="0 0 300 302.5" xml:space="preserve" xmlns="http://www.w3.org/2000/svg">
	<style type="text/css">
		.st0{fill:#fff;}
	</style>
	</svg>      
	    </div>
	    <form action="/findid" method="post" class="log-in" autocomplete="off" onsubmit="return fnSubmit();"> 
	      <h4><span>Cau</span>아이디 찾는 공간입니다.</h4>
	      <p>본인 성명과 핸드폰 번호를 입력해주세요.</p>
	      <div class="floating-label">
	        <input placeholder="이름" type="text" name="KORN_FLNM" id="KORN_FLNM_ID" autocomplete="off" class="aim">
	        <label for="email">이름</label>
	      </div>
	      <div class="floating-label">
	        <input placeholder="핸드폰번호" type="text" name="TELNO" id="TELNO_ID" autocomplete="off" class="aim">
	        <label for="password">핸드폰번호</label>
	      </div>
	      <div><input type="submit" name="idfindbtn" class="button" value="찾기" class="aim" id="submitBtn" onclick="openFindResultModal('${USER_ID}')"></div>
	          <a onclick="openFindPassModal()" class="discrete" >비밀번호 찾기</a>
	      
	    </form>
	  </div>
	  
	<script>
	
	$(document).ready(function() {
		
    $("#submitBtn").on("click", function() {
        var KORN_FLNM = $("input[name='KORN_FLNM']").val();
        var TELNO = $("input[name='TELNO']").val();
        
      
        
        $.ajax({
            url: "/findid",
            type: "POST",
            data: {
                KORN_FLNM: KORN_FLNM,
                TELNO: TELNO
            },
            success: function(data) {
                var findResultModal = document.getElementById("myFindResultModal");
                if (findResultModal) {
                    findResultModal.style.display = "block";
                }
                $("#myFindResultModal").find(".modal-body").html(data);
            },
            error: function(xhr, status, error) {
                alert("에러가 발생하였습니다.");
            }
        });
        return false;
    });
});


</script>
	  
	</body>
	
		
</body>
</html>