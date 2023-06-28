<%@page import="com.shoppingcart_dto.Product"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
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
	
	Product p = em.find(Product.class, id1);
	System.out.println(id1);
	%>

		<form action="Update_Price.jsp?id=<%=p.getId()%>">
			<table cellpadding="20" align="center" border="20px">

		  <th>ID</th>
		  <tr>
			<td><%=p.getId()%></td>
			<td><input type="number" placeholder="Enter Price Of Product" name="price" class="input"></td>
			<td><input type="submit"></td>
			
		</tr>
		</table>
		</form>
	
</body>
</html>