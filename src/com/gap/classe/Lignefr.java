package com.gap.classe;

public class Lignefr extends Produits {
	Integer idLignefr;
	Integer qteAppro;
	/* Classe mère */
	String idFournir;
	String dateAppro;
	String montant;
	

	public String getIdFournir() {
		return idFournir;
	}
	public void setIdFournir(String idFournir) {
		this.idFournir = idFournir;
	}
	public String getDateAppro() {
		return dateAppro;
	}
	public void setDateAppro(String dateAppro) {
		this.dateAppro = dateAppro;
	}
	public Integer getIdLignefr() {
		return idLignefr;
	}
	public void setIdLignefr(Integer idLignefr) {
		this.idLignefr = idLignefr;
	}
	public Integer getQteAppro() {
		return qteAppro;
	}
	public void setQteAppro(Integer qteAppro) {
		this.qteAppro = qteAppro;
	}
	public String getMontant() {
		return montant;
	}
	public void setMontant(String montant) {
		this.montant = montant;
	}
	
	


}
