package com.omiyami.shop.user;

public interface UserDAO {

	//로그인
	UserVO getUserForLogin(String username, String password);
	UserVO getUserById(String username);
	

	//회원가입 	
	public void signup(UserVO vo) throws Exception;
	
	//아이디 찾기
	public String findId(UserVO vo);

	//비밀번호 찾기
	public  String findPw(UserVO vo);
	
	//비밀번호 재설정
	public void updatePw(UserVO vo);
	
	// 회원정보 수정
	public UserVO getUserInfo(String username);

	// 회원정보 재수정
	public void updateInfo(UserVO vo);

	// 회원탈퇴 정보
	public String deleteCheckPassword(String username);
	
	// 회원탈퇴 
	public void deleteUser(UserVO vo);
	
	
}
