package egovframework.security.office.dao;

import java.util.List;

import egovframework.security.dto.DeptDTO;

public interface SecurityOfficeDAO {

	public List<DeptDTO> selectDeptDao();
    public void insertDeptDao(DeptDTO data);

}
