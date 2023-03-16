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

/**
 * Servlet implementation class DashboardServlet
 */
@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	LignefrBean lignfr = new LignefrBean();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				
		FournisseurBean  fournisseur = new FournisseurBean();
		FournirBean fournir = new FournirBean();
		
		request.setAttribute("lignfrs", lignfr.produitsParFournisseur(""));
		request.setAttribute("annees", fournir.getAnnee());
		request.setAttribute("chiffres", fournisseur.chiffreAffaire(""));
		request.setAttribute("fournisseurs", fournisseur.listFournisseur());
		
		this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String option =(request.getParameter("option")!=null)?request.getParameter("option"):"";
		String codeFrs =(request.getParameter("codeFrs")!=null)?request.getParameter("codeFrs"):"";
		String annee_cf =(request.getParameter("annee_cf")!=null)?request.getParameter("annee_cf"):"";
		
		FournisseurBean  fournisseur = new FournisseurBean();
		FournirBean fournir = new FournirBean();
		
		if(annee_cf.isEmpty()) {
			request.setAttribute("chiffres", fournisseur.chiffreAffaire(""));
		} else {
			request.setAttribute("selected_annee_cf", annee_cf);
			request.setAttribute("chiffres", fournisseur.chiffreAffaire(annee_cf));
		}
		
		if(option.isEmpty()) {
			request.setAttribute("lignfrs", lignfr.produitsParFournisseur(codeFrs));
		} else {

			if(option.equals("1")) {
				String annee =(request.getParameter("annee")!=null)?request.getParameter("annee"):"";
				request.setAttribute("selected_annee", annee);
				request.setAttribute("lignfrs", lignfr.produitsParFournisseurParAnnee(codeFrs, annee));
			} else if (option.equals("2")) {
				String mois =(request.getParameter("mois")!=null)?request.getParameter("mois"):"";
				request.setAttribute("selected_mois", mois);
				request.setAttribute("lignfrs", lignfr.produitsParFournisseurParMois(codeFrs, mois));
			} else if (option.equals("3")) {
				String date_debut =(request.getParameter("date_debut")!=null)?request.getParameter("date_debut"):"";
				String date_fin =(request.getParameter("date_fin")!=null)?request.getParameter("date_fin"):"";
				request.setAttribute("selected_db", date_debut);
				request.setAttribute("selected_df", date_fin);
				request.setAttribute("lignfrs", lignfr.produitsParFournisseurParDates(codeFrs, date_debut, date_fin));
			}
		}

		request.setAttribute("selected_cf", codeFrs);
		request.setAttribute("annees", fournir.getAnnee());
		request.setAttribute("fournisseurs", fournisseur.listFournisseur());
		
		this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
