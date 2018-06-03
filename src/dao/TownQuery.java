package dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import vo.QueryVO;
@Repository
public class TownQuery {
	public QueryVO queryMake(HttpServletRequest request) {
		QueryVO qvo = new QueryVO();
		List<String> weight_name = new ArrayList<>();
		List<Double> weight_value = new ArrayList<>();
		String select = "select l.lo_id, l.lo_name";
		String table = "\r\n from location l";
		String where = "\r\n where l.lo_id in(";
		List<String> variable_name = new ArrayList<>();
		
		//location
		String[] area1 = request.getParameterValues("area1");
		for (int i = 0; i < area1.length; i++) {
			if(area1[i].equals("0")) {
				where="";
				break;
			}else {
				where += area1[i];
				if (i != area1.length - 1)
					where += ",";
				else where += ")";
			}
		}
		
		variable_name.add("지역명");
		//surroundings
		if (request.getParameterValues("area2") != null) {
			table += " join surroundings s on l.lo_id=s.su_lo_id";
			String[] area2 = request.getParameterValues("area2");
			for (String st : area2) {
				switch (st) {
				case "1":
					select += ", s.su_dust";
					weight_name.add("su_dust");
					weight_value.add(Double.parseDouble(request.getParameter("su_w1")));
					variable_name.add("미세먼지");
					break;
				case "2":
					select += ", s.su_green";
					weight_name.add("su_green");
					weight_value.add(Double.parseDouble(request.getParameter("su_w2")));
					variable_name.add("녹지");
					break;
				}
			}
		}
		//education
		if (request.getParameterValues("area3") != null) {
			table += "\r\n join education e on l.lo_id=e.ed_lo_id";
			String[] area3 = request.getParameterValues("area3");
			for (String st : area3) {
				switch (st) {
				case "1":
					select += ", e.ed_gym";
					weight_name.add("ed_gym");
					weight_value.add(Double.parseDouble(request.getParameter("ed_w1")));
					variable_name.add("체육시설");
					break;
				case "2":
					select += ", e.ed_library";
					weight_name.add("ed_library");
					weight_value.add(Double.parseDouble(request.getParameter("ed_w2")));
					variable_name.add("도서관 수");
					break;
				case "3":
					select += ", e.ed_facility_ratio";
					weight_name.add("ed_facility_ratio");
					weight_value.add(Double.parseDouble(request.getParameter("ed_w3")));
					variable_name.add("아동 관련 시설 수");
					break;
				case "4":
					select += ", e.ed_facility_grade";
					weight_name.add("ed_facility_grade");
					weight_value.add(Double.parseDouble(request.getParameter("ed_w4")));
					variable_name.add("어린이집 평가점수");
					break;
				}
			}
		}
		//hazard
		if (request.getParameterValues("area4") != null) {
			table += "\r\n join hazard h on l.lo_id=h.ha_lo_id";
			String[] area4 = request.getParameterValues("area4");
			for (String st : area4) {
				switch (st) {
				case "1":
					select += ", h.ha_car";
					weight_name.add("ha_car");
					weight_value.add(Double.parseDouble(request.getParameter("ha_w1")));
					variable_name.add("교통사고");
					break;
				case "2":
					select += ", h.ha_bar";
					weight_name.add("ha_ba");
					weight_value.add(Double.parseDouble(request.getParameter("ha_w2")));
					variable_name.add("유흥업소 수");
					break;
				case "3":
					select += ", h.ha_disgust";
					weight_name.add("ha_disgust");
					weight_value.add(Double.parseDouble(request.getParameter("ha_w3")));
					variable_name.add("혐오시설 수");
					break;
				case "4":
					select += ", h.ha_crime";
					weight_name.add("ha_crime");
					weight_value.add(Double.parseDouble(request.getParameter("ha_w4")));
					variable_name.add("아동범죄율");
					break;
				}
			}
		}
		/*//crime
		if (request.getParameterValues("area5") != null) {
			table += "\r\n join crime_count cc on l.lo_id=cc.cr_lo_id" + "\r\n join crime c on cc.crime_id=c.crime_id";
			select += ", c.CRIME_NAME, cc.CRIME_NUM";
			String[] area5 = request.getParameterValues("area5");
			where += " and c.crime_id in (";
			variable_name.add("범죄율");
			for (int i = 0; i < area5.length; i++) {
				switch (area5[i]) {
				case "1":
					where += "1";
					weight_name.add("cr_w1");
					weight_value.add(Double.parseDouble(request.getParameter("cr_w1")));
					//variable_name.add("납치");
					break;
				case "2":
					where += "2";
					weight_name.add("cr_w2");
					weight_value.add(Double.parseDouble(request.getParameter("cr_w2")));
					//variable_name.add("폭행");
					break;
				case "3":
					where += "3";
					weight_name.add("cr_w3");
					weight_value.add(Double.parseDouble(request.getParameter("cr_w3")));
					//variable_name.add("살인");
					break;
				}
				if (i != area5.length - 1)
					where += ",";
			}
			where += ")";
		}*/
		
		qvo.setQuery(select + table + where);
		String[] name=new String[weight_name.size()];
		weight_name.toArray(name);
		String[] variable = new String[variable_name.size()];
		variable_name.toArray(variable);
		double[] value=new double[weight_value.size()];
		for(int i=0;i<weight_value.size();i++) {
			value[i]=weight_value.get(i);
		}
		
		qvo.setWeight_name(name);
		qvo.setWeight_value(value);
		qvo.setVariable_name(variable);
		return qvo;
	}
}
