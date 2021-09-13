<%@ page import = "java.sql.*"%>
<%



try{
     String username = request.getParameter("username");
 String password = request.getParameter("password");
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
     PreparedStatement ps = conn.prepareStatement("Select username,password from registration where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, password);

             ResultSet rs = ps.executeQuery();

           if(rs.next()){
              response.sendRedirect("index.jsp");
           }else{
               out.println("incorrect Password");
           }

}catch(Exception e){
    out.println(e);
}


%>