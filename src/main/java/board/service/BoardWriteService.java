package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setName(name);
		boardDTO.setId(id);
		boardDTO.setEmail((String)session.getAttribute("memberEmail"));
		boardDTO.setSubject(subject);
		boardDTO.setContent(content);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.writeBoard(boardDTO);
		//boolean check = boardDAO.writeBoard(boardDTO);
		
		//request.setAttribute("check", check);
		return "none";
	}

}
