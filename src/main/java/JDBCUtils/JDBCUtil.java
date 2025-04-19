package JDBCUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {

	private static final String URL = System.getenv("DB_URL");
	private static final String USERNAME = System.getenv("DB_USER");
	private static final String PASSWORD = System.getenv("DB_PASSWORD");

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("✅ Kết nối thành công đến database");
		} catch (SQLException e) {
			System.err.println("❌ Lỗi SQL: " + e.getMessage());
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.err.println("❌ Không tìm thấy MySQL Driver: " + e.getMessage());
			e.printStackTrace();
		}
		return conn;
	}

	public static void closeConnection(Connection conn) {
		try {
			if (conn != null && !conn.isClosed()) {
				conn.close();
				System.out.println("🔒 Đóng kết nối thành công");
			}
		} catch (SQLException e) {
			System.err.println("❌ Lỗi khi đóng kết nối: " + e.getMessage());
			e.printStackTrace();
		}
	}
}
