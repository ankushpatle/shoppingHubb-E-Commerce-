<%@page import="com.shoppingcart_dto.Cart"%>
<%@page import="com.shoppingcart_dto.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart_dto.Product"%>
<%@page import="com.shoppingcart_dto.Merchant"%>
<%@page import="com.shoppingcart_dto.Customer"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		
		Item i = em.find(Item.class, id1);
		Cart c = em.find(Cart.class, id1);
		
		Customer customer = (Customer) session.getAttribute("customer");
		
		c.setCustomer(customer);
		i.setCart(c);
		
		List<Item> items = new ArrayList();	
		
		List<Cart> carts = new ArrayList();
		
		items.remove(i);
		carts.remove(c);
		
		et.begin();
		em.remove(c);
		em.remove(i);
		et.commit();
		
		PrintWriter pw = response.getWriter();
		pw.write("Item Deleted Successfully");
		RequestDispatcher rd = request.getRequestDispatcher("View_Item.jsp");
		rd.include(request, response);
		response.setContentType("text/html");
	%>
</body>
</html>