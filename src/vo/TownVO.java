package vo;

import java.util.ArrayList;
//import java.util.HashMap;

public class TownVO {
	// location
	int lo_ID;
	String lo_name;

	// surroundings
	int su_dust;
	int su_green;
	int su_tree;
	//// 가중치
	int su_dust_w;
	int su_green_w;
	int su_tree_w;

	// education
	int ed_gym;
	int ed_library;
	int ed_facility_ratio;
	int ed_facility_grade;
	//// 가중치
	int ed_gym_w;
	int ed_library_w;
	int ed_facility_ratio_w;
	int ed_facility_grade_w;

	// hazard
	int ha_car;
	int ha_bar;
	int ha_disgust;
	
	//범죄
	ArrayList<String> crime_name = new ArrayList<>();
	ArrayList<Integer> crime_num = new ArrayList<>();
	
	//// 가중치
	int ha_car_w;
	int ha_bar_w;
	int ha_disgust_w;
	int crime_w;
	public int getLo_ID() {
		return lo_ID;
	}
	public void setLo_ID(int lo_ID) {
		this.lo_ID = lo_ID;
	}
	public String getLo_name() {
		return lo_name;
	}
	public void setLo_name(String lo_name) {
		this.lo_name = lo_name;
	}
	public int getSu_dust() {
		return su_dust;
	}
	public void setSu_dust(int su_dust) {
		this.su_dust = su_dust;
	}
	public int getSu_green() {
		return su_green;
	}
	public void setSu_green(int su_green) {
		this.su_green = su_green;
	}
	public int getSu_tree() {
		return su_tree;
	}
	public void setSu_tree(int su_tree) {
		this.su_tree = su_tree;
	}
	public int getSu_dust_w() {
		return su_dust_w;
	}
	public void setSu_dust_w(int su_dust_w) {
		this.su_dust_w = su_dust_w;
	}
	public int getSu_green_w() {
		return su_green_w;
	}
	public void setSu_green_w(int su_green_w) {
		this.su_green_w = su_green_w;
	}
	public int getSu_tree_w() {
		return su_tree_w;
	}
	public void setSu_tree_w(int su_tree_w) {
		this.su_tree_w = su_tree_w;
	}
	public int getEd_gym() {
		return ed_gym;
	}
	public void setEd_gym(int ed_gym) {
		this.ed_gym = ed_gym;
	}
	public int getEd_library() {
		return ed_library;
	}
	public void setEd_library(int ed_library) {
		this.ed_library = ed_library;
	}
	public int getEd_facility_ratio() {
		return ed_facility_ratio;
	}
	public void setEd_facility_ratio(int ed_facility_ratio) {
		this.ed_facility_ratio = ed_facility_ratio;
	}
	public int getEd_facility_grade() {
		return ed_facility_grade;
	}
	public void setEd_facility_grade(int ed_facility_grade) {
		this.ed_facility_grade = ed_facility_grade;
	}
	public int getEd_gym_w() {
		return ed_gym_w;
	}
	public void setEd_gym_w(int ed_gym_w) {
		this.ed_gym_w = ed_gym_w;
	}
	public int getEd_library_w() {
		return ed_library_w;
	}
	public void setEd_library_w(int ed_library_w) {
		this.ed_library_w = ed_library_w;
	}
	public int getEd_facility_ratio_w() {
		return ed_facility_ratio_w;
	}
	public void setEd_facility_ratio_w(int ed_facility_ratio_w) {
		this.ed_facility_ratio_w = ed_facility_ratio_w;
	}
	public int getEd_facility_grade_w() {
		return ed_facility_grade_w;
	}
	public void setEd_facility_grade_w(int ed_facility_grade_w) {
		this.ed_facility_grade_w = ed_facility_grade_w;
	}
	public int getHa_car() {
		return ha_car;
	}
	public void setHa_car(int ha_car) {
		this.ha_car = ha_car;
	}
	public int getHa_bar() {
		return ha_bar;
	}
	public void setHa_bar(int ha_bar) {
		this.ha_bar = ha_bar;
	}
	public int getHa_disgust() {
		return ha_disgust;
	}
	public void setHa_disgust(int ha_disgust) {
		this.ha_disgust = ha_disgust;
	}
	public ArrayList<String> getCrime_name() {
		return crime_name;
	}
	public void setCrime_name(ArrayList<String> crime_name) {
		this.crime_name = crime_name;
	}
	public ArrayList<Integer> getCrime_num() {
		return crime_num;
	}
	public void setCrime_num(ArrayList<Integer> crime_num) {
		this.crime_num = crime_num;
	}
	public int getHa_car_w() {
		return ha_car_w;
	}
	public void setHa_car_w(int ha_car_w) {
		this.ha_car_w = ha_car_w;
	}
	public int getHa_bar_w() {
		return ha_bar_w;
	}
	public void setHa_bar_w(int ha_bar_w) {
		this.ha_bar_w = ha_bar_w;
	}
	public int getHa_disgust_w() {
		return ha_disgust_w;
	}
	public void setHa_disgust_w(int ha_disgust_w) {
		this.ha_disgust_w = ha_disgust_w;
	}
	public int getCrime_w() {
		return crime_w;
	}
	public void setCrime_w(int crime_w) {
		this.crime_w = crime_w;
	}
	
	

	
}
