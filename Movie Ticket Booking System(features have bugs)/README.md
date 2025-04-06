```markdown
Đã thay đổi các lệnh cls, title, color và các thư viện qua LINUX  
Nhớ cài thư viện này để biên dịch cùng với SQL:  
```
sudo apt-get update  
sudo apt-get install libmysqlclient-dev
```

Nếu thư viện đã được cài đặt nhưng trình biên dịch vẫn không thể tìm thấy `mysql.h`, bạn có thể cần chỉ rõ đường dẫn đến thư mục chứa các tệp header của MySQL khi biên dịch. Giả sử tệp `mysql.h` nằm trong thư mục `/usr/include/mysql/`, bạn có thể biên dịch như sau:  
```
g++ -o my_program main.cpp -I/usr/include/mysql -lmysqlclient
```

### Configs for SQL system file:
```
[client]  
port=3306  
socket=/var/run/mysqld/mysqld.sock  

[mysqld]  
user=mysql  
port=3306   
datadir=/var/lib/mysql  
socket=/var/run/mysqld/mysqld.sock
```

Link tham khảo:  
https://helpdesk.inet.vn/knowledgebase/loi-cant-connect-to-local-msql-server-through-socket-varlibmysqlmysqlsock

### NOTE:  
- Chỉnh qua `sudo su` để có quyền admin connect vào MySQL, không có password (cứ nhấn Enter).  
- Hoặc:  
```
ls -l /var/run/mysqld/  
sudo chmod 755 /var/run/mysqld/  
sudo chown mysql:mysql /var/run/mysqld/  
```


một số hàm chính bị bugs, đã fix lại hàm thêm movie

đề xuất cải tiến:
thêm khả năng thay đổi giá trị cho các biến khi cần để bảo trì vả mở rộng  --> dùng các design pattern và nguyên lí SOLID
dùng vòng lặp để thoát an toàn --> cấu trúc lại chương trình
try catch
