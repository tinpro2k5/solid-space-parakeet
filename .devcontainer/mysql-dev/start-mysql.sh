#!/bin/bash
set -e

# Start mysql as root user
echo "Switching to root to start MySQL..."
sudo service mysql stop || true

# Start MySQL in background
echo "Starting MySQL temporarily..."
sudo mysqld_safe --skip-networking &
sleep 5

# Fix authentication method for root user
echo "Fixing root user authentication..."
sudo mysql -uroot <<-EOSQL
  ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'rootpassword';
  FLUSH PRIVILEGES;
EOSQL

# Shutdown MySQL
sudo mysqladmin -uroot -prootpassword shutdown

# Sửa cấu hình để không bind localhost
sudo sed -i 's/^bind-address/#bind-address/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Start mysql thật
echo "Starting MySQL server normally..."
exec sudo mysqld_safe
