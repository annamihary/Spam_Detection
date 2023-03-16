package com.gap.beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.gap.classe.Lignefr;

import database.Database;

public class LignefrBean {
	ResultSet rs;
	Database db;
	
	public LignefrBean() {
		db = new Database();
	}
	
	public ArrayList<Lignefr> listFr(String idFournir){
		ArrayList<Lignefr> list = new ArrayList<>();
		rs= db.executionQuery("SELECT idLignefr,idFournir,produits.codePro,design,qteAppro FROM lignefr,produits WHERE lignefr.codePro=produits.codePro AND idFournir='"+idFournir+"'");
		try {
			while (rs.next()) {
				Lignefr frir = new Lignefr();
				frir.setIdLignefr(rs.getInt("idLignefr"));
				frir.setIdFournir(rs.getString("idFournir"));
				frir.setCodePro(rs.getString("codePro"));
				frir.setDesign(rs.getString("design"));
				frir.setQteAppro(rs.getInt("qteAppro"));
				list.add(frir);
			}
			
		} catch(SQLException ex)
		{
            System.out.println(ex.getMessage());
		}
		return list;
	}
	
	public ArrayList<Lignefr> factureFournir(String idFournir){
		ArrayList<Lignefr> list = new ArrayList<>();
		if(idFournir.isEmpty())
			rs = db.executionQuery("SELECT design,pu, sum(qteAppro) as some FROM lignefr,produits WHERE produits.codePro=lignefr.codePro GROUP BY produits.codePro;");
		else
			rs = db.executionQuery("SELECT design,pu, sum(qteAppro) as some FROM lignefr,produits WHERE produits.codePro=lignefr.codePro AND idFournir='"+idFournir+"' GROUP BY produits.codePro;");
		try {
			while(rs.next()) {
				Lignefr frir =new Lignefr();
				frir.setDesign(rs.getString("design"));
				frir.setPu(rs.getInt("pu"));
				frir.setQteAppro(rs.getInt("some"));
				list.add(frir);
			}
			
	 	} catch(SQLException ex)
		{
            System.out.println(ex.getMessage());
		}
		return list;
		}
	
	public ArrayList<Lignefr> produitsParFournisseur(String codeFrs){
		ArrayList<Lignefr> list = new ArrayList<>();
		String requete ="SELECT design,pu,sum(qteAppro) as some FROM lignefr,produits,fournir,fournisseur WHERE produits.codePro=lignefr.codePro AND lignefr.idFournir=fournir.idFournir AND fournir.codeFrs=fournisseur.codeFrs";
		
		if(codeFrs.isEmpty()) 
			rs = db.executionQuery(requete + " GROUP BY produits.codePro");
		else
			rs = db.executionQuery(requete + " AND fournisseur.codeFrs='"+codeFrs+"' GROUP BY produits.codePro");
		
		try {
			while(rs.next()) {
				Lignefr frir =new Lignefr();
				frir.setDesign(rs.getString("design"));
				frir.setPu(rs.getInt("pu"));
				frir.setQteAppro(rs.getInt("some"));
				list.add(frir);
			}
			
		}  catch(SQLException ex)
		{
            System.out.println(ex.getMessage());
		}
		return list;
	}
	
	public ArrayList<Lignefr> produitsParFournisseurParMois(String codeFrs, String month){
		ArrayList<Lignefr> list =new ArrayList<>();
		String requete ="SELECT design,pu,dateAppro,sum(qteAppro) as some FROM lignefr,produits,fournir,fournisseur WHERE produits.codePro=lignefr.codePro AND lignefr.idFournir=fournir.idFournir AND fournir.codeFrs=fournisseur.codeFrs";
		
		if(codeFrs.isEmpty()) 
			rs = db.executionQuery(requete + " AND MONTH(dateAppro)="+month+" GROUP BY produits.codePro");
		else {
			rs = db.executionQuery(requete + " AND fournisseur.codeFrs='"+codeFrs+"' AND MONTH(dateAppro)="+month+" GROUP BY produits.codePro");
		}
		
		try {
			while(rs.next()) {
				Lignefr frir = new Lignefr();
				frir.setDesign(rs.getString("design"));
				frir.setPu(rs.getInt("pu"));
				frir.setQteAppro(rs.getInt("some"));
				list.add(frir);
			}
			
		}  catch(SQLException ex)
		{
            System.out.println(ex.getMessage());
		}
		return list;
		}
	
    public ArrayList<Lignefr> produitsParFournisseurParAnnee(String codeFrs, String annee){
    	ArrayList<Lignefr> list =new ArrayList<>();
	String requete ="SELECT design,pu,dateAppro,sum(qteAppro) as some FROM lignefr,produits,fournir,fournisseur WHERE produits.codePro=lignefr.codePro AND lignefr.idFournir=fournir.idFournir AND fournir.codeFrs=fournisseur.codeFrs";
		
		if(codeFrs.isEmpty()) {
			rs = db.executionQuery(requete + " AND YEAR(dateAppro)="+annee+" GROUP BY produits.codePro");
		} else {
			rs = db.executionQuery(requete + " AND fournisseur.codeFrs='"+codeFrs+"' AND YEAR(dateAppro)="+annee+" GROUP BY produits.codePro");
		}
		
		try {
			while(rs.next()) {
				Lignefr frir = new Lignefr();
				frir.setDesign(rs.getString("design"));
				frir.setPu(rs.getInt("pu"));
				frir.setQteAppro(rs.getInt("some"));
				list.add(frir);
			}
			
		}  catch(SQLException ex)
		{
            System.out.println(ex.getMessage());
		}
		return list;
    }
    
    public ArrayList<Lignefr> produitsParFournisseurParDates(String codeFrs, String date_debut, String date_fin){
    	ArrayList<Lignefr> list =new ArrayList<>();
    	String requete ="SELECT design,pu,dateAppro,sum(qteAppro) as some FROM lignefr,produits,fournir,fournisseur WHERE produits.codePro=lignefr.codePro AND lignefr.idFournir=fournir.idFournir AND fournir.codeFrs=fournisseur.codeFrs";
    		
    		if(codeFrs.isEmpty()) 
    			rs = db.executionQuery(requete + " AND dateAppro BETWEEN '"+date_debut+"' AND '"+date_fin+"' GROUP BY produits.codePro");
    		else {
    			rs = db.executionQuery(requete + " AND fournisseur.codeFrs='"+codeFrs+"' AND dateAppro BETWEEN '"+date_debut+"' AND '"+date_fin+"' GROUP BY produits.codePro");
    		}
    		
    		try {
    			while(rs.next()) {
    				Lignefr frir = new Lignefr();
    				frir.setDesign(rs.getString("design"));
    				frir.setPu(rs.getInt("pu"));
    				frir.setQteAppro(rs.getInt("some"));
    				list.add(frir);
    			}
    			
    		}  catch(SQLException ex)
    		{
                System.out.println(ex.getMessage());
    		}
    		return list;
    }
	
	public Lignefr getLigneFr(String idLignefr) {
		Lignefr frir =null;
		rs= db.executionQuery("SELECT * FROM lignefr WHERE idLignefr='"+idLignefr+"'");
		
		try {
			while(rs.next()) {
				frir =new Lignefr();
				frir.setIdLignefr(rs.getInt("idLignefr"));
				frir.setIdFournir(rs.getString("idFournir"));
				frir.setCodePro(rs.getString("codePro"));
				frir.setQteAppro(rs.getInt("qteAppro"));
			}
			
		} catch (SQLException ex)
		{
           System.out.println(ex.getMessage());
		}
		 return frir;
	}
	
	public Boolean addfr(Lignefr frir) {
		return db.executionUpdate("INSERT INTO lignefr(idFournir,codePro,qteAppro) VALUES('"+frir.getIdFournir()+"','"+frir.getCodePro()+"','"+frir.getQteAppro()+"')");
	}
	
	public Boolean updateFr(Lignefr frir) {
		return db.executionUpdate("UPDATE lignefr SET idFournir='"+frir.getIdFournir()+"',codePro='"+frir.getCodePro()+"', qteAppro='"+frir.getQteAppro()+"' WHERE idLignefr='"+frir.getIdLignefr()+"'");
	}
	
	public Boolean deleteFr(Integer idLignefr) {
		return db.executionUpdate("DELETE FROM lignefr WHERE idLignefr='"+idLignefr+"'");
	}

}
