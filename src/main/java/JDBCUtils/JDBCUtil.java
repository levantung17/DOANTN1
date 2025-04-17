package JDBCUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
	// Sử dụng tên của container MySQL là 'mysql' trong Docker Compose
	private static final String URL = "jdbc:mysql://mysql:3306/project_web?useSSL=false&serverTimezone=UTC";
	private static final String USERNAME = "user"; // Sử dụng tên người dùng là 'user' từ Docker Compose
	private static final String PASSWORD = "pass"; // Sử dụng mật khẩu là 'pass' từ Docker Compose

	public static Connection getConnection() {
		Connection conn = null;
		try {
			// Kết nối đến cơ sở dữ liệu MySQL
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("Connection successful");
		} catch (SQLException e) {
			// Xử lý ngoại lệ khi không thể kết nối
			System.err.println("Connection failed: " + e.getMessage());
			e.printStackTrace();
		}
		return conn;
	}

	public static void closeConnection(Connection conn) {
		if (conn != null) {
			try {
				// Đóng kết nối
				System.out.println("Closing connection...");
				conn.close();
			} catch (SQLException e) {
				// Xử lý lỗi khi đóng kết nối
				System.err.println("Error closing connection: " + e.getMessage());
				e.printStackTrace();
			}
		}
	}
}
