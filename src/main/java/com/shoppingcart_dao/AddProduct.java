package com.shoppingcart_dao;

import java.io.IOException;
import java.io.PrintWriter;

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
import javax.servlet.http.HttpSession;

import com.shoppingcart_dto.Merchant;
import com.shoppingcart_dto.Product;
@WebServlet("/addproduct")
public class AddProduct extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String category = req.getParameter("category");
		String price = req.getParameter("price");
		String stock = req.getParameter("stock");
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		Product p = new Product();
		
		HttpSession hs = req.getSession();
		Merchant m = (Merchant) hs.getAttribute("merchant");
		
		p.setMerchant(m);
		
		p.setName(name);
		p.setCategory(category);;
		p.setPrice(Double.parseDouble(price));
		p.setStock(Integer.parseInt(stock));
		
		et.begin();
		em.merge(m);
		em.persist(p);
		et.commit();
		
		PrintWriter pw = resp.getWriter();
		pw.write("Product Added Successfully");
		RequestDispatcher rd = req.getRequestDispatcher("AddProduct.html");
		rd.include(req, resp);
		resp.setContentType("text/html");
		
	}

}
