<%@page import="com.shoppingcart_dto.Admin"%>
<%@page import="java.lang.reflect.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart_dto.Merchant"%>
<%@page import="com.shoppingcart_dto.Customer"%>
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
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
	
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		
		Customer c = em.find(Customer.class, id1);
		c.setStatus("Blocked");
		
		Admin a = (Admin) session.getAttribute("admin");
		
		c.setAdmin(a);
		List<Customer> customers = new ArrayList();
		
		if(a.getCustomers() != null){
			customers.add(c);
		}else{
			customers = new ArrayList();
			customers.add(c);
		}
		a.setCustomers(customers);
		
		et.begin();
		em.merge(a);
		em.merge(c);
		et.commit();
		
		emf.close();
		em.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("BlockAndDelete.jsp");
		rd.forward(request, response);
	
	%>
</body>
</html>