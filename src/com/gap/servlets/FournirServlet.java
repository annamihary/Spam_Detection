package com.gap.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.gap.beans.FournirBean;
import com.gap.beans.FournisseurBean;
import com.gap.classe.Fournir;



@WebServlet("/FournirServlet")
public class FournirServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       FournirBean fournir = new FournirBean();
       Fournir fr = new Fournir();
  
    public FournirServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getServletPath();
		if(path.equals("/listFournir")) {
			request.setAttribute("fournir", fournir.listFournir());
			this.getServletContext().getRequestDispatcher("/WEB-INF/Fournir/listFournir.jsp").forward(request, response);
		}
		
		if(path.equals("/ajoutFournir")) {
			FournisseurBean frs = new FournisseurBean();
			request.setAttribute("option", "ajout");
			request.setAttribute("fournisseurs", frs.listFournisseur());
			this.getServletContext().getRequestDispatcher("/WEB-INF/Fournir/editFournir.jsp").forward(request,response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getServletPath();
		String option =(request.getParameter("option")!=null)?request.getParameter("option"):"";
	
		
		if(path.equals("/modifFournir")) {
			fr = fournir.getFournir(request.getParameter("idFournir"));
			request.setAttribute("option", "modif");
			request.setAttribute("idFournir", fr.getIdFournir());
			request.setAttribute("codeFrs", fr.getCodeFrs());
			request.setAttribute("dateAppro", fr.getDateAppro());
			this.getServletContext().getRequestDispatcher("/WEB-INF/Fournir/editFournir.jsp").forward(request,response);
			
			
		}
		
	    if(path.equals("/suppFournir")) {
	    	String idFournir = request.getParameter("idFournir");
			fournir.deleteFournir(idFournir);
			response.sendRedirect("listFournir");
	    }
		
		if(option.equals("add")) {
			String codeFrs = request.getParameter("codeFrs");
			String dateAppro = request.getParameter("dateAppro");
			fr.setCodeFrs(codeFrs);
			fr.setDateAppro(dateAppro);
			fournir.addFournir(fr);
		
			response.sendRedirect("listFournir");
		}
		
		if(option.equals("update")) {
			String idFournir = request.getParameter("idFournir");
			String codeFrs = request.getParameter("codeFrs");
			String dateAppro = request.getParameter("dateAppro");
			fr.setIdFournir(idFournir);
			fr.setDateAppro(dateAppro);
			fr.setCodeFrs(codeFrs);
			fournir.updateFournir(fr);
			response.sendRedirect("listFournir");
		}
	}
	}


