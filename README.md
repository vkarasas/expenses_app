> [!WARNING]
> This project is under construction and is only for educational purposes.

# Expense App
#### A simple expense application built with Spring Boot, JPA and JTE(Java Template Engine)

## Features
- Secure authentication with OAuth2(GitHub & Google)
- Personal Expenses
- Categorize Expenses

## Tech Stack
- **Spring Boot 4** - Application framework
- **Spring Security** - Authentication and authorization
- **Spring Data JPA** - Data persistence layer
- **Flyway** - Database migration and version control
- **OAuth2** - Social Login(GitHub, Google)
- **JTE (Java Template Engine)** - Server-side templating
- **H2/PostgreSQL/MySQL** - Database (specify your choice)
- **Maven** - Build tool

## Prerequisites
- JDK 25
- Database (if not using H2)

# Getting Started

### Installation

1. Clone the repository:
```bash
git clone https://github.com/vkarasas/expenses_app.git
cd expense_app
```

2. Configure the database in `application.properties`:
```properties
spring.datasource.driver-class-name=${DATASOURCE_DRIVER_CLASS_NAME}
spring.datasource.url=${DATASOURCE_URL_HOST}
spring.datasource.username=${DATASOURCE_USERNAME}
spring.datasource.password=${DATASOURCE_PASSWORD}
```

3. Set up OAuth2 credentials:

   **GitHub OAuth App:**
    - Go to GitHub Settings → Developer settings → OAuth Apps → New OAuth App
    - Set Authorization callback URL: `http://localhost:8080/login/oauth2/code/github`
    - Copy Client ID and Client Secret

   **Google OAuth App:**
    - Go to [Google Cloud Console](https://console.cloud.google.com/)
    - Create a new project or select existing
    - Enable Google+ API
    - Create OAuth 2.0 credentials
    - Set Authorized redirect URI: `http://localhost:8080/login/oauth2/code/google`
    - Copy Client ID and Client Secret

2. Add OAuth2 configuration to `application.properties`:
```properties
# GitHub OAuth2
# Google OAuth2
spring.security.oauth2.client.registration.google.client-id=${GOOGLE_CLIENT_ID}
spring.security.oauth2.client.registration.google.client-secret=${GOOGLE_CLIENT_SECRET}

# Google OAuth2
spring.security.oauth2.client.registration.github.client-id=${GITHUB_CLIENT_ID}
spring.security.oauth2.client.registration.github.client-secret=${GITHUB_CLIENT_SECRET}
```

5. Build the project:
```bash
# Maven
mvn clean install
```

6. Run the application:
```bash
# Maven
mvn spring-boot:run
```

7. Open your browser and navigate to:
http://localhost:8080

### Creating Users (Database Authentication)

Users can be added directly to the database with BCrypt-hashed passwords. The application uses the following schema:

**User Table:**
- `id` (Primary Key)
- `username` (Unique)
- `password` (BCrypt hashed)
- `enabled` (Boolean)

**Role Table:**
- `id` (Primary Key)
- `name` (e.g., ROLE_USER, ROLE_ADMIN)

**User_Role Table:**
- `id` (Primary Key)
- `user_id` (Foreign Key)
- `role_id` (Foreign Key)

> [!NOTE]
> The below example to insert user is on migration files already.

You can add users via:
- Direct SQL insertion with BCrypt-hashed passwords

**Example SQL for adding a user:**
```sql
-- Password is 'password123' hashed with BCrypt https://bcrypt-generator.com/
INSERT INTO `user` (`username`, `password`, `enabled`)
VALUES ('john', '$2a$20$Wv/c4YLvbik44iQMXEyFh.ezXrhfib.8mM.btRW23ProIdd7W6GCW', true);

INSERT INTO `role` (`name`) VALUES ('ROLE_USER'), ('ROLE_ADMIN');

INSERT INTO `user_role` (`user_id`, `role_id`)
VALUES (
             (SELECT `id` FROM `user` WHERE `username` = 'john'),
             (SELECT `id` FROM `role` WHERE `name` = 'ROLE_USER')
       ),
       (
             (SELECT `id` FROM `user` WHERE `username` = 'john'),
             (SELECT `id` FROM `role` WHERE `name` = 'ROLE_ADMIN')
       );
```

## Usage

### Login Options

**Option 1: Username/Password Login**
1. Navigate to `http://localhost:8080/login`
2. Enter your username and password
3. Access your expense dashboard

**Option 2: OAuth2 Social Login**
1. Navigate to `http://localhost:8080/login`
2. Choose to login with GitHub or Google
3. Authorize the application
4. You'll be redirected to your expense dashboard