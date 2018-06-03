package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ClientVO;

@Repository
public class ClientDAO {
	@Autowired
	SqlSession session;
	
	public List<ClientVO> selectAll() {
		List<ClientVO> list = null;
		ClientVO vo = new ClientVO();
		try {
			String statement = "resource.TownMapper.selectAll";
			list = session.selectList(statement, vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public String selectOne(String c_id) {
		String userId = null;
		try {
			String statement = "resource.TownMapper.selectOne";
			userId = session.selectOne(statement, c_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userId;
	}
	
	public String login(String c_id) {
		String passWord = null;
		try {
			String statement = "resource.TownMapper.login";
			passWord = session.selectOne(statement, c_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return passWord;
	}
}
