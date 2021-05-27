<%@ page import="java.sql.*;"%>
<jsp:useBean id="cn" scope="page" class="mm.Conn1" />
<%

    String pname = request.getParameter("pname");
    int price = Integer.parseInt(request.getParameter("price"));
    String image = request.getParameter("image");
    String pid = request.getParameter("pid");
    String uid = request.getParameter("uid");
    String uemail = request.getParameter("uemail");
    String aprice = request.getParameter("price");
    String pdetail = request.getParameter("desc");

    int d = Integer.parseInt(request.getParameter("discount"));
    out.println(d + "<br>");
    out.println(price + "<br>");
    out.println(pname + "<br>");
    out.println(image + "<br>");
    out.println(uid + "<br>");
    out.println(uemail + "<br>");
    out.println(aprice + "<br>");
    out.println(pdetail + "<br>");
    int ds = price - d;
    out.println(ds + "<br>");

    ResultSet rs = cn.executeQuery("select * from cart where p_id='" + pid + "'");
    try {
        if (rs.next()) {
            int dd = rs.getInt("i_discount");
            out.println(dd + "<br>");

            int s = cn.executeUpdate("update cart set price=price+'" + ds + "',qty=qty+1,discount=discount+'" + dd + "' where p_id='" + pid + "'");
            out.println(s + "Update1<br>");
            if (s > 0) {
                response.sendRedirect("four_column.jsp?type=all");
            }
        } else {
            int n = cn.executeUpdate("insert into cart(p_id,p_name,qty,price,image,user_id,user_email,a_price,product_detail,discount,i_discount) values('" + pid + "','" + pname + "',1,'" + ds + "','" + image + "','" + uid + "','" + uemail + "','" + aprice + "','" + pdetail + "','" + d + "','" + d + "')");
            out.println(n + "Update2<br>");
            if (n > 0) {
                response.sendRedirect("four_column.jsp?type=all");
            } else {
                response.sendRedirect("error.jsp");
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }


%>