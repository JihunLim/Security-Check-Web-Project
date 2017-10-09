package egovframework.security.office.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	//부서수 출력하기
	public String selectDeptNumDao(int data);
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
    
    /*
     * 사무실보안점검DB
     */
    //사무실보안점검 출력하기
    public List<OfficeSecurityDTO> selectOfficeSecurityDao();
    //사무실보안점검 해당부서만 출력하기
    public List<OfficeSecurityDTO> selectOfficeSecurityWithDeptDao(int data);
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
    
    /*
     * 당직근무일지DB
     */
    //당직근무일지 출력하기
    public List<WatchKeepingDTO> selectWatchKeepingDao();
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
    //당직근무표 수정
    public void updateNightDutyDao(NightDutyDTO data);
    //당직근무표 전체출력
    public List<NightDutyDTO> selectNightDutyDao();
    //당직근무표 해당날짜출력
    public NightDutyDTO selectNightDutyWithDateDao();
    //당직근무표 회원이메일 출력하기
    public String selectEmailNightDutyWithDateDao();
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
