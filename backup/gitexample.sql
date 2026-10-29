SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS login_audit;
DROP TABLE IF EXISTS api_clients;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(120) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  password_plain VARCHAR(120) DEFAULT NULL,
  role ENUM('admin', 'analyst', 'viewer') NOT NULL DEFAULT 'viewer',
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  last_login_at DATETIME DEFAULT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_users_username (username),
  UNIQUE KEY uq_users_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE api_clients (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  client_name VARCHAR(100) NOT NULL,
  api_key VARCHAR(120) NOT NULL,
  api_secret VARCHAR(180) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_api_clients_user (user_id),
  CONSTRAINT fk_api_clients_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE login_audit (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  ip_address VARCHAR(45) NOT NULL,
  user_agent VARCHAR(255) NOT NULL,
  success TINYINT(1) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_login_audit_user (user_id),
  CONSTRAINT fk_login_audit_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO users (id, username, email, password_hash, password_plain, role, is_active, last_login_at, created_at) VALUES
  (1, 'admin', 'admin@gitexample.test', '$2y$10$7H9m5qjJ8nX0mRjv8bG7U.N8hQm9FqRjA0X7g31g97x1lK2P0aI0a', 'Admin!2026_demo', 'admin', 1, '2026-10-25 16:10:22', '2026-01-10 08:00:00'),
  (2, 'j.novak', 'jan.novak@gitexample.test', '$2y$10$H3Y0sB5XqZ0h1eN9rPjM6O6rY6pJw0Nn1C5w8kD4eQ6aU2fS7pNQe', 'Novak123_demo', 'analyst', 1, '2026-10-24 11:44:53', '2026-03-14 09:17:00'),
  (3, 'service.bot', 'service.bot@gitexample.test', '$2y$10$D8Q5fV2yR1pL0jM9nB4sT5uW6xY7zA8bC9dE0fG1hI2jK3lM4nO5P', 'SrvBot#Key_demo', 'viewer', 1, '2026-10-25 15:59:02', '2026-04-03 13:25:00');

INSERT INTO api_clients (id, user_id, client_name, api_key, api_secret, created_at) VALUES
  (1, 1, 'admin-dashboard', 'bg_demo_key_9f2e7c1a4b6d', 'bg_demo_secret_2f7a4c6d9e1b8a3f', '2026-08-01 07:30:00'),
  (2, 2, 'reporting-worker', 'bg_demo_key_12ab98cd45ef', 'bg_demo_secret_77af31de45bc9021', '2026-08-15 10:05:00'),
  (3, 3, 'internal-sync', 'bg_demo_key_55aa88dd11ff', 'bg_demo_secret_8d32ab9e01fc7654', '2026-09-12 18:41:00');

INSERT INTO login_audit (id, user_id, ip_address, user_agent, success, created_at) VALUES
  (1, 1, '10.20.1.8', 'Mozilla/5.0 (X11; Linux x86_64)', 1, '2026-10-25 16:10:22'),
  (2, 2, '192.168.56.21', 'curl/8.8.0', 0, '2026-10-25 16:13:54'),
  (3, 2, '192.168.56.21', 'curl/8.8.0', 1, '2026-10-25 16:14:08'),
  (4, 3, '172.16.0.15', 'python-requests/2.32.3', 1, '2026-10-25 15:59:02');

COMMIT;
