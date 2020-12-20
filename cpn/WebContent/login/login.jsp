<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
  <!-- 기본제이쿼리라이브러리 -->
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
  <!-- 아이디중복확인 / 유효성검사 js-->
<script type="text/javascript" src="../js/member.js"></script>
  <!-- top메뉴 간격 css-->
<link href="../css/top.css" rel="stylesheet" />
  
<script type="text/javascript">
   $(function(){
      $('#userid').focus();
      
      $('form[name=frmLogin]').submit(function(){
         $('.infobox').each(function(idx, item){
            if($(this).val().length<1){
               alert($(this).prev().text()+"를 입력하세요");
               $(this).focus();
               event.preventDefault();
               return false;
            }            
         });
      });      
   });
</script>
<%
   //쿠키 읽어오기
   String ckValue="";
   Cookie[] ckArr=request.getCookies();
   if(ckArr!=null){
      for(int i=0; i<ckArr.length; i++){
         if(ckArr[i].getName().equals("ck_memid")){
            ckValue=ckArr[i].getValue();
            break;
         }
      }//for
   }
%>
<div class="topBox"></div>
<div style="width:100%; height: 600px;">
<article class="simpleForm">
   <form name="frmLogin" method="post" action="login_ok.jsp">
      <fieldset>
         <legend>로그인</legend>
         <div>
            <label for="memid" class="label">아이디</label>
            <input type="text" name="memid" id="userid"
                  class="infobox" value="<%=ckValue%>">
         </div>
         <div>
            <label for="memPwd" class="label">비밀번호</label>
            <input type="password" name="memPwd"
                  id="pwd" class="infobox">
         </div>
         <div class="align_center">
            <input type="submit" id="lg_submit" value="로그인">
            <input type="checkbox" name="chkSave"
            <%if(ckValue!=null && !ckValue.isEmpty()){%>
               checked="checked"
            <%}%>
            >
            <label for="chkSave">아이디 저장하기</label>
         </div>
      </fieldset>
   </form>
</article>
</div>
<%@ include file="../inc/bottom.jsp"%>