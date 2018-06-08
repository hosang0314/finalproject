package dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import vo.TownVO;

@Repository
public class TownDAO {
	public TownVO queryMake(HttpServletRequest request) {
		TownVO qvo = new TownVO();
		
		List<String> variable_name = new ArrayList<>();
		List<Double> variable_value = new ArrayList<>();
		List<String> variable_name_hangl = new ArrayList<>();
		
		/////// row data_query///////////////////
		String select = "select l.lo_id, l.lo_name"; //
		String table = "\r\n from location l";
		String where = "\r\n where l.lo_id in(";

		/////// normalized data query////////////
		String select_n = "select lo_id, lo_name"; //
		String table_n = "\r\n from calc";
		String where_n = "\r\n where lo_id in(";

		// location
		String[] location = request.getParameterValues("location");
		for (int i = 0; i < location.length; i++) {
			System.out.println(location[i]+"|");
			if (location[i].equals("0")) {
				where = "";
				where_n = "";
				break;
			} else {
				where += location[i];
				where_n += location[i];
				if (i != location.length - 1) {
					where += ",";
					where_n += ",";
				} else {
					where += ")";
					where_n += ")";
				}
			}

		}
		variable_name.add("lo_id");
		variable_name.add("lo_name");
		variable_value.add(0.0);
		variable_value.add(0.0);
		variable_name_hangl.add("지역ID");
		variable_name_hangl.add("지역명");
		// surroundings
		if (request.getParameterValues("surroundings") != null){
			table += " join surroundings s on l.lo_id=s.su_lo_id";
			String[] surroundings = request.getParameterValues("surroundings");
			for (String st : surroundings) {
				switch (st) {
				case "0":
					select += ", s.su_dust, s.su_green, s.su_population, s.su_cctv, s.su_hospital";
					select_n += ", su_dust, su_green, su_population, su_cctv, su_hospital";
					variable_name.add("su_dust");
					variable_value.add(Double.parseDouble(request.getParameter("su_w1")));
					variable_name_hangl.add("미세먼지농도");
					variable_name.add("su_green");
					variable_value.add(Double.parseDouble(request.getParameter("su_w2")));
					variable_name_hangl.add("녹지조성도");
					variable_name.add("su_hospital");
					variable_value.add(Double.parseDouble(request.getParameter("su_w3")));
					variable_name_hangl.add("의료기관수");
					variable_name.add("su_population");
					variable_value.add(Double.parseDouble(request.getParameter("su_w4")));
					variable_name_hangl.add("인구밀도");
					variable_name.add("su_cctv");
					variable_value.add(Double.parseDouble(request.getParameter("su_w5")));
					variable_name_hangl.add("CCTV");
					break;
				case "1":
					select += ", s.su_dust";
					select_n += ", su_dust";
					variable_name.add("su_dust");
					variable_value.add(Double.parseDouble(request.getParameter("su_w1")));
					variable_name_hangl.add("미세먼지농도");
					break;
				case "2":
					select += ", s.su_green";
					select_n += ", su_green";
					variable_name.add("su_green");
					variable_value.add(Double.parseDouble(request.getParameter("su_w2")));
					variable_name_hangl.add("녹지조성도");
					break;
				
				case "3":
					select += ", s.su_hospital";
					select_n += ", su_hospital";
					variable_name.add("su_hospital");
					variable_value.add(Double.parseDouble(request.getParameter("su_w3")));
					variable_name_hangl.add("의료기관수");
					break;
				case "4":
					select += ", s.su_population";
					select_n += ", su_population";
					variable_name.add("su_population");
					variable_value.add(Double.parseDouble(request.getParameter("su_w4")));
					variable_name_hangl.add("인구밀도");
					break;	
				case "5":
					select += ", s.su_cctv";
					select_n += ", su_cctv";
					variable_name.add("su_cctv");
					variable_value.add(Double.parseDouble(request.getParameter("su_w5")));
					variable_name_hangl.add("CCTV");
					break;
				}
			}
		}
		
		// education
		if (request.getParameterValues("education") != null) {
			table += "\r\n join education e on l.lo_id=e.ed_lo_id";
			String[] education = request.getParameterValues("education");
			for (String st : education) {
				switch (st) {
				case "0":
					select += ", e.ed_gym, e.ed_facility_ratio, e.ed_facility_grade";
					select_n += ", ed_gym, ed_facility_ratio, ed_facility_grade";
					variable_name.add("ed_gym");
					variable_value.add(Double.parseDouble(request.getParameter("ed_w1")));
					variable_name_hangl.add("체육시설");
					variable_name.add("ed_facility_ratio");
					variable_value.add(Double.parseDouble(request.getParameter("ed_w2")));
					variable_name_hangl.add("아동관련시설수");
					variable_name.add("ed_facility_grade");
					variable_value.add(Double.parseDouble(request.getParameter("ed_w3")));					
					variable_name_hangl.add("어린이집평가점수");
					break;
				case "1":
					select += ", e.ed_gym";
					select_n += ", ed_gym";
					variable_name.add("ed_gym");
					variable_value.add(Double.parseDouble(request.getParameter("ed_w1")));
					variable_name_hangl.add("체육시설");
					break;
				case "2":
					select += ", e.ed_facility_ratio";
					select_n += ", ed_facility_ratio";
					variable_name.add("ed_facility_ratio");
					variable_value.add(Double.parseDouble(request.getParameter("ed_w2")));
					variable_name_hangl.add("아동관련시설수");
					break;
				case "3":
					select += ", e.ed_facility_grade";
					select_n += ", ed_facility_grade";
					variable_name.add("ed_facility_grade");
					variable_value.add(Double.parseDouble(request.getParameter("ed_w3")));
					variable_name_hangl.add("어린이집평가점수");
					break;
				}
			}
		}
		
		// hazard
		if (request.getParameterValues("hazard") != null) {
			table += "\r\n join hazard h on l.lo_id=h.ha_lo_id";
			String[] hazard = request.getParameterValues("hazard");
			for (String st : hazard) {
				switch (st) {
				case "0":
					select += ", h.ha_car, h.ha_bar, h.ha_crime";
					select_n += ", ha_car, ha_bar, ha_crime";
					variable_name.add("ha_car");
					variable_value.add(Double.parseDouble(request.getParameter("ha_w1")));
					variable_name_hangl.add("교통사고수");
					variable_name.add("ha_bar");
					variable_value.add(Double.parseDouble(request.getParameter("ha_w2")));
					variable_name_hangl.add("유흥시설수");
					variable_name.add("ha_crime");
					variable_value.add(Double.parseDouble(request.getParameter("ha_w3")));
					variable_name_hangl.add("범죄율");
					break;
				case "1":
					select += ", h.ha_car";
					select_n += ", ha_car";
					variable_name.add("ha_car");
					variable_value.add(Double.parseDouble(request.getParameter("ha_w1")));
					variable_name_hangl.add("교통사고수");
					break;
				case "2":
					select += ", h.ha_bar";
					select_n += ", ha_bar";
					variable_name.add("ha_ba");
					variable_value.add(Double.parseDouble(request.getParameter("ha_w2")));
					variable_name_hangl.add("유흥시설수");
					break;
				case "3":
					select += ", h.ha_crime";
					select_n += ", ha_crime";
					variable_name.add("ha_crime");
					variable_value.add(Double.parseDouble(request.getParameter("ha_w3")));
					variable_name_hangl.add("범죄율");
					break;
				}
			}
		}

		qvo.setQuery(select + table + where);
		qvo.setQuery_n(select_n + table_n + where_n);
		
		String[] name = new String[variable_name.size()];
		variable_name.toArray(name);
		String[] name_hangl = new String[variable_name_hangl.size()];
		variable_name_hangl.toArray(name_hangl);
		double[] value = new double[variable_value.size()];
		for (int i = 0; i < variable_value.size(); i++) {
			value[i] = variable_value.get(i);
		}
		qvo.setVariable_name(name);
		qvo.setVariable_value(value);
		qvo.setVariable_name_hangl(name_hangl);
		return qvo;
	}
}
