
<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id = "database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="sql12.freemysqlhosting.net"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="sql12172477"/>
  <jsp:setProperty property="user" name="database" value="sql12172477"/>
  <jsp:setProperty property="password" name="database" value="4sCZKh9RiR"/>
</jsp:useBean>
<%
  request.setCharacterEncoding("UTF-8");
  String p_name = request.getParameter("name");
  String p_password = request.getParameter("password");
  database.connectDB();
  database.query("select * from login where name='" + p_name + "' and password='" + p_password + "';");
  ResultSet rs = database.getRS();
  if (rs.next()) {
      response.sendRedirect("success.html");
  } else {
      out.println("Invalid password <a href='index.html'>try again</a>");
  }
%>
