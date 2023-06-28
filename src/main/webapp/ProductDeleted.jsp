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
<title>Delete Product</title>
</head>
<body>
	<%
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		
		Product p = em.find(Product.class, id1);
		
		Merchant m = (Merchant) session.getAttribute("merchant");
		
		p.setMerchant(m);
		List<Product> products = new ArrayList();
		
		products.remove(p);
		
		m.setProducts(products);
		
		et.begin();
		em.merge(m);
		em.remove(p);
		et.commit();
		
		PrintWriter pw = response.getWriter();
		pw.write("Product Deleted Successfully");
		RequestDispatcher rd = request.getRequestDispatcher("DeleteProduct.jsp");
		rd.include(request, response);
		response.setContentType("text/html");
	%>
</body>
</html>