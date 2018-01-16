package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.lang.ArrayUtils;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.Date;
import java.util.*;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.util.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 Statement st1 = null;
 ResultSet rs1, rs2 = null;
 Connection con = null;
 Statement st = null;
 ResultSet rs = null;
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(1);
    _jspx_dependants.add("/header.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"home.css\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write(" ");
      out.write("\n");
      out.write("        <div id=\"container\"  >\n");
      out.write("            \n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
      out.write(" \n");
      out.write("        ");


            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb1", "mydb", "mydb");

        
      out.write("\n");
      out.write("       \n");
      out.write("            ");
      out.write("\n");
      out.write("            <div id=\"header\" >\n");
      out.write("                ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"cart\" style=\"float: right;font-size: 25px;\">  <a href=\"checkout.jsp?status=1\"><img src=\"img/shopcart.jpg\" width=\"60px\" height=\"60px\"/></a>\n");
      out.write("                ");

                    try {
                        request.getSession();
                        int counter = 0;
                        if (session.getAttribute("product_count") != null) {
                            counter = (Integer) session.getAttribute("product_count");
                        } else {
                            counter = 0;
                        }
                        if (counter != 0) {
                            out.print("(" + counter + ")");
                        } else {
                            out.print("(" + counter + ")");
                                   }
      out.write("\n");
      out.write("        </div><div id=\"login\" >\n");
      out.write("        ");

                        String error = (String) request.getParameter("errid");
                        if (session.getAttribute("username") == null || session == null) {// Session is not created.

       
      out.write("\n");
      out.write("            <div id=\"loginform\" style=\"float: right;margin-right: 10px;font-size: 20px;\"><form action=\"cookie.jsp?header=login\" method=\"post\">   \n");
      out.write("                    <table>\n");
      out.write("                        <tr>\n");
      out.write("                            ");

                                if (error == null) {
                                    out.println("Guest !  Welcome to our website.");
                                } else if (error.equals("err2")) {
                                    out.println("<font color='red'>* Your Email Id is not registered,so please Register.</font>");
                                } else if (error.equals("err1")) {
                                    out.println("<font color='red'>* Your Email Id and password do not match.</font>");
                                }
                            
      out.write("\n");
      out.write("\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Email Id : </td>\n");
      out.write("                            <td><input type=\"text\" name=\"user_emailid\" ></td>&nbsp;\n");
      out.write("                            <td>Password : </td>\n");
      out.write("                            <td><input type=\"password\" name=\"pass\"> </td>\n");
      out.write("                            <td> <input type=\"submit\" value=\"Login\" > </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr><td><a href='user_registration.jsp'>Register Here.</a></td></tr>\n");
      out.write("                    </table> \n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("                ");

                } else if (session.getAttribute("username") != null && session != null && request.getParameter("status").equals("1")) {
                    
      out.write("\n");
      out.write("                    <div id=\"loggedin\" style=\"float: right;margin-right: 10px;margin-top:29px;font-size: 25px;\">\n");
      out.write("                ");

                    out.println("Welcome " + session.getAttribute("username") + ",  to our website. <a href='cookie.jsp?header=logout'>Logout</a>");
                
      out.write(" </div></div>\n");
      out.write("                ");

                } else {
                    out.println("Guest!  Welcome to our website.");
                
      out.write("\n");
      out.write("        <div id=\"login\" style=\"float: right\">\n");
      out.write("            <form action=\"cookie.jsp?header=login\" method=\"post\">   \n");
      out.write("                <table>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Email Id : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"user_emailid\" ></td>&nbsp;\n");
      out.write("                        <td>Password : </td>\n");
      out.write("                        <td><input type=\"password\" name=\"pass\"> </td>\n");
      out.write("                        <td> <input type=\"submit\" value=\"Login\" > </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr><td><a href='user_registration.jsp'>Register Here.</a></td></tr>\n");
      out.write("                </table> \n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        ");
 }
            } catch (Exception e) {
                out.println("Welcome "+session.getAttribute("username") + ",  to our website. <a href='cookie.jsp?header=logout'>Logout</a>");
            }
        
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("  \n");
      out.write("        <div id=\"header\" >\n");
      out.write("            <a href=\"index.jsp\"><img src=\"img/index.jpg\" height=\"100px\" width=\"250\"></a><h2> GIFT STORE WEB-SITE</h2><BR>\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");
      out.write(" \n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            ");
      out.write("\n");
      out.write("            <div id=\"categorylist\" class=\"div\" style=\"width:1200px\" >\n");
      out.write("                ");

                    try {
                        st = con.createStatement();

                        rs = st.executeQuery("SELECT  category_id, category_name FROM Category where category_level=0");

                        con.setAutoCommit(false);

                        String parname = "", prodname = "", imgsrc = "";
                        int parid = 0, prodid = 0, prodprice = 0;
                        int i = 0, count = 0;
                        String[] catname = new String[500];
                        int catid[] = new int[500];

                        while (rs.next()) {
                            parid = rs.getInt(1);
                            parname = rs.getString(2);
                            out.println("<a href='category.jsp?catid=" + parid + "'>" + parname + "</a>&nbsp;&nbsp;&nbsp;");

                        }
                        out.println("<br><br>");
                        st1 = con.createStatement();
                        rs1 = st.executeQuery("SELECT DISTINCT CatC.CATEGORY_ID, catp.category_name || ' ' || CatC.category_name "
                                + "FROM Category catP  "
                                + "inner join Category CatC on CatP.Category_id=CatC.CATEGORY_PARENTID "
                                + "where CatP.category_Level = 0");
                        con.setAutoCommit(false);
                        while (rs1.next()) {
                            catid[count] = rs1.getInt(1);
                            catname[count] = rs1.getString(2);
                            count++;
                        }
                        PreparedStatement pst1 = con.prepareStatement("SELECT  product_id, product_imgsrc, product_name, product_price FROM Product where product_id in"
                                + "(select product_id from CATEGORY_PRODUCT_RELATION where category_id=?)");
                        out.println("<ul>");

                        while (i < count) {
                            pst1.setInt(1, catid[i]);
                            rs2 = pst1.executeQuery();
                
      out.write("<li id=\"subcat\"><div id=\"category\" style=\"vertical-align: middle\">\n");
      out.write("                    ");
 out.println("<a href='subcategory.jsp?catid=" + catid[i] + "'>" + catname[i] + "</a>");
                                       
      out.write("</div></li><br><div id=\"indeximages\" style=\"width:1150px;height:250px;float: left; margin-left: 20px; margin-up: -10px;color: #660000;\">\n");
      out.write("                    ");

                        while (rs2.next()) {
                            imgsrc = rs2.getString(2);
                            prodid = rs2.getInt(1);
                            prodname = rs2.getString(3);
                            prodprice = rs2.getInt(4);
                            if (prodname.length() > 20) {
                                prodname = prodname.substring(0, Math.min(prodname.length(), 21));
                                out.println("<li><a href='item.jsp?prodid=" + prodid + "'>" + prodname + "...</a>");
                                out.println("<br/><a href='item.jsp?prodid=" + prodid + "'>"
                                        + "<img src='img/" + imgsrc + "' height='200' width='200'></a><br>Rs. " + prodprice + "</li>");
                            } else {
                                out.println("<li><a href='item.jsp?prodid=" + prodid + "'>" + prodname + "</a>");
                                out.println("<br/><a href='item.jsp?prodid=" + prodid + "'>"
                                        + "<img src='img/" + imgsrc + "' height='200' width='200'></a><br>Rs. " + prodprice + "</li>");
                            }

                        }
      out.write("</div>");

                                    out.println("</ul>");
                                    i++;
                                }

                            } catch (Exception e) {
                                out.println(e);
                            }

                    
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            ");
      out.write("  \n");
      out.write("            <div id=\"productlist\"  class=\"div\" >\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            ");
      out.write("            \n");
      out.write("            <div id=\"footer\" class=\"div\" >\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div> \n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
