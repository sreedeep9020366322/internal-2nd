package project.internal.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class SqlConnection {

	public static Connection getOracleConnection() {
	
		Connection con = null;
		
		try {
		
			Properties prop = new Properties();
			
			InputStream inStream = Thread.currentThread().getContextClassLoader().getResourceAsStream("DbConnection.properties");
			
			//FileInputStream inStream = new FileInputStream(new File("DbConnection.properties"));
			
			System.out.println(inStream);
			prop.load(inStream);
		
			Class.forName(prop.getProperty("db.className"));
			con = DriverManager.getConnection(prop.getProperty("db.url"),prop.getProperty("db.userName"),prop.getProperty("db.passWord"));
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return con;
	}
	
	
}
