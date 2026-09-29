CREATE DATABASE IF NOT EXISTS ecommerce_test
  DEFAULT CHARSET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE ecommerce_test;

CREATE TABLE users (
  id BIGINT NOT NULL AUTO_INCREMENT,
  username VARCHAR(64) NOT NULL,
  email VARCHAR(128) NOT NULL,
  status TINYINT DEFAULT 1,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_username (username),
) InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE products (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(128) NOT NULL,
  category_id INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock INT  NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE orders (
  id BIGINT NOT NULL AUTO_INCREMENT,
  order_no VARCHAR(32) NOT NULL,
  user_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  quantity INT NOT NULL  DEFAULT 1,
  amount DECIMAL(10,2) NOT NULL,
  status TINYINT DEFAULT 0,
  create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_order_no (order_no),
  KEY idx_user_id (user_id),
  KEY idx_product_id (product_id),
  KEY idx_create_time (create_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;