package r;

import javax.servlet.http.HttpServletRequest;

import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.stereotype.Repository;

import vo.QueryVO;

@Repository
public class TownR {
	public RList resultList(QueryVO qvo, HttpServletRequest request) {
		RConnection r = null;
		RList list = null;
		try {
			r = new RConnection();
			r.eval("library(DBI)");
			r.eval("library(RJDBC)");
			r.eval("library(rJava)");
			r.eval("drv <- JDBC('oracle.jdbc.driver.OracleDriver','c:/unico/ojdbc6.jar')");
			r.eval("conn <- dbConnect(drv, 'jdbc:oracle:thin:@70.12.111.135:1521:xe','ora','ora')");

			r.assign("x", qvo.getWeight_name());
			r.assign("y", qvo.getWeight_value());
			r.eval("weight<-rbind(x,y)");

			///
			String[] x = r.eval("weight[1,]").asStrings();
			String[] y = r.eval("weight[2,]").asStrings();
			///////////////////////////////////////////////////
			for (int i = 0; i < x.length; i++) {
				System.out.println(x[i] + "|" + y[i]);
			}
			//////////////////////////////////////////////////
			r.eval("query <-'" + qvo.getQuery() + "'");
			System.out.println("전달 쿼리: " + qvo.getQuery());
			// r.eval("resultList<-dbGetQuery(conn,query)")

			list = r.eval("dbGetQuery(conn,query)").asList();
			// 계산이염..
			// list =r.eval("계산한거욤list.욤").asList();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return list;
	}

	public String[][] table(RList list) {
		String[][] table = null;
		RConnection r = null;
		try {
			r = new RConnection();
			r.eval("library(DBI)");
			r.eval("library(RJDBC)");
			r.eval("library(rJava)");
			r.eval("drv <- JDBC('oracle.jdbc.driver.OracleDriver','c:/unico/ojdbc6.jar')");
			r.eval("conn <- dbConnect(drv, 'jdbc:oracle:thin:@70.12.111.135:1521:xe','ora','ora')");
			int arrayRows = list.size();
			int arrayCols = list.at(0).length();
			//////////////////////////////////////////////////
			System.out.println("데이터(관측치)의 갯수 : " + arrayCols);
			System.out.println("변수의 갯수 : " + arrayRows);
			//////////////////////////////////////////////////
			table = new String[arrayRows][];
			for (int i = 0; i < arrayRows; i++) {
				table[i] = list.at(i).asStrings();
			}
			System.out.println("r 준비됐습니까요?" + table.length + "|" + table[0].length);

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return table;
	}

	public byte[] bar(RList list) {

		byte retImg[] = null;
		RConnection r = null;
		try {
			r = new RConnection();
			r.eval("library(DBI)");
			r.eval("library(RJDBC)");
			r.eval("library(rJava)");
			r.eval("drv <- JDBC('oracle.jdbc.driver.OracleDriver','c:/unico/ojdbc6.jar')");
			r.eval("conn <- dbConnect(drv, 'jdbc:oracle:thin:@70.12.111.135:1521:xe','ora','ora')");
			r.eval("townTable<-" + list);
		} catch (RserveException e) {
			e.printStackTrace();
		}

		
		return retImg;
	}
	public byte[] radial(RList list) {
		byte retImg[] = null;
		RConnection r = null;
		try {
			r = new RConnection();
			r.eval("library(DBI)");
			r.eval("library(RJDBC)");
			r.eval("library(rJava)");
			r.eval("drv <- JDBC('oracle.jdbc.driver.OracleDriver','c:/unico/ojdbc6.jar')");
			r.eval("conn <- dbConnect(drv, 'jdbc:oracle:thin:@70.12.111.135:1521:xe','ora','ora')");
			r.eval("townTable<-" + list);
		} catch (RserveException e) {
			e.printStackTrace();
		}	
		return retImg;
	}
	
}
