<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 탈퇴도 로그인된경우에만 되야하니까 -->
<%@ include file="../login/login_check.jsp" %>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript">
   $(function(){
      $('#pwd').focus();
      
      $('.simpleForm form[name=frmOut]').submit(function(){
         if($('#pwd').val().length<1){
            alert('비밀번호를 입력하세요');
            $('#pwd').focus();
            event.preventDefault();
         }else{
            if(!confirm('탈퇴하시겠습니까?')){
               event.preventDefault();
               //return false;
            }
         }
      });
   });
</script>
</script>
<article class="simpleForm">
<form name="frmOut" method="post" action="memberOut_ok.jsp" >
	<fieldset> 
		<legend>회원 탈퇴</legend>
		<%
		String memid=(String)session.getAttribute("userid");
		
		%>
		<p class="p"><%=memid %>님 회원탈퇴하시겠습니까?</p>
		
		<div> 
		<label for="pwd" class="p">비밀번호</label>
		<input type="password" name="pwd" id="pwd">
		</div>
		
		<div class="align_center">
		<input type="submit" id="submit" value="회원탈퇴">
		<input type="reset" value="취소">
		</div>
	
	</fieldset>
</form>
</article>

<%@ include file="../inc/bottom.jsp"%>