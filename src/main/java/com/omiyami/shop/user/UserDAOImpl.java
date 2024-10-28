package com.omiyami.shop.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//로그인
	@Override
	public UserVO getUserForLogin(String username, String password) {
		UserVO vo = new UserVO();
		vo.setUsername(username);
		vo.setPassword(password);
		return sqlSession.selectOne("UserMapper.getUserForLogin", vo);
	}

	//헤더이름출력
	@Override
	public UserVO getUserById(String username) {
		return sqlSession.selectOne("UserMapper.getUserById", username);
	}


	//회원가입	
	@Override
	public void signup(UserVO vo) throws Exception{
		sqlSession.insert("UserMapper.signup",vo);
	}
	
	//아이디찾기
	@Override
	public String findId(UserVO vo) {
		return sqlSession.selectOne("UserMapper.findId", vo);
	}
	
	//비밀번호찾기
	@Override
	public String findPw(UserVO vo) {
		return sqlSession.selectOne("UserMapper.findPw", vo);
	}
	
	//비밀번호재설정
	@Override
	public void updatePw(UserVO vo) {
	   sqlSession.update("UserMapper.updatePw", vo);  // 변경된 행 수 반환
	}

	//회원정보수정
	@Override
	public UserVO getUserInfo(String username) {
		return sqlSession.selectOne("UserMapper.getUserInfo", username);
	}

	//회원정보수정실행
	@Override
	public void updateInfo(UserVO vo) {
		sqlSession.update("UserMapper.updateInfo", vo);
	}

	//회원탈퇴
	@Override
	public String deleteCheckPassword(String username) {
		return sqlSession.selectOne("UserMapper.deleteCheckPassword", username);
	}

	//회원탈퇴실행
	@Override
	public void deleteUser(UserVO vo) {
		sqlSession.update("UserMapper.deleteUser", vo);
	}
	
}
