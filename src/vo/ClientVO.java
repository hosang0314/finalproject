package vo;

public class ClientVO {
	String C_ID;
	String C_PW;
	int LO_ID;
	
	String LO_NAME;
	String C_FIRSTNAME;
	String C_LASTNAME;
	
	public String getC_ID() {
		return C_ID;
	}
	public void setC_ID(String c_ID) {
		C_ID = c_ID;
	}
	public String getC_PW() {
		return C_PW;
	}
	public void setC_PW(String c_PW) {
		C_PW = c_PW;
	}
	public int getLO_ID() {
		return LO_ID;
	}
	public void setLO_ID(int lO_ID) {
		LO_ID = lO_ID;
	}
	public String getLO_NAME() {
		return LO_NAME;
	}
	public void setLO_NAME(String lO_NAME) {
		LO_NAME = lO_NAME;
	}
	public String getC_FIRSTNAME() {
		return C_FIRSTNAME;
	}
	public void setC_FIRSTNAME(String c_FIRSTNAME) {
		C_FIRSTNAME = c_FIRSTNAME;
	}
	public String getC_LASTNAME() {
		return C_LASTNAME;
	}
	public void setC_LASTNAME(String c_LASTNAME) {
		C_LASTNAME = c_LASTNAME;
	}
	@Override
	public String toString() {
		return "ClientVO [C_ID=" + C_ID + ", C_PW=" + C_PW + ", LO_ID=" + LO_ID + ", LO_NAME=" + LO_NAME
				+ ", C_FIRSTNAME=" + C_FIRSTNAME + ", C_LASTNAME=" + C_LASTNAME + "]";
	}
	
	
	
}
