package p1;
import java.sql.*;

public class DbUtil {
    public static Connection con;
    public static Statement st;
    public static PreparedStatement pstmt; 

    public static void connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting", "root", "5958@Kvreddy");
            st = con.createStatement();
            pstmt = null; 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void close() {
        try {
            if (st != null && !st.isClosed()) {
                st.close();
            }
            if (con != null && !con.isClosed()) {
                con.close();
            }
            if (pstmt != null && !pstmt.isClosed()) {
                pstmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
