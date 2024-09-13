package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	private SqlSessionFactory sqlSessionFactory;
	
	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	public boolean isExistId(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();	//생성
		boolean exist = false;
		String isExist = null;
		isExist = sqlSession.selectOne("memberSQL.isExistId", id);
		if(isExist != null) exist = true;
		sqlSession.close();
		return exist;
	}
	
	public boolean writeMember(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		boolean check = false;
		int su = sqlSession.insert("memberSQL.writeMember", memberDTO);
		sqlSession.commit();
		sqlSession.close();
		if(su > 0) check = true;
		return check;
	}
	
	public MemberDTO loginMember(String id, String pwd) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = new MemberDTO();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		memberDTO = sqlSession.selectOne("memberSQL.loginMember", map);
		sqlSession.close();
		return memberDTO;
	}
	
	public boolean updateMember(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		boolean check = false;
		int su = sqlSession.update("memberSQL.updateMember", memberDTO);
		sqlSession.commit();
		sqlSession.close();
		if (su > 0) check = true;
		return check;
	}
	
}
