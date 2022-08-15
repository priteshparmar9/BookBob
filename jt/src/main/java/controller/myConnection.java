package controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

	public class myConnection {
		 private static Connection con=null;
		    
		    public static Connection getConnection(){
		        try{
		            Class.forName("com.mysql.cj.jdbc.Driver");
		            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/jt_project","root","parshwa");
		            
		        }catch(Exception e){
		            e.printStackTrace();
		        }
		        return con;
		    }

			public PreparedStatement prepareStatement(String query) {
				// TODO Auto-generated method stub
				return null;
			}
	}

