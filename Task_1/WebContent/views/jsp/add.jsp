<%@page import="com.ces.model.BookModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="views/css/add.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: center">
<%! String type = "null"; %>
<% 	BookModel bookModel = (BookModel)request.getAttribute("book");
	if(bookModel != null) type = "edit";
%>
	<form style="display: inline-block;" action="<%= request.getContextPath() %>/Book" method="POST">
	
		<h2>Create book</h2>
		<div class="add" style="display: flex">
			<div class="add__lable">
				<p style="margin-top: .5rem">Name:</p> </br></br>
				<p style="margin-top: -.5rem">Author:</p> 
			</div>
			<div class="add__input">
				<input
					style="padding: .5rem; width: 20rem"
					type="text"
					placeholder="Enter book's name"
					name="name"
					value="<% if(bookModel != null) { %> <%= bookModel.getName() %> <% } %>"
				/></br></br>
				<%
					String error = (String)request.getAttribute("error");
					if(error != null) { %>
					<p style="margin-top: -1rem; color: red; display: flex; justify-content: flex-end; font-size: .7rem">
						<%= error %>
					</p>
				<%	} %>
				<input
				style="padding: .5rem; width: 20rem"
					type="text"
					placeholder="Enter book's author"
					name="author"
					value="<% if(bookModel != null) { %> <%= bookModel.getAuthor() %> <% } %>"
				/>
				<input
					
					name=type
					type="hidden"
					value="<%= type %>"
				/>
				<%
					if(bookModel != null) { %>
					<input name="id" type="hidden" value="<%= bookModel.getId() %>"/>
				<% } %>
			</div>
		</div>
		<div class="add__actions" style="display: flex; justify-content: flex-end;">
			<% if(request.getParameter("type") != null && request.getParameter("type").equals("edit")) { %>
				<button type="submit" style="margin-right: .5rem; padding: .5rem">
					Update
				</button>
				
			<% } else { %>
				<button type="submit" style="padding: .5rem">
					Submit
				</button>
			<% } %>
			<button>
				<a href="<%= request.getContextPath() %>/Book">Cancel</a>
			</button>
		</div>
	</form>
</body>
</html>