<%@ page import = "java.sql.*"%>
<%
String fullName = request.getParameter("fullName");
String email = request.getParameter("email");
String username = request.getParameter("username");
String password = request.getParameter("password");


try{
   
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
   PreparedStatement ps = conn.prepareStatement("insert into registration(fullName, email, username, password) values(?,?,?,?);");
    ps.setString(1,fullName);
    ps.setString(2,email);
    ps.setString(3,username);
    ps.setString(4,password);
    int x = ps.executeUpdate();
    if(x>0){
        response.sendRedirect("login.html");
    }else{
        out.println("failed.....");
    }

}catch(Exception e){
    out.println(e);
}

 %>