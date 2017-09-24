package egovframework.security.web;

import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.security.dto.DeptDTO;
import egovframework.security.office.dao.SecurityOfficeDAO;

@Controller
public class HomeController {
	
	@Autowired
	public SqlSession sqlSession;

	
	@RequestMapping("/")
	public String start( Model model){
		return "security/index";
	}
	
	@RequestMapping("/login.do")
	public String login( Model model){
		return "security/login";
	}

	@RequestMapping("/manage.do")
	public String manage( Model model){
		return "security/manage";
	}
	
	@RequestMapping("/loginForm.do")
	public String loginForm( Model model){
		return "security/loginForm";
	}
	
	 @RequestMapping(value = "/manage.do", method = RequestMethod.GET)
	    public String home(Locale locale, Model model) {
	        SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
	        model.addAttribute("list", dao.selectDeptDao());
	        
	        return "security/manage";
	 }


}
