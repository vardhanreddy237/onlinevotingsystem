<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="p1.DbUtil" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Vote Processing</title>
</head>
<body>
    <h2>VOTE PROCESSING</h2>
    <%
    int voterId = Integer.parseInt(request.getParameter("voterId"));
    String party = request.getParameter("party");

    try {
        DbUtil.connect();
        String sql = "INSERT INTO votetable VALUES (?, ?)";
        DbUtil.pstmt = DbUtil.con.prepareStatement(sql);
        DbUtil.pstmt.setInt(1, voterId);
        DbUtil.pstmt.setString(2, party);
        int insertResult = DbUtil.pstmt.executeUpdate();

        if (insertResult > 0) {
            out.println("<p>Vote successfully recorded! Thank you for voting.</p>");
        } else {
            out.println("<p>Failed to record vote. Please try again.</p>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<p>An error occurred. Please try again later.</p>");
    } finally {
        DbUtil.close();
    }
    %>
</body>
</html>
