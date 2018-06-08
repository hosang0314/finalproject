

import javax.servlet.http.HttpServletRequest;

import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.TownDAO;
import vo.TownVO;

@Controller
public class TownController {
	@Autowired
	TownDAO dao;
	
	@RequestMapping(value = "/main.do")
	public void main() {
		
	}
	
	@RequestMapping(value = "/town.do")
	public ModelAndView select(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();	
		///rawdata가져오기
		TownVO qvo = dao.queryMake(request);
		String[][] rawTable = this.rowTable(qvo.getQuery());
		
		RConnection r = null;
		double[]value = new double[qvo.getVariable_value().length];
		try {
			r = new RConnection();
			r.eval("library(DBI)");
			r.eval("library(RJDBC)");
			r.eval("library(rJava)");
			r.eval("library(ggplot2)");
			r.eval("library(dplyr)");
			r.eval("drv <- JDBC('oracle.jdbc.driver.OracleDriver','c:/unico/ojdbc6.jar')");
			r.eval("conn <- dbConnect(drv, 'jdbc:oracle:thin:@70.12.111.135:1521:xe','ora','ora')");
			///가중치 R에 넣기
			r.assign("name", qvo.getVariable_name());
			r.assign("value", qvo.getVariable_value());
			r.eval("weight<- data.frame(name, value)");
			/*/////////////////////////////////////////////////////
			String[] x = r.eval("weight[1,]").asStrings();
			String[] y = r.eval("weight[2,]").asStrings();
			for (int i = 0; i < x.length; i++) {
				System.out.println("가중치 : "+x[i] + "|" + y[i]);
			}
            /////////////////////////////////////////////////////
*/			
			///rawTable R에 넣기
			String msg="townTable <- data.frame(";
			double[]data = null;
			for(int i=0;i<rawTable.length;i++) {	
				if(qvo.getVariable_name()[i].equals("lo_name"))
					r.assign(qvo.getVariable_name()[i], rawTable[i]);
				else{
					data= new double[rawTable[0].length];
					for(int j=0; j<rawTable[i].length;j++) {
						data[j] = Double.parseDouble(rawTable[i][j]);
					}
					r.assign(qvo.getVariable_name()[i], data);
				}
				msg+=qvo.getVariable_name()[i];
				msg+=",";
				if(i==rawTable.length-1)
					msg+="stringsAsFactors=F)";
			
			}
			r.eval(msg);
			///r계산
			///map
			///bar
			///radial
			///table
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}	
		
		///////////////////////////////////////////////////
		//r데이터
		byte[]table = null;
		byte[] bar = null;
		byte[] radial = null;
		
		mav.addObject("table", table);
		mav.addObject("bar_graph", bar);
		mav.addObject("radial_graph", radial);
		
		mav.addObject("variable", qvo.getVariable_name());
		mav.setViewName("main");
		return mav;
	}
	
	public String[][] rowTable(String query){
		System.out.println(query);
		RConnection r = null;
		String[][] table = null;
		try {
			r = new RConnection();
			r.eval("library(DBI)");
			r.eval("library(RJDBC)");
			r.eval("library(rJava)");
			r.eval("drv <- JDBC('oracle.jdbc.driver.OracleDriver','c:/unico/ojdbc6.jar')");
			r.eval("conn <- dbConnect(drv, 'jdbc:oracle:thin:@70.12.111.135:1521:xe','ora','ora')");
			////R에서 해당 쿼리 수행//////
			r.eval("query <-'" + query + "'");	
			RList list = r.eval("dbGetQuery(conn,query)").asList();
			////String[][]로 결과값 추출
			int arrayRows = list.size();
			int arrayCols = list.at(0).length();			
			table = new String[arrayRows][];
			for (int i = 0; i < arrayRows; i++) {
				table[i] = list.at(i).asStrings();
			}
		/*	//////////////////////////////////////////////////
			System.out.println("데이터(관측치)의 갯수 : " + arrayCols);
			System.out.println("변수의 갯수 : " + arrayRows);
			//////////////////////////////////////////////////
*/		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return table;
	}
}
