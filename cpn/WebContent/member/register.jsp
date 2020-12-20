<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- top 인클루드 -->
 <%@ include file="../inc/top.jsp"%>
<!--   <link href="../inc/css/styles.css" rel="stylesheet" /> -->
  
  <!-- 기본제이쿼리라이브러리 -->
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
  <!-- 아이디중복확인 / 유효성검사 js-->
<script type="text/javascript" src="../js/member.js"></script>
  <!-- top메뉴 간격 css-->
<link href="../css/top.css" rel="stylesheet" />
  
  
  
<script type="text/javascript">
	$(function(){
		$('#wr_submit').click(function(){
			if($('#memName').val().length<1){
				alert('이름을 입력하세요');
				$('#memName').focus();
				event.preventDefault();

			}else if(!validate_userid($('#memid').val())){
				alert('아이디는 영문,숫자,_만 가능합니다.');
				$('#memid').focus();
				event.preventDefault();				
			}else if($('#memPwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#memPwd').focus();
				event.preventDefault();
			}else if($('#memPwd').val()!=$('#memPwd2').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#memPwd2').focus();
				event.preventDefault();
			}else if(!validate_phone($('#hp2').val()) ||
					!validate_phone($('#hp3').val())){
				alert('전화번호는 숫자만 가능합니다.');
				$('#hp2').focus();
				event.preventDefault();				
			}else if($('#chkId').val() !='Y'){
				alert('아이디 중복확인하세요');
				$('#btnChkId').focus();
				event.preventDefault();
			}
		});
		
	});
	

</script>

<style type="text/css">
	.width_80{
		width:80px;
	}
	.width_350{
		width:350px;
	}	
	
	

</style>


<article>


<div class="topBox"></div>

<div class="divForm"  style="margin:30px;text-align:left ">
<form name="frm1" method="post" action="register_ok.jsp">
<fieldset>
	<legend>쿠퐁퐁 회원 가입</legend>
    <div>        
        <label for="memName">이름</label>
        <input type="text" name="memName" id="memName" style="ime-mode:active">
    </div>
    <div>
        <label for="memid">회원ID</label>
        <input type="text" name="memid" id="memid"
        		style="ime-mode:inactive">&nbsp;
        <input type="button" value="중복확인" id="btnChkId" title="새창열림">
    </div>
    <div>
        <label for="memPwd">비밀번호</label>
        <input type="Password" name="memPwd" id="memPwd">
    </div>
    <div>
        <label for="memPwd2">비밀번호 확인</label>
        <input type="Password" name="memPwd2" id="memPwd2">
    </div>

    <div>
        <label for="memAddress">주소</label>
        <input type="text" name="memAddress" title="주소"  class="width_350"><br />
        <span class="sp1">&nbsp;</span>
    </div>

    <div>
        <label for="hp1">핸드폰</label>&nbsp;
        <select name="hp1" id="hp1" title="휴대폰 앞자리">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
       	</select>
        -
        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
        	class="width_80">-
        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
        	class="width_80">
    </div>
    
    
    <div>
        <label for="email1">이메일</label>
        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리">@
        <select name="email2" id="email2"  title="이메일주소 뒷자리">
            <option value="naver.com">naver.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="nate.com">nate.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="etc">직접입력</option>        
		</select>
        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        	style="visibility:hidden">
    </div>

    <div class="center" style="margin:30px; text-align:center">
         <input type="submit" id="wr_submit" value="회원가입">
    </div>
</fieldset>
 
     <input type ="text" name="chkId" id="chkId">  
        
</form>
</div>

</article>


<%@ include file="../inc/bottom.jsp"%>
