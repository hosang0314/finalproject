package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CrimeVO;
import vo.TownVO;

@Repository
public class TownDAO {
	@Autowired
	SqlSession session;

	public List<TownVO> listAll(int[] ids) {
		List <TownVO> townlist = new ArrayList<>();
		try {
			
			for (int i = 0; i < ids.length; i++) {
				ArrayList<String> crime_name = new ArrayList<>();
				ArrayList<Integer> crime_num = new ArrayList<>();
				String statement = "resource.TownMapper.listOne";
				int lo_id = ids[i];
				TownVO townvo = session.selectOne(statement,lo_id);
				statement = "resource.TownMapper.listCrime";
				List<CrimeVO> clist = session.selectList(statement, lo_id);
				for(CrimeVO vo: clist) {
					crime_name.add(vo.getCrime_name());
					crime_num.add(vo.getCrime_num());
				}
				townvo.setCrime_name(crime_name);
				townvo.setCrime_num(crime_num);				
				townlist.add(townvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Select One Error");
		}
		return townlist;
	}
}
