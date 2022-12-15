package com.community.util;

import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapper {

	private static SqlMapClient sqlMapClient;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("META-INF/ibatis/ibatis-config.xml");
			sqlMapClient = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}

	private static SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}
	
	public static void insert(String id) {
		try {
			getSqlMapClient().insert(id);
		} catch (SQLException ex) {
			throw new RuntimeException(ex);
		}
	} 
	
	public static void insert(String id, Object param) {
		try {
			getSqlMapClient().insert(id, param);
		} catch (SQLException ex) {
			throw new RuntimeException(ex);
		}
	}
	
	public static void update(String id) {
		try {
			getSqlMapClient().update(id);
		} catch (SQLException ex) {
			throw new RuntimeException(ex);
		}
	} 
	
	public static void update(String id, Object param) {
		try {
			getSqlMapClient().update(id, param);
		} catch (SQLException ex) {
			throw new RuntimeException(ex);
		}
	}
	
	public static void delete(String id) {
		try {
			getSqlMapClient().delete(id);
		} catch (SQLException ex) {
			throw new RuntimeException(ex);
		}
	} 
	
	public static void delete(String id, Object param) {
		try {
			getSqlMapClient().delete(id, param);
		} catch (SQLException ex) {
			throw new RuntimeException(ex);
		}
	}
	
	public static Object selectOne(String id) {
		try {
			return getSqlMapClient().queryForObject(id);
		} catch (SQLException ex) {
			throw new RuntimeException(ex);
		}
	} 
	
	public static Object selectOne(String id, Object param) {
		try {
			return getSqlMapClient().queryForObject(id, param);
		} catch (SQLException ex) {
			throw new RuntimeException(ex);
		}
	}
	
	public static List<?> selectList(String id) {
		try {
			return getSqlMapClient().queryForList(id);
		} catch (SQLException ex) {
			throw new RuntimeException(ex);
		}
	} 
	
	public static List<?> selectList(String id, Object param) {
		try {
			return getSqlMapClient().queryForList(id, param);
		} catch (SQLException ex) {
			throw new RuntimeException(ex);
		}
	}
	
	
	
}
