package com.gap.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gap.beans.FournirBean;
import com.gap.beans.FournisseurBean;
import com.gap.beans.LignefrBean;
import com.gap.beans.ProduitsBean;
import com.gap.classe.Fournir;
import com.gap.classe.Fournisseur;
import com.gap.classe.Lignefr;



@WebServlet("/FrServlet")
public class LignfrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LignefrBean lignfr = new LignefrBean();
	Lignefr frir = new Lignefr();

	public LignfrServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		if (path.equals("/lignefr")) {
			String idFournir =(request.getParameter("id")!=null)?request.getParameter("id"):"";
			
			FournirBean fournir = new FournirBean();
			Fournir fr = fournir.getFournir(idFournir);
			 
			request.setAttribute("idFournir", idFournir);
			
			FournisseurBean  fournisseur = new FournisseurBean();
			Fournisseur frs = fournisseur.getFournisseur(fr.getCodeFrs());
			request.setAttribute("codeFrs", frs.getCodeFrs());
			request.setAttribute("nom", frs.getNom());
			
			request.setAttribute("lignefrs", lignfr.listFr(idFournir));
			request.setAttribute("factures", lignfr.factureFournir(idFournir));
			this.getServletContext().getRequestDispatcher("/WEB-INF/Fr/listFr.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		String option =(request.getParameter("option")!=null)?request.getParameter("option"):"";
		
		if(path.equals("/ajoutlignefr")) {
			String retour = request.getParameter("retour");
			FournirBean fournir = new FournirBean();
			request.setAttribute("option", "ajout");
			request.setAttribute("retour", retour);
			Fournir fr = fournir.getFournir(request.getParameter("idFournir"));
			request.setAttribute("idFournir", fr.getIdFournir());
			
			//String idFournir =request.getParameter("idFournir");
			//request.setAttribute("option", "ajout");
			//request.setAttribute("idFournir", idFournir);
			
		    FournisseurBean  fournisseur = new FournisseurBean();
			Fournisseur frs = fournisseur.getFournisseur(fr.getCodeFrs());
			request.setAttribute("codeFrs", frs.getCodeFrs());
			request.setAttribute("nom", frs.getNom());
			request.setAttribute("adr", frs.getAdr());
			
			
			ProduitsBean produit = new ProduitsBean();
			request.setAttribute("produits", produit.listProduits());
			this.getServletContext().getRequestDispatcher("/WEB-INF/Fr/editFr.jsp").forward(request, response);
		}
		
		if(path.equals("/modiflignefr")) {
			FournirBean fournir = new FournirBean();
			request.setAttribute("option", "modif");
			 
			Lignefr frir = lignfr.getLigneFr(request.getParameter("idLignefr"));
			
			request.setAttribute("idLignefr", frir.getIdLignefr());
			request.setAttribute("idFournir", frir.getIdFournir());
			request.setAttribute("codePro", frir.getCodePro());
			request.setAttribute("qteAppro", frir.getQteAppro());
			
			Fournir fr = fournir.getFournir(frir.getIdFournir());
			
			request.setAttribute("dateAppro", fr.getDateAppro());
			
			FournisseurBean fournisseur = new FournisseurBean();
			Fournisseur frs = fournisseur.getFournisseur(fr.getCodeFrs());
			request.setAttribute("codeFrs", frs.getCodeFrs());
			request.setAttribute("nom", frs.getNom());
			request.setAttribute("adr", frs.getAdr());
			
			ProduitsBean produit = new ProduitsBean();
			request.setAttribute("produits", produit.listProduits());
			this.getServletContext().getRequestDispatcher("/WEB-INF/Fr/editFr.jsp").forward(request, response);
		}
		
		if(path.equals("/supplignefr")) {
			String idLignefr = request.getParameter("idLignefr");
			String idFournir = request.getParameter("idFournir");
			String codePro = request.getParameter("codePro");
			String qteAppro = request.getParameter("qteAppro");
			
			// Mis à jour du stock 
		 	ProduitsBean produit = new ProduitsBean();
		 	produit.updateStock(0, codePro,  Integer.parseInt(qteAppro));
		 	
		 	lignfr.deleteFr(Integer.parseInt(idLignefr));
		 	
		 	response.sendRedirect("lignefr?id="+idFournir+"");
		 	
		}
		
		if(option.equals("add")) {
			//id n'est pas appelé car c'est auto increment;
			String idFournir = request.getParameter("idFournir");
			String codePro =request.getParameter("codePro");
			String qteAppro =request.getParameter("qteAppro");
			
			     frir.setIdFournir(idFournir);
			     frir.setCodePro(codePro);
			     frir.setQteAppro(Integer.parseInt(qteAppro));
			     lignfr.addfr(frir);
			     
			 	// Mis à jour du stock 
			 	ProduitsBean produit = new ProduitsBean();
			 	produit.updateStock(1, codePro,  Integer.parseInt(qteAppro));
			 	
			 	response.sendRedirect("lignefr?id="+idFournir+"");
		}
		
		if(option.equals("update")) {
			String idLignefr =request.getParameter("idLignefr");
			String idFournir =request.getParameter("idFournir");
			String codePro =request.getParameter("codePro");
			Integer qteAppro = Integer.parseInt(request.getParameter("qteAppro"));
			Integer qte_init = Integer.parseInt(request.getParameter("qte_init"));
			
			// Mis à jour du stock 
			ProduitsBean produit = new ProduitsBean();	
			if(qte_init<qteAppro)
				produit.updateStock(1, codePro, qteAppro - qte_init);
			else
				produit.updateStock(0, codePro, qte_init - qteAppro);
			
			frir.setIdLignefr(Integer.parseInt(idLignefr));
			frir.setIdFournir(idFournir);
			frir.setCodePro(codePro);
			frir.setQteAppro(qteAppro);
			
			lignfr.updateFr(frir);
			response.sendRedirect("lignefr?id="+idFournir+"");
			
		}

	}
	  
}	

