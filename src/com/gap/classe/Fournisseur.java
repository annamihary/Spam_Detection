package com.gap.classe;

public class Fournisseur {
	String codeFrs;
	String nom;
	String adr;
	String chiffre;
	
	public String getChiffre() {
		return chiffre;
	}
	public void setChiffre(String chiffre) {
		this.chiffre = chiffre;
	}
	public String getCodeFrs() { 
		return codeFrs;              //retourne le codeFrs
	}
	public void setCodeFrs(String codeFrs) {
		this.codeFrs = codeFrs;     //definit le codeFrs
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
		
	}
	public String getAdr() {
		return adr;
	}
	public void setAdr(String adr) {
		this.adr = adr;
		
	}
}
