package com.community.dao;

import java.util.List;
import java.util.Map;

import com.community.dto.TempDto;
import com.community.util.SqlMapper;
import com.community.vo.Temp;

public class TempDao {
		
	
	private static TempDao instance = new TempDao();
	private TempDao() {}
	public static TempDao getInstance() {
		return instance;
	}
	
	
	public int getTotalRows(Map<String, Object> param) { 
		 return (Integer) SqlMapper.selectOne("temps.getTotalRows", param); 
	}
	
	@SuppressWarnings("unchecked")
	public List<TempDto> getTemps(Map<String, Object> param){
		return (List<TempDto>) SqlMapper.selectList("temps.getTemps", param);
	}
	
	public void insertTemp(Temp temp) {
		SqlMapper.insert("temps.insertTemp", temp);
	}
	
	public void deleteTempByNo(int tempNo) {
		SqlMapper.delete("temps.deleteTempByNo", tempNo);
	}
	
	public void deleteEmployeeNo(int empNo) {
		SqlMapper.delete("temps.deleteEmployeeNo", empNo);
	}
	
	public TempDto getTempByNo(int tempNo) {
		return (TempDto) SqlMapper.selectOne("temps.getTempByNo", tempNo);
	}
	
	public void updateTemp(Temp temp) {
		SqlMapper.update("temps.updateTemp", temp);
	}
}
