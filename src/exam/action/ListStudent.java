package exam.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.bean.Student;
import exam.service.ExamService;

/**
 * Servlet implementation class AddStudentAction
 */
@WebServlet("/ListStudent")
public class ListStudent extends HttpServlet {
	/**
	 */
	private static final long serialVersionUID = 1L;
	
	private ExamService examService = new ExamService();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Student> listStudent = examService.findAllStudent();
		request.setAttribute("list", listStudent);
		request.getRequestDispatcher("/listStudent.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
