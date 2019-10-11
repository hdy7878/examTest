package exam.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import exam.bean.Student;
import exam.bean.Subject;
import exam.utils.DataSourceUtils;

public class ExamDao {

	private QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	
	/**
	 * 查询所有的书籍
	 */
	public List<Subject> findAll(String studentName) {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");
		String date = df.format(new Date());
		String studentId = "A" + date;
		try {
			Student student = runner.query("SELECT * FROM exam_student where studentName = '"+studentName+"'", new BeanHandler<Student>(Student.class));
			if (student == null) {
				runner.update("INSERT INTO exam_student (studentId,studentName) VALUES ('"+studentId+"','"+studentName+"')");
			}
			return runner.query("SELECT * FROM exam_subject ORDER BY RAND() LIMIT 10", new BeanListHandler<Subject>(Subject.class));
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	public List<Student> findAllStudent() {
		try {
			return runner.query("select * from exam_student order by studentScore asc", new BeanListHandler<Student>(Student.class));
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}

	public Subject findSubjectById(String id) {
		try {
			return runner.query("select * from exam_subject where subjectId = '"+id+"'", new BeanHandler<Subject>(Subject.class));
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	public void updateStudentScore(String studentName , String score) {
		try {
			runner.update("UPDATE exam_student SET studentScore = '"+score+"' WHERE studentName = '"+studentName.trim()+"'");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}


}
