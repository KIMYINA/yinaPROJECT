<%@page import="com.cpn.member.model.MemberVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../login/login_check.jsp" %>
<%-- <jsp:useBean id="memVo" class="com.mystudy.member.model.MemberVO" 
										scope="session"></jsp:useBean> --%>
<jsp:useBean id="memService" class="com.cpn.member.model.MemberService"
	scope="session"></jsp:useBean>										
										
<%
	/* userid세션에서 읽어오기 */
	String memid=(String)session.getAttribute("memid");	//로그인할 때 입력받는 값으로 set해둔 key값
	String memName=(String)session.getAttribute("memName");	//로그인할 때 입력받는 값으로 set해둔 key값
	String memEmail =(String)session.getAttribute("memEmail");	//로그인할 때 입력받는 값으로 set해둔 key값
	
	MemberVO vo = null;
	try{
		vo = memService.selectMember(memid);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String memAddress = vo.getMemAddress();
	//"null"들어가니까  null체크
	if(memAddress==null) memAddress="";
	
	//전화번호, 이메일 split	
	String hp = vo.getMemTel();
	
	String hp1="", hp2="", hp3=""; 
	String email1="", email2="", email3="";
	
	if(hp != null && !hp.isEmpty()){	//010-1000-1000
		String[] hpArr = hp.split("-");
		hp1 = hpArr[0];
		hp2 = hpArr[1];
		hp3 = hpArr[2];
	}

	
	String[] emailList = {"naver.com","hanmail.net","nate.com","gmail.com",};
	
	boolean isEtc = false; //직접입력아닌경우 false
	int count=0; 
	
	if(memEmail != null && !memEmail.isEmpty()){	// emailid@naver.com , 직접입력 / 있는거선택
		String[] emailArr = memEmail.split("@");
		email1 = emailArr[0];	//이메일아이디부분
		email2 = emailArr[1];	//이메일 도메인부분
		
		//emailList안에 없으면 'etc'인것 
		for(int i=0; i<emailList.length;i++  ){
			String s_email = emailList[i];
			if(email2.equals(emailList[i])){
				count++;	//있으면 ++하고 빠짐
				break;
			}
		}//for
		
		//count가 
		if(count==0){	//++안된경우는 
			isEtc = true;	//직접입력값인경우
		}
	}
	
	
%>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
	$(function(){
		$('#wr_submit').click(function(){
					
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}else if(!validate_phone($('#hp2').val()) ||
					!validate_phone($('#hp3').val())){
				alert('전화번호는 숫자만 가능합니다.');
				$('#hp2').focus();
				event.preventDefault();		
			}
		
		});
		
		
	});//1212js지움

	
	function validate_phone(tel){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
		/*
			0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
			닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복
		*/
	}
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
<div class="divForm">
<form name="frm1" method="post" action="memberEdit_ok.jsp">
<fieldset>
	<legend>회원 정보수정</legend>
	<!--  
		수정할때는 이름이랑 아이디는 수정안되게 span으로 바꾸고 ,
		비번은 빈칸 , 
		나머지정보는 수정되게 value 셋팅
	-->
	
	<!--  
		userid세션에서 읽어오고 
		핸드폰이메일 제외한 나머지 넣기
		
	-->
    <div>        
        <span class="sp1">성명</span>
        <span><%=memName%></span>
    </div>
    <div>
        <span class="sp1">회원ID</span>
        <span><%=memid%></span><!-- userid세션에서 읽어오고 -->
    </div>


    <div>
        <label for="pwd">비밀번호</label>
        <input type="Password" name="memPwd" id="pwd">
    </div>

    <div>
        <label for="address">주소</label>
  
        <br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="memAddress" title="주소"  class="width_350"
        value="<%=memAddress%>"><br />
        <span class="sp1">&nbsp;</span>
  
    </div>
    <div>
        <label for="hp1">핸드폰</label>&nbsp;
        <select name="hp1" id="hp1" title="휴대폰 앞자리">
            <option value="010"
            	<%if(hp1.equals("010")){ %>
            		selected=""
            	<%} %>
            	>010</option>
            <option value="011"
            	<%if(hp1.equals("011")){ %>
            		selected="selected"
            	<%} %>>011</option>
            <option value="016"
            	<%if(hp1.equals("016")){ %>
            		selected="selected"
            	<%} %>
            >016</option>
            <option value="017"
            	<%if(hp1.equals("017")){ %>
            		selected="selected"
            	<%} %>
            >017</option>
            <option value="018"
            	<%if(hp1.equals("018")){ %>
            		selected="selected"
            	<%} %>
            >018</option>
            <option value="019"
            	<%if(hp1.equals("019")){ %>
            		selected="selected"
            	<%} %>
            >019</option>
       	</select>
        -
        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
        	class="width_80" value="<%=hp2 %>">-
        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
        	class="width_80" value="<%=hp3 %>">
    </div>
    <div>
        <label for="email1">이메일 주소</label>
        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리"
        value="<%=email1%>">@
        <!-- if사용 -->
        <select name="email2" id="email2"  title="이메일주소 뒷자리">
            <option value="naver.com"
            	<%if(email2.equals("naver.com")){ %>
            		selected="selected"
            	<%} %>
            >naver.com</option>
            <option value="hanmail.net"
            	<%if(email2.equals("hanmail.net")){ %>
            		selected="selected"
            	<%} %>
            >hanmail.net</option>
            <option value="nate.com"
               <%if(email2.equals("nate.com")){ %>
            		selected="selected"
            	<%} %>
            >nate.com</option>
            <option value="gmail.com"
               <%if(email2.equals("gmail.com")){ %>
            		selected="selected"
            	<%} %>
            >gmail.com</option>
            <option value="etc"
               <%if(isEtc){ %>
            		selected="selected"
            	<%} %>
            >직접입력</option>
        </select>
        
        <input type="text" name="email3" id="email3" 
        title="직접입력인 경우 이메일주소 뒷자리"
                <%if(isEtc){ %>
					style="visibility:visible;"
					value="<%=email2 %>"
            	<%}else{ %>
					style="visibility:hidden"
            	<%}%>
        	>
    </div>
    <div class="center">
         <input type="submit" id="wr_submit" value="수정">
    </div>
</fieldset>
        
</form>
</div>
</article>

<%@ include file="../inc/bottom.jsp"%>









