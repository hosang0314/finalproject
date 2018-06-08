package controller;

import javax.servlet.http.HttpServletRequest;

import org.rosuda.REngine.REXP;
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
		/// rawdata가져오기
		TownVO qvo = dao.queryMake(request);
		String[][] rawTable = this.rawTable(qvo.getQuery());
		String[][] normTable = this.normTable(qvo.getQuery_n());
		RConnection r = null;
		byte tableimg [] = null;
		byte bar []= null;
		byte radial []= null;
		double[] value = new double[qvo.getVariable_value().length];
		try {
			r = new RConnection();
			r.eval("library(DBI)");
			r.eval("library(RJDBC)");
			r.eval("library(rJava)");
			r.eval("library(ggplot2)");
			r.eval("library(dplyr)");
			r.eval("drv <- JDBC('oracle.jdbc.driver.OracleDriver','c:/unico/ojdbc6.jar')");
			r.eval("conn <- dbConnect(drv, 'jdbc:oracle:thin:@70.12.111.135:1521:xe','ora','ora')");
			/// 가중치 R에 넣기
			r.assign("name", qvo.getVariable_name());
			r.assign("value", qvo.getVariable_value());
			r.eval("weight<- data.frame(name, value,stringsAsFactors=F)");
			/*
			 * ///////////////////////////////////////////////////// String[] x =
			 * r.eval("weight[1,]").asStrings(); String[] y =
			 * r.eval("weight[2,]").asStrings(); for (int i = 0; i < x.length; i++) {
			 * System.out.println("가중치 : "+x[i] + "|" + y[i]); }
			 * /////////////////////////////////////////////////////
			 */
			/// rawTable R에 넣기
			String msg = "townTable <- data.frame(";
			double[] data = null;
			for (int i = 0; i < rawTable.length; i++) {
				if (qvo.getVariable_name()[i].equals("lo_name"))
					r.assign(qvo.getVariable_name()[i], rawTable[i]);
				else {
					data = new double[rawTable[0].length];
					for (int j = 0; j < rawTable[i].length; j++) {
						data[j] = Double.parseDouble(rawTable[i][j]);
					}
					r.assign(qvo.getVariable_name()[i], data);
				}
				msg += qvo.getVariable_name()[i];
				msg += ",";
				if (i == rawTable.length - 1)
					msg += "stringsAsFactors=F)";

			}
			r.eval(msg);
			
			System.out.println(msg);
			System.out.println("!");
		   

			for (int i = 0; i < rawTable.length; i++) {
				System.out.println();
				for (int j = 0; j < rawTable[i].length; j++) {
					System.out.print(rawTable[i][j] + " ");
				}
			}
			
			for (int i = 0; i < normTable.length; i++) {
				System.out.println();
				for (int j = 0; j < normTable[i].length; j++) {
					System.out.print(normTable[i][j] + " ");
				}
			}
			System.out.println("ㅎㅎ");
			System.out.println(normTable[0][0]);
			//System.out.println(normTable[0][1]);
			System.out.println(normTable[1][0]);
			System.out.println("ㅋㅋ");
			
			//r에서 normalized라는 변수에 데이터를 담기
			String calc = "normalized <- data.frame(";
			double[] calcdata = null;
			for (int i = 1; i < normTable.length; i++) {
				if (qvo.getVariable_name()[i].equals("lo_name"))
					r.assign(qvo.getVariable_name()[i], normTable[i]);
				else {
					calcdata = new double[normTable[0].length];
					for (int j = 0; j < normTable[i].length; j++) {
						calcdata[j] = Double.parseDouble(normTable[i][j]);
					}
					r.assign(qvo.getVariable_name()[i], calcdata);
				}
				calc += qvo.getVariable_name()[i];
				calc += ",";
				if (i == normTable.length - 1)
					calc += "stringsAsFactors=F)";

			}
			r.eval(calc);
			//  normalized를  table1에 담기
			String[][] table1=null;
			RList hh=r.eval("normalized").asList();
			int arrayRows = hh.size();
			int arrayCols = hh.at(0).length();
			table1 = new String[arrayRows][];
			for (int i = 0; i < arrayRows; i++) {
				table1[i] = hh.at(i).asStrings();
			}
			//table 1을 한번 출력해보는 곳
			for (int i = 0; i < table1.length; i++) {
				System.out.println();
				for (int j = 0; j < table1[i].length; j++) {
					System.out.print(table1[i][j] + " ");
				}   
			}
			
			
			 REXP x = r.eval("value");
             double[] d = x.asDoubles();
             for (int i = 0; i < d.length; i++) {
                     System.out.println(d[i]);
             }
             
             REXP xn = r.eval("name");
             String[] dn = xn.asStrings();
             for (int i = 0; i < dn.length; i++) {
                     System.out.println(dn[i]);
             }
             
            /* REXP rResponseObject = rServeConnection.parseAndEval("try(eval("+R_COMMAND_OR_SOURCE_FILE_PATH+"),silent=TRUE)");
             if (rResponseObject.inherits("try-error")) {
             LOGGER.error("R Serve Eval Exception : "+rResponseObject.asString());
             }*/
          /*   REXP c = r.eval("normalized[2,]");
             double[] f = c.asDoubles();
             for (int i = 0; i < f.length; i++) { 
            	 System.out.println(f[i]);
             }
*/
		/*	String[][] valuetable=null;
			RList val=r.eval("weight").asList();
			int arrayRows1 = val.size();
			int arrayCols1= val.at(0).length();
			valuetable = new String[arrayRows1][];
			for (int i = 0; i < arrayRows1; i++) {
				valuetable[i] = val.at(i).asStrings();
			}
			//table 1을 한번 출력해보는 곳
			for (int i = 0; i < valuetable.length; i++) {
				System.out.println();
				for (int j = 0; j < valuetable[i].length; j++) {
					System.out.print(valuetable[i][j] + " ");
				}
			}
			*/
            r.eval("library(gridExtra)");
            r.eval("library(dplyr)");
            r.eval("d<-0");
            r.eval("name2<-name[-(1:2)]");
            r.eval("colnames(normalized)<- c('gugu', name2)");
			r.eval("for(i in 1:length(normalized[1,-1])-1) { d[i]<-(normalized[i,-1]*value[i])}");
			r.eval("e<- cbind(normalized, d)");
		//	r.eval("gugu<- normalized[1]");
		//	r.eval("e<- cbind(normalized, gugu)");
					//r.eval("e<- cbind(e, normalized[1])");
					//r.eval("e <-as.data.frame(e)");
//			r.eval("normalized<- cbind(normalized, gugu)");
			r.eval("gu <- arrange(e,desc(d)) %>% select(gugu)");
			//r.eval("arrange(e, desc(d)) %>% order(d)");
			r.eval("w <-gu$gugu");
			r.eval("e <-as.data.frame(e)"); //그냥 해줌
			r.eval("normalized <-as.data.frame(normalized)"); //그냥 해줌
			
			
			
			String[][] table2=null;
			RList hhh=r.eval("normalized").asList();
			int arrayRows2 = hhh.size();
			int arrayCols2 = hhh.at(0).length();
			table2 = new String[arrayRows2][];
			for (int i = 0; i < arrayRows2; i++) {
				table2[i] = hhh.at(i).asStrings();
			}
			//table 1을 한번 출력해보는 곳
			for (int i = 0; i < table2.length; i++) {
				System.out.println();
				for (int j = 0; j < table2[i].length; j++) {
					System.out.print(table2[i][j] + " ");
				}   
			}
			
			r.eval("tmp2<- factor(normalized$gugu,levels=w");
			r.eval("b<-data.frame(normalized,tmp2)");
			r.eval("c<-b[order(b$tmp2),]");
			r.eval("f<-c[c(-ncol(c))]");
			r.eval("rownames(f) <-c()");
			r.eval("name2<-name[-(1:2)]");
			r.eval("name<-c(name2,name[2])");
			r.eval("colnames(f)<- name");
			r.eval("jpeg('testt.jpg')");
			r.eval("grid.table(f)");
			r.eval("dev.off()");
			r.eval("r=readBin('testt.jpg','raw',1020*1020)");
			r.eval("unlink('testt.jpg')");
			tableimg = r.eval("r").asBytes();
			//	System.out.println(qvo.getVariable_name());
			//System.out.println(qvo.getVariable_value());
			/// r계산
			/// map
			/// bar
			/// radial
			/// table

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}

		///////////////////////////////////////////////////
		// r데이터
	

		mav.addObject("table", tableimg);
		mav.addObject("bar_graph", bar);
		mav.addObject("radial_graph", radial);

		mav.addObject("variable", qvo.getVariable_name());
		mav.setViewName("main");
		return mav;
	}

	public String[][] rawTable(String query) {
		RConnection r = null;
		String[][] table = null;
		System.out.println(query);
		try {
			r = new RConnection();
			r.eval("library(DBI)");
			r.eval("library(RJDBC)");
			r.eval("library(rJava)");
			r.eval("drv <- JDBC('oracle.jdbc.driver.OracleDriver','c:/unico/ojdbc6.jar')");
			r.eval("conn <- dbConnect(drv, 'jdbc:oracle:thin:@70.12.111.135:1521:xe','ora','ora')");
			//// R에서 해당 쿼리 수행//////
			r.eval("query <-'" + query + "'");
			RList list = r.eval("dbGetQuery(conn,query)").asList();
			//// String[][]로 결과값 추출
			int arrayRows = list.size();
			int arrayCols = list.at(0).length();
			table = new String[arrayRows][];
			for (int i = 0; i < arrayRows; i++) {
				table[i] = list.at(i).asStrings();
			}
			/*
			 * //////////////////////////////////////////////////
			 * System.out.println("데이터(관측치)의 갯수 : " + arrayCols);
			 * System.out.println("변수의 갯수 : " + arrayRows);
			 * //////////////////////////////////////////////////
			 */ } catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return table;
	}
	
	public String[][] normTable(String query_n) {
		RConnection r = null;
		String[][] normTable = null;
		System.out.println(query_n);
		try {
			r = new RConnection();
			r.eval("library(DBI)");
			r.eval("library(RJDBC)");
			r.eval("library(rJava)");
			r.eval("drv <- JDBC('oracle.jdbc.driver.OracleDriver','c:/unico/ojdbc6.jar')");
			r.eval("conn <- dbConnect(drv, 'jdbc:oracle:thin:@70.12.111.135:1521:xe','ora','ora')");
			//// R에서 해당 쿼리 수행//////
			r.eval("query_n <-'" + query_n + "'");
			RList list = r.eval("dbGetQuery(conn,query_n)").asList();
			//// String[][]로 결과값 추출
			int arrayRows = list.size();
			int arrayCols = list.at(0).length();
			normTable = new String[arrayRows][];
			for (int i = 0; i < arrayRows; i++) {
				normTable[i] = list.at(i).asStrings();
			}
			/*
			 * //////////////////////////////////////////////////
			 * System.out.println("데이터(관측치)의 갯수 : " + arrayCols);
			 * System.out.println("변수의 갯수 : " + arrayRows);
			 * //////////////////////////////////////////////////
			 */ } catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return normTable;
	}
}
