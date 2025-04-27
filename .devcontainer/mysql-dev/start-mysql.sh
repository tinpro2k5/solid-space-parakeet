#!/bin/bash
set -e

# Stop MySQL if accidentally running
sudo service mysql stop || true

# Start MySQL temporarily in background to fix user permissions
echo "Starting MySQL temporarily..."
sudo mysqld_safe --skip-networking &
sleep 5

# Fix authentication for root user to mysql_native_password
echo "Fixing root user authentication..."
sudo mysql -uroot <<-EOSQL
  ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'rootpassword';
  FLUSH PRIVILEGES;
EOSQL

# Shutdown MySQL
echo "Shutting down MySQL after fixing user authentication..."
sudo mysqladmin -uroot -prootpassword shutdown

# Modify config to allow connections on all addresses
echo "Modifying MySQL config to allow connections from any host..."
sudo sed -i 's/^bind-address/#bind-address/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Finally, start MySQL normally
echo "Starting MySQL server normally..."
exec sudo mysqld_safe
