<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="p1.DbUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
    int VoterID = Integer.parseInt(request.getParameter("voterId"));
    String name = request.getParameter("name");
    String adhar = request.getParameter("adhar");
    int age = Integer.parseInt(request.getParameter("age"));
    String userid = request.getParameter("userId");
    String password = request.getParameter("password");

    DbUtil.connect();

    if (age >= 18) {
        
        String sql = "INSERT INTO votertable VALUES (?, ?, ?, ?, ?, ?)";
        DbUtil.pstmt = DbUtil.con.prepareStatement(sql);
        DbUtil.pstmt.setInt(1, VoterID);
        DbUtil.pstmt.setString(2, name);
        DbUtil.pstmt.setString(3, adhar);
        DbUtil.pstmt.setInt(4, age);
        DbUtil.pstmt.setString(5, userid);
        DbUtil.pstmt.setString(6, password);

        int i = DbUtil.pstmt.executeUpdate();

        if (i > 0) {
            out.println("Registration successful");
            
            response.setHeader("Refresh","2;url=First.html");
        } else {
            out.println("Registration failed");
        }
    } else {
        out.println("Not eligible for registration");
    }
} catch (Exception e) {
    e.printStackTrace();
    out.println("An error occurred. Please try again later.");
} finally {
    DbUtil.close();
}
%>

</body>
</html>