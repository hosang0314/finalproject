package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.ClientDAO;
import vo.ClientEvalVO;
import vo.ClientVO;

@Controller
public class ClientController {
	@Autowired
	ClientDAO cdao;
	
	@RequestMapping(value="/evaluation.do")
	public void evaluation() {
		
	}
	
	@RequestMapping(value="/profile_edit.do")
	public void profile_edit() {
		
	}
	
	@RequestMapping(value="/profile.do")
	public void profile() {
		
	}
	
	@RequestMapping(value="/evaluation_edit.do")
	public void evaluation_edit() {	
	}
	
	@RequestMapping(value="/insertEvaluation.do")
	public ModelAndView evaluation(ClientEvalVO evo,HttpSession session) {
		ModelAndView mav= new ModelAndView();
		
		try {
		ClientVO cvo = (ClientVO)session.getAttribute("cvo");
		evo.setC_id(cvo.getC_ID());
		evo.setLo_id(cvo.getLO_ID());
		cdao.insertEvaluation(evo);
		mav.addObject("evalmsg","평가가 완료되었습니다.\n 감사합니다.");
		}catch(Exception e) {
			mav.addObject("evalmsg","이미 평가를 하셨습니다.");
		}
		mav.setViewName("evaluation");
		return mav;
	}
	
	@RequestMapping(value="/updateEvaluation.do")
	public ModelAndView evaluation_update(ClientEvalVO evo,HttpSession session) {
		ModelAndView mav= new ModelAndView();
		
		try {
		ClientVO cvo = (ClientVO)session.getAttribute("cvo");
		evo.setC_id(cvo.getC_ID());
		evo.setLo_id(cvo.getLO_ID());
		cdao.updateEvaluation(evo);
		mav.addObject("evalmsg","평가가 수정되었습니다.\n 감사합니다.");
		}catch(Exception e) {
			mav.addObject("evalmsg","잘못입력하셨습니다. 다시 시도하세요.");
		}
		mav.setViewName("evaluation_edit");
		return mav;
	}
	
	
	@RequestMapping(value = "/register.do")
	public ModelAndView insertClient(ClientVO cvo) {
		ModelAndView mav = new ModelAndView();
		List<ClientVO> list = cdao.selectAll();
		
		for (ClientVO vo : list) {
			if (vo.getC_ID().equals(cvo.getC_ID())) {
				mav.addObject("msg", "기존에 존재하는 ID 입니다.");
				mav.setViewName("register");
				return mav;
			}
		}
		boolean result = cdao.register(cvo);
		String msg = (result==false)? "가입 실패":"가입 성공";
		mav.addObject("msg", msg);
		mav.setViewName("register");
		
		return mav;
	}
	
	@RequestMapping(value = "/loginCheck.do")
	public ModelAndView loginCheck(ClientVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try{
			String passWord = vo.getC_PW();
			vo = cdao.selectOne(vo.getC_ID());
			if(vo.getC_PW().equals(passWord)) {
				session.setAttribute("cvo", vo);
				mav.setViewName("redirect:main.do");
				return mav;
				}else {
					throw new Exception();
				}
		}catch(Exception e) {
			mav.addObject("msg", "ID나 비밀번호가 일치하지 않습니다.");
			mav.setViewName("login");
			e.printStackTrace();
			return mav;	
		}
	}
	
	@RequestMapping(value = "/logout.do")
	public ModelAndView logout(HttpSession session) {
		cdao.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:main.do");
		return mav;
	}
	//?왜 필요한거죵?
	@RequestMapping(value = "/login.do")
	public ModelAndView login(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
}
