package kr.co.there;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.there.member.service.MemberService;
import kr.co.there.mzbbs.service.MzbbsService;
import kr.co.there.place.service.PlaceService;

@Controller
public class AdminIndexController {
	@Autowired
	PlaceService placeService;
	@Autowired
	MemberService memberService;
	@Autowired
	MzbbsService mzbbsService;
	

	@RequestMapping("/admin")
	public String index(Model model) throws SQLException {
		ClassPathResource resource = new ClassPathResource("");
		System.out.println(resource.getPath());
		model.addAttribute("plList", placeService.list());
		model.addAttribute("mbrList",memberService.list());
		model.addAttribute("mzList",mzbbsService.list());
		return "admin/index";
	}

}
