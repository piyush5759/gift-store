<%-- 
    Document   : cookie
    Created on : Jun 15, 2013, 4:05:05 PM
    Author     : Piyush
--%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%String header_response = request.getParameter("header");%>
        <%! Connection con = null;%>
        <%! Statement st = null;%>
        <%! ResultSet rs = null;%> 

        <div id="cookiedelete">
            <%  String username = "", password = "", useremail = "";
                int userid = 0;
                String user_password = request.getParameter("pass");
                String user_email = request.getParameter("user_emailid");
                try {
                    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb1", "mydb", "mydb");
                    PreparedStatement pst = con.prepareStatement("select user_id,user_name,user_emailid,user_password from user_registration where USER_EMAILID=?");
                    pst.setString(1, user_email);
                    rs = pst.executeQuery();
                    con.setAutoCommit(false);

                    while (rs.next()) {
                        userid = rs.getInt(1);
                        username = rs.getString(2);
                        useremail = rs.getString(3);
                        password = rs.getString(4);
                    }

                    if (header_response.equals("logout")) {
                        Cookie cookie = null;
                        Cookie[] cookies = null;
                        // Get an array of Cookies associated with this domain
                        cookies = request.getCookies();
                        for (int i = 0; i < cookies.length; i++) {
                            cookie = cookies[i];
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);

                        }
                        session.removeAttribute("username");
                        response.sendRedirect("index.jsp");

                    } else if (header_response.equals("login")) {
                        if (!user_email.equals(useremail)) {
                            out.print(user_email);
                            out.print(useremail);
                            response.sendRedirect("index.jsp?errid=err2");
                        } else if (!user_password.equals(password)) {
                            response.sendRedirect("index.jsp?errid=err1");
                        } else {
                            Cookie userName = new Cookie("user_name", username);
                            userName.setMaxAge(60 * 60 * 24);
                            response.addCookie(userName);
                            request.getSession();
                            session.setAttribute("ID", session.getId());
                            session.setAttribute("user_id", userid);
                            session.setAttribute("username", username);
                            session.setMaxInactiveInterval(60 * 60);
                            response.sendRedirect("index.jsp?status=1");

                        }
                    }
                } catch (Exception e) {
                    //err = "Your email id is not registered, so please <a href='user_registration.jsp'>register</a>";
                    out.println(e);
                }
            %>
        </div>
    </body>
</html>
