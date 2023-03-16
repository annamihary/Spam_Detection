package com.gap.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.gap.beans.ProduitsBean;
import com.gap.classe.Produits;


@WebServlet("/ProduitsServlet")
public class ProduitsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       ProduitsBean produits = new ProduitsBean();
       Produits pro = new Produits();
  
    public ProduitsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		if(path.equals("/listProduits")) {
			request.setAttribute("produits", produits.listProduits());
			this.getServletContext().getRequestDispatcher("/WEB-INF/Produits/listProduits.jsp").forward(request,response);
		}
		if(path.equals("/ajoutProduits")) {
			request.setAttribute("option", "ajout"); 
			request.setAttribute("nextPro", produits.nextProduits());
			request.setAttribute("produits", produits.listProduits());
			this.getServletContext().getRequestDispatcher("/WEB-INF/Produits/editProduits.jsp").forward(request,response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		String option =(request.getParameter("option")!=null)?request.getParameter("option"):"";
		
		if(option.equals("add")) {
			String codePro =request.getParameter("codePro");
			String design =request.getParameter("design");
			String pu =request.getParameter("pu");
			String stock =request.getParameter("stock");
			if(produits.verifyProduits(codePro)) {
				pro.setCodePro(codePro);
				pro.setDesign(design);
				pro.setPu(Integer.parseInt(pu));
				pro.setStock(Integer.parseInt(stock));
				produits.addProduits(pro);
			}
			response.sendRedirect("listProduits");				
		}
	
		if(path.equals("/modifProduits")) {
			pro = produits.getProduits(request.getParameter("codePro"));
			request.setAttribute("option", "modif");
			request.setAttribute("codePro", pro.getCodePro());
			request.setAttribute("design", pro.getDesign());
			request.setAttribute("pu", pro.getPu());
			request.setAttribute("stock", pro.getStock());
			this.getServletContext().getRequestDispatcher("/WEB-INF/Produits/editProduits.jsp").forward(request,response);
		}
		
		if(path.equals("/suppProduits")) {
			String codePro =request.getParameter("codePro");
			produits.deleteProduits(codePro);
			response.sendRedirect("listProduits");
		}
		
		if(option.equals("update")) {
			String codePro= request.getParameter("codePro");
			String design= request.getParameter("design");
			String pu= request.getParameter("pu");
			String stock= request.getParameter("stock");
			pro.setCodePro(codePro);
			pro.setDesign(design);
			pro.setPu(Integer.parseInt(pu));
			pro.setStock(Integer.parseInt(stock));
			produits.updateProduits(pro);
			response.sendRedirect("listProduits");
		}
	}
	


}
