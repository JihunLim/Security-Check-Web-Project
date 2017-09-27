package egovframework.security.web;


import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.security.dto.DeptDTO;
import egovframework.security.dto.OfficeSecurityDTO;
import egovframework.security.office.dao.SecurityOfficeDAO;

@Controller
public class HomeController {
	
	@Autowired
	public SqlSession sqlSession;

	
	@RequestMapping("/basicTutorial")
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
	
	@RequestMapping("/updateDept.do")
    public String home(Locale locale, Model model) {
        SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
        model.addAttribute("list", dao.selectDeptDao());
        System.out.print("updateManager");
        return "manage/updateDept";
     }
	
	 
		/**
		 * 사무실 보안점검 페이지
		 */
		@RequestMapping("/officeSecurityForm.do")
		public String officeSecurityForm(Model model) throws Exception {
		
			return "security/officeSecurityForm";
		}
		
		/**
		 * 사무실 보안점검 데이터 db에 저장
		 */
		@RequestMapping("/officeSecurityCheck.do")
		public String officeSecurityCheck(HttpServletRequest request, Model model) throws Exception {
			String resultPage = "forward:/";
			try{
				SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
				
				 OfficeSecurityDTO officeDTO;
				 //정보 가지고 오기
				request.setCharacterEncoding("EUC-KR");
			    //Date os_date = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(request.getParameter("os_date"));
				String os_empemail = request.getParameter("os_empemail"); //직원번호
				int os_document = Integer.parseInt(request.getParameter("os_document"));
				int os_clean = Integer.parseInt(request.getParameter("os_clean"));
				int os_lightout = Integer.parseInt(request.getParameter("os_lightout"));
				int os_ventilation = Integer.parseInt(request.getParameter("os_ventilation"));
				int os_door = Integer.parseInt(request.getParameter("os_door"));
				String os_etc = request.getParameter("os_etc");
				System.out.println(dao.findDeptDao(os_empemail));
				HashMap map = dao.findDeptDao(os_empemail);
				int os_deptcode = (Integer) map.get("emp_deptcode");
			    System.out.print("officeSecurityCheck가 실행됐습니다 : " + os_document);
			    //정보를 가지고 와서 db에 입력
			    
			    officeDTO = new OfficeSecurityDTO(os_empemail, os_deptcode, os_document, os_clean, os_lightout, os_ventilation, os_door, os_etc);
			    System.out.print("5\n");
			    dao.insertOfficeSecurityDao(officeDTO);
			}catch(Exception exp){
				System.out.println(exp.getMessage());
				resultPage = "cmmn/dataAccessFailure";
			}
			return resultPage;
		}
		
		/**
		 * 부서항목 관리 페이지
		 */
		@RequestMapping("/updateDeptForm.do")
		public String updateDeptForm(Model model) throws Exception {
			return "manage/list_dept";
		}
		
		/**
		 * 부서항목 db 업데이트 처리
		 */
		@RequestMapping("/updateDeptCheck.do")
		public String updateDeptCheck(HttpServletRequest request, Model model) throws Exception {
			SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
			 DeptDTO deptDTO = new DeptDTO();
			 
			 //정보 가지고 오기
			 request.setCharacterEncoding("EUC-KR");
			 String deptName = request.getParameter("name");
			 System.out.print("updateDeptCheck : " + deptName);
			 //정보를 가지고 와서 db에 입력
			 deptDTO.setDeptName(deptName);
			 dao.insertDeptDao(deptDTO);
			
			return "forward:/";
		}
		
		/**
		 * 메인메뉴 
		 */
		@RequestMapping("/mainmenu.do")
		public String mainMenu(Model model) throws Exception {
			return "menu/mainmenu";
		}
		
		/**
		 * 사무실 보안점검 - 최종퇴실자 또는 당직근무자 선택 
		 */
		@RequestMapping("/officeSecurityChoice.do")
		public String menuChoice(Model model) throws Exception {
			return "menu/officeSecurityChoice";
		}
		
		/**
		 * 사무실보안점검 리스트 조회 
		 */
		@RequestMapping("/listOfficeSecurity.do")
		public String listOfficeSecurity(Model model) throws Exception {
			try{
				SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		        model.addAttribute("list", dao.selectOfficeSecurityDao());
		        System.out.print("listOfficeSecurity");
			}catch(Exception exp){
				System.out.println(exp);
			}
				return "list/listOfficeSecurity";
		}
		
		
		
		
		
		
		
		
		


}
