package com.shoppingcart_dao;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart_dto.Product;

@WebServlet("/updateprice")
public class Update_Price extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		Product p = new Product();
		
		String price = req.getParameter("price");
		double price1 = Double.parseDouble(price);
		
		p.setPrice(price1);
		
		
		
		et.begin();
		em.merge(p);
		et.commit();
		
		emf.close();
		em.close();
		
		RequestDispatcher rd = req.getRequestDispatcher("UpdateProduct.jsp");
		rd.forward(req, resp);	
	}

}
