<%@page import="javax.persistence.Query"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shoppingcart_dto.Customer"%>
<%@page import="com.shoppingcart_dto.Item"%>
<%@page import="com.shoppingcart_dto.Cart"%>
<%@page import="java.util.List"%>
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
<title>Insert title here</title>
</head>
<body>
	<%
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		String price = request.getParameter("price");
		double price1= Double.parseDouble(price);
		
		
		Product product = em.find(Product.class, id1);
		
		Customer customer = (Customer)session.getAttribute("customer");
		System.out.println(customer);
		int cId = customer.getId();
		System.out.println(cId);
		
		Cart cart = new Cart();
		cart.setId(cId);
		
		List<Cart> cart1 = customer.getCart();
		
		double tp = cart.getTotalPrice();
		
		if(cart.getId() > 0){
			
			
			System.out.println(cart);
			
			cart1.setId(cId);
			cart.setTotalPrice(tp+price1);
			cart.setCustomer(customer);
			
			et.begin();
			em.merge(cart1);
			em.merge(customer);
			et.commit();
			
		}else{
			cart.setId(cId);
			cart.setTotalPrice(product.getPrice());
			cart.setCustomer(customer);
			
			et.begin();
			em.persist(cart);
			em.merge(customer);
			et.commit();
			
		}
		
	
	%>
</body>
</html>