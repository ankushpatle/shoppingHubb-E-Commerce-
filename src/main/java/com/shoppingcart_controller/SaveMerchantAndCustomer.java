package com.shoppingcart_controller;

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

import com.shoppingcart_dto.Customer;
import com.shoppingcart_dto.Merchant;

@WebServlet("/savedata")
public class SaveMerchantAndCustomer extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String mobileNumber = req.getParameter("mobilenumber");

		String choice = req.getParameter("choice");

		if (choice.equals("create account as merchant")) {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
			EntityManager em = emf.createEntityManager();
			EntityTransaction et = em.getTransaction();

			Merchant merchant = new Merchant();
			merchant.setName(name);
			merchant.setEmail(email);
			merchant.setPassword(password);
			merchant.setMobileNumber(Long.parseLong(mobileNumber));
			merchant.setStatus("Inactive");

			et.begin();
			em.persist(merchant);
			et.commit();

			PrintWriter pw = resp.getWriter();
			pw.print("Account Created Succsesully");
			RequestDispatcher rd = req.getRequestDispatcher("createaccount.html");
			rd.include(req, resp);
			resp.setContentType("text/html");

		} else {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
			EntityManager em = emf.createEntityManager();
			EntityTransaction et = em.getTransaction();

			Customer customer = new Customer();
			customer.setName(name);
			customer.setEmail(email);
			customer.setPassword(password);
			customer.setMobileNumber(Long.parseLong(mobileNumber));
			customer.setStatus("active");

			et.begin();
			em.persist(customer);
			et.commit();

			PrintWriter pw = resp.getWriter();
			pw.print("Account Created Succsesully");
			RequestDispatcher rd = req.getRequestDispatcher("createaccount.html");
			rd.include(req, resp);
			resp.setContentType("text/html");

		}

	}

}
