# Dùng Tomcat với JDK 8
FROM tomcat:9.0-jdk8

# Xóa ứng dụng mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR của bạn vào Tomcat và đổi tên thành ROOT.war để chạy mặc định tại /
COPY target/FinalProject-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Mở port 8080
EXPOSE 8080

# Lệnh chạy Tomcat
CMD ["catalina.sh", "run"]
