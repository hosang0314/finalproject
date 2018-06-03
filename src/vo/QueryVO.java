package vo;


public class QueryVO {
	String query;
	String[] weight_name;
	double[] weight_value;
	String[] variable_name;
	
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public String[] getWeight_name() {
		return weight_name;
	}
	public void setWeight_name(String[] weight_name) {
		this.weight_name = weight_name;
	}
	public double[] getWeight_value() {
		return weight_value;
	}
	public void setWeight_value(double[] value) {
		this.weight_value = value;
	}
	public String[] getVariable_name() {
		return variable_name;
	}
	public void setVariable_name(String[] variable_name) {
		this.variable_name = variable_name;
	}
	
	
	
	
}
