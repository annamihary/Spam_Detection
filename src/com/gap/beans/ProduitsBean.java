package com.gap.beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.gap.classe.Produits;

import database.Database;

public class ProduitsBean {
	ResultSet rs;
	Database db;
	
	public ProduitsBean(){
		db= new Database();
	}
	
	public ArrayList<Produits> listProduits(){
		ArrayList<Produits> list = new ArrayList<>();
		rs= db.executionQuery("SELECT * FROM produits");
		try {
			while (rs.next()) {
				Produits pro = new Produits();
				pro.setCodePro(rs.getString("codePro"));
				pro.setDesign(rs.getString("design"));
				pro.setPu(rs.getInt("pu"));
				pro.setStock(rs.getInt("stock"));
				list.add(pro);
			}
			
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
		return list;
		
	}
	
	public ArrayList<String> listNom(){
		ArrayList<String> list = new ArrayList<>();
		rs= db.executionQuery("SELECT * FROM produits");
		try {
			while (rs.next()) {
				list.add(rs.getString("design"));
				
			}
			
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
		return list;
	}
	
	public ArrayList<Integer> listStock(){
		ArrayList<Integer> list = new ArrayList<>();
		rs= db.executionQuery("SELECT * FROM produits");
		try {
			while (rs.next()) {
				list.add(rs.getInt("stock"));
				
			}
			
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
		return list;
	}
	
	public Produits getProduits(String codePro) {
		Produits pro= null;
		rs= db.executionQuery("SELECT * FROM produits WHERE codePro='"+codePro+"'");
		try {
			while (rs.next()) {
				 pro = new Produits();
				 pro.setCodePro(rs.getString("codePro"));
				 pro.setDesign(rs.getString("design"));
				 pro.setPu(rs.getInt("pu"));
				 pro.setStock(rs.getInt("stock"));
				
			}
			
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
			// TODO: handle exception
		}
		return pro;
		
	}
	
	public Boolean verifyProduits(String codePro) {
		ArrayList<Produits> list = listProduits();
		for(Produits pro: list) {
			if (pro.getCodePro().equals(codePro)) return false; 
				
			} return true;
		}
	
	public String nextProduits() {
		Integer lastId =0;
		String codePro=null;
		
		rs = db.executionQuery("SELECT * FROM produits ORDER BY codePro DESC LIMIT 1");
		try {
			while (rs.next()) {
				codePro = rs.getString("codePro");
			}
			if (codePro !=null) lastId = Integer.parseInt(codePro.split("PRO")[1]);
			
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
		return codeProFormat(lastId+1);
	}
	
	public String codeProFormat(Integer id) {
		return "PRO" + id;
	}
	
	public Boolean updateStock(int options, String codePro, Integer qteAppro) {
		if(!codePro.isEmpty()) {
			Produits pro = getProduits(codePro);
			Integer stock = 0;
			switch (options) {
			case 0: stock = pro.getStock() - qteAppro ; break;
			case 1: stock = pro.getStock() + qteAppro ; break;
				
			default: return false;
			}
			
			if(stock>=0) {
				pro.setStock(stock);
				return updateProduits(pro);
			}
		}
		return false;
	}
	
	public String join(ArrayList<?> arr, String del) {
		StringBuilder output = new StringBuilder();
		for(int i = 0; i<arr.size(); i++)
		{
			if(i>0) output.append(del);
			
			// --- Quote strings, only, for JS syntax
			if (arr.get(i) instanceof String) output.append("\"");
            output.append(arr.get(i));
            if (arr.get(i) instanceof String) output.append("\"");
		}
		 return output.toString();
	}
	
	public Boolean addProduits(Produits pro) {
		return db.executionUpdate("INSERT INTO produits(codePro, design, pu, stock) VALUES('"+pro.getCodePro()+"','"+pro.getDesign()+"','"+pro.getPu()+"', '"+pro.getStock()+"')");
	}
	
	public Boolean updateProduits(Produits pro) {
		return db.executionUpdate("UPDATE produits SET design='"+pro.getDesign()+"' , pu='"+pro.getPu()+"' , stock='"+pro.getStock()+"' WHERE codePro='"+pro.getCodePro()+"'" );
	}
	
	public Boolean deleteProduits(String codePro) {
		return db.executionUpdate("DELETE FROM produits WHERE codePro='"+codePro+"'");
	}
	}
	
	


