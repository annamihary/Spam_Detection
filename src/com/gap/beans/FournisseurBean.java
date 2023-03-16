package com.gap.beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.gap.classe.Fournisseur;

import database.Database;

public class FournisseurBean {
   ResultSet rs;
   Database db;
   public FournisseurBean() {
	   db = new Database();
   }
   public ArrayList<Fournisseur> listFournisseur(){
	ArrayList<Fournisseur> list = new ArrayList<>();
	rs = db.executionQuery("SELECT * FROM fournisseur");
	try {
		while (rs.next()) {
			Fournisseur frs = new Fournisseur();
			frs.setCodeFrs(rs.getString("codeFrs"));
			frs.setNom(rs.getString("nom"));
			frs.setAdr(rs.getString("adr"));
			list.add(frs);
		}
		
	} catch (SQLException ex) {
		// TODO: handle exception
		System.out.println(ex.getMessage());
	}
	return list ;
	   
  }
   public Fournisseur getFournisseur (String codeFrs) {
	   Fournisseur frs =null;
	    rs = db.executionQuery("SELECT * FROM fournisseur WHERE codeFrs='"+codeFrs+"'");
	  try {
		  while(rs.next()) {
			  frs = new Fournisseur();
			  frs.setCodeFrs(rs.getString("codeFrs"));
			  frs.setNom(rs.getString("nom"));
			  frs.setAdr(rs.getString("adr"));
		  }
		
	} catch (SQLException ex) {
		System.out.println(ex.getMessage());
		// TODO: handle exception
	}  
	return frs;
	   
   }
   
   public Boolean verifyFournisseur(String codeFrs) { //verify si l'objet= a un autre
	   ArrayList<Fournisseur> list = listFournisseur();
	   for(Fournisseur frs:list) {
		   if (frs.getCodeFrs().equals(codeFrs)) return false;
			
		}
		   return true;
   }
   
   public String nextFournisseur() {  //recupere nouvelle valeur
	   Integer lastId =0;
	   String codeFrs=null;
	   
	   rs = db.executionQuery("SELECT * FROM fournisseur ORDER BY codeFrs DESC LIMIT 1");
	   try {
		while (rs.next()) {
			codeFrs = rs.getString("codeFrs");
		}
		if (codeFrs!=null) lastId = Integer.parseInt(codeFrs.split("FRS")[1]);
			
	} catch (SQLException ex) {
		// TODO: handle exception
		System.out.println(ex.getMessage());
	}
	return codeFrsFormat(lastId+1); 
   }
   
   public String codeFrsFormat(Integer id) {
	   if (id<10) return"FRS0"+id;
		
	 else return "FRS"+id;
	   
   }
   
   public ArrayList<Fournisseur> chiffreAffaire(String annee){
	   ArrayList<Fournisseur> list = new ArrayList<>();
	   if(annee.isEmpty())
		   rs = db.executionQuery("SELECT fournisseur.codeFrs,nom,dateAppro,sum(qteAppro*pu) as chiffre FROM lignefr,fournir,produits,fournisseur WHERE produits.codePro=lignefr.codePro AND lignefr.idFournir=fournir.idFournir AND fournisseur.codeFrs=fournir.codeFrs GROUP BY fournisseur.codeFrs");
	   else   
		   rs = db.executionQuery("SELECT fournisseur.codeFrs,nom,dateAppro,sum(qteAppro*pu) as chiffre FROM lignefr,fournir,produits,fournisseur WHERE produits.codePro=lignefr.codePro AND lignefr.idFournir=fournir.idFournir AND fournisseur.codeFrs=fournir.codeFrs AND YEAR(dateAppro)="+annee+" GROUP BY fournisseur.codeFrs");
	   try {
		   while(rs.next()) {
			   Fournisseur frs = new Fournisseur();
			   frs.setCodeFrs(rs.getString("codeFrs"));
			   frs.setNom(rs.getString("nom"));
			   frs.setChiffre(rs.getString("chiffre"));
			   list.add(frs);
		   }
		
	} catch(SQLException ex)
		{
        System.out.println(ex.getMessage());
	}
	return list;
   }
   
   public Boolean addFournisseur(Fournisseur frs) {
	   return db.executionUpdate("INSERT INTO fournisseur (codeFrs,nom,adr) VALUES ('"+frs.getCodeFrs()+"','"+frs.getNom()+"','"+frs.getAdr()+"')");
   }
   
   public Boolean updateFournisseur(Fournisseur frs) {
	   return db.executionUpdate("UPDATE fournisseur SET nom = '"+frs.getNom()+"', adr= '"+frs.getAdr()+"' WHERE codeFrs = '"+frs.getCodeFrs()+"'");
   }
   
   public Boolean deleteFournisseur(String codeFrs) {
	   return db.executionUpdate("DELETE FROM fournisseur WHERE codeFrs= '"+codeFrs+"'");
   }
   
   
}
