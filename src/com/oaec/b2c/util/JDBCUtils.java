package com.oaec.b2c.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtils {
	/*private static final String DRIVER = "oracle.jdbc.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private static final String USER = "Test";
	private static final String PASSWORD = "123456";

	
	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}*/
	
	public Connection getConnection() {
		try {
			return JdbcDataSource.getDataSource().getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void close(ResultSet rs, Statement stm, Connection conn) {
		try {
			if(rs != null) {
				rs.close();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			try {
				if(stm != null) {
					stm.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(conn != null && !conn.isClosed()) {
						conn.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public void close(Statement stm, Connection conn) {
		try {
			if(stm != null) {
				stm.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
