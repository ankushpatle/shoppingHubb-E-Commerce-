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
    <title>Block Merchant</title>
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
	
	Query query = em.createQuery("select a from Merchant a where a.status='Active'");
	
	List<Merchant> merchants = query.getResultList();
	if(merchants.size()>0){
	%>
	<table cellpadding="20" align="center" border="20px">
		<th class="c1">ID</th>
		<th class="c1">Name</th>
		<th class="c1">E-Mail</th>
		<th class="c1">Password</th>
		<th class="c1">Mobile-Number</th>
		<th class="c1">Status</th>
		<th class="c1">Approve</th>

		<%
		for(Merchant m : merchants) {
		%>
		<tr>
			<td><%= m.getId() %></td>
			<td><%= m.getName() %></td>
			<td><%= m.getEmail() %></td>
			<td><%= m.getPassword() %></td>
			<td><%= m.getMobileNumber() %>
			<td><%= m.getStatus() %></td>
			<td> <a href="MerchantStatusBlock.jsp?id=<%=m.getId() %>"> Block </a></td>
		</tr>
				<% emf.close() ;
				em.close() ;%>

		<% }%>
	</table>
	<%} else{ %>
		<%
			PrintWriter pw = response.getWriter();
			pw.print("No Merchants to be Block");
	        RequestDispatcher rd = request.getRequestDispatcher("Adminoption.jsp");
	        rd.include(request, response);
	        response.setContentType("text/html");
	        emf.close() ;
			em.close() ;
			
		}%>
				
    </div>

</body>
</html>