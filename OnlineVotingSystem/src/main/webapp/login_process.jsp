<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="p1.DbUtil" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String userid=request.getParameter("t1");
String password=request.getParameter("t2");
try{
	DbUtil.connect();
	String sql="SELECT * FROM votertable WHERE UserID=? AND Password=?";
	DbUtil.pstmt=DbUtil.con.prepareStatement(sql);
	DbUtil.pstmt.setString(1,userid);
	DbUtil.pstmt.setString(2,password);
	
	ResultSet rs=DbUtil.pstmt.executeQuery();
	
	if(rs.next()){
		out.println("sign in successfull");
		
		int voterId=Integer.parseInt(rs.getString("voterID"));

		response.sendRedirect("Voting.html?voterId=" + voterId);
		
	}else{
		out.println("invalid credentials");
	}
	
}catch(Exception e){
	out.println("an error occured");
}finally{
	DbUtil.close();
}
%>

</body>
</html>