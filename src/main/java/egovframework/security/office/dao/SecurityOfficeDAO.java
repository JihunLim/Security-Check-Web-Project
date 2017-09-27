package egovframework.security.office.dao;

import java.util.HashMap;
import java.util.List;

import egovframework.security.dto.DeptDTO;
import egovframework.security.dto.OfficeSecurityDTO;
import egovframework.security.dto.WatchKeepingDTO;

public interface SecurityOfficeDAO {

	/*
	 * 부서DB 
	 */
	//부서정보 출력하기
	public List<DeptDTO> selectDeptDao();
	//부서정보 삽입하기
    public void insertDeptDao(DeptDTO data);
    //부서정보 삭제하기
    public void deleteDeptDao(DeptDTO data);
    
    /*
     * 사무실보안점검DB
     */
    //사무실보안점검 출력하기
    public List<OfficeSecurityDTO> selectOfficeSecurityDao();
    //사무실보안점검 삽입하기
    public void insertOfficeSecurityDao(OfficeSecurityDTO data);
    //사무실보안점검 수정하기
    public void updateOfficeSecurityDao(OfficeSecurityDTO data);
    //사무실보안점검 삭제하기
    public void deleteOfficeSecurityDao(OfficeSecurityDTO data);
    //부서 찾아주기
    public HashMap findDeptDao(String data);
    
    /*
     * 당직근무일지DB
     */
    public List<WatchKeepingDTO> selectWatchKeepingDao();
    public void insertWatchKeepingDao(WatchKeepingDTO data);
    public void updateWatchKeepingDao(WatchKeepingDTO data);
    public void deleteWatchKeepingDao(WatchKeepingDTO data);

}
