package egovframework.security.web;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.security.dto.DeptDTO;
import egovframework.security.dto.OfficeSecurityDTO;
import egovframework.security.dto.PagingDTO;
import egovframework.security.dto.WatchKeepingDTO;
import egovframework.security.office.dao.SecurityOfficeDAO;
import egovframework.security.service.UserInfo;

@Controller
public class HomeController {

	@Autowired
	public SqlSession sqlSession;

	@Autowired
	private JavaMailSender mailSender;

	// User infomation
	UserInfo userInfo;

	// 서비스 시작 일자
	String startDate = "2017-10-23"; // 시작 날짜

	@RequestMapping("/aaa.do")
	public String aaa(Model model)  {
			return "security/aaa";
	}
	
	
	
	@RequestMapping("/showImage.do")
	public String showImage(@RequestParam("imgIdx") String imgIdx, Model model)  {
			try{
				model.addAttribute("imgIdx", imgIdx);
			}catch(Exception ex){
				System.out.println("예외처리 메시지 : " + ex.getMessage());
			}
			return "security/showImage";
		
	}
	
	
		@RequestMapping("/ShowImageFunc.do")
	public Boolean ShowImageFunc(@RequestParam("imgIdx") String imgIdx, HttpServletResponse response
            ,HttpServletRequest request) throws ServletException, IOException, SQLException  {
			try{
				
				SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
				String content_type = "image/png";
				response.setContentType(content_type);  // Content Type Set
				InputStream is = null;
			    /* DB의 BLOB 타입의 내용을 가져와서 bytes 변수에 담아보자. */
				if(dao.selectPicOfficeSecurityWithNoDao(Integer.parseInt(imgIdx)).getOs_image() == null)
					return false; //데이터가 없을 경우
		
			    byte[] bytes = dao.selectPicOfficeSecurityWithNoDao(Integer.parseInt(imgIdx)).getOs_image();
			    if (bytes == null)
			    	return false; //데이터가 없을 경우
			    
			    /* String --> InputStream 타입으로 변환 */
			    is = new ByteArrayInputStream(bytes);
			    
			    
			    /* 이제 OutputStream 으로 출력해보자*/
			    ServletOutputStream os = response.getOutputStream();
			    
			    int binaryRead;
			    
			    while ((binaryRead = is.read()) != -1)	{
			        os.write(binaryRead);
			    }

			}catch(Exception ex){
				System.out.println("예외처리 메시지 : " + ex.getMessage());
			}
			return true;
				

	}
		
	@RequestMapping("/test2.do")
	public String test2(Model model, HttpServletResponse response
            ,HttpServletRequest request) throws IOException {
		
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
	
		return "sample/test2";
	}

	@RequestMapping("/loginForm.do")
	public String loginForm(Model model) {
		return "security/loginForm";
	}

	@RequestMapping("/updateDept.do")
	public String updateDept(Locale locale, Model model) {
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());
		model.addAttribute("list", dao.selectDeptDao());
		System.out.print("updateManager");
		return "manage/updateDept";
	}

	@RequestMapping("/addDeptForm.do")
	public String addDeptForm(Locale locale, Model model) {
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());
		return "manage/addDeptForm";
	}

	// access_denied.do
	@RequestMapping("/access_denied.do")
	public String access_denied(HttpServletResponse response, Model model)
			throws IOException {
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());
		return "cmmn/access_denied";
	}

	@RequestMapping("/addDeptCheck.do")
	public String addDeptCheck(HttpServletRequest request, Model model) {
		// 추가한 부서 insert 처리
		String resultPage = "forward:/updateDept.do";

		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());
		DeptDTO deptDto;
		try {

			// 정보 가지고 오기
			request.setCharacterEncoding("EUC-KR");
			String deptName = request.getParameter("deptName"); // 부서이름
			deptDto = new DeptDTO(deptName);
			dao.insertDeptDao(deptDto);
		} catch (Exception exp) {
			System.out.println("예외처리 메시지 : " + exp.getMessage());
			resultPage = "cmmn/dataAccessFailure";
		}
		return resultPage;
	}

	@RequestMapping("/deleteDeptCheck.do")
	public String deleteDeptCheck(HttpServletRequest request, Model model) {
		// 추가한 부서 insert 처리
		String resultPage = "forward:/updateDept.do";

		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());
		DeptDTO deptDto;
		try {
			// 정보 가지고 오기
			int deptId = Integer.parseInt(request.getParameter("deptId")); // 부서이름
			deptDto = new DeptDTO(deptId);
			dao.deleteDeptDao(deptDto);
		} catch (Exception exp) {
			System.out.println("예외처리 메시지 : " + exp.getMessage());
			resultPage = "cmmn/dataAccessFailure";
		}
		return resultPage;
	}

	/**
	 * 사무실 보안점검 페이지(최종퇴실자 용)
	 */
	@RequestMapping("/officeSecurityForm.do")
	public String officeSecurityForm(Model model) throws Exception {
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());
		return "security/officeSecurityForm";
	}

	/**
	 * 사무실 보안점검 데이터 db에 저장(최종퇴실자 용)
	 */
	@RequestMapping("/officeSecurityCheck.do")
	public String officeSecurityCheck(HttpServletRequest request, Model model,
			@RequestParam("os_image") MultipartFile imageFile) throws Exception {

		String resultPage = "cmmn/saveDataSuccess";
		boolean SendEmail = false;
		Map<String, Object> imgMap = new HashMap<String, Object>();
		byte[] os_image = null;
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());

		OfficeSecurityDTO officeDTO;
		try {
			// 정보 가지고 오기
			request.setCharacterEncoding("EUC-KR");
			String os_empemail = request.getParameter("os_empemail"); // 직원번호
			int os_document = Integer.parseInt(request
					.getParameter("os_document"));
			// int os_deptcode =
			// Integer.parseInt(request.getParameter("os_deptcode"));
			int os_clean = Integer.parseInt(request.getParameter("os_clean"));
			int os_lightout = Integer.parseInt(request
					.getParameter("os_lightout"));
			int os_ventilation = Integer.parseInt(request
					.getParameter("os_ventilation"));
			int os_door = Integer.parseInt(request.getParameter("os_door"));
			String os_etc = request.getParameter("os_etc");
			if (!imageFile.isEmpty()) {
				os_image = imageFile.getBytes();
				imgMap.put("img", imageFile.getBytes());
			}

			HashMap map = dao.findDeptDao(os_empemail);
			int os_deptcode = (Integer) map.get("emp_deptcode");
			officeDTO = new OfficeSecurityDTO(os_empemail, os_deptcode,
					os_document, os_clean, os_lightout, os_ventilation,
					os_door, os_etc, os_image);

			// 당직자 이메일 구하기
			String fnUser = dao.selectEmailNightDutyWithDateDao();
			// 실행하는 날짜의 데이터가 있는지 확인
			HashMap OSMap = (HashMap) dao
					.selectOfficeSecurityWithDateDao(os_deptcode);
			// 지금 실시하고자 하는 최종퇴실자의 부서번호와 이미 db에 입력되어있는 부서번호를 비교하여 -> 있으면 : update
			// 및 alert() 발생 / 없으면 : insert
			if (OSMap == null) {
				// 데이터가 없을 시
				dao.insertOfficeSecurityDao(officeDTO);
				if (!fnUser.equals((String) os_empemail)) {
					// 당직자가 아닐 경우
					SendEmail = true;
				}
			} else {
				// 데이터가 있을 시
				// 기존 입력한 유저가 당직근무자면 에러발생, 최종퇴실자면 정상진행(os_empemail은 수정금지)
				// if 당직근무자 이메일과 여기 db의 이메일이 동일하면 에러발생, 그렇지 않으면 수정가능(단,
				// os_empemail은 수정금지)
				// 당직근무자 이메일(fnUser)

				officeDTO = new OfficeSecurityDTO((Integer) OSMap.get("os_id"),
						os_empemail, os_deptcode, os_document, os_clean,
						os_lightout, os_ventilation, os_door, os_etc, os_image);
				if (fnUser.equals((String) OSMap.get("os_empemail"))) {
					// 당직근무자가 이미 사무실보안점검을 한 경우
					dao.updateOfficeSecurityDao(officeDTO);
					SendEmail = true;
				} else {
					// 다른 최종퇴실자가 처리를 한 경우
					// 그래도 수정하는지 alert 발생 처리
					dao.updateOfficeSecurityDao(officeDTO);
				}
			}
			if (SendEmail) {
				// 성공할 시 메일 보내기
				Date dt = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat(
						"yyyy-MM-dd, a hh:mm:ss");
				String os_date = sdf.format(dt).toString();
				String setfrom = "limjihun204@gmail.com"; // 보내는 사람 이메일
				String title = "[" + os_date.toString() + "] "
						+ "사회보장정보원 사무실보안점검" + "(" + userInfo.getDeptName()
						+ ")" + "을 완료했습니다."; // 제목
				String content = "[" + os_date.toString() + "]경으로 "
						+ userInfo.getEmp_name() + "(" + userInfo.getDeptName()
						+ ")" + "님께서 사회보장정보원 사무실보안점검" + "("
						+ userInfo.getDeptName() + ")"
						+ "을 완료했습니다.\n자세한 내용은 홈페이지에서 확인바랍니다."; // 내용
				String tomail = (String) dao
						.selectDeptBossEmailDao(os_deptcode);// 받는 사람 이메일
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(
							message, true, "UTF-8");
					messageHelper.setFrom(setfrom); // 보내는사람
					messageHelper.setTo(tomail); // 받는사람 이메일
					messageHelper.setSubject(title); // 메일제목
					messageHelper.setText(content); // 메일 내용
					mailSender.send(message);
				} catch (Exception e) {
					System.out.println(e);
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
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());
		return "security/officeSecurityFNForm";
	}

	/**
	 * 사무실 보안점검 데이터 db에 저장(당직자 용)
	 */
	@RequestMapping("/officeSecurityFNCheck.do")
	public String officeSecurityFNCheck(HttpServletRequest request,
			Model model, @RequestParam("os_image") MultipartFile imageData)
			throws Exception {

		String resultPage = "";
		byte[] os_image = null;
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);

		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());
		OfficeSecurityDTO officeDTO;
		try {
			// 정보 가지고 오기
			request.setCharacterEncoding("EUC-KR");
			String os_empemail = request.getParameter("os_empemail"); // 직원번호
			int os_document = Integer.parseInt(request
					.getParameter("os_document"));
			int os_deptcode = Integer.parseInt(request
					.getParameter("os_deptcode"));
			int os_clean = Integer.parseInt(request.getParameter("os_clean"));
			int os_lightout = Integer.parseInt(request
					.getParameter("os_lightout"));
			int os_ventilation = Integer.parseInt(request
					.getParameter("os_ventilation"));
			int os_door = Integer.parseInt(request.getParameter("os_door"));
			String os_etc = request.getParameter("os_etc");

			if (!imageData.isEmpty()) {
				os_image = imageData.getBytes();
				
			}
			officeDTO = new OfficeSecurityDTO(os_empemail, os_deptcode,
					os_document, os_clean, os_lightout, os_ventilation,
					os_door, os_etc, os_image);

			// 실행하는 날짜의 데이터가 있는지 확인
			HashMap OSMap = (HashMap) dao
					.selectOfficeSecurityWithDateDao(os_deptcode);
			if (OSMap == null) {
				// 데이터가 없을 시
				System.out.println("기존 데이터가 없음");
				dao.insertOfficeSecurityDao(officeDTO);
			} else {
				// 데이터가 있을 시
				// 기존 입력한 유저가 당직근무자면 에러발생, 최종퇴실자면 정상진행(os_empemail은 수정금지)
				System.out.println("기존 데이터가 있음");
				System.out.println(OSMap);
				// if 당직근무자 이메일과 여기 db의 이메일이 동일하면 에러발생, 그렇지 않으면 수정가능(단,
				// os_empemail은 수정금지)
				// 당직근무자 이메일(fnUser)
				String fnUser = dao.selectEmailNightDutyWithDateDao();
				System.out.println("당직자 : " + fnUser);
				if (fnUser.equals((String) OSMap.get("os_empemail"))) {
					// 당직근무자가 이미 사무실보안점검을 한 경우
					resultPage = "cmmn/dataHasAlready";
					throw new Exception("당직근무자 중복실시 방지");
				} else {
					// 최종퇴실자가 이미 사무실보안점검을 한 경우
					officeDTO = new OfficeSecurityDTO(
							(Integer) OSMap.get("os_id"),
							(String) OSMap.get("os_empemail"), os_deptcode,
							os_document, os_clean, os_lightout, os_ventilation,
							os_door, os_etc, os_image);
					dao.updateOfficeSecurityDao(officeDTO);
				}
			}
			resultPage = "cmmn/saveDataSuccess";
		} catch (Exception exp) {
			System.out.println("예외처리 메시지 : " + exp.getMessage());
			if ("".equals(resultPage))
				resultPage = "cmmn/dataAccessFailure";
		}
		return resultPage;
	}

	/**
	 * 부서항목 관리 페이지
	 */
	@RequestMapping("/updateDeptForm.do")
	public String updateDeptForm(Model model) throws Exception {
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());
		return "manage/list_dept";
	}

	/**
	 * 부서항목 db 업데이트 처리
	 */
	@RequestMapping("/updateDeptCheck.do")
	public String updateDeptCheck(HttpServletRequest request, Model model)
			throws Exception {
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());

		DeptDTO deptDTO = new DeptDTO();

		// 정보 가지고 오기
		request.setCharacterEncoding("EUC-KR");
		String deptName = request.getParameter("name");
		System.out.print("updateDeptCheck : " + deptName);
		// 정보를 가지고 와서 db에 입력
		deptDTO.setDeptName(deptName);
		dao.insertDeptDao(deptDTO);

		return "forward:/";
	}

	/**
	 * 메인메뉴
	 */
	@RequestMapping("/mainmenu.do")
	public String mainMenu(Model model) throws Exception {
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);

		// 부서 총 수
		int deptTotalNum = dao.selectNDeptDao();
		// 부서 이름
		String[] strDeptName = new String[deptTotalNum];
		// 부서 별 미실시 횟수
		int[] numNonImplement = new int[deptTotalNum];
		// 부서 별 보안점수 (월 단위)
		int[] scoreDeptList = new int[deptTotalNum];
		// 항목 별 보안점수 (db 전체)
		float[] scoreEachList = new float[5];
		// 항목 별 자신 부서 보안점수
		int[] scoreMyDeptEachList = new int[5];

		// userInfo 구하기
		HashMap empMap = dao.selectEmpWithIdDao(SecurityContextHolder
				.getContext().getAuthentication().getName());
		String emp_name = (String) empMap.get("emp_name");
		int os_deptcode = (Integer) empMap.get("emp_deptcode");
		String deptName = (String) dao.selectDeptNameDao(os_deptcode);
		String emp_role = (String) empMap.get("emp_role");
		String emp_rank = (String) empMap.get("emp_rank");
		String auth = "";

		userInfo = new UserInfo(os_deptcode, deptName, emp_name, emp_role,
				emp_rank);

		if ("ROLE_USER".equals(emp_role))
			auth = "일반사용자";
		else
			auth = "관리자";

		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());

		// smart 도표 구하기
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM");
		String now_date = sdf.format(dt).toString();
		String month_date = sdf2.format(dt).toString();

		String endDate = now_date; // 오늘 날짜
		long diffDateAsDay = 0;
		// String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면 컴파일러에서
		// 에러가 발생해서 컴파일을 할 수 없다.
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		// date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
		Date FirstDate = format.parse(startDate);
		Date SecondDate = format.parse(endDate);
		long calDate = FirstDate.getTime() - SecondDate.getTime();

		// Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다.
		// 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
		diffDateAsDay = calDate / (24 * 60 * 60 * 1000);
		diffDateAsDay = Math.abs(diffDateAsDay);
		int temp = 0;
		int max = 0;
		for (int i = 1; i <= deptTotalNum; i++) {
			temp = i - 1;
			strDeptName[temp] = dao.selectTotalDeptDao(i); // 부서 이름 넣기
			if (dao.selectCheckScoreDeptOfficeDao(i) != 0)
				//부서 별 보안점수 넣기(당원 데이터만 해당)
				scoreDeptList[temp] = dao.selectScoreDeptOfficeDao(i);
			else
				scoreDeptList[temp] = 0; // 부서 별 보안점수 넣기(당월 데이터만 해당)
			numNonImplement[temp] = ((int) diffDateAsDay - dao
					.selectNumImplementDao(i));// 전체일 수 - 실시일 수
			if (numNonImplement[temp] > max)
				max = numNonImplement[temp];
		}
		int maxNum = (max / 10) + 10;
		// ArrayList<Integer> tempArray = dao.selectScoreListOfficeDao();
		// System.out.println("aaab : "+ tempArray.size());
		// for(int i=0; i<5; i++){
		// scoreEachList[i] = tempArray.get(i).intValue();
		// System.out.println("aaa : "+i +":"+ scoreEachList[i]);
		// }

		scoreEachList[0] = dao.selectScoreDocumentDao();
		scoreEachList[1] = dao.selectScoreCleanDao();
		scoreEachList[2] = dao.selectScoreLightoutDao();
		scoreEachList[3] = dao.selectScoreVentilationDao();
		scoreEachList[4] = dao.selectScoreDoorDao();
		
		model.addAttribute("month_date", month_date);
		model.addAttribute("maxNumBar", maxNum);
		model.addAttribute("nameDept", strDeptName);
		model.addAttribute("numNonImplement", numNonImplement);
		model.addAttribute("scoreDeptList", scoreDeptList);
		model.addAttribute("scoreEachList", scoreEachList);
		model.addAttribute("scoreMyDeptEachList", scoreMyDeptEachList);

		return "menu/mainmenu";
	}

	/**
	 * 사무실 보안점검 - 최종퇴실자 또는 당직근무자 선택
	 */
	@RequestMapping("/officeSecurityChoice.do")
	public String menuChoice(Model model, HttpServletResponse response)
			throws Exception {
		String resultPage = "/";
		String fnUser = "";
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());

		// 당직자면 당직자페이지로, 아니면 최종퇴실자페이지로 이동
		if (dao.selectNumNightDutyWithDateDao() > 0) // 오늘 당직자가 있으면
			fnUser = dao.selectEmailNightDutyWithDateDao(); // fnUser : 오늘의 당직자
															// id
		else {
			// db에 오늘 당직자가 설정 안되어 있는 경우
			return "cmmn/dataAccessFailure";
		}

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		System.out.println("로그인 정보 : " + auth.getDetails());
		if (fnUser.equals(auth.getName())) {
			// 당직자인 경우
			resultPage = "forward:/officeSecurityFNForm.do";
		} else {
			// 최종퇴실자인 경우
			resultPage = "forward:/officeSecurityForm.do";
		}

		return resultPage;
	}

	/**
	 * 사무실보안점검 리스트 조회
	 */
	@RequestMapping("/listOfficeSecurity.do")
	public String listOfficeSecurity(HttpServletRequest request, Model model)
			throws Exception {
		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			PagingDTO pageInfo;
			model.addAttribute("emp_name", userInfo.getEmp_name());
			model.addAttribute("deptName", userInfo.getDeptName());
			model.addAttribute("auth", userInfo.getAuth());
			// 현재 로그인 정보 가져오기
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			System.out.println("로그인 정보 : " + auth.getDetails());
			// 페이지 번호 가져옴
			long pageNum = (long) Integer
					.parseInt(request.getParameter("page"));
			if (pageNum <= 0)
				pageNum = 1;

			// 관리자 정보 가져오기
			ArrayList managerList = dao.selectManagerDao();
			// 권한에 따라 다르게 출력
			if (managerList.contains(auth.getName())) {
				// 관리자일 경우 모두 출력
				// 페이지에 대한 정보 입력 및 전달
				// 파라미터 -> 총 페이지 수, 클릭한 페이지 넘버 전달
				pageInfo = new PagingDTO(dao.selectNumTotalListOfOfficeDao(), pageNum);
				model.addAttribute("paging", pageInfo);
				// 파라미터 -> (클릭한 페이지 넘버 -1) * rows
				model.addAttribute("list", dao.selectOfficeSecurityDao((long) ((pageNum - 1) * pageInfo.getRows())));
			} else {
				// 일반유저일 경우 해당 부서만 출력
				// 사용자의 부서정보 가져옴
				int userDept = dao.selectDeptWithIdDao(auth.getName());
				// 페이지에 대한 정보 입력 및 전달
				// 파라미터 -> 총 페이지 수, 클릭한 페이지 넘버 전달
				pageInfo = new PagingDTO(
						dao.selectNumTotalListOfOfficeWithDeptDao(userDept),
						pageNum);
				model.addAttribute("paging", pageInfo);

				Map map = new HashMap();
				map.put("userDept", (int) userDept);
				map.put("page", (long) ((pageNum - 1) * pageInfo.getRows()));

				model.addAttribute("list", dao.selectOfficeSecurityWithDeptDao(map));
			    
			}

		} catch (Exception exp) {
			System.out.println(exp);
		}
		return "list/listOfficeSecurity";
	}

	/**
	 * 당직점검 DB에 저장
	 */
	@RequestMapping("/watchKeepingForm.do")
	public String watchKeepingForm(Model model, HttpServletResponse response) {
		// 당직자인지 확인해서 아니면 경고표시 후 back 시킴
		String resultPage = "cmmn/dataAccessFailure";
		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			model.addAttribute("emp_name", userInfo.getEmp_name());
			model.addAttribute("deptName", userInfo.getDeptName());
			model.addAttribute("auth", userInfo.getAuth());
			// 당직자 정보 가져오기
			String fnUser = dao.selectEmailNightDutyWithDateDao();
			// 현재 로그인 정보 가져오기
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();

			if (fnUser.equals((String) auth.getName())) {
				// 당직근무자와 접속자가 같은 경우와 이미 실행된 적이 없으면 실행
				if (dao.selectNumWatchKeepingDao() < 1) {
					resultPage = "security/watchKeepingForm";
				} else {
					// 이미 실행된 경우
					resultPage = "cmmn/dataHasAlready";
				}
			} else {
				// 당직근무자와 접속자가 다른 경우 경고 후 뒤로 돌아가기
				response.setCharacterEncoding("EUC-KR");
				PrintWriter writer = response.getWriter();
				writer.println("<script type='text/javascript'>");
				writer.println("alert('당직자가 아닙니다.');");
				writer.println("history.back();");
				writer.println("</script>");
				writer.flush();
				return null;
			}

		} catch (Exception exp) {
			System.out.println(exp.getMessage());
			resultPage = "cmmn/dataAccessFailure";
		}
		return resultPage;
	}

	/**
	 * 사무실보안점검 리스트 DB에 저장
	 */
	@RequestMapping("/watchKeepingCheck.do")
	public String watchKeepingCheck(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		String resultPage = "cmmn/saveDataSuccess";
		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			model.addAttribute("emp_name", userInfo.getEmp_name());
			model.addAttribute("deptName", userInfo.getDeptName());
			model.addAttribute("auth", userInfo.getAuth());
			WatchKeepingDTO wkDTO;
			// 정보 가지고 오기
			request.setCharacterEncoding("EUC-KR");
			String wk_empemail = request.getParameter("wk_empemail"); //
			String wk_indication = request.getParameter("wk_indication"); //
			String wk_measure = request.getParameter("wk_measure"); //
			int wk_mpd = Integer.parseInt(request.getParameter("wk_mpd"));
			int wk_vmd = Integer.parseInt(request.getParameter("wk_vmd"));
			int wk_hmd = Integer.parseInt(request.getParameter("wk_hmd"));
			int wk_csd = Integer.parseInt(request.getParameter("wk_csd"));
			int wk_itd = Integer.parseInt(request.getParameter("wk_itd"));
			int wk_wio = Integer.parseInt(request.getParameter("wk_wio"));
			int wk_wim = Integer.parseInt(request.getParameter("wk_wim"));
			int wk_hwd = Integer.parseInt(request.getParameter("wk_hwd"));
			int wk_sii = Integer.parseInt(request.getParameter("wk_sii"));
			String wk_specificity = request.getParameter("wk_specificity");
			String wk_report = request.getParameter("wk_report");
			String wk_delivery = request.getParameter("wk_delivery");
			// 정보를 가지고 와서 db에 입력
			wkDTO = new WatchKeepingDTO(wk_empemail, wk_indication, wk_measure,
					wk_mpd, wk_vmd, wk_hmd, wk_csd, wk_itd, wk_wio, wk_wim,
					wk_hwd, wk_sii, wk_specificity, wk_report, wk_delivery);
			dao.insertWatchKeepingDao(wkDTO);

			// 성공할 시 메일 보내기
			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat(
					"yyyy-MM-dd, a hh:mm:ss");
			String os_date = sdf.format(dt).toString();
			String setfrom = "limjihun204@gmail.com"; // 보내는 사람 이메일
			String title = "[" + os_date.toString() + "] "
					+ "사회보장정보원 당직점검을 완료했습니다."; // 제목
			String content = "[" + os_date.toString() + "]경으로 "
					+ userInfo.getEmp_name() + "(" + userInfo.getDeptName()
					+ ")" + "님께서 사회보장정보원 당직점검을 완료했습니다.\n자세한 내용은 홈페이지에서 확인바랍니다."; // 내용
			int count = dao.selectManagerCheckEmailNumDao(); // 보내는 사람이 몇명인지 확인
			while (count-- > 0) {
				String tomail = (String) dao.selectManagerCheckEmailDao()
						.get(count).get("emp_email");// 받는 사람 이메일
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(
							message, true, "UTF-8");
					messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
					messageHelper.setTo(tomail); // 받는사람 이메일
					messageHelper.setSubject(title); // 메일제목
					messageHelper.setText(content); // 메일 내용
					mailSender.send(message);
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		} catch (Exception exp) {
			System.out.println(exp.getMessage());
			resultPage = "cmmn/dataAccessFailure";
		}
		// 성공적으로 데이터가 저장된 경우
		System.out.println(resultPage);
		return resultPage;
	}

	/**
	 * 당직근무일지 리스트 조회
	 */
	@RequestMapping("/listWatchKeeping.do")
	public String listWatchKeeping(HttpServletRequest request, Model model)
			throws Exception {
		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			PagingDTO pageInfo;

			/* 밑에 코드 수정해야 함 */
			model.addAttribute("emp_name", userInfo.getEmp_name());
			model.addAttribute("deptName", userInfo.getDeptName());
			model.addAttribute("auth", userInfo.getAuth());

			// 페이지 번호 가져옴
			long pageNum = (long) Integer
					.parseInt(request.getParameter("page"));
			if (pageNum <= 0)
				pageNum = 1;
			// 페이지에 대한 정보 입력 및 전달
			// 파라미터 -> 총 페이지 수, 클릭한 페이지 넘버 전달
			pageInfo = new PagingDTO(dao.selectNumTotalListOfNightDutyDao(), pageNum);
			model.addAttribute("paging", pageInfo);
			model.addAttribute("list", dao.selectWatchKeepingDao((long) ((pageNum - 1) * pageInfo.getRows())));
		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		}
		return "list/listWatchKeeping";
	}
	
	/**
	 * 당직근무일지 내용 조회
	 */
	@RequestMapping("/contentWatchKeeping.do")
	public String contentWatchKeeping(HttpServletRequest request, Model model)
			throws Exception {
		try {
			SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
			PagingDTO pageInfo;

			model.addAttribute("emp_name", userInfo.getEmp_name());
			model.addAttribute("deptName", userInfo.getDeptName());
			model.addAttribute("auth", userInfo.getAuth());

			// id 가져옴
			String id = request.getParameter("id");
			if (id == null)
				return "cmmn/dataAccessFailure";
			model.addAttribute("data", dao.selectWatchKeepingWithIdDao(Integer.parseInt(id)));
			model.addAttribute("deptNum", dao.selectDeptNumDao());
			
		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		}
		return "list/contentWatchKeeping";
	}
	
	/**
	 * 당직근무일지 내용 출력
	 */
	@RequestMapping("/extractWatchKeeping.do")
	public String extractWatchKeeping(HttpServletRequest request, Model model) throws Exception {
		
			try {
				SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
				PagingDTO pageInfo;
				
				Date dt = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd. EEE", Locale.KOREA);
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
				String today = sdf.format(dt).toString();
				String filename ="("+sdf2.format(dt).toString()+")";
				
				model.addAttribute("emp_name", userInfo.getEmp_name());
				model.addAttribute("deptName", userInfo.getDeptName());
				model.addAttribute("auth", userInfo.getAuth());

				// id 가져옴
				String id = request.getParameter("id");
				if (id == null)
					return "cmmn/dataAccessFailure";
				model.addAttribute("data", dao.selectWatchKeepingWithIdDao(Integer.parseInt(id)));
				// 밑에 각 부서의 총 인원 수 가져올 수 있도록 수정
				model.addAttribute("listDeptNum", dao.selectDeptNumDao());
				model.addAttribute("today", today);
				model.addAttribute("filename", filename);
				
			} catch (Exception exp) {
				System.out.println(exp.getMessage());
			}
			return "security/extractWatchKeeping";
	}

	/**
	 * 당직근무자 변경하기
	 * ------------------------------------------------------------------
	 */
	@RequestMapping("/changeWatchKeeperCheck.do")
	public String changeWatchKeeper(HttpServletRequest request, Model model)
			throws Exception {
		String resultPage = "cmmn/saveDataSuccess";
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());
		return resultPage;
	}

	/*
	 * 보안담당자 관리updateManager.do
	 */
	// 관리자 리스트 출력
	@RequestMapping("/updateManager.do")
	public String updateManager(HttpServletRequest request, Model model)
			throws Exception {
		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			model.addAttribute("emp_name", userInfo.getEmp_name());
			model.addAttribute("deptName", userInfo.getDeptName());
			model.addAttribute("auth", userInfo.getAuth());
			model.addAttribute("list", dao.selectAllManagerDao());
		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		}
		return "manage/updateManager";
	}

	// 관리자 권한 삭제
	@RequestMapping("/deleteManagerCheck.do")
	public String deleteManagerCheck(HttpServletRequest request, Model model)
			throws Exception {
		String resultPage = "forward:/updateManager.do";

		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			model.addAttribute("emp_name", userInfo.getEmp_name());
			model.addAttribute("deptName", userInfo.getDeptName());
			model.addAttribute("auth", userInfo.getAuth());
			// 정보 가지고 오기
			String emp_email = request.getParameter("emp_email"); // 부서이름
			if (dao.countManagerDao() > 1) {
				dao.updateAuthEmpDao(emp_email);
			} else {
				// 최소 관리자는 1명 이상이여야 하므로 경고 팝업 띄움
				throw new Exception("관리자는 최소 1명 이상이여야 합니다.");
			}

		} catch (Exception exp) {
			System.out.println(exp.getMessage());
			resultPage = "cmmn/dataAccessFailure";
		}
		return resultPage;
	}

	// 관리자 권한 추가 양식
	@RequestMapping("/addManagerForm.do")
	public String addManagerForm(Locale locale, Model model) {
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());
		model.addAttribute("list", dao.selectEmployeeNotManagerDao());
		return "manage/addManagerForm";
	}

	// 관리자 권한 추가
	@RequestMapping("/addManagerCheck.do")
	public String addManagerCheck(HttpServletRequest request, Model model) {
		// 추가한 부서 insert 처리
		String resultPage = "forward:/updateManager.do";

		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		model.addAttribute("emp_name", userInfo.getEmp_name());
		model.addAttribute("deptName", userInfo.getDeptName());
		model.addAttribute("auth", userInfo.getAuth());
		try {
			// 정보 가지고 오기
			request.setCharacterEncoding("EUC-KR");
			String[] emp_emailList = request.getParameterValues("emp_emails"); // 추가시킬
																				// 이메일
																				// 리스트
			for (String val : emp_emailList) {
				dao.addManagerDao((String) val);
			}

		} catch (Exception exp) {
			System.out.println("예외처리 메시지 : " + exp.getMessage());
			resultPage = "cmmn/dataAccessFailure";
		}
		return resultPage;
	}

	// 스마트 보안솔루션
	@RequestMapping("/smartSecuritySolution.do")
	public String smartSecuritySolution(HttpServletRequest request, Model model) {

		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		String resultPage = "security/smartSecuritySolution";
		// 부서 총 수
		int deptTotalNum = dao.selectNDeptDao();
		// 부서 이름
		String[] strDeptName = new String[deptTotalNum];
		// 부서 별 미실시 횟수
		int[] numNonImplement = new int[deptTotalNum];
		// 부서 별 보안점수 (월 단위)
		int[] scoreDeptList = new int[deptTotalNum];
		// 항목 별 보안점수 (db 전체)
		float[] scoreEachList = new float[5];
		// 항목 별 자신 부서 보안점수
		int[] scoreMyDeptEachList = new int[5];
		try {
			model.addAttribute("emp_name", userInfo.getEmp_name());
			model.addAttribute("deptName", userInfo.getDeptName());
			model.addAttribute("auth", userInfo.getAuth());

			// /
			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("MM");
			String now_date = sdf.format(dt).toString();
			String month_date = sdf2.format(dt).toString();

			// String startDate = "2017-10-23"; //시작 날짜
			String endDate = now_date; // 오늘 날짜
			long diffDateAsDay = 0;
			// String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면
			// 컴파일러에서 에러가 발생해서 컴파일을 할 수 없다.
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			// date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
			Date FirstDate = format.parse(startDate);
			Date SecondDate = format.parse(endDate);
			long calDate = SecondDate.getTime() - FirstDate.getTime();
			
			// Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다.
			// 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
			diffDateAsDay = Math.abs(calDate / (24 * 60 * 60 * 1000));

			int temp = 0;
			int max = 0;
			for (int i = 1; i <= deptTotalNum; i++) {
				temp = i - 1;
				strDeptName[temp] = dao.selectTotalDeptDao(i); // 부서 이름 넣기
				if (dao.selectCheckScoreDeptOfficeDao(i) != 0)
					// 부서 별 보안점수 넣기(당월 데이터만 해당)
					scoreDeptList[temp] = dao.selectScoreDeptOfficeDao(i); 
				else
					scoreDeptList[temp] = 0; // 부서 별 보안점수 넣기(당월 데이터만 해당)
				numNonImplement[temp] = ((int) diffDateAsDay - dao.selectNumImplementDao(i));// 전체일 수 - 실시일 수
				if (numNonImplement[temp] > max)
					max = numNonImplement[temp];
			}
			int maxNum = ((max / 10)+1) * 10;
			
			// 평균 데이터
			HashMap<String, BigDecimal> totalScore = dao.selectScoreDao();
			scoreEachList[0] = Math.round(((BigDecimal)totalScore.get("sum(os_document)")).intValueExact()/(float)deptTotalNum);
			scoreEachList[1] = Math.round(((BigDecimal)totalScore.get("sum(os_clean)")).intValueExact()/(float)deptTotalNum);
			scoreEachList[2] = Math.round(((BigDecimal)totalScore.get("sum(os_lightout)")).intValueExact()/(float)deptTotalNum);
			scoreEachList[3] = Math.round(((BigDecimal)totalScore.get("sum(os_ventilation)")).intValueExact()/(float)deptTotalNum);
			scoreEachList[4] = Math.round(((BigDecimal)totalScore.get("sum(os_door)")).intValueExact()/(float)deptTotalNum);
			
			// 자기 부서 데이터
			HashMap<String, BigDecimal> ownScore = dao.selectScoreWithDeptDao(userInfo.getOs_deptcode());
			scoreMyDeptEachList[0] = ((BigDecimal)ownScore.get("sum(os_document)")).intValueExact();
			scoreMyDeptEachList[1] = ((BigDecimal)ownScore.get("sum(os_clean)")).intValueExact(); 
			scoreMyDeptEachList[2] = ((BigDecimal)ownScore.get("sum(os_lightout)")).intValueExact(); 
			scoreMyDeptEachList[3] = ((BigDecimal)ownScore.get("sum(os_ventilation)")).intValueExact();
			scoreMyDeptEachList[4] = ((BigDecimal)ownScore.get("sum(os_door)")).intValueExact();
			
			float max2 = 0;
			for(int i =0;i<scoreEachList.length;i++){
				if(scoreEachList[i] > max2)
					max2 = scoreEachList[i];
				if(scoreMyDeptEachList[i] > max2)
					max2 = scoreMyDeptEachList[i];
			}
			int stepSize2=1;
			if(max2<10)
				stepSize2 = 1;
			else if(max2<100)
				stepSize2 = 10;
			else if(max2<1000)
				stepSize2 = 100;
			else
				stepSize2 = 1000;
			
			model.addAttribute("month_date", month_date);
			model.addAttribute("maxNumBar", maxNum);
			model.addAttribute("nameDept", strDeptName);
			model.addAttribute("numNonImplement", numNonImplement);
			model.addAttribute("scoreDeptList", scoreDeptList);
			model.addAttribute("scoreEachList", scoreEachList);
			model.addAttribute("scoreMyDeptEachList", scoreMyDeptEachList);
			model.addAttribute("max2", max2);
			model.addAttribute("stepSize2", stepSize2);
			
			
		} catch (Exception exp) {
			System.out.println("예외처리 메시지 : " + exp.getMessage());
			System.out.println("예외처리 메시지 : " + exp.getCause());
			exp.printStackTrace();
			resultPage = "cmmn/dataAccessFailure";
		}
		return resultPage;

	}

	// 당직테이블
	@RequestMapping("/nightDutyTable.do")
	public String nightDutyTable(HttpServletRequest request, Model model) {
		String resultPage = "security/nightDutyTable";
		String year = null;
		String month = null;
		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			
			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String now_month = sdf.format(dt).toString();
			String today = sdf2.format(dt).toString();
			
			model.addAttribute("emp_name", userInfo.getEmp_name());
			model.addAttribute("deptName", userInfo.getDeptName());
			model.addAttribute("auth", userInfo.getAuth());
			
			//int year = Integer.parseInt(request.getParameter("year"));
			month = request.getParameter("month");
			if(year == null)
				year = "2017";
			if(month == null)
				month = now_month;
			//db에 넘겨주는 데이터 값 : yyyy-mm-% 
			String value = month + "-%";
			if ("1".equals(month))
				model.addAttribute("list", dao.selectNightDutyOnlyMeDao(SecurityContextHolder.getContext().getAuthentication().getName()));
			else
				model.addAttribute("list", dao.selectNightDutyWithMonthDao(value));
			//model.addAttribute("list", dao.selectNightDutyDao());  //전체출력
			//오늘 날짜 전달
			model.addAttribute("today", today);
			
		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		}
		return resultPage;
	}

}
