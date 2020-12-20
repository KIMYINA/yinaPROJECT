<%@page import="com.cpn.member.model.MemberVO"%>
<%@page import="com.cpn.member.model.MemberService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memVo" class="com.cpn.member.model.MemberVO" 
scope="page"></jsp:useBean>
<jsp:useBean id="memService" class="com.cpn.member.model.MemberService"	
scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 OK</title>
</head>
<body>
<%
	//login.jsp에서 [로그인]클릭해서 post로 이동
	request.setCharacterEncoding("utf-8");

	String memid = request.getParameter("memid");
	String memPwd= request.getParameter("memPwd");
	String chkSave= request.getParameter("chkSave");
	
	//DB작업
	String msg="로그인처리 실패", url="/login/login.jsp";
					//메세지jsp에있으니까 ->ContextPath제외하고 작성
	try{
		int result = memService.loginCheck(memid, memPwd);
		
		//결과msg
		if(result==MemberService.LOGIN_OK){	//성공한 경우
			//1) 로그인 정보 세션에 저장 -> 필수★	
			
			//selectMember해서 정보 불러온 후 
			memVo = memService.selectMember(memid);
			
			
			/*
				세션에 꼭 저장할 것들 
				1. 회원번호 memNo
				2. 아이디 memid
				3. 비번	memPwd
				4. 이름	memName
				5. 이메일	memEmail
				6. 권한번호 rigNo
			
			*/
			//vo에서 필요한정보만 get하고
			int memNo = memVo.getMemNo();
			//아이디는 memid
			//비번은 memPwd
			String memName = memVo.getMemName();
			String memEmail = memVo.getMemEmail();
			int rigNo = memVo.getRigNo();
			

			// 입력받아서 가져온 아이디, 비번 setAttribute하기
			session.setAttribute("memid", memid);
			session.setAttribute("memPwd", memPwd);
			
			//아이디비번으로 vo에서 get해온 정보를 setAttribute하기
			session.setAttribute("memName", memName);
			session.setAttribute("memEmail", memEmail);
			session.setAttribute("rigNo", rigNo);
			
			
				//1-1)사용자 이름 읽어다가 세션에 같이 저장해도 됨 -> DB에서 한번 더 읽어오면됨
			//MemberVO vo = memService.selectMember(memid);
			//session.setAttribute("userName", vo.getMemName());

				//아이디저장 체크에 : value=""없을 때 체크하면 -> on이 넘어오고
				//아이디저장 체크에 : value=""없을 때 체크 안하면 -> null이 넘어오고

			//2) [아이디저장 체크한경우만] 쿠키에 저장

				Cookie ck = new Cookie("ck_memid",memid);
				ck.setPath("/");	
			
			if(chkSave != null ){	//체크한 경우
				ck.setMaxAge(1000*24*60*60);												
				response.addCookie(ck);
				
			}else{	//체크안한경우
				ck.setMaxAge(0);	//쿠키삭제
				response.addCookie(ck);
				
			}
			msg = memVo.getMemName() +"님 로그인되었습니다";
			url="/index.jsp";
			
		}else if(result==MemberService.PWD_DISAGREE){
			msg=" 비번 불일치";
		}else if(result==MemberService.ID_NONE){
			msg=" 아이디없음";
			
		}
		
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>

<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>