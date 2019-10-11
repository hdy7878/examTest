package exam.service;

import java.util.List;

import exam.bean.Student;
import exam.bean.Subject;
import exam.dao.ExamDao;

public class ExamService {


	private ExamDao examDao = new ExamDao();
	
	public List<Subject> findAll(String studentName) {
		return examDao.findAll(studentName);
	}
	

	public  List<Student> findAllStudent() {
		return examDao.findAllStudent();
	}


	public Subject findSubjectById(String id) {
		return examDao.findSubjectById(id);
	}


	public void updateStudentScore(String studentName,String score) {
		examDao.updateStudentScore(studentName,score);
	}
	
}
