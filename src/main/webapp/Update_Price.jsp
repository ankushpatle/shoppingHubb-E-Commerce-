<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart_dto.Merchant"%>
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
<title>Update Price</title>
</head>
<body>
	<%
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();
	
	String id = request.getParameter("id");
	int id1 = Integer.parseInt(id);
	
	String price = request.getParameter("price");
	System.out.println(price);
	double price1 = Double.parseDouble(price);
	
	
	Product p = em.find(Product.class, id1);
	
	p.setPrice(price1);
	
	
	et.begin();
	em.merge(p);
	et.commit();
	
	PrintWriter pw = response.getWriter();
	pw.write("Product Updated Successfully");
	RequestDispatcher rd = request.getRequestDispatcher("ViewProduct.jsp");
	rd.include(request, response);
	response.setContentType("text/html");
	%>
</body>
</html>