import java.util. *;
import java.sql. *;
import java.sql.Date;
public class ShowRentals2005 {

	public static void main(String[] args) throws java.lang.ClassNotFoundException, SQLException {
	String url = "jdbc:sqlserver://sqlserver.dmst.aueb.gr:1433;" + "databaseName = DB104; user = G5104; password = 49dnmj5405;";
	Connection dbcon;
	Statement stmt;
	ResultSet rs;
	int code, plate_number, pickup_locid, return_locid, c_code;
	Date first_day, last_day;
	float value;
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLSeverDriver");
	} catch(java.lang.ClassNotFoundException e) {
		System.out.println(e.getMessage());
	}
	try {
		Scanner sc = new Scanner(System.in);
		dbcon = DriverManager.getConnection(url);
		stmt = dbcon.createStatement();
		System.out.print("Insert a customer's id and you'll learn about all his Rentals in 2005");
		int c2 = sc.nextInt();
		rs = stmt.executeQuery("SELECT code, plate_number, first_day, last_day, value, cust_code,"
				+ " pickup_locid, return_locid FROM Rental WHERE ( cust_code = "+ c2 +" AND year(first_day) = 2005 ) ");
		while (rs.next()) {
			code = rs.getInt("code");
			plate_number = rs.getInt("plate_number");
			first_day = rs.getDate("first_day");
			last_day = rs.getDate("last_day");
			value = rs.getFloat("value");
			pickup_locid = rs.getInt("pickup_locid");
			return_locid = rs.getInt("return_locid");
			c_code = rs.getInt("cust_code");
			if (c_code == c2) {
				System.out.println("code: "+ code+" plate_number: "+plate_number+" first_day: "+first_day+
						" last_day: "+last_day+" value: "+value+ " pickup_locid: "+pickup_locid+" return_locid: "+return_locid);
			}
		}
		rs.close();
		stmt.close();
		dbcon.close();
		sc.close();
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	}
	}
}