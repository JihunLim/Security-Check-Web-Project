package egovframework.security.web;


import java.util.ArrayList;
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
import egovframework.security.dto.WatchKeepingDTO;
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
		 * 사무실 보안점검 페이지(최종퇴실자 용)
		 */
		@RequestMapping("/officeSecurityForm.do")
		public String officeSecurityForm(Model model) throws Exception {
		
			return "security/officeSecurityForm";
		}
		
		/**
		 * 사무실 보안점검 데이터 db에 저장(최종퇴실자 용)
		 */
		@RequestMapping("/officeSecurityCheck.do")
		public String officeSecurityCheck(HttpServletRequest request, Model model) throws Exception {
			
			String resultPage = "forward:/";
			
			SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
			
			 OfficeSecurityDTO officeDTO;
			 try {
			 	//정보 가지고 오기
				request.setCharacterEncoding("EUC-KR");
				String os_empemail = request.getParameter("os_empemail"); //직원번호
				int os_document = Integer.parseInt(request.getParameter("os_document"));
				//int os_deptcode = Integer.parseInt(request.getParameter("os_deptcode"));
				int os_clean = Integer.parseInt(request.getParameter("os_clean"));
				int os_lightout = Integer.parseInt(request.getParameter("os_lightout"));
				int os_ventilation = Integer.parseInt(request.getParameter("os_ventilation"));
				int os_door = Integer.parseInt(request.getParameter("os_door"));
				String os_etc = request.getParameter("os_etc");
				HashMap map = dao.findDeptDao(os_empemail);
				int os_deptcode = (Integer) map.get("emp_deptcode");
				System.out.println("officeSecurityCheck가 실행됐습니다 : " + os_empemail);
				officeDTO = new OfficeSecurityDTO(os_empemail, os_deptcode, os_document, os_clean, os_lightout, os_ventilation, os_door, os_etc);
				
				//실행하는 날짜의 데이터가 있는지 확인
				 HashMap OSMap = (HashMap)dao.selectOfficeSecurityWithDateDao(os_deptcode);
					//지금 실시하고자 하는 최종퇴실자의 부서번호와 이미 db에 입력되어있는 부서번호를 비교하여 -> 있으면 : update 및 alert() 발생 / 없으면 : insert
					if (OSMap == null) {
						// 데이터가 없을 시
						System.out.println("기존 데이터가 없음");
						dao.insertOfficeSecurityDao(officeDTO);
					} else {
						// 데이터가 있을 시
						// 기존 입력한 유저가 당직근무자면 에러발생, 최종퇴실자면 정상진행(os_empemail은 수정금지)
						System.out.println("기존 데이터가 있음");
						//if 당직근무자 이메일과 여기 db의 이메일이 동일하면 에러발생, 그렇지 않으면 수정가능(단, os_empemail은 수정금지)
						//당직근무자 이메일(fnUser)
						String fnUser = dao.selectEmpFNDao().get(0);
						System.out.println("오늘 당직자 : " + fnUser);
						officeDTO = new OfficeSecurityDTO((Integer) OSMap.get("os_id"), os_empemail, os_deptcode, os_document, os_clean, os_lightout, os_ventilation, os_door, os_etc);
						if (fnUser.equals((String)OSMap.get("os_empemail"))){
							//당직근무자가 이미 사무실보안점검을 한 경우
							dao.updateOfficeSecurityDao(officeDTO);
						}
						else {
							//다른 최종퇴실자가 처리를 한 경우 
							//그래도 수정하는지 alert 발생 처리
							//~~~
							dao.updateOfficeSecurityDao(officeDTO);
						}
					}
				} catch (Exception exp) {
					System.out.println("예외처리 메시지 : " + exp.getCause());
					resultPage = "cmmn/dataAccessFailure";
				}
				return resultPage;
			}
		
		/**
		 * 사무실 보안점검 페이지(당직자 용)
		 */
		@RequestMapping("/officeSecurityFNForm.do")
		public String officeSecurityFNForm(Model model) throws Exception {
		
			return "security/officeSecurityFNForm";
		}
		
		/**
		 * 사무실 보안점검 데이터 db에 저장(당직자 용)
		 */
		@RequestMapping("/officeSecurityFNCheck.do")
		public String officeSecurityFNCheck(HttpServletRequest request, Model model) throws Exception {
			
			String resultPage = "forward:/";
			
			SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
			
			 OfficeSecurityDTO officeDTO;
			 try {
				 	//정보 가지고 오기
					request.setCharacterEncoding("EUC-KR");
					String os_empemail = request.getParameter("os_empemail"); //직원번호
					int os_document = Integer.parseInt(request.getParameter("os_document"));
					int os_deptcode = Integer.parseInt(request.getParameter("os_deptcode"));
					int os_clean = Integer.parseInt(request.getParameter("os_clean"));
					int os_lightout = Integer.parseInt(request.getParameter("os_lightout"));
					int os_ventilation = Integer.parseInt(request.getParameter("os_ventilation"));
					int os_door = Integer.parseInt(request.getParameter("os_door"));
					String os_etc = request.getParameter("os_etc");
					System.out.println("officeSecurityCheck가 실행됐습니다 : " + os_empemail);
					officeDTO = new OfficeSecurityDTO(os_empemail, os_deptcode, os_document, os_clean, os_lightout, os_ventilation, os_door, os_etc);
					 
					//실행하는 날짜의 데이터가 있는지 확인
					 HashMap OSMap = (HashMap) dao.selectOfficeSecurityWithDateDao(os_deptcode);
					if (OSMap == null) {
						// 데이터가 없을 시
						System.out.println("기존 데이터가 없음");
						dao.insertOfficeSecurityDao(officeDTO);
					} else {
						// 데이터가 있을 시
						// 기존 입력한 유저가 당직근무자면 에러발생, 최종퇴실자면 정상진행(os_empemail은 수정금지)
						System.out.println("기존 데이터가 있음");
						System.out.println(OSMap);
						//if 당직근무자 이메일과 여기 db의 이메일이 동일하면 에러발생, 그렇지 않으면 수정가능(단, os_empemail은 수정금지)
						//당직근무자 이메일(fnUser)
						String fnUser = dao.selectEmpFNDao().get(0);
						System.out.println("당직자 : "+fnUser);
						if (fnUser.equals((String)OSMap.get("os_empemail"))){
							//당직근무자가 이미 사무실보안점검을 한 경우
							throw new Exception("당직근무자 중복실시 방지");
						}
						else {
							//최종퇴실자가 이미 사무실보안점검을 한 경우
							officeDTO = new OfficeSecurityDTO((Integer) OSMap.get("os_id"), (String)OSMap.get("os_empemail"), os_deptcode, os_document, os_clean, os_lightout, os_ventilation, os_door, os_etc);
							dao.updateOfficeSecurityDao(officeDTO);
						}
					}
				} catch (Exception exp) {
					System.out.println("예외처리 메시지 : " + exp.getMessage());
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
//			String resultPage = "/";
//			SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
//			// 당직자면 당직자페이지로, 아니면 최종퇴실자페이지로 이동
//			String fnUser = dao.selectEmpFNDao().get(0);
//			if (fnUser.equals(내 id)){
//				//당직자면
//				resultPage = "forward:/officeSecurityFNCheck.do";
//			}else{
//				resultPage = "forward:/officeSecurityCheck.do";
//			}
			
			
			return "menu/officeSecurityChoice";
			//return resultPage;
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
		
		/**
		 * 사무실보안점검 리스트 DB에 저장
		 */
		@RequestMapping("/watchKeepingForm.do")
		public String watchKeepingForm(Model model) throws Exception {
			return "security/watchKeepingForm";
		}
		
		
		/**
		 * 사무실보안점검 리스트 DB에 저장
		 */
		@RequestMapping("/watchKeepingCheck.do")
		public String watchKeepingCheck(HttpServletRequest request, Model model) throws Exception {
			String resultPage = "forward:/";
			try{
				SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
				
				 WatchKeepingDTO wkDTO;
				 //정보 가지고 오기
				request.setCharacterEncoding("EUC-KR");
			    //Date os_date = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(request.getParameter("os_date"));
				String wk_empemail = request.getParameter("wk_empemail"); //직원번호
				String wk_indication = request.getParameter("wk_indication"); //직원번호
				String wk_measure = request.getParameter("wk_measure"); //직원번호
				int wk_na = Integer.parseInt(request.getParameter("wk_na"));
				int wk_nb = Integer.parseInt(request.getParameter("wk_nb"));
				int wk_nc = Integer.parseInt(request.getParameter("wk_nc"));
				int wk_nd = Integer.parseInt(request.getParameter("wk_nd"));
				int wk_ne = Integer.parseInt(request.getParameter("wk_ne"));
				int wk_nf = Integer.parseInt(request.getParameter("wk_nf"));
				int wk_ng = Integer.parseInt(request.getParameter("wk_ng"));
				int wk_nh = Integer.parseInt(request.getParameter("wk_nh"));
				int wk_ni = Integer.parseInt(request.getParameter("wk_ni"));
				String wk_specificity = request.getParameter("wk_specificity");
				String wk_report = request.getParameter("wk_report");
				String wk_delivery = request.getParameter("wk_delivery");
			    System.out.print("watchKeepingForm이 실행됐습니다 : ");
			    //정보를 가지고 와서 db에 입력
			    
			    wkDTO = new WatchKeepingDTO(wk_empemail, wk_indication, wk_measure, wk_na, wk_nb, wk_nc, wk_nd, wk_ne, wk_nf, wk_ng, wk_nh, wk_ni, wk_specificity, wk_report, wk_delivery);
			    
			    dao.insertWatchKeepingDao(wkDTO);
			}catch(Exception exp){
				System.out.println(exp.getMessage());
				resultPage = "cmmn/dataAccessFailure";
			}
			return resultPage;
		}
	
		/**
		 * 당직근무자 리스트 조회 
		 */
		@RequestMapping("/listWatchKeeping.do")
		public String listWatchKeeping(Model model) throws Exception {
			try{
				SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		        model.addAttribute("list", dao.selectWatchKeepingDao());
		        System.out.print("listWatchKeeping");
			}catch(Exception exp){
				System.out.println(exp.getMessage());
			}
				return "list/listWatchKeeping";
		}
		
		
		


}
