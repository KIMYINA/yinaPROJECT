package com.cpn.member.model;

import java.sql.SQLException;
import java.util.List;



//DAO - DB작업 로직만을 담는 클래스
//jsp > DAO > DB : 이전까지 했던 프로세스


//Service - DB작업 이외의 로직을 담는 클래스
//jsp > Service > DAO > DB : 이제부터 할 프로세스 (레이어가 하나 더 생기는거임)
// -> DAO와 관련된 로직은 멀스로준다고? 뭐래 발음 ㅅㅂ

public class MemberService {
	//아이디 중복확인시 사용하는 상수
	public static final int EXIST_ID=1;  //아이디가 이미 존재하는 경우
	public static final int NON_EXIST_ID=2; //존재하지 않는 경우
	
	
	//로그인처리시 사용하는 상수
	public static final int LOGIN_OK = 1;  	//로그인성공
	public static final int ID_NONE = 2;  	//아이디 없음
	public static final int PWD_DISAGREE = 2; //비번불일치
	
	
	
	//DAO메서드를 여기서 대신 호출하기 위해 -> DAO객체 필요
	private MemberDAO memberDao;
	
	//Zipcode클래스의 메서드를 여기서 대신 호출하기 위해 -> zipcode객체 필요
	//private ZipcodeDAO zipcodeDao;
	
	//생성자에서 객체 생성
	public MemberService() {
		memberDao = new  MemberDAO();
		//zipcodeDao = new ZipcodeDAO();
	}


	
	//DAO메서드를 Service가 중간다리로서 호출해주는 것
	public int insertMember(MemberVO vo) throws SQLException{
		int cnt = memberDao.insertMember(vo);
		return cnt;
	} 
	
	public int checkDup(String userid) throws SQLException {
		int cnt = memberDao.checkDup(userid);
		return cnt;
	}

	
	public int loginCheck(String userid, String pwd) throws SQLException{
		return memberDao.loginCheck(userid, pwd);
	}
	
	
	public MemberVO selectMember(String userid) throws SQLException {
		return memberDao.selectMember(userid);
	}
	
	
	public int updateMember(MemberVO vo) throws SQLException { 
		  return  memberDao.updateMember(vo); 
	}
	 
	
	
	
	public int withdrawMember(String userid) throws SQLException{
		return memberDao.withdrawMember(userid);
	}
	

	//zipcodeDAO
	/*
	 * public List<ZipcodeVO> selectZipcode(String dong) throws SQLException{ return
	 * zipcodeDao.selectZipcode(dong);
	 * 
	 * }
	 */
	//------------->이렇게 해놓소 추가적인 로직(메서드)이 필요하면 여기다 작성, 
	//				jsp에서는 직접 DAO를 호출하지 않고 무조건 Service만 호출
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//Service
