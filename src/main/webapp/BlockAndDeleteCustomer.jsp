<!DOCTYPE html>
<%@page import="com.shoppingcart_dto.Merchant"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart_dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Block and Delete Customer</title>
    <link rel="stylesheet" href="Common_Page.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
    <header class="header">
        <nav class="navbar">
             <a href="Home_Page.html">Home</a>
            <a href="About.html">About</a>
            <a href="Contact_Page.jsp">Contact</a>
            <a href="Feedback_Page.jsp">Feedback</a>
        </nav>

        <form action="#" class="search-bar">
            <input type="text" placeholder="search...">
            <button class="submit"><i class='bx bx-search'></i></button>
        </form>
    </header>

    <div class="background"></div>

    <div class="container">
     	<%
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ankush");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		Query query = em.createQuery("select a from Customer a where a.status= 'active'");
		List<Customer> customers = query.getResultList();
		
		if(customers.size()>0){  
	%>

	<table cellpadding="20" align="center" border="20px">
		<th>ID</th>
		<th>Email ID</th>
		<th>Mobile Number</th>
		<th>Name</th>
		<th>Password</th>
		<th>Status</th>
		<th>Block</th>
		<th>Delete</th>
	<%
	 for(Customer c : customers){
	%>
		<tr>
			<td><%= c.getId() %> </td>
			<td><%= c.getEmail() %> </td>
			<td><%= c.getMobileNumber() %> </td>
			<td><%= c.getName() %> </td>
			<td><%= c.getPassword() %> </td>
			<td><%= c.getStatus()%> </td>
			<td><a href="BlockCustomer.jsp?id=<%=c.getId() %>"> Block</a></td>
			<td><a href="DeleteCustomer.jsp?id=<%=c.getId()%>">Delete</a></td>
		</tr>
		<%} %>
	</table>
	<% } else{ 
		PrintWriter pw = response.getWriter();
		pw.write("Customer Does Not Exist");
		RequestDispatcher rd = request.getRequestDispatcher("merchantoption.jsp");
		rd.forward(request, response);
		response.setContentType("text/html");
		emf.close();
		em.close();
	}
	%>
				
    </div>

</body>
</html>