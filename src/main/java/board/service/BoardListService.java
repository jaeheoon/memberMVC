package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		BoardDAO boardDAO = BoardDAO.getInstance();
	    int pg = Integer.parseInt(request.getParameter("page"));
	    int count = 5;
	    int endNum = pg*count;
	    int startNum = endNum-(count-1);
	    int totalNum = boardDAO.getTotalNum();
		//int pageCount = (totalNum + (count - 1)) / count;
		
		// 페이징 계산
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(count);
		boardPaging.setTotalA(totalNum);
		
		StringBuffer sb = boardPaging.makePagingHTML();
		request.setAttribute("paging", sb.toString());
		request.setAttribute("totalNum", totalNum);
	    // 데이터 목록을 가져옴
	    List<BoardDTO> boardList = boardDAO.boardList(startNum, endNum);

	    request.setAttribute("list", boardList);
	    
		return "/board/boardList.jsp";
	}

}
