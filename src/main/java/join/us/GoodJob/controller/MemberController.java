package join.us.GoodJob.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import join.us.GoodJob.model.service.MemberService;
import join.us.GoodJob.model.vo.MemberVO;

@Controller
public class MemberController {
	@Resource
	MemberService memberService;

	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "member/login_form.tiles2";
	}

	@RequestMapping("login.do")
	public String login(MemberVO memberVO, HttpSession session) {
		MemberVO mvo = memberService.loginMember(memberVO);
		if(mvo!=null) { //로그인 성공
			session.setAttribute("mvo", mvo);
			return "redirect:home.do";
		}else { //로그인 실패
			return 	"member/login_fail";
		}
	}	
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home.do";
	}
}
