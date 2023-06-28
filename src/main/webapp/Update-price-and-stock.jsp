<%@page import="com.shoppingcart_dto.Product"%>
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
<title>Update Price and Stock</title>
</head>
<body>
	<%
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();
	
	Product p = new Product();
	
	String price = request.getParameter("price");
	double price1 = Double.parseDouble(price);
	
	p.setPrice(price1);
	
	et.begin();
	em.merge(p);
	et.commit();
	
	emf.close();
	em.close();
	
	RequestDispatcher rd = request.getRequestDispatcher("UpdateProduct.jsp");
	rd.forward(request, response);
	%>
	
	
</body>
</html>