package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Connexion  {
	protected Connection conn =null;
	protected Statement stm = null;
	protected ResultSet rs=null;
	
    public Connexion() {
            try {Class.forName("com.mysql.jdbc.Driver");
            try {
				conn= DriverManager.getConnection("jdbc:mysql://localhost/gestionappro","root","");
			} catch (SQLException ex) {
				
				System.out.println("Probleme de connexion ou requete");
				System.out.println(ex.getMessage());
			}
            	
			} catch (ClassNotFoundException ex) {
				System.out.println("Probleme de pilode de BBD");
				System.out.println(ex.getMessage());
			}
    }

	

}
