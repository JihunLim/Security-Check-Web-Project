package egovframework.security.office.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.jdbc.Blob;

import egovframework.security.dto.DeptDTO;
import egovframework.security.dto.EmployeeDTO;
import egovframework.security.dto.NightDutyDTO;
import egovframework.security.dto.OfficeSecurityDTO;
import egovframework.security.dto.WatchKeepingDTO;

public interface SecurityOfficeDAO {

	/*
	 * 부서DB 
	 */
	//부서정보 출력하기
	public List<DeptDTO> selectDeptDao();
	//부서이름 출력하기
	public String selectDeptNameDao(int data);
	//부서 인원수 출력하기
	public List<Integer> selectDeptNumDao();
	//부서 개수 출력하기
	public int selectNDeptDao();
	//부서 장 이메일 출력하기
	public String selectDeptBossEmailDao(int data);
	//부서 이름 출력하기
	public String selectTotalDeptDao(int data);
	//부서정보 삽입하기
    public void insertDeptDao(DeptDTO data);
    //부서정보 삭제하기
    public void deleteDeptDao(DeptDTO data);
    
    /*
     * 회원DB
     */
    //회원정보 출력하기
    public List<EmployeeDTO> selectEmployeeDao();
    //관리자 이메일 출력하기
    public ArrayList<String> selectManagerDao();
    //관리자 정보 출력하기
    public List<EmployeeDTO> selectAllManagerDao();
    //회원이메일로 부서번호 출력
    public int selectDeptWithIdDao(String data);
    //회원이메일로 회원정보 출력
    public HashMap selectEmpWithIdDao(String data);
    //회원 권한 삭제하기(수정)
    public void updateAuthEmpDao(String data);
    //회원 권한 추가하기(수정)
    public void addManagerDao(String data);
    //관리자 아닌 회원 출력하기
    public List<EmployeeDTO> selectEmployeeNotManagerDao();
    //관리자 수 출력
    public int countManagerDao();
    //이메일 수신 동의자 수 출력
    public int selectManagerCheckEmailNumDao();
    //이메일 수신 이메일 출력
    public List<HashMap> selectManagerCheckEmailDao();
    /*
     * 사무실보안점검DB
     */
    //사무실보안점검 출력하기
    public List<OfficeSecurityDTO> selectOfficeSecurityDao(long data);
    //사무실보안점검 해당부서만 출력하기
    public List<OfficeSecurityDTO> selectOfficeSecurityWithDeptDao(Map data);
    //사무실보안점검 삽입하기
    public void insertOfficeSecurityDao(OfficeSecurityDTO data);
    //사무실보안점검 수정하기
    public void updateOfficeSecurityDao(OfficeSecurityDTO data);
    //사무실보안점검 삭제하기
    public void deleteOfficeSecurityDao(OfficeSecurityDTO data);
    //부서 찾아주기
    public HashMap findDeptDao(String data);
    //해당 날짜에 데이터가 있는지 확인
    public HashMap selectOfficeSecurityWithDateDao(int data);
    //사진 가져오기(id로)
    public OfficeSecurityDTO selectPicOfficeSecurityWithNoDao(int data);
    
    /*
     * 당직근무일지DB
     */
    //당직근무일지 출력하기
    public List<WatchKeepingDTO> selectWatchKeepingDao(long data);
    //id로 당직근무일지 출력하기
    public WatchKeepingDTO selectWatchKeepingWithIdDao(int data);
    //당직근무일지 작성 확인
    public int selectNumWatchKeepingDao();
    //당직근무일지 삽입하기
    public void insertWatchKeepingDao(WatchKeepingDTO data);
    //당직근무일지 수정하기
    public void updateWatchKeepingDao(WatchKeepingDTO data);
    //당직근무일지 삭제하기
    public void deleteWatchKeepingDao(WatchKeepingDTO data);
    
    
    /*
     * 당직근무자 관련 DB
     */
//    //기존 당직근무자 취소하기(수정)
//    public void subWatchKeeperDao(String data);
//    //새로운 당직근무자 추가하기(수정)
//    public void addWatchKeeperDao(String data);
//    //기존 당직근무자가 있는지 확인(출력)
//    public int countWatchKeeperDao();
    
    /*
     * 당직근무표 DB
     */
    //당직근무표 삽입
    public void insertNightDutyDao(NightDutyDTO data);
    //당직근무표 확인
    public int checkNightDutyDao(String data);
    //당직근무표 수정
    public void updateNightDutyDao(NightDutyDTO data);
    //당직근무표 전체출력
    public List<NightDutyDTO> selectNightDutyDao();
    //당직근무표 날짜에 맞춰서 출력
    public List<NightDutyDTO> selectNightDutyWithMonthDao(String data);
    //당직근무표 자신것에 맞춰서 출력
    public List<NightDutyDTO> selectNightDutyOnlyMeDao(String data);
    //당직근무표 해당날짜출력
    public NightDutyDTO selectNightDutyWithDateDao(String data);
    //당직근무표 회원이메일 출력하기
    public String selectEmailNightDutyWithDateDao();
    //오늘 당직근무표에 인원이 할당되어있는지 숫자 리턴
    public int selectNumNightDutyWithDateDao();
    
    /*
     * 페이지 DB 
     */
    //사무실 보안점검 리스트 - 관리자용
    public long selectNumTotalListOfOfficeDao();
    //사무실 보안점검 리스트 - 일반사용자용
    public long selectNumTotalListOfOfficeWithDeptDao(int data);
    //당직점검일지 리스트 - 관리자용
    public long selectNumTotalListOfNightDutyDao();
    
    /*
     * smart 보안점검 처리 DB
     */
    //스마트 보안점검 - 부서별 사무실보안점검 실시 수
    public int selectNumImplementDao(int data);
    //스마트 보안점검 - 월 별 부서별 보안점수
    public int selectScoreDeptOfficeDao(int data);
    //스마트 보안점검 - 해당 부서 데이터 확인
    public int selectCheckScoreDeptOfficeDao(int data);
    //스마트 보안점검 - 모든 부서의 각 보안항목 점수
    public float selectScoreDocumentDao();
    public float selectScoreCleanDao();
    public float selectScoreLightoutDao();
    public float selectScoreVentilationDao();
    public float selectScoreDoorDao();
    public HashMap selectScoreDao();
    //스마트 보안점검 - 자신 부서의 각 보안항목 점수
    public int selectScoreDocumentWithDeptDao(int data);
    public int selectScoreCleanWithDeptDao(int data);
    public int selectScoreLightoutWithDeptDao(int data);
    public int selectScoreVentilationWithDeptDao(int data);
    public int selectScoreDoorWithDeptDao(int data);
    public HashMap selectScoreWithDeptDao(int data);
	
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
