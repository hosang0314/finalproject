package vo;


public class TownVO {
	String query;
	String query_n;
	
	
	String[] variable_name;
	double[] variable_value;
	String[] variable_name_hangl;
	
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public String getQuery_n() {
		return query_n;
	}
	public void setQuery_n(String query_n) {
		this.query_n = query_n;
	}
	public String[] getVariable_name() {
		return variable_name;
	}
	public void setVariable_name(String[] variable_name) {
		this.variable_name = variable_name;
	}
	public double[] getVariable_value() {
		return variable_value;
	}
	public void setVariable_value(double[] variable_value) {
		this.variable_value = variable_value;
	}
	public String[] getVariable_name_hangl() {
		return variable_name_hangl;
	}
	public void setVariable_name_hangl(String[] variable_name_hangl) {
		this.variable_name_hangl = variable_name_hangl;
	}

}