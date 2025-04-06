FROM ubuntu:22.04

# Cập nhật và cài các gói cần thiết
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    mysql-server \
    libmysqlclient-dev \
    build-essential \
    g++ \
    vim \
    curl \
    git \
    sudo

# Tạo user để không chạy bằng root
RUN useradd -m devuser && echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER devuser
WORKDIR /home/devuser

# Cấu hình MySQL
USER root
COPY ./mysql-custom.cnf /etc/mysql/conf.d/custom.cnf


# Sửa quyền thư mục socket
RUN mkdir -p /var/run/mysqld && \
    chmod 755 /var/run/mysqld && \
    chown mysql:mysql /var/run/mysqld

# Expose cổng mysql
EXPOSE 3306

# Khởi động MySQL khi container start
CMD ["bash", "-c", "service mysql start && bash"]
