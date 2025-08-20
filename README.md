# 🚀 Hello Servlet - Ứng dụng Demo Servlet với Session và Cookie

Một ứng dụng web Java Servlet hiện đại với giao diện đẹp mắt, hỗ trợ đầy đủ các tính năng đăng nhập bằng Session và Cookie với chức năng "Remember Me".

## ✨ Tính năng

### 🔐 Đăng nhập với Session
- Sử dụng HttpSession để lưu trữ thông tin đăng nhập
- Bảo mật cao - dữ liệu lưu trên server
- Tự động hết hạn khi đóng trình duyệt
- Phù hợp cho thông tin nhạy cảm

### 🍪 Đăng nhập với Cookie
- Sử dụng Cookie để lưu trữ thông tin đăng nhập
- **Chế độ thường**: 30 phút
- **Chế độ "Remember Me"**: 30 ngày
- Tự động đăng nhập lại khi quay lại website
- Tiện lợi cho người dùng thường xuyên

### 🎨 Giao diện hiện đại
- Thiết kế responsive, thân thiện với mobile
- Gradient background đẹp mắt
- Hiệu ứng hover và animation mượt mà
- Icons emoji sinh động
- Dark mode friendly

## 🛠️ Công nghệ sử dụng

- **Java Servlet API** - Backend logic
- **JSP** - Server-side rendering
- **CSS3** - Styling hiện đại
- **JavaScript** - Interactive effects
- **Maven** - Build tool
- **Tomcat** - Application server

## 📦 Cài đặt và chạy

### Yêu cầu hệ thống
- Java 8 trở lên
- Maven 3.6+
- Tomcat 9.0+ hoặc application server tương thích

### Các bước cài đặt

1. **Clone repository**
```bash
git clone <repository-url>
cd HelloServlet
```

2. **Build project**
```bash
mvn clean package
```

3. **Deploy lên Tomcat**
- Copy file `target/HelloServlet.war` vào thư mục `webapps` của Tomcat
- Hoặc deploy qua Tomcat Manager

4. **Truy cập ứng dụng**
```
http://localhost:8080/HelloServlet/
```

## 🎯 Hướng dẫn sử dụng

### Tài khoản demo
- **Tên đăng nhập**: Bất kỳ tên nào (ví dụ: admin, user, john...)
- **Mật khẩu**: `123`

### Tính năng chính

#### 1. Đăng nhập với Session
- Truy cập: `/login`
- Đăng nhập và dữ liệu sẽ lưu trong HttpSession
- Tự động hết hạn khi đóng trình duyệt

#### 2. Đăng nhập với Cookie
- Truy cập: `/login-cookie`
- **Không check "Remember Me"**: Cookie tồn tại 30 phút
- **Check "Remember Me"**: Cookie tồn tại 30 ngày
- Tự động đăng nhập lại khi quay lại

#### 3. Xem thông tin cá nhân
- Session mode: `/profile`
- Cookie mode: `/profile-cookie`
- Hiển thị thông tin chi tiết về phiên đăng nhập

## 📁 Cấu trúc dự án

```
src/
├── main/
│   ├── java/com/example/
│   │   ├── servlet/           # Các servlet chính
│   │   │   ├── LoginServlet.java
│   │   │   ├── CookieLoginServlet.java
│   │   │   ├── ProfileServlet.java
│   │   │   ├── CookieProfileServlet.java
│   │   │   ├── LogoutServlet.java
│   │   │   └── CookieLogoutServlet.java
│   │   └── filter/            # Authentication filters
│   │       ├── AuthFilter.java
│   │       └── CookieAuthFilter.java
│   └── webapp/
│       ├── index.jsp          # Trang chủ
│       ├── assets/css/        # Stylesheet
│       │   └── style.css
│       └── WEB-INF/
│           ├── web.xml        # Cấu hình web
│           └── views/         # JSP views
│               ├── login.jsp
│               ├── login_cookie.jsp
│               ├── profile.jsp
│               └── profile_cookie.jsp
```

## 🔧 Customization

### Thay đổi thời gian cookie
Trong `CookieLoginServlet.java`:
```java
// Remember Me: 30 ngày
userCookie.setMaxAge(30 * 24 * 60 * 60);

// Thường: 30 phút  
userCookie.setMaxAge(30 * 60);
```

### Tùy chỉnh giao diện
Chỉnh sửa file `assets/css/style.css` để thay đổi:
- Màu sắc chủ đạo
- Font chữ
- Hiệu ứng animation
- Layout responsive

### Thêm validation
- Cải thiện validation trong các servlet
- Thêm regex cho username/password
- Tăng cường bảo mật

## 🔒 Bảo mật

- ✅ Input validation
- ✅ XSS protection với JSP escaping
- ✅ Session management
- ✅ Cookie security attributes
- ✅ Path-based cookie scope

## 🚀 Tính năng nâng cao có thể thêm

- [ ] Database integration cho user management
- [ ] Password hashing (BCrypt)
- [ ] CSRF protection
- [ ] Remember Me với secure tokens
- [ ] Social login integration
- [ ] Multi-language support
- [ ] Admin dashboard

## 📞 Hỗ trợ

Nếu bạn gặp vấn đề hoặc có câu hỏi:
1. Kiểm tra logs của Tomcat
2. Đảm bảo Java version compatibility
3. Kiểm tra port conflicts
4. Xem console của browser để debug JavaScript

## 📜 License

MIT License - Sử dụng tự do cho mục đích học tập và phát triển.

---

**Phát triển bởi**: Coding Enthusiast  
**Ngày cập nhật**: August 2025  
**Version**: 2.0.0 - Modern UI with Remember Me feature – Bài tập Login với Session và với Cookie

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
