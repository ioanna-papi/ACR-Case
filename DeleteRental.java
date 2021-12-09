import java.util.*;
import java.sql.*;
public class DeleteRental {

	public static void main(String[] args) throws java.lang.ClassNotFoundException, SQLException {
		String url = "jdbc:sqlserver://sqlserver.dmst.aueb.gr:1433;" + "databaseName = DB104; user = G5104; password = 49dnmj5405;";
		Connection dbcon;
		Statement stmt;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLSeverDriver");
		} catch(java.lang.ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
		try {
			Scanner sc = new Scanner(System.in);
			dbcon = DriverManager.getConnection(url);
			stmt = dbcon.createStatement();
			System.out.print("Insert the id of the Rental you want to delete");
			int c2 = sc.nextInt();
			stmt.executeUpdate("DELETE FROM Payment WHERE r_code = "+ c2 +" ");
			stmt.executeUpdate("DELETE FROM Rental WHERE code = "+ c2 +" ");
			stmt.close();
			dbcon.close();
			sc.close();
			} catch (SQLException e) {
			System.out.println(e.getMessage());
			}
		}
	}
