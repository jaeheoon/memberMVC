package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;


public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	private SqlSessionFactory sqlSessionFactory;
	
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public boolean writeBoard(BoardDTO boardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		boolean check = false;
		int su = sqlSession.insert("boardSQL.writeBoard", boardDTO);
		if (su > 0) check = true;
		sqlSession.commit();
		sqlSession.close();
		return check;
	}
	
	public List<BoardDTO> boardList(int startNum, int endNum) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		HashMap<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardList", map);
		sqlSession.close();
		return list;
	}
	
	public int getTotalNum() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int count = sqlSession.selectOne("boardSQL.getTotalNum");
		sqlSession.close();
		return count;
	}
}
