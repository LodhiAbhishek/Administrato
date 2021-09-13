<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root",""); // create connection 
	
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		int hide; 
		
		String name_up,designation_up;
		
		hide=Integer.parseInt(request.getParameter("txt_hide")); //it is hidden id get for update record
		name_up=request.getParameter("txt_name");  //txt_name
		designation_up=request.getParameter("txt_designation"); //txt_owner
		
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update person set name=?, designation=? where id=?"); //sql update query 
		pstmt.setString(1,name_up);
		pstmt.setString(2,designation_up);
		pstmt.setInt(3,hide);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("Update Successfully...! Click Back link."); //after update record successfully message
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>JSP:Insert, Update, Delete using MySQL</title>
		
	<!--css for div main class and table-->
	<style type="text/css">
		
		.main
		{
			width:700px;;
			margin-left:250px;
			padding: 10px;
			border: 5px solid grey;
			
		}
		table
		{
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 600px;
		}
		td
		{
			border: 5px solid silver;
			text-align: left;
			padding: 8px;
		}
		</style>	
		
		<!-- javascript for form validation-->
		<script>
		
			function validate()
			{
				var name = document.myform.txt_name;
				var designation = document.myform.txt_owner;
				
				if (name.value == "")
				{
					window.alert("please enter name ?");
					name.focus();
					return false;
				}
				if (owner.value == "")
				{
					window.alert("please enter designation ?");
					owner.focus();
					return false;
				}
			}
			
		</script>
		
	</head>
	
<body>

	<div class="main">

	<form method="post" name="myform"  onsubmit="return validate();">
	
		
			<h1 text-align:center>Update Record</h1>
		
		
		<table>	
		   <%
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); //load driver  
		
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root",""); // create connection  
	
			if(request.getParameter("edit")!=null) 
			{
				int id=Integer.parseInt(request.getParameter("edit"));
		
				String name,owner;
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from candidate where id=?"); // sql select query
				pstmt.setInt(1,id);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					id=rs.getInt(1);
					name=rs.getString(2);
					owner=rs.getString(3);
			%>
			<tr>
				<td>Name</td>
				<td><input type="text" name="txt_name" value="<%=name%>"></td>
			</tr>
			
			<tr>
				<td>Owner</td>
				<td><input type="text" name="txt_designation" value="<%=owner%>"></td>
			</tr>	
			
			<tr>
				<td><input type="submit" name="btn_update" value="Update"></td>	
			</tr>
				
				<input type="hidden" name="txt_hide" value="<%=id%>">
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>
		
		<center>
				<h1><a href="index.jsp">Back</a></h1>
		</center>
		
	</form>

	</div>
	
	

</body>

</html>