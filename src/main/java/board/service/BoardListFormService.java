package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardListFormService implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setAttribute("page", request.getParameter("page"));
		return "/board/boardListForm.jsp";
	}

}
