<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart_dto.Item"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart_dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Item</title>
</head>
<body>
	<% 
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
	
		Customer c = (Customer) session.getAttribute("customer");
		
		Query query = em.createQuery("select a from Item a ");
		
		List<Item> items = query.getResultList();
		
		if(items.size() >0){
			
	%>
		<table cellpadding="20" align="center" border="10px">
			<th>ID</th>
			<th>Name</th>
			<th>Category</th>
			<th>Price</th>
			<th>Quentity</th>
			<th>Remove item</th>
			
	<%
		for(Item i : items){ %>
		<tr>
			<td><%= i.getId() %></td>
			<td><%= i.getName() %></td>
			<td><%= i.getCategory() %></td>
			<td><%= i.getPrice() %></td>
			<td><%= i.getQuantity() %></td>
			<td><a href="Delete_Cart_and_Item.jsp?id=<%=i.getId()%>">Remove</a></td>
		</tr>
		<%} %>
		</table>
		<%} else{
			PrintWriter pw = response.getWriter();
			pw.write("Cart is Empty");
			RequestDispatcher rd = request.getRequestDispatcher("Customer_Home_Page.html");
			rd.include(request, response);
			response.setContentType("text/html");
		}
		%>
</body>
</html>