package com.gap.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gap.classe.Fournisseur;
import com.gap.beans.FournisseurBean;

@WebServlet("/Fournisseur")
public class FournisseurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       FournisseurBean fournisseur =  new FournisseurBean();
       Fournisseur frs = new Fournisseur();
    
    public FournisseurServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getServletPath();
		if(path.equals("/listFournisseur")) {
			request.setAttribute("fournisseur", fournisseur.listFournisseur());
			this.getServletContext().getRequestDispatcher("/WEB-INF/Fournisseur/listFournisseur.jsp").forward(request, response);	
		}
		
		if(path.equals("/ajoutFournisseur")) {
			request.setAttribute("option", "ajout");
			request.setAttribute("nextFour",fournisseur.nextFournisseur());
			request.setAttribute("fournisseur",fournisseur.listFournisseur());
			this.getServletContext().getRequestDispatcher("/WEB-INF/Fournisseur/editFournisseur.jsp").forward(request, response);
	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String path = request.getServletPath();
		String option =(request.getParameter("option")!=null)?request.getParameter("option"):"";
	
		if(option.equals("add")) {
			String codeFrs =request.getParameter("codeFrs");
			String nom =request.getParameter("nom");
			String adr =request.getParameter("adr");
			if(fournisseur.verifyFournisseur(codeFrs)) {
				frs.setCodeFrs(codeFrs);
				frs.setNom(nom);
				frs.setAdr(adr);
				fournisseur.addFournisseur(frs);
			}
			response.sendRedirect("listFournisseur");				
		}
		
		if(option.equals("modif")) {
			frs = fournisseur.getFournisseur(request.getParameter("codeFrs"));
			request.setAttribute("option", "modif");
			request.setAttribute("codeFrs", frs.getCodeFrs());
			request.setAttribute("nom", frs.getNom());
			request.setAttribute("adr", frs.getAdr());
			this.getServletContext().getRequestDispatcher("/WEB-INF/Fournisseur/editFournisseur.jsp").forward(request,response);
		}
		
		if(path.equals("/suppFournisseur")) {
			String codeFrs = request.getParameter("codeFrs");
			fournisseur.deleteFournisseur(codeFrs);
			response.sendRedirect("listFournisseur");
		}
		
		if(option.equals("update")) {
			String codeFrs =request.getParameter("codeFrs");
			String nom =request.getParameter("nom");
			String adr =request.getParameter("adr");
			frs.setCodeFrs(codeFrs);
			frs.setNom(nom);
			frs.setAdr(adr);
			fournisseur.updateFournisseur(frs);
			response.sendRedirect("listFournisseur");
			
		}
		
	}

}
