package com.shoppingcart_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingcart_dto.Admin;
import com.shoppingcart_dto.Customer;
import com.shoppingcart_dto.Merchant;

@WebServlet("/loginvalidation")
public class LoginValidation extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		String choice = req.getParameter("choice");

		if (choice.equals("Customer")) {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
			EntityManager em = emf.createEntityManager();

			Query query = em.createQuery("select a from Customer a where a.email=?1 and a.password=?2");
			query.setParameter(1, email);
			query.setParameter(2, password);

			List<Customer> customers = query.getResultList();
			if (customers.size() > 0) {
				
				Customer c = customers.get(0);
				HttpSession hs = req.getSession();
				hs.setAttribute("customer", c);
				
				RequestDispatcher rd = req.getRequestDispatcher("Customer_Home_Page.html");
				rd.forward(req, resp);
				
			} else {
				PrintWriter pw = resp.getWriter();
				pw.print("Invalid Credentials");
				RequestDispatcher rd = req.getRequestDispatcher("LoginPage.html");
				rd.include(req, resp);
				resp.setContentType("text/html");
			}

		} else if (choice.equals("Merchant")) {

			EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
			EntityManager em = emf.createEntityManager();

			Query query = em.createQuery("select a from Merchant a where a.email=?1 and a.password=?2");
			query.setParameter(1, email);
			query.setParameter(2, password);

			List<Merchant> merchants = query.getResultList();
			if (merchants.size() > 0) {

				Merchant m = merchants.get(0);
				if (m.getStatus().equals("Active")) {
					RequestDispatcher rd = req.getRequestDispatcher("merchantoption.jsp");
					rd.forward(req, resp);
					
					Merchant m1 = merchants.get(0);
					HttpSession hs = req.getSession();
					hs.setAttribute("merchant", m1);

				} else if (m.getStatus().equals("Inactive")) {

					PrintWriter pw = resp.getWriter();
					pw.print("your Account is Not Active");
					RequestDispatcher rd = req.getRequestDispatcher("LoginPage.html");
					rd.include(req, resp);
					resp.setContentType("text/html");

				} else if (m.getStatus().equals("Blocked")) {

					PrintWriter pw = resp.getWriter();
					pw.print("Merchant you have Blocked from Admin");
					RequestDispatcher rd = req.getRequestDispatcher("LoginPage.html");
					rd.include(req, resp);
					resp.setContentType("text/html");
				}

			} else {
				PrintWriter pw = resp.getWriter();
				pw.print("Invalid Credentials");
				RequestDispatcher rd = req.getRequestDispatcher("LoginPage.html");
				rd.include(req, resp);
				resp.setContentType("text/html");
			}

		} else if (choice.equals("Admin")) {

			EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
			EntityManager em = emf.createEntityManager();

			Query query = em.createQuery("select a from Admin a where a.email=?1 and a.password=?2");
			query.setParameter(1, email);
			query.setParameter(2, password);

			List<Admin> admins = query.getResultList();
			if (admins.size() > 0) {
				Admin a = admins.get(0);
				HttpSession hs = req.getSession();
				hs.setAttribute("admin", a);

				RequestDispatcher rd = req.getRequestDispatcher("Adminoption.jsp");
				rd.forward(req, resp);

			} else {
				PrintWriter pw = resp.getWriter();
				pw.print("Invalid Credentials");
				RequestDispatcher rd = req.getRequestDispatcher("LoginPage.html");
				rd.include(req, resp);
				resp.setContentType("text/html");
			}

		}
	}
}
