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
    String p_birthday = request.getParameter("birthday");
    String p_memo = request.getParameter("memo");
    database.connectDB();
    database.query("select * from login where name = '" + p_name +"';");
    ResultSet rs = database.getRS();
    if (rs.next() == false){
      database.insertData(p_name,p_password,p_birthday,p_memo);
      out.println("Registrate successful!");
    }
    else{
      out.println("Il y a un probléme! This username has been used.");
    }
%>
<html>
  <head>
  </head>
  <body>
    <button onclick="window.open('index.html','_self')">Login Page</button>
  </body>
</html>
