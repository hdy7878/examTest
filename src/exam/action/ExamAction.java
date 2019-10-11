package exam.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.bean.Subject;
import exam.service.ExamService;

@WebServlet("/ExamAction")
public class ExamAction extends HttpServlet {

	/**
	 */
	private static final long serialVersionUID = 1L;
	
	
	// 1. 调用业务层
	private ExamService examService = new ExamService();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String studentName = request.getParameter("studentName");
		List<Subject> list = examService.findAll(studentName);
		request.setAttribute("studentName", studentName);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/list.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
