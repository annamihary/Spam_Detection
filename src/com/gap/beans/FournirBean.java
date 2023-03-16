package com.gap.beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.gap.classe.Fournir;


import database.Database;

public class FournirBean {
    ResultSet rs;
    Database db;
    
    public FournirBean() {
    	db = new Database();
    }
    
    public ArrayList<Fournir> listFournir(){
    	ArrayList<Fournir> list= new ArrayList<>();
    	rs= db.executionQuery("SELECT idFournir,fournir.codeFrs,nom,dateAppro FROM fournir,fournisseur WHERE fournir.codeFrs = fournisseur.codeFrs");
    	try {
    		while(rs.next()) {
    			Fournir fr = new Fournir(); 
    			fr.setIdFournir(rs.getString("idFournir"));
    			fr.setCodeFrs(rs.getString("codeFrs"));
    			fr.setNom(rs.getString("nom"));
				fr.setDateAppro(rs.getString("dateAppro"));
    			list.add(fr);
    		}
    	}
    	catch (SQLException ex)
		{
            System.out.println(ex.getMessage());
		}
		return list;
    }
    
    public Fournir getFournir(String idFournir) {
    	Fournir fr = null;
    	String sql = "SELECT idFournir,fournir.codeFrs,nom,dateAppro FROM fournir,fournisseur WHERE fournir.codeFrs = fournisseur.codeFrs AND fournir.idFournir='"+idFournir+"'";
    	rs= db.executionQuery(sql);
    	try {
    		while(rs.next()) {
    			fr = new Fournir(); 
    			fr.setIdFournir(rs.getString("idFournir"));
    			fr.setCodeFrs(rs.getString("codeFrs"));
    			fr.setNom(rs.getString("nom"));
				fr.setDateAppro(rs.getString("dateAppro"));
    		}
    	}
    	catch (SQLException ex)
		{
            System.out.println(ex.getMessage());
		}
    	return fr;
    }
    
    public Boolean verifyFournir(String idFournir) {
    	ArrayList<Fournir> list = listFournir();
    	for (Fournir fr:list) {
    		if(fr.getIdFournir().equals(idFournir)) return false;
    	}
    	return true;
    }
    
    public ArrayList<String> getAnnee() {
    	ArrayList<String> list= new ArrayList<>();
    	rs= db.executionQuery("SELECT DISTINCT YEAR(dateAppro) AS year FROM fournir ORDER BY year DESC");
    	try {
    		while(rs.next()) {
    			list.add(rs.getString("year"));
    		}
    	}
    	catch (SQLException ex)
		{
            System.out.println(ex.getMessage());
		}
		return list;
    }
    
    public String nextFournir() {
    	Integer lastId =0;
		String idFournir=null;
		
		rs = db.executionQuery("SELECT * FROM fournir ORDER BY idFournir DESC LIMIT 1");
		try {
			while(rs.next()) {
				idFournir = rs.getString("idFournir");
			}
			if(idFournir!=null) lastId = Integer.parseInt(idFournir.split("FR")[1]);
			
		}catch(SQLException ex)
		{
            System.out.println(ex.getMessage());
		}
		return idFournirFormat(lastId+1);
    }
    
    public String idFournirFormat(Integer id) {
		if(id<10) return "FR0"+id;
		else if(id<100) return "FR"+id;
		else if(id<1000) return "FR"+id;
		else return "FR"+id;
	}
    
    public Boolean addFournir(Fournir fr) {
    	return db.executionUpdate("INSERT INTO fournir(codeFrs,dateAppro) VALUES ('"+fr.getCodeFrs()+"','"+fr.getDateAppro()+"')");
    		
    }
    
    public Boolean updateFournir(Fournir fr) {
    	return db.executionUpdate("UPDATE fournir SET codeFrs='"+fr.getCodeFrs()+"', dateAppro='"+fr.getDateAppro()+"' WHERE idFournir='"+fr.getIdFournir()+"'");
    }
    
    public Boolean deleteFournir(String idFournir) {
    	return db.executionUpdate("DELETE FROM fournir WHERE idFournir='"+idFournir+"'");
    }

	
}

