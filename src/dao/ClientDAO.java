package dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ClientEvalVO;
import vo.ClientVO;

@Repository
public class ClientDAO {
	@Autowired
	SqlSession session;
	
	public void insertEvaluation(ClientEvalVO evo) throws Exception {
			String statement = "resource.TownMapper.insertEvaluation";
			session.insert(statement, evo);
	}
	
	public void updateEvaluation(ClientEvalVO evo) throws Exception {
		try {
			String statement = "resource.TownMapper.updateEvaluation";
			session.insert(statement, evo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Insert Error");
		}
	}
	
	
	public List<ClientVO> selectAll() {
		List<ClientVO> list = null;
		try {
			//System.out.println(1);
			String statement = "resource.TownMapper.selectAll";
			list = session.selectList(statement);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
	}

	public ClientVO selectOne(String c_id) {
		ClientVO vo = null;
		try {
			String statement = "resource.TownMapper.selectOne";
			vo = session.selectOne(statement, c_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public String login(String c_id) {
		String passWord = null;
		try {
			String statement = "resource.TownMapper.login";
			System.out.println("login:["+c_id+"]");
			passWord = session.selectOne(statement, c_id);
			System.out.println("password : "+passWord);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return passWord;
	}
	
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	public boolean register(ClientVO vo) {
		boolean result = false;
		try {
			String statement = "resource.TownMapper.insertClient";
			int re = session.insert(statement, vo);
			
			result = (re==0) ? false : true;
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
		return result;	
	}
	
	public String firstName(String email) {
		String firstName = null;
		try {
			String statement = "resource.TownMapper.firstName";
			System.out.println("email:["+email+"]");
			firstName = session.selectOne(statement, email);
			System.out.println("firstName : "+firstName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return firstName;
	
	}
	
}
