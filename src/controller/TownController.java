package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.rosuda.REngine.RList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.ClientDAO;
import dao.TownQuery;
import r.TownR;
import vo.ClientVO;
import vo.QueryVO;

@Controller
public class TownController {
	//@Autowired
	//TownDAO dao;
	@Autowired
	TownR r;
	@Autowired
	TownQuery query;
	@Autowired
	ClientDAO dao;
	
	@RequestMapping(value = "/main.do")
	public void main() {
		
	}
	
	@RequestMapping(value = "/loginCheck.do")
	public ModelAndView loginCheck(ClientVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String passWord = null;
		passWord = dao.login(vo.getC_ID());
		System.out.println(passWord);
		List<ClientVO> list = dao.selectAll();

		for (ClientVO volist : list) {
			if (vo.getC_ID().equals(vo.getC_ID())) {
				if (vo.getC_PW().equals(passWord)) {
					String userId = null;
					userId = dao.selectOne(vo.getC_ID());
					System.out.println(userId);
					session.setAttribute("userId", userId);
					mav.setViewName("main");
					return mav;
				} else {
					mav.addObject("msg", "비밀번호가 일치하지 않습니다.");
					mav.setViewName("login");
					return mav;
				}
			}
		}
		mav.addObject("msg", "존재하지 않는 Email을 입니다.");
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value = "/town.do")
	public ModelAndView select(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		//가중치만들기
		QueryVO qvo = query.queryMake(request);
		
		//r데이터
		RList list=r.resultList(qvo, request);
		String[][]table = r.table(list);
		//byte[] bar = r.bar(list);
		//byte[] radial = r.radial(list);
		System.out.println("r 왔습니까요?"+table.length+"|"+table[0].length);
		for(int j=0; j<table[0].length; j++) {
			for(int i=0; i<table.length; i++) {
				System.out.print(table[i][j]+"|");
			}
			System.out.println();
		}		
		mav.addObject("table", table);
		//mav.addObject("bar_graph", bar);
		//mav.addObject("radial_graph", radial);
		
		mav.addObject("variable", qvo.getVariable_name());
		mav.setViewName("main");
		return mav;
	}
	
	
	
	
	
	

	// 선택한 정보 추리기

	// 추린 정보 R에 넣고 결과 만들어내기 public byte[] returnRImg() { RConnection r = null;

}
