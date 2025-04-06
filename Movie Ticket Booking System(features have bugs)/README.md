# Hướng dẫn cài đặt local host Mysql trên Github codespace 

## Vì trên codespace không có 

## 1) Cài thư cơ sở dữ liệu mysql:
```Bash
$ sudo apt update
$ sudo apt install mysql-server -y
```
## 2) Sửa lỗi 
- Dùng root user:
```Bash
$ sudo su
```
- Tìm file cấu hình
```Bash
$ cd /var/lib/mysql
$ ls -l
$ find / -name mysql.sock
```
- mở VIM để sửa:
 ```Bash
$ vi /etc/my.cnf
```
Sau khi chạy lệnh này terminal vào chế độ chỉnh sửa file của VIM.  
Ghi vào nội dung sau, lưu và exit về terminal  
(Học cách để sử dụng VIM đi 👽👽)

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

1) Gõ I để vào mode Insert
2) Paste nội dung vào
3) Ecs 
4) Nhập :wq

- Cấp quyền 
```Bash
$ sudo chmod 755 /var/run/mysqld/  
$ sudo chown mysql:mysql /var/run/mysqld/ 
$ sudo service mysql restart
$ ls -l /var/run/mysqld/ 
```
- Nếu hiện ra các file mysql.sock thì đã xong có thể đóng terminal tại đây
## 3) Đã có thể Truy cập Mysql:  
- Mặc định không có password (cứ nhấn Enter khi hỏi)
- Chuyển qua `$ sudo su` để có toàn quyền admin connect vào MySQL và chạy chương trình. (chỉ cần `$ mysql`)
- Hoặc chạy bằng `$ sudo mysql -u root -p` nếu không muốn chuyển qua
- Hoặc phải cấu hình user và password thêm

Link tham khảo:  
https://helpdesk.inet.vn/knowledgebase/loi-cant-connect-to-local-msql-server-through-socket-varlibmysqlmysqlsock






# Biên dịch: 

Nhớ cài thư viện này để biên dịch cùng với SQL:  
```
sudo apt-get update  
sudo apt-get install libmysqlclient-dev
```
Nếu thư viện đã được cài đặt nhưng trình biên dịch vẫn không thể tìm thấy `mysql.h`, bạn có thể cần chỉ rõ đường dẫn đến thư mục chứa các tệp header của MySQL khi biên dịch. Giả sử tệp `mysql.h` nằm trong thư mục `/usr/include/mysql/`, bạn có thể biên dịch như sau:  
```
g++ -o my_program main.cpp -I/usr/include/mysql -lmysqlclient
```





một số hàm chính bị bugs, đã fix lại hàm thêm movie

đề xuất cải tiến:
thêm khả năng thay đổi giá trị cho các biến khi cần để bảo trì vả mở rộng  --> dùng các design pattern và nguyên lí SOLID
dùng vòng lặp để thoát an toàn --> cấu trúc lại chương trình
try catch
