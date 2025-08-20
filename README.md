# HelloServlet – Bài tập Login với Session và với Cookie

## 1) Cấu hình môi trường
- JDK 8 hoặc mới hơn (khuyến nghị Temurin/OpenJDK)
- Maven 3.8+ (đã kèm theo wrapper hệ thống hoặc cài riêng)
- Apache Tomcat 9+ (Servlet 4.0)

Kiểm tra nhanh:
```sh
java -version
mvn -v
```

## 2) Build & Deploy
```sh
mvn -q clean package
# Tạo ra target/HelloServlet.war

# Deploy lên Tomcat: copy WAR vào thư mục webapps của Tomcat
# macOS (ví dụ cài bằng Homebrew):
# cp target/HelloServlet.war /usr/local/opt/tomcat/libexec/webapps/
```

Truy cập: `http://localhost:8080/HelloServlet/`

## 3) Bài tập Login với Session
- Form: `/login`
- Xử lý: `LoginServlet` – nếu hợp lệ sẽ set `session.setAttribute("user", <username>)`
- Trang bảo vệ: `/profile` (bị chặn bởi `AuthFilter` nếu chưa đăng nhập)
- Đăng xuất: `/logout` (invalidate session)

## 4) Bài tập Login với Cookie
- Form: `/login-cookie`
- Xử lý: `CookieLoginServlet` – nếu hợp lệ sẽ set cookie `user=<username>` (30 phút)
- Trang bảo vệ: `/profile-cookie` (bị chặn bởi `CookieAuthFilter` nếu không có cookie hợp lệ)
- Đăng xuất: `/logout-cookie` (xóa cookie)

Ghi chú xác thực demo: chấp nhận bất kỳ tên đăng nhập, mật khẩu cố định là `123`.

## 5) Đường dẫn tổng hợp
- `/` – Trang chủ
- Session flow: `/login`, `/profile`, `/logout`
- Cookie flow: `/login-cookie`, `/profile-cookie`, `/logout-cookie`
