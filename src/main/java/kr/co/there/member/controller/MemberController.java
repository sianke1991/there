package kr.co.there.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.there.member.model.entity.MemberVo;
import kr.co.there.member.service.MemberService;

@Controller
//@RequestMapping("/admin")
public class MemberController {
	@Autowired
	MemberService memberService;

	//------ admin --------
	@GetMapping(value = "/admin/member")
	public String list(Model model,HttpServletRequest req) throws Exception {
		try {
			if(req.getSession()==null || (int)req.getSession().getAttribute("sessionAuth")!=1) {
				return "redirect:/";
			}
		} catch(NullPointerException e) { //세션 값이 들어있지 않은 경우 이 예외가 발생하는 듯 하다. 즉, 로그아웃 상태에서 어드민 페이지를 요청할 때 예외를 잡고 메인페이지를 보여준다.
			return "redirect:/";
		}
		model.addAttribute("mbrList", memberService.list());
		return "/admin/member/memberList";
	}
	
	//------ home --------
	@GetMapping("/member/join")
	public String join() {
		
		return "/home/member/join";
	}
	
	@PostMapping("/member/join")
	public String join(MemberVo bean) throws Exception {
		memberService.add(bean);
		return "/home/index";
	}
	
	@PostMapping("/member/login")
	public String loginResult(MemberVo bean, HttpServletRequest req,Model model) throws Exception {
		int isLogin=memberService.isLogin(bean.getMember_id(), bean.getMember_pw());
		if(isLogin==1) {
			req.getSession().setAttribute("success", true);
			req.getSession().setAttribute("sessionId", bean.getMember_id());
			req.getSession().setAttribute("sessionAuth", memberService.One(bean.getMember_id()).getMember_authid());
			return "redirect:/";
		}
		else if(isLogin==0) {
			model.addAttribute("showWarning",1);
			model.addAttribute("mbrbean",bean);
			return "/home/member/login";
		}
		else {
			model.addAttribute("showWarning",2);
			model.addAttribute("mbrbean",bean);
			return "/home/member/login";
		}
	}
	
	@GetMapping("/member/login")
	public String login(Model model) {
		model.addAttribute("showWarning",0);
		model.addAttribute("mbrbean",new MemberVo());
		return "/home/member/login";
	}
	
	@GetMapping("/member/logout")
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/member/findId")
	public String findIdPage() throws Exception {
		return "/home/member/findId";
	}
	
	@GetMapping("/member/findPw")
	public String findPwPage() throws Exception {
		return "/home/member/findPw";
	}
	
	@GetMapping("/member/mypage")
	public String toMypage(Model model,HttpServletRequest req) throws Exception{
		if((boolean)req.getSession().getAttribute("success")!=true)
			return "redirect:/";
		String member_id=(String)req.getSession().getAttribute("sessionId");
		model.addAttribute("mbrbean",memberService.One(member_id));
		model.addAttribute("myMzList",memberService.myMzList(member_id));
		model.addAttribute("myPlList",memberService.myPlList(member_id));
		model.addAttribute("myRvList",memberService.myRvList(member_id));
		return "/home/member/mypage";
	}
	
	@PostMapping("/member/change")
	public String changeInfo(MemberVo mbrbean) throws Exception{
		memberService.edit(mbrbean);
		return "redirect:/member/mypage";
	}
	
	@PostMapping("/member/out")
	public String out(String member_id) throws Exception {
		memberService.remove(member_id);
		return "redirect:/member/logout";
	}
	
	
	//------ AJAX --------
	@ResponseBody
	@PostMapping("/member/checkid")
	public boolean checkId(String member_id) throws Exception {
		return memberService.isIdUnique(member_id);
	}
	
	@ResponseBody
	@PostMapping("member/checkemail")
	public boolean checkEmail(String member_email) throws Exception {
		return memberService.isEmailUnique(member_email);
	}
	
	@ResponseBody
	@PostMapping("member/checktel")
	public boolean checkTel(String member_tel) throws Exception {
		return memberService.isTelUnique(member_tel);
	}
	
	@ResponseBody
	@PostMapping("member/getid")
	public String getId(String member_name,String member_tel) throws Exception {
		return memberService.getId(member_name, member_tel);
	}
	
	@ResponseBody
	@PostMapping("member/getpwans")
	public String getPwans(String member_id,String member_tel) throws Exception {
		return memberService.getPwans(member_id, member_tel);
	}
	
	@ResponseBody
	@PostMapping("member/checknewemail")
	public boolean checkNewEmail(String member_id,String member_email) throws Exception{
		return memberService.isNewEmailUnique(member_id, member_email);
	}
	
	@ResponseBody
	@PostMapping("member/checknewtel")
	public boolean checkNewTel(String member_id,String member_tel) throws Exception{
		return memberService.isNewTelUnique(member_id, member_tel);
	}
	
	@ResponseBody
	@PostMapping("member/rejoin")
	public boolean rejoin(String member_id,String member_pw) throws Exception{
		return memberService.rejoin(member_id,member_pw);
	}
	
}