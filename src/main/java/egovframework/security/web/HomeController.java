package egovframework.security.web;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import egovframework.security.dto.NightDutyDTO;
import egovframework.security.dto.OfficeSecurityDTO;
import egovframework.security.dto.PagingDTO;
import egovframework.security.dto.PrintOfficeDTO;
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
	String startDate = "2017-10-30"; // 시작 날짜
	// 메일 서비스 보내는 사람 이메일
	String setfrom = "limjihun204@gmail.com";
	// 사무실보안점검 위치 표 색상 결정 배열
	int[] status = new int[]{1,1,1,1,1,1,1,1,1,1};
	// 당직자 3일 전 이메일 알람 서비스 
	boolean statusForND = false;

	public void getUserInfo(Model model) throws Exception{
		// userInfo 구하기
				SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
				//User 객체가 null이면 실행, null이 아니면 실행하지 않음
				
					HashMap empMap = dao.selectEmpWithIdDao(SecurityContextHolder.getContext().getAuthentication().getName());
					String emp_name = (String) empMap.get("emp_name");
					int os_deptcode = (Integer) empMap.get("emp_deptcode");
					String deptName = (String) dao.selectDeptNameDao(os_deptcode);
					String emp_role = (String) empMap.get("emp_role");
					String emp_rank = (String) empMap.get("emp_rank");
					String auth = "";
					
					userInfo = new UserInfo(os_deptcode, deptName, emp_name, emp_role, emp_rank);

					if ("ROLE_USER".equals(emp_role))
						auth = "일반사용자";
					else
						auth = "관리자";

				
				
				model.addAttribute("emp_name", userInfo.getEmp_name());
				model.addAttribute("deptName", userInfo.getDeptName());
				model.addAttribute("auth", userInfo.getAuth());
	}
	
	@RequestMapping("/showImage.do")
	public String showImage(@RequestParam("imgIdx") String imgIdx, Model model) {
		try {
			model.addAttribute("imgIdx", imgIdx);
		} catch (Exception ex) {
			System.out.println("예외처리 메시지 : " + ex.getMessage());
		}
		return "security/showImage";

	}

	@RequestMapping("/ShowImageFunc.do")
	public Boolean ShowImageFunc(@RequestParam("imgIdx") String imgIdx,
			HttpServletResponse response, HttpServletRequest request)
			throws ServletException, IOException, SQLException {
		try {

			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			String content_type = "image/jpg";
			response.setContentType(content_type); // Content Type Set
			InputStream is = null;
			/* DB의 BLOB 타입의 내용을 가져와서 bytes 변수에 담아보자. */
			if (dao.selectPicOfficeSecurityWithNoDao(Integer.parseInt(imgIdx))
					.getOs_image() == null)
				return false; // 데이터가 없을 경우

			byte[] bytes = dao.selectPicOfficeSecurityWithNoDao(
					Integer.parseInt(imgIdx)).getOs_image();
			if (bytes == null)
				return false; // 데이터가 없을 경우

			/* String --> InputStream 타입으로 변환 */
			is = new ByteArrayInputStream(bytes);

			/* 이제 OutputStream 으로 출력해보자 */
			ServletOutputStream os = response.getOutputStream();

			int binaryRead;

			while ((binaryRead = is.read()) != -1) {
				os.write(binaryRead);
			}

		} catch (Exception ex) {
			System.out.println("예외처리 메시지 : " + ex.getMessage());
		}
		return true;

	}

	@RequestMapping("/test2.do")
	public String test2(Model model, HttpServletResponse response,
			HttpServletRequest request) throws IOException {

		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);

		return "sample/test2";
	}

	@RequestMapping("/loginForm.do")
	public String loginForm(Model model) {
		return "security/loginForm";
	}

	@RequestMapping("/updateDept.do")
	public String updateDept(Locale locale, Model model) throws Exception {
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		getUserInfo(model);
		model.addAttribute("list", dao.selectDeptDao());
		System.out.print("updateManager");
		return "manage/updateDept";
	}

	@RequestMapping("/addDeptForm.do")
	public String addDeptForm(Locale locale, Model model) throws Exception {
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		getUserInfo(model);
		return "manage/addDeptForm";
	}

	@RequestMapping("/addDeptCheck.do")
	public String addDeptCheck(HttpServletRequest request, Model model) throws Exception {
		// 추가한 부서 insert 처리
		String resultPage = "forward:/updateDept.do";

		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		getUserInfo(model);//사용자 정보를 가져옴
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
	public String deleteDeptCheck(HttpServletRequest request, Model model) throws Exception {
		// 추가한 부서 insert 처리
		//String resultPage = "forward:/updateDept.do";
		String resultPage = "cmmn/blockFunction";
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		getUserInfo(model);//사용자 정보를 가져옴
		DeptDTO deptDto;
		try {
			// 정보 가지고 오기
			int deptId = Integer.parseInt(request.getParameter("deptId")); // 부서이름
			deptDto = new DeptDTO(deptId);
			//dao.deleteDeptDao(deptDto);
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
		getUserInfo(model);//사용자 정보를 가져옴
		/*
		 * 1. 오늘 날짜(now())와 부서번호를 조건으로 사무실 점검 데이터가 있는 지 확인
		 * 2. 있으면 -> 리스트로 가져옴 (dept 총원 가져오는 것 참고)
		 * 3. 없으면 -> -1 (int 형)으로 채움 array.fill 함수 사용
		 * 4. view 로 넘겨줌
		 */
		int[] checkData = new int[]{-1,-1,-1,-1,-1};
		String etc = "";
		HashMap OSMap = (HashMap) dao.checkOfficeSecurityWithDateDao(userInfo.getOs_deptcode());
		// 지금 실시하고자 하는 최종퇴실자의 부서번호와 이미 db에 입력되어있는 부서번호를 비교하여 -> 있으면 : update
		// 및 alert() 발생 / 없으면 : insert
		if (OSMap == null) {
			// 데이터가 없을 시
		} else {
			// 데이터가 있을 시
			checkData[0] = (Integer) OSMap.get("os_document");  
			checkData[1] = (Integer) OSMap.get("os_clean");
			checkData[2] = (Integer) OSMap.get("os_lightout");
			checkData[3] = (Integer) OSMap.get("os_ventilation");
			checkData[4] = (Integer) OSMap.get("os_door");
			etc = (String) OSMap.get("os_etc");
		}
		model.addAttribute("checkData",checkData);
		model.addAttribute("etc", etc);
		return "security/officeSecurityForm";
	}

	/**
	 * 사무실 보안점검 데이터 db에 저장(최종퇴실자 용)
	 */
	@RequestMapping("/officeSecurityCheck.do")
	public String officeSecurityCheck(HttpServletRequest request, Model model,
			@RequestParam("os_image") MultipartFile imageFile) throws Exception {

		String resultPage = "cmmn/saveDataSuccess";
		String strReSend = "";
		boolean SendEmail = false;
		Map<String, Object> imgMap = new HashMap<String, Object>();
		byte[] os_image = null;
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		getUserInfo(model);//사용자 정보를 가져옴
		boolean hasImage = true;

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
			}else{
				//이미지가 없는 경우
				hasImage = false;
			}

			HashMap map = dao.findDeptDao(os_empemail);
			int os_deptcode = (Integer) map.get("emp_deptcode");
			officeDTO = new OfficeSecurityDTO(os_empemail, os_deptcode,
					os_document, os_clean, os_lightout, os_ventilation,
					os_door, os_etc, os_image);

			// 당직자 이메일 구하기
			String fnUser = dao.selectEmailNightDutyWithDateDao();
			// 실행하는 날짜의 데이터가 있는지 확인
			HashMap OSMap = (HashMap) dao.checkOfficeSecurityWithDateDao(os_deptcode);
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
				
				
				//이미지가 있을 경우
				if(hasImage == true){
					dao.updateOfficeSecurityDao(officeDTO);
				}else{
					//이미지가 없을 경우
					dao.updateOfficeSecurityNoImageDao(officeDTO);
				}
				SendEmail = true;
				
				if (fnUser.equals((String) OSMap.get("os_empemail"))) {
					// 당직근무자가 이미 사무실보안점검을 한 경우
					
				} else {
					// 다른 최종퇴실자가 처리를 한 경우
					// 중복실시할 경우 이메일을 보내지 않게 할 경우 하단을 false로 변경할 것
					strReSend = "(재실시)";
				}
				
				
			}
			
			if (SendEmail) {
				// 성공할 시 메일 보내기
				Date dt = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, a hh:mm:ss");
				String os_date = sdf.format(dt).toString();
				String setfrom = "limjihun204@gmail.com"; // 보내는 사람 이메일
				String title = "[" + os_date.toString() + "] "
						+ "사회보장정보원 사무실보안점검" + "(" + userInfo.getDeptName()
						+ ")" + "을 완료했습니다."; // 제목
				String content = strReSend+"[" + os_date.toString() + "]경으로 "
						+ userInfo.getEmp_name() + "(" + userInfo.getDeptName()
						+ ")" + "님께서 사회보장정보원 사무실보안점검" + "("
						+ userInfo.getDeptName() + ")"
						+ "을 완료했습니다.\n자세한 내용은 홈페이지에서 확인바랍니다."; // 내용
				String tomail = (String) dao.selectDeptBossEmailDao(os_deptcode);// 받는 사람 이메일
				System.out.println("보내는사람 : "+tomail);
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
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
		getUserInfo(model);//사용자 정보를 가져옴
		model.addAttribute("status", status);
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
		//부서 위치 표의 색상을 결정
		boolean hasImage = true;
		
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);

		getUserInfo(model);//사용자 정보를 가져옴
		OfficeSecurityDTO officeDTO;
		try {
			//status 값이 모두 -1(실행)이면 1로 초기화
			boolean bool_temp = true;
			for(int n : status){
				if(n == 1)
					bool_temp = false;
			}
			if(bool_temp == true) {
				//초기화
				for(int i=0;i<status.length;i++){
					status[i] = 1;
				}
					
			}
			
			// 정보 가지고 오기
			request.setCharacterEncoding("EUC-KR");
			String os_empemail = request.getParameter("os_empemail"); // 직원번호
			int os_document = Integer.parseInt(request.getParameter("os_document"));
			int os_deptcode = Integer.parseInt(request.getParameter("os_deptcode"));
			int os_clean = Integer.parseInt(request.getParameter("os_clean"));
			int os_lightout = Integer.parseInt(request.getParameter("os_lightout"));
			int os_ventilation = Integer.parseInt(request.getParameter("os_ventilation"));
			int os_door = Integer.parseInt(request.getParameter("os_door"));
			String os_etc = request.getParameter("os_etc");
			
			//이미지가 있을 시 이미지를 바이트로 변환하여 저장
			if (!imageData.isEmpty()) {
				os_image = imageData.getBytes();
			}else{
				//이미지가 없을 경우
				hasImage = false;
			}
			
			//결과를 객체에 저장시킴
			officeDTO = new OfficeSecurityDTO(os_empemail, os_deptcode,
					os_document, os_clean, os_lightout, os_ventilation,
					os_door, os_etc, os_image);
			int temp = os_deptcode - 1;
			// 실행하는 날짜의 데이터가 있는지 확인
			HashMap OSMap = (HashMap) dao.checkOfficeSecurityWithDateDao(os_deptcode);
			if (OSMap == null) {
				// 데이터가 없을 시 저장시킨 객체를 db에 저장
				dao.insertOfficeSecurityDao(officeDTO);
				status[temp] *= -1; 
			} else {
				// 데이터가 있을 시 update 시킴 	
				officeDTO = new OfficeSecurityDTO(
						(Integer) OSMap.get("os_id"),
						(String) OSMap.get("os_empemail"), os_deptcode,
						os_document, os_clean, os_lightout, os_ventilation,
						os_door, os_etc, os_image);
				// 이미지가 있을 경우
				if(hasImage == true){
					dao.updateOfficeSecurityDao(officeDTO);
					status[temp] *= -1; 
				}else{
					// 이미지가 없을 경우
					dao.updateOfficeSecurityNoImageDao(officeDTO);
					status[temp] *= -1;
				}
				
			}
			
			resultPage = "cmmn/saveDataSuccessForOffFn";
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
		getUserInfo(model);//사용자 정보를 가져옴
		return "manage/list_dept";
	}

	/**
	 * 부서항목 db 업데이트 처리
	 */
	@RequestMapping("/updateDeptCheck.do")
	public String updateDeptCheck(HttpServletRequest request, Model model)
			throws Exception {
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		getUserInfo(model);//사용자 정보를 가져옴

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
		Boolean SendEmail = false;
		getUserInfo(model);//사용자 정보를 가져옴
		// 그래프 관련 코드
		// 부서 총 수
		int deptTotalNum = 10;//dao.selectNDeptDao();
		// 부서 이름
		String[] strDeptName = new String[]{"경영기획본부","정보기술본부","고객지원본부","정보개발본부","복지정보본부","보건의료본부","희망복지중앙지원단","바우처관리본부","바우처정보본부","사회보장연구소"};
		// 부서 별 보안점수 (월 단위)
		int[] scoreDeptList = new int[deptTotalNum];
		// 항목 별 보안점수 (db 전체)
		float[] scoreEachList = new float[5];
		// 항목 별 자신 부서 보안점수
		int[] scoreMyDeptEachList = new int[5];
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM");
		String now_date = sdf.format(dt).toString();
		String month_date = sdf2.format(dt).toString();

		// String startDate = "2017-10-23"; //시작 날짜
		String endDate = now_date; // 오늘 날짜
		// String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면
		// 컴파일러에서 에러가 발생해서 컴파일을 할 수 없다.
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		// date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
		Date FirstDate = format.parse(startDate);
		Date SecondDate = format.parse(endDate);
		long calDate = SecondDate.getTime() - FirstDate.getTime();

		int temp = 0;
		int max = 0;
		for (int i = 1; i <= deptTotalNum; i++) {
			temp = i - 1;
			//strDeptName[temp] = dao.selectTotalDeptDao(i); // 부서 이름 넣기
			if (dao.selectCheckScoreDeptOfficeDao(i) != 0)
				// 부서 별 보안점수 넣기(당월 데이터만 해당)
				scoreDeptList[temp] = dao.selectScoreDeptOfficeDao(i);
			else
				scoreDeptList[temp] = 0; // 부서 별 보안점수 넣기(당월 데이터만 해당)
		}
		int maxNum = ((max / 10) + 1) * 10;

		// 평균 데이터
		HashMap<String, BigDecimal> totalScore = dao.selectScoreDao();
		scoreEachList[0] = Math.round(((BigDecimal) totalScore
				.get("sum(os_document)")).intValueExact()
				/ (float) deptTotalNum);
		scoreEachList[1] = Math.round(((BigDecimal) totalScore
				.get("sum(os_clean)")).intValueExact()
				/ (float) deptTotalNum);
		scoreEachList[2] = Math.round(((BigDecimal) totalScore
				.get("sum(os_lightout)")).intValueExact()
				/ (float) deptTotalNum);
		scoreEachList[3] = Math.round(((BigDecimal) totalScore
				.get("sum(os_ventilation)")).intValueExact()
				/ (float) deptTotalNum);
		scoreEachList[4] = Math.round(((BigDecimal) totalScore
				.get("sum(os_door)")).intValueExact()
				/ (float) deptTotalNum);

		// 자기 부서 데이터
		HashMap<String, BigDecimal> ownScore = dao
				.selectScoreWithDeptDao(userInfo.getOs_deptcode());
		scoreMyDeptEachList[0] = ((BigDecimal) ownScore
				.get("sum(os_document)")).intValueExact();
		scoreMyDeptEachList[1] = ((BigDecimal) ownScore
				.get("sum(os_clean)")).intValueExact();
		scoreMyDeptEachList[2] = ((BigDecimal) ownScore
				.get("sum(os_lightout)")).intValueExact();
		scoreMyDeptEachList[3] = ((BigDecimal) ownScore
				.get("sum(os_ventilation)")).intValueExact();
		scoreMyDeptEachList[4] = ((BigDecimal) ownScore.get("sum(os_door)"))
				.intValueExact();

		float max2 = 0;
		for (int i = 0; i < scoreEachList.length; i++) {
			if (scoreEachList[i] > max2)
				max2 = scoreEachList[i];
			if (scoreMyDeptEachList[i] > max2)
				max2 = scoreMyDeptEachList[i];
		}
		int stepSize2 = 1;
		if (max2 < 10)
			stepSize2 = 1;
		else if (max2 < 100)
			stepSize2 = 10;
		else if (max2 < 1000)
			stepSize2 = 100;
		else
			stepSize2 = 1000;

		model.addAttribute("month_date", month_date);
		model.addAttribute("maxNumBar", maxNum);
		model.addAttribute("nameDept", strDeptName);
		model.addAttribute("scoreDeptList", scoreDeptList);
		model.addAttribute("scoreEachList", scoreEachList);
		model.addAttribute("scoreMyDeptEachList", scoreMyDeptEachList);
		model.addAttribute("max2", max2);
		model.addAttribute("stepSize2", stepSize2);
		
		/*
		 * 당직자 메일 알림 서비스 (3일 전) 
		 * status <- false
		 * 1. if 4일전 && status가 true면 (초기화)
		         status <- false
		 *    else if 3일전 && status가 false면
		 *       당직자에게 메일보내기
		 *       status <- true
		 */
		
		//3일 후의 당직자 정보를 가져온다.
		NightDutyDTO ndt = null;
		if(dao.checkNightDutyEmailAfter3DayDao(3)>0){
			ndt = dao.selectNightDutyEmailAfter3DayDao(3);
		}
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-mm-dd");
		String date1 = "2000-01-01";
		String nowDate = format2.format(dt).toString();
	    
	    Date FirstDate2 = format2.parse(date1);
        Date SecondDate2 = format2.parse(nowDate);
        long calDate2 = FirstDate2.getTime() - SecondDate2.getTime();
        long calDateDays = calDate2 / ( 24*60*60*1000);
        calDateDays = Math.abs(calDateDays);
        int todayNum = (int) (calDateDays % 2);
        int temp_num = todayNum;
        if(temp_num != todayNum){
        	//하루가 바뀐 것임
        	statusForND = false;
        }
        //당직자에게 메일 보내기
        if(!statusForND && ndt != null){
        	//매일 1번씩 3일 후에 있는 당직자에게 메일 보내기
        	// 성공할 시 메일 보내기
        				String setfrom = "limjihun204@gmail.com"; // 보내는 사람 이메일
        				String title = "[사회보장정보원] ** 3일 전 당직알림 서비스 **"; // 제목
        				String content = "귀하는 ["+ndt.getNd_date()+"]에 당직임을 3일 전에 알려드립니다. \n\n자세한 내용은 홈페이지에서 확인바랍니다.";
        				String tomail = ndt.getNd_empemail();// 받는 사람 이메일
        				try {
        					MimeMessage message = mailSender.createMimeMessage();
        					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
        					messageHelper.setFrom(setfrom); // 보내는사람
        					messageHelper.setTo(tomail); // 받는사람 이메일
        					messageHelper.setSubject(title); // 메일제목
        					messageHelper.setText(content); // 메일 내용
        					mailSender.send(message);
        				} catch (Exception e) {
        					System.out.println(e);
        				}
        				//메일 보냈으면 true로 하루 내 이메일 재 발송 방지
        				statusForND = true;
        }

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
		getUserInfo(model);//사용자 정보를 가져옴

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
			getUserInfo(model);//사용자 정보를 가져옴
			// 현재 로그인 정보 가져오기
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			System.out.println("로그인 정보 : " + auth.getDetails());
			// 클라이언트에서 보낸 정보 받아오기
			long pageNum = (long) Integer.parseInt(request.getParameter("page"));
			int selectedDept = (request.getParameter("changeDept") == null ? 0
					: Integer.parseInt(request.getParameter("changeDept")));
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			if (pageNum <= 0)
				pageNum = 1;

			// 관리자 정보 가져오기
			ArrayList managerList = dao.selectManagerDao();
			// 권한에 따라 다르게 출력
			if (managerList.contains(auth.getName())) {
				// 관리자일 경우 모두 출력

				/*
				 * 경우의 수 1. 부서선택과 기간선택 모두 2. 부서선택만 3. 기간선택만
				 */
				Map map = new HashMap();
				if (selectedDept != 0 && startDate != null && endDate != null
						&& !"".equals(startDate) && !"".equals(endDate)) {
					// case 1 : 부서선택과 기간선택 모두
					map.put("userDept", selectedDept);
					map.put("startDate", startDate);
					map.put("endDate", endDate);
					// 페이지에 대한 정보 입력 및 전달, 파라미터 -> 총 페이지 수, 클릭한 페이지 넘버 전달
					pageInfo = new PagingDTO(
							dao.selectNumTotalListOfMOfficeWithDeptAndDateDao(map),
							pageNum);
					model.addAttribute("paging", pageInfo);
					// 파라미터 -> (클릭한 페이지 넘버 -1) * rows
					map.put("page", (long) ((pageNum - 1) * pageInfo.getRows()));
					model.addAttribute("list",
							dao.selectOfficeSecurityWithDeptAndDateDao(map));
				} else if (selectedDept != 0
						&& !(startDate != null && endDate != null
								&& !"".equals(startDate) && !"".equals(endDate))) {
					// case 2 : 부서선택만 한 경우
					map.put("userDept", selectedDept);
					// 페이지에 대한 정보 입력 및 전달, 파라미터 -> 총 페이지 수, 클릭한 페이지 넘버 전달
					pageInfo = new PagingDTO(
							dao.selectNumTotalListOfMOfficeWithDeptDao(map),
							pageNum);
					model.addAttribute("paging", pageInfo);
					// 파라미터 -> (클릭한 페이지 넘버 -1) * rows
					map.put("page", (long) ((pageNum - 1) * pageInfo.getRows()));
					model.addAttribute("list",
							dao.selectOfficeSecurityWithDeptDao(map));
				} else if (selectedDept == 0 && startDate != null
						&& endDate != null && !"".equals(startDate)
						&& !"".equals(endDate)) {
					// case 3 : 기간선택만 한 경우
					map.put("startDate", startDate);
					map.put("endDate", endDate);
					// 페이지에 대한 정보 입력 및 전달, 파라미터 -> 총 페이지 수, 클릭한 페이지 넘버 전달
					pageInfo = new PagingDTO(
							dao.selectNumTotalListOfMOfficeWithDateDao(map),
							pageNum);
					model.addAttribute("paging", pageInfo);
					// 파라미터 -> (클릭한 페이지 넘버 -1) * rows
					map.put("page", (long) ((pageNum - 1) * pageInfo.getRows()));
					model.addAttribute("list",
							dao.selectOfficeSecurityWithDateDao(map));
				} else {
					// 모두 선택하지 않은 경우
					// 페이지에 대한 정보 입력 및 전달, 파라미터 -> 총 페이지 수, 클릭한 페이지 넘버 전달
					pageInfo = new PagingDTO(
							dao.selectNumTotalListOfMOfficeDao(), pageNum);
					model.addAttribute("paging", pageInfo);
					// 파라미터 -> (클릭한 페이지 넘버 -1) * rows
					model.addAttribute(
							"list",
							dao.selectOfficeSecurityDao((long) ((pageNum - 1) * pageInfo
									.getRows())));
				}

			} else {
				// 일반유저일 경우 해당 부서만 출력
				// 사용자의 부서정보 가져옴
				int userDept = dao.selectDeptWithIdDao(auth.getName());
				Map map = new HashMap();
				map.put("userDept", (int) userDept);
				// 검색을 한 경우 (기간 선택)
				if (startDate != null && endDate != null
						&& !"".equals(startDate) && !"".equals(endDate)) {
					map.put("startDate", startDate);
					map.put("endDate", endDate);
					// 페이지에 대한 정보 입력 및 전달, 파라미터 -> 총 페이지 수, 클릭한 페이지 넘버 전달
					pageInfo = new PagingDTO(
							dao.selectNumTotalListOfOfficeWithDeptAndDateDao(map),
							pageNum);
					model.addAttribute("paging", pageInfo);
					map.put("page", (long) ((pageNum - 1) * pageInfo.getRows()));
					model.addAttribute("list",
							dao.selectOfficeSecurityWithDeptAndDateDao(map));
				} else {
					// 검색을 하지 않은 경우(기본)
					// 페이지에 대한 정보 입력 및 전달, 파라미터 -> 총 페이지 수, 클릭한 페이지 넘버 전달
					pageInfo = new PagingDTO(
							dao.selectNumTotalListOfOfficeWithDeptDao(userDept),
							pageNum);
					model.addAttribute("paging", pageInfo);
					map.put("page", (long) ((pageNum - 1) * pageInfo.getRows()));
					model.addAttribute("list",
							dao.selectOfficeSecurityWithDeptDao(map));
				}
			}

		} catch (Exception exp) {
			System.out.println(exp);
		}
		return "list/listOfficeSecurity";
	}

	/**
	 * 사무실보안일지 출력
	 */
	@RequestMapping("/extractOfficeSecurity.do")
	public String extractOfficeSecurity(HttpServletRequest request, Model model)
			throws Exception {

		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			PagingDTO pageInfo;
			Map map = new HashMap();
			getUserInfo(model);//사용자 정보를 가져옴
			// id 가져옴
			String param_date = request.getParameter("date");
			String param_dept = request.getParameter("dept");
			if (param_date == null || param_dept == null)
				return "cmmn/dataAccessFailure";
			
			map.put("param_date", param_date);
			
			// 일반사용자일 경우 자신 부서로, 관리자일 경우 검색이 0(선택안함)이면 자신부서, 0이 아니면 검색한 부서로 출력***
			map.put("param_dept", Integer.parseInt(param_dept));
			model.addAttribute("deptName", dao.selectDeptNameDao(Integer.parseInt(param_dept)));
			
			List<PrintOfficeDTO> listOSDto = dao.printOfficeSecurityWithDateDao(map);
			model.addAttribute("list", listOSDto);
			model.addAttribute("ndData", dao.printOfficeSecurityWithDateForNDDao(map));
			// 파일 이름
			Date dt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss",Locale.KOREA).parse(listOSDto.get(0).getOs_datetime());
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
			String tempName = "사무실점검(" + sdf2.format(dt).toString() + ").xls";
			String fileName = new String(tempName.getBytes("UTF-8"), "ISO-8859-1");
			//String fileName = "OfficeSecurityReport.xls";
			model.addAttribute("fileName", fileName);


		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		}
		return "security/extractOfficeSecurity";
	}

	/**
	 * 당직점검 DB에 저장
	 */
	@RequestMapping("/watchKeepingForm.do")
	public String watchKeepingForm(Model model, HttpServletResponse response) {
		// 당직자인지 확인해서 아니면 경고표시 후 back 시킴
		String resultPage = "cmmn/dataAccessFailure";
		String hasIndication = ""; // 미리 입력된 조치사항
		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			getUserInfo(model);//사용자 정보를 가져옴
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
					// 이미 실행된 경우 -> 지시사항 조치로 인하여 실행됐어도 진행
					resultPage = "security/watchKeepingForm";
				}
			} else {
				// 당직근무자와 접속자가 다른 경우 경고 후 뒤로 돌아가기
				resultPage = "cmmn/notNightWorker";
			}
			hasIndication = "Today's 지시사항 : " + ((dao.selectIndicationDao() == null) ? "(지시사항이 아직 등록되지 않았습니다.)" : dao.selectIndicationDao());  
					
			model.addAttribute("indication", hasIndication);
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
			getUserInfo(model);//사용자 정보를 가져옴
			WatchKeepingDTO wkDTO;
			// 정보 가지고 오기
			request.setCharacterEncoding("EUC-KR");
			String wk_empemail = request.getParameter("wk_empemail");
			String wk_indication = request.getParameter("wk_indication");
			String wk_measure = request.getParameter("wk_measure");
			
			//wk_dp뒤에 있는 숫자는 dept(부서)db에 있는 deptNo와 일치
			int wk_dp1 = Integer.parseInt(request.getParameter("wk_dp1"));
			int wk_dp2 = Integer.parseInt(request.getParameter("wk_dp2"));
			int wk_dp3 = Integer.parseInt(request.getParameter("wk_dp3"));
			int wk_dp4 = Integer.parseInt(request.getParameter("wk_dp4"));
			int wk_dp5 = Integer.parseInt(request.getParameter("wk_dp5"));
			int wk_dp6 = Integer.parseInt(request.getParameter("wk_dp6"));
			int wk_dp7 = Integer.parseInt(request.getParameter("wk_dp7"));
			int wk_dp8 = Integer.parseInt(request.getParameter("wk_dp8"));
			int wk_dp9 = Integer.parseInt(request.getParameter("wk_dp9"));
			int wk_dp10 = Integer.parseInt(request.getParameter("wk_dp10"));
			String wk_specificity = request.getParameter("wk_specificity");
			String wk_report = request.getParameter("wk_report");
			String wk_delivery = request.getParameter("wk_delivery");
			// 정보를 가지고 와서 db에 입력
			wkDTO = new WatchKeepingDTO(wk_empemail, wk_indication, wk_measure,
					wk_dp1, wk_dp2, wk_dp3, wk_dp4, wk_dp5, wk_dp6, wk_dp7,
					wk_dp8, wk_dp9,wk_dp10, wk_specificity, wk_report, wk_delivery);

			// 지시사항으로 이미 데이터가 있을 경우 수정, 없을 경우 삽입
			if (dao.selectNumWatchKeepingDao() > 0) {
				// 데이터가 이미 있을 경우 update하기
				dao.updateWatchKeepingDao(wkDTO);
				// 조치사항 가져오기

			} else {
				// 데이터가 없을 경우 insert하기
				dao.insertWatchKeepingDao(wkDTO);
				// 조치사항이 없음

			}

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
			List<HashMap> emailList = dao.selectManagerCheckEmailDao();
			while (count-- > 0) {
				String tomail = (String) emailList.get(count).get("emp_email");// 받는 사람 이메일
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
			Map map = new HashMap();
			PagingDTO pageInfo;

			getUserInfo(model);//사용자 정보를 가져옴

			// 클라이언트에서 보낸 정보 받아오기
			long pageNum = (long) Integer
					.parseInt(request.getParameter("page"));
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			if (pageNum <= 0)
				pageNum = 1;

			System.out.println("pipi: " + startDate);

			// 검색을 한 경우
			if (startDate != null && endDate != null && !"".equals(startDate)
					&& !"".equals(endDate)) {
				map.put("startDate", startDate);
				map.put("endDate", endDate);
				// 페이지에 대한 정보 입력 및 전달, 파라미터 -> 총 페이지 수, 클릭한 페이지 넘버 전달
				pageInfo = new PagingDTO(
						dao.selectNumTotalListOfNightDutyWithDateDao(), pageNum);
				model.addAttribute("paging", pageInfo);
				long data = (long) ((pageNum - 1) * pageInfo.getRows());
				map.put("data", data);
				model.addAttribute("list",
						dao.selectWatchKeepingWithDateDao(map));
			} else {
				// 검색하지 않은 경우
				// 페이지에 대한 정보 입력 및 전달, 파라미터 -> 총 페이지 수, 클릭한 페이지 넘버 전달
				pageInfo = new PagingDTO(
						dao.selectNumTotalListOfNightDutyDao(), pageNum);
				model.addAttribute("paging", pageInfo);
				model.addAttribute("list", dao
						.selectWatchKeepingDao((long) ((pageNum - 1) * pageInfo
								.getRows())));
			}

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
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			PagingDTO pageInfo;

			getUserInfo(model);//사용자 정보를 가져옴

			// id 가져옴
			String id = request.getParameter("id");
			if (id == null)
				return "cmmn/dataAccessFailure";
			model.addAttribute("data",
					dao.selectWatchKeepingWithIdDao(Integer.parseInt(id)));
			model.addAttribute("deptNum", dao.selectDeptNumDao());

		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		}
		return "list/contentWatchKeeping";
	}

	/**
	 * 당직근무일지 내용 출력(hwp)
	 */
	@RequestMapping("/extractWatchKeeping.do")
	public String extractWatchKeeping(HttpServletRequest request, Model model)
			throws Exception {

		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			PagingDTO pageInfo;
			// id받아와서 해당 id에 맞는 당직근무일지 데이터 가져옴
			String id = request.getParameter("id");
			if (id == null)
				return "cmmn/dataAccessFailure";
			WatchKeepingDTO wkDto = dao.selectWatchKeepingWithIdDao(Integer.parseInt(id));

			Date dt = new SimpleDateFormat("yyyy-MM-dd(EEE) hh:mm:ss",
					Locale.KOREA).parse(wkDto.getWk_datetime());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd. (EEE)",
					Locale.KOREA);
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
			String date = sdf.format(dt).toString();
			String tempName = "당직근무일지(" + sdf2.format(dt).toString() + ").xls";
			String fileName = new String(tempName.getBytes("UTF-8"), "ISO-8859-1");
			model.addAttribute("emp_name", userInfo.getEmp_name());
			model.addAttribute("deptName", userInfo.getDeptName());
			model.addAttribute("auth", userInfo.getAuth());

			model.addAttribute("data",dao.selectWatchKeepingWithIdDao(Integer.parseInt(id)));
			// 밑에 각 부서의 총 인원 수 가져올 수 있도록 수정
			model.addAttribute("listDeptNum", dao.selectDeptNumDao());
			model.addAttribute("today", date);
			model.addAttribute("fileName", fileName);

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
		getUserInfo(model);//사용자 정보를 가져옴
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
			SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
			getUserInfo(model);//사용자 정보를 가져옴
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
			getUserInfo(model);//사용자 정보를 가져옴
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
	
	
	// 관리자 이메일 수신 변경
		@RequestMapping("/changeManagerEmailCheck.do")
		public String changeManagerEmailCheck(HttpServletRequest request, Model model)
				throws Exception {
			String resultPage = "forward:/updateManager.do";

			try {
				Map map = new HashMap();
				SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
				getUserInfo(model);//사용자 정보를 가져옴
				// 정보 가지고 오기
				String emp_email = request.getParameter("emp_email"); // 부서이름
				String emailCheck = request.getParameter("check"); // 현재 이메일 수신 여부
				map.put("emp_email", emp_email);
				//수신동의를 수신거부로 변경할 경우
				if ("Y".equals(emailCheck)) {
					map.put("emailCheck", "N");
					dao.changeCheckEmailDao(map);
				}else{
					//수신거부를 수신동의로 변경할 경우
					map.put("emailCheck", "Y");
					dao.changeCheckEmailDao(map);
				}
				

			} catch (Exception exp) {
				System.out.println(exp.getMessage());
				resultPage = "cmmn/dataAccessFailure";
			}
			return resultPage;
		}
	
	

	// 관리자 권한 추가 양식
	@RequestMapping("/addManagerForm.do")
	public String addManagerForm(HttpServletRequest request, Locale locale, Model model) throws Exception {
		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		getUserInfo(model);//사용자 정보를 가져옴
		PagingDTO pageInfo;
		long pageNum = (long) Integer.parseInt(request.getParameter("page"));
		if (pageNum <= 0) pageNum = 1;
		
		// 페이지에 대한 정보 입력 및 전달, 파라미터 -> 총 페이지 수, 클릭한 페이지 넘버 전달
		pageInfo = new PagingDTO( dao.selectNumEmployeeNotManagerDao(), pageNum);
		model.addAttribute("paging", pageInfo);
		// 파라미터 -> (클릭한 페이지 넘버 -1) * rows
		model.addAttribute("list", dao.selectEmployeeNotManagerDao( (long) ((pageNum - 1) * pageInfo.getRows())));
		return "manage/addManagerForm";
	}

	// 관리자 권한 추가
	@RequestMapping("/addManagerCheck.do")
	public String addManagerCheck(HttpServletRequest request, Model model) throws Exception {
		// 추가한 부서 insert 처리
		String resultPage = "forward:/updateManager.do";

		SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);
		getUserInfo(model);//사용자 정보를 가져옴
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
		int deptTotalNum = 10;//dao.selectNDeptDao();
		// 부서 이름
		String[] strDeptName = new String[]{"경영기획본부","정보기술본부","고객지원본부","정보개발본부","복지정보본부","보건의료본부","희망복지중앙지원단","바우처관리본부","바우처정보본부","사회보장연구소"};
		// 부서 별 미실시 횟수
		int[] numNonImplement = new int[deptTotalNum];
		// 부서 별 보안점수 (월 단위)
		int[] scoreDeptList = new int[deptTotalNum];
		// 항목 별 보안점수 (db 전체)
		float[] scoreEachList = new float[5];
		// 항목 별 자신 부서 보안점수
		int[] scoreMyDeptEachList = new int[5];
		try {
			getUserInfo(model);//사용자 정보를 가져옴

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
				//strDeptName[temp] = dao.selectTotalDeptDao(i); // 부서 이름 넣기
				if (dao.selectCheckScoreDeptOfficeDao(i) != 0)
					// 부서 별 보안점수 넣기(당월 데이터만 해당)
					scoreDeptList[temp] = dao.selectScoreDeptOfficeDao(i);
				else
					scoreDeptList[temp] = 0; // 부서 별 보안점수 넣기(당월 데이터만 해당)
				numNonImplement[temp] = ((int) diffDateAsDay - dao
						.selectNumImplementDao(i));// 전체일 수 - 실시일 수
				if (numNonImplement[temp] > max)
					max = numNonImplement[temp];
			}
			int maxNum = ((max / 10) + 1) * 10;

			// 평균 데이터
			HashMap<String, BigDecimal> totalScore = dao.selectScoreDao();
			scoreEachList[0] = Math.round(((BigDecimal) totalScore
					.get("sum(os_document)")).intValueExact()
					/ (float) deptTotalNum);
			scoreEachList[1] = Math.round(((BigDecimal) totalScore
					.get("sum(os_clean)")).intValueExact()
					/ (float) deptTotalNum);
			scoreEachList[2] = Math.round(((BigDecimal) totalScore
					.get("sum(os_lightout)")).intValueExact()
					/ (float) deptTotalNum);
			scoreEachList[3] = Math.round(((BigDecimal) totalScore
					.get("sum(os_ventilation)")).intValueExact()
					/ (float) deptTotalNum);
			scoreEachList[4] = Math.round(((BigDecimal) totalScore
					.get("sum(os_door)")).intValueExact()
					/ (float) deptTotalNum);

			// 자기 부서 데이터
			HashMap<String, BigDecimal> ownScore = dao
					.selectScoreWithDeptDao(userInfo.getOs_deptcode());
			scoreMyDeptEachList[0] = ((BigDecimal) ownScore
					.get("sum(os_document)")).intValueExact();
			scoreMyDeptEachList[1] = ((BigDecimal) ownScore
					.get("sum(os_clean)")).intValueExact();
			scoreMyDeptEachList[2] = ((BigDecimal) ownScore
					.get("sum(os_lightout)")).intValueExact();
			scoreMyDeptEachList[3] = ((BigDecimal) ownScore
					.get("sum(os_ventilation)")).intValueExact();
			scoreMyDeptEachList[4] = ((BigDecimal) ownScore.get("sum(os_door)"))
					.intValueExact();

			float max2 = 0;
			for (int i = 0; i < scoreEachList.length; i++) {
				if (scoreEachList[i] > max2)
					max2 = scoreEachList[i];
				if (scoreMyDeptEachList[i] > max2)
					max2 = scoreMyDeptEachList[i];
			}
			int stepSize2 = 1;
			if (max2 < 10)
				stepSize2 = 1;
			else if (max2 < 100)
				stepSize2 = 10;
			else if (max2 < 1000)
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
		String month = null;
		try {
			SecurityOfficeDAO dao = sqlSession.getMapper(SecurityOfficeDAO.class);

			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd (EEE)");
			String now_month = sdf.format(dt).toString();
			String today = sdf3.format(dt).toString();

			getUserInfo(model);//사용자 정보를 가져옴

			// int year = Integer.parseInt(request.getParameter("year"));
			month = request.getParameter("month");

			if (month == null)
				month = now_month;
			// db에 넘겨주는 데이터 값 : yyyy-mm-%
			String value = month + "-%";
			if ("1".equals(month))
				model.addAttribute(
						"list",
						dao.selectNightDutyOnlyMeDao(SecurityContextHolder
								.getContext().getAuthentication().getName()));
			else
				model.addAttribute("list", dao.selectNightDutyWithMonthDao(value));
			// model.addAttribute("list", dao.selectNightDutyDao()); //전체출력
			// 오늘 날짜 전달
			model.addAttribute("today", today);

		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		}
		return resultPage;
	}

	// 당직테이블 삽입 폼
	@RequestMapping("/insertNightDutyTable.do")
	public String insertNightDutyTable(HttpServletResponse response,
			HttpServletRequest request, Model model) {
		String resultPage = "manage/insertNightDutyTable";
		String year = null;
		String month = null;
		ArrayList<String> date = new ArrayList<String>();
		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);

			getUserInfo(model);//사용자 정보를 가져옴

			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");

			String now_month = sdf2.format(dt).toString();
			// int year = Integer.parseInt(request.getParameter("year"));
			// month = request.getParameter("month");
			month = (request.getParameter("month") == null) ? "" : request
					.getParameter("month");
			if (month == null || "0-0".equals(month)) {
				date.add("날짜를 선택해주세요.");
				model.addAttribute("date", date);
				return resultPage;
			}
			// month를 date로 변경
			Date d_month = sdf2.parse(month);
			String check_month = sdf.format(d_month).toString();
			Calendar cal = Calendar.getInstance();
			cal.setTime(d_month);
			int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			String value = null;
			// date(d_month)를 String으로 변환
			String strMonth = sdf2.format(d_month).toString();
			// month = (Integer.parseInt(month)<10) ? "0"+month : month;
			for (int i = 1; i <= endDay; i++) {
				if (i < 10)
					value = strMonth + "-0" + i;
				else
					value = strMonth + "-" + i;
				date.add(value);
			}
			model.addAttribute("date", date);
			if (dao.checkNightDutyDao(check_month) > 0) {
				// update처리를 해줬기 때문에 에러페이지 호출 안함
				// resultPage = "cmmn/dataHasAlready";
			}

		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		}
		return resultPage;
	}

	// 당직테이블 삽입하기
	@RequestMapping("/insertNightDutyCheck.do")
	public String insertNightDutyCheck(HttpServletResponse response,
			HttpServletRequest request, Model model) {
		String resultPage = "cmmn/saveDataSuccessForTable";
		String year = null;
		String month = null;
		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			String[] arrDate = request.getParameterValues("nd_date");
			String[] arrEmail = request.getParameterValues("nd_email");

			// 데이터가 이미 있는지 확인
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM");
			Date d_month = sdf.parse(arrDate[0]);
			String insert_month = sdf2.format(d_month).toString();
			String value = insert_month + "-%";
			System.out.println("ak : " + value);

			for (int i = 0; i < arrDate.length; i++) {
				NightDutyDTO ndDto = new NightDutyDTO(arrDate[i], arrEmail[i]);
				if (dao.checkNightDutyDao(arrDate[i]) <= 0)
					dao.insertNightDutyDao(ndDto);
				else
					dao.updateNightDutyDao(ndDto);
			}

		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		}
		return resultPage;
	}

	// 당직테이블 삽입폼 ver2
	@RequestMapping("/insertSeveralNightDutyTable.do")
	public String insertSeveralNightDutyTable(HttpServletResponse response,
			HttpServletRequest request, Model model) {
		String resultPage = "manage/insertSeveralNightDutyTable";
		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			getUserInfo(model);//사용자 정보를 가져옴

		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		}
		return resultPage;
	}

	// 당직테이블 삽입하기 ver2
	@RequestMapping("/insertSeveralNightDutyCheck.do")
	public String insertSeveralNightDutyCheck(HttpServletResponse response,
			HttpServletRequest request, Model model) {
		String resultPage = "cmmn/saveDataSuccessForTable";
		String year = null;
		String month = null;
		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			String[] arrDate = request.getParameterValues("nd_date");
			String[] arrEmail = request.getParameterValues("nd_email");

			/*
			 * 1. 데이터를 받아서 2. for문을 돌리는데 3. if문으로 날짜 값이 이미 있으면 update로 수정 4. 없으면
			 * insert로 삽입
			 */
			System.out.println("날짜 : " + arrDate[0]);
			for (int i = 0; i < arrDate.length; i++) {
				// 객체 instance
				NightDutyDTO ndDto = new NightDutyDTO(arrDate[i], arrEmail[i]);
				// 날짜 값이 이미 있는 경우
				if (dao.checkNightDutyDao(arrDate[i]) > 0)
					dao.updateNightDutyDao(ndDto);
				// 날짜 값이 없는 경우
				else
					dao.insertNightDutyDao(ndDto);
			}

		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		}
		return resultPage;
	}

	// 당직근무 지시사항 추가
	@RequestMapping("/indicateWatchKeeping.do")
	public String indicateWatchKeeping(HttpServletResponse response,
			HttpServletRequest request, Model model) {
		String resultPage = "manage/indicateWatchKeeping";
		Boolean SendEmail = false; 
		try {
			SecurityOfficeDAO dao = sqlSession
					.getMapper(SecurityOfficeDAO.class);
			getUserInfo(model);//사용자 정보를 가져옴
			// 오늘 날짜 얻기
			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (EEE)", Locale.KOREA);
			String nowDate = sdf.format(dt).toString();
			// 당직근무자 이메일(fnUser)
			String fnUser = dao.selectEmailNightDutyWithDateDao();
			// 클라이언트에서 보내준 정보 받기
			String strIndication = (request.getParameter("wk_indication") == null) ? ""
					: request.getParameter("wk_indication");
			String hasIndication = "";
			if (dao.selectNumWatchKeepingDao() > 0) {
				// 당직점검 데이터가 이미 있는 경우 -> update
				hasIndication = dao.selectIndicationDao(); // 기존 지시사항 불러와서 저장
				//값이 있는경우 update
				if (!(strIndication == null || "".equals(strIndication))) { 
					dao.updateIndicationDao(strIndication);
					SendEmail = true;
					resultPage = "cmmn/saveDataSuccess";
				}
			} else {
				// 당직점검 데이터가 없는 경우 -> insert
				hasIndication = ""; // 저장된 데이터가 없음
				// 값이 있는경우 insert
				if (!(strIndication == null || "".equals(strIndication))) {
					dao.insertIndicationDao(strIndication);
					SendEmail = true;
				}
			}

			model.addAttribute("indication", hasIndication);
			model.addAttribute("today", nowDate);
			
			if (SendEmail) {
				// 성공할 시 메일 보내기
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd(EEE)", Locale.KOREA);
				String os_date = sdf2.format(dt).toString();
				String setfrom = "limjihun204@gmail.com"; // 보내는 사람 이메일
				String title = "[" + os_date.toString() + "] " + "당직점검 지시사항이 등록되었습니다."; // 제목
				String content = "오늘의 당직점검 지시사항이 등록되었습니다.\n"+"["+os_date+"]당직점검 지시사항 : "+strIndication+"\n\n자세한 내용은 홈페이지에서 확인바랍니다.";
				String tomail = fnUser;// 받는 사람 이메일
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
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
			System.out.println(exp.getMessage());
		}
		return resultPage;
	}

}
