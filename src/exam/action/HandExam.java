package exam.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.bean.Subject;
import exam.service.ExamService;

/**
 * Servlet implementation class AddStudentAction
 */
@WebServlet("/HandExam")
public class HandExam extends HttpServlet {
	/**
	 */
	private static final long serialVersionUID = 1L;
	
	private ExamService examService = new ExamService();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Subject> listSubject = new ArrayList<>();
		HashMap<String, String> map = new HashMap<String, String>();
		HashMap<String, String> oldCheckedMap = new HashMap<String, String>();
		String tempStr = request.getParameter("tempStr");
		String studentName = request.getParameter("studentName");
		String[] optionArr = tempStr.split(",");
		Integer count = 0;
		for (String option : optionArr) {
			String[] optionChildArr = option.split(":");
			Subject subject = examService.findSubjectById(optionChildArr[0]);
			if (subject != null && subject.getSubjectAnswer().equalsIgnoreCase(optionChildArr[1])) {
				count++;
				listSubject.add(subject);
				map.put(optionChildArr[0], "1");
			}else{
				listSubject.add(subject);
				map.put(optionChildArr[0], subject.getSubjectAnswer());
			}
			oldCheckedMap.put(optionChildArr[0],optionChildArr[1]);
		}
		Integer score = count * 10;
		examService.updateStudentScore(studentName,score.toString());
		request.setAttribute("score", score);
		request.setAttribute("mapSubject", map);
		request.setAttribute("oldCheckedMap", oldCheckedMap);
		request.setAttribute("listSubject", listSubject);
		request.getRequestDispatcher("/listExam.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
