package com.mos.ProductChatbot;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.*;

public class DAO {
	
	Connection Connection;
	Statement statement;
	
	private Connection createConnection(){
		try {

				Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin","root","root");
			    return con;	    
		}
		catch(Exception e){
				System.out.println(e);
				return null;
		}
	} 
	public ResultSet getData(String query) {
		try {
		Connection con = createConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		return rs;
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}
	public int putData(String query) {
		try {
			Connection con = createConnection();
			Statement st = con.createStatement();
			int row = st.executeUpdate(query);
			return row;
			}
			catch(Exception e) {
				System.out.println(e);
				return -1;
			}
	}
}
