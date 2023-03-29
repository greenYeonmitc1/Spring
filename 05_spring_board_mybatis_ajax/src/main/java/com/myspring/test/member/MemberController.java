package com.myspring.test.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired
	MemberDAO memberDAO;
	
	@ModelAttribute("cp")
	public String getContextPath(Model model , HttpServletRequest request) {		
		model.addAttribute("cp", request.getContextPath());	
		return request.getContextPath();
	}
	
	@RequestMapping(value = "/member/login")
	public String login() {
		return "member/login";
	}
	

	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(Member member, Model model, HttpSession session) {
		int check = memberDAO.checkMember(member);
		if(check == 1) {
			session.setAttribute("log", member.getId());
		}
		model.addAttribute("check", check);
		return "member/loginPro";
	}
	
	
	@RequestMapping(value = "/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/board/index";
	}
	
	@RequestMapping(value = "/member/join")
	public String join() {
		return "member/join";
	}
	
	
	@RequestMapping(value = "/member/joinPro")
	public String joinPro(Member member, Model model) {
		
		int check = memberDAO.checkId(member.getId());
		if(check == 0) {
			memberDAO.joinMember(member);
		}
		
		model.addAttribute("check", check);
		return "member/joinPro";
	}
}






