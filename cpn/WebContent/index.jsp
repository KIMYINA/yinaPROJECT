<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>    
  <!-- 기본제이쿼리라이브러리 -->
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>

<h1>테스트용 index.jsp</h1>
<a href="<%=request.getContextPath()%>/member/memberEdit.jsp">회원수정</a>
<a href="<%=request.getContextPath()%>/member/memberOut.jsp">회원탈퇴</a>


<%@ include file="../inc/bottom.jsp"%>
