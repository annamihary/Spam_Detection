package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import database.Connexion;


public class Database extends Connexion {

  public ResultSet executionQuery(String sql) {
	  try {
		stm = conn.createStatement();
		rs = stm.executeQuery(sql); //insert pour executeQuery
	} catch (SQLException ex) {
		System.out.println(ex);
	}
	return rs;
	
}
  public Boolean executionUpdate(String sql) {
	 try {
		stm = conn.createStatement();
		stm.executeUpdate(sql);
		System.out.println(sql);
		return true;
	} catch (SQLException ex) {
		System.out.println(ex);
		return false;
	}
	  
  }

}
