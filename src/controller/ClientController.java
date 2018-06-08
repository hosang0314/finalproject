package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
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

	@RequestMapping(value = "/evaluation.do")
	public void evaluation() {

	}

	@RequestMapping(value = "/profile_edit.do")
	public void profile_edit() {

	}

	@RequestMapping(value = "/profile.do")
	public void profile() {

	}
	
	@RequestMapping(value = "/forgot-password.do")
	public void forgotpassword() {

	}
	
	@RequestMapping(value = "/evaluation_edit.do")
	public void evaluation_edit() {
	}

	@RequestMapping(value = "/insertEvaluation.do")
	public ModelAndView evaluation(ClientEvalVO evo, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		try {
			ClientVO cvo = (ClientVO) session.getAttribute("cvo");
			evo.setC_id(cvo.getC_ID());
			evo.setLo_id(cvo.getLO_ID());
			cdao.insertEvaluation(evo);
			mav.addObject("evalmsg", "평가가 완료되었습니다.\n 감사합니다.");
		} catch (Exception e) {
			mav.addObject("evalmsg", "이미 평가를 하셨습니다.");
		}
		mav.setViewName("evaluation");
		return mav;
	}

	@RequestMapping(value = "/updateEvaluation.do")
	public ModelAndView evaluation_update(ClientEvalVO evo, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		try {
			ClientVO cvo = (ClientVO) session.getAttribute("cvo");
			evo.setC_id(cvo.getC_ID());
			evo.setLo_id(cvo.getLO_ID());
			cdao.updateEvaluation(evo);
			mav.addObject("evalmsg", "평가가 수정되었습니다.\n 감사합니다.");
		} catch (Exception e) {
			mav.addObject("evalmsg", "잘못입력하셨습니다. 다시 시도하세요.");
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
		String msg = (result == false) ? "가입 실패" : "가입 성공";
		mav.addObject("msg", msg);
		mav.setViewName("register");

		return mav;
	}

	@RequestMapping(value = "/loginCheck.do")
	public ModelAndView loginCheck(ClientVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			String passWord = vo.getC_PW();
			vo = cdao.selectOne(vo.getC_ID());
			if (vo.getC_PW().equals(passWord)) {
				session.setAttribute("cvo", vo);
				mav.setViewName("redirect:main.do");
				return mav;
			} else {
				throw new Exception();
			}
		} catch (Exception e) {
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

	@RequestMapping(value = "/login.do")
	public ModelAndView login(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}

	@RequestMapping(value = "/sendPassWord.do", produces = "application/json; charset=utf-8")
	public ModelAndView sendPassWord(String email, String confirmFirstName)
			throws AddressException, MessagingException, UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		String firstName = null;
		firstName = cdao.firstName(email);
		List<ClientVO> list = cdao.selectAll();
		System.out.println(email);

		for (ClientVO vo : list) {
			System.out.println(vo.getC_ID());
			if (vo.getC_ID().equals(email)) {
				if (firstName.equals(confirmFirstName)) {
					String host = "smtp.naver.com";
					final String userName = "clftkek";
					final String passWord = "vitlexusval153@";

					String recipient = email;
					String subject = "요청하신 비밀번호 입니다.";
					String body = userName + "@naver.com 님으로 부터 메일을 받았습니다. 비밀번호는" + vo.getC_PW() + "입니다.";

					Properties props = System.getProperties();
					props.put("mail.smtp.host", host);
					props.put("mail.smtp.port", 465);
					props.put("mail.smtp.auth", "true");
					props.put("mail.smtp.starttls.enable", "true");
					props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
					props.put("mail.smtp.ssl.enable", "true");
					props.put("mail.smtp.ssl.trust", host);
					props.put("mail.smtp.timeout", "20000");
					props.put("mail.smtp.connectiontimeout", "20000");

					Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {

						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(userName, passWord);
						}
					});
					session.setDebug(true);
					Message mimeMessage = new MimeMessage(session);
					mimeMessage.setFrom(new InternetAddress("clftkek@naver.com"));
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
					mimeMessage.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
					mimeMessage.setText(body);
					Transport.send(mimeMessage);
					System.out.println("Sueccess Message Send");

					mav.addObject("msg", "해당 Email로 비밀번호를 보냈습니다.");
					mav.setViewName("login");
					return mav;

				} else {
					mav.addObject("msg", "Email과 이름이 일치하지 않습니다.");
					mav.setViewName("forgot-password");
					return mav;
				}
			}
		}
		mav.addObject("msg", "존재하지 않는 Email 입니다.");
		mav.setViewName("forgot-password");
		return mav;
	}
}
