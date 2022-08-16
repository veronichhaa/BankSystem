-- Table: users
CREATE TABLE users (
                       id       INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(255) NOT NULL,
                       password VARCHAR(255) NOT NULL,
                           UNIQUE (username)
)
    ENGINE = InnoDB;

-- Table: roles
CREATE TABLE roles (
                       id   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(100) NOT NULL
)
    ENGINE = InnoDB;

-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
                            user_id INT NOT NULL,
                            role_id INT NOT NULL,

                            FOREIGN KEY (user_id) REFERENCES users (id),
                            FOREIGN KEY (role_id) REFERENCES roles (id),

                            UNIQUE (user_id, role_id)
)
    ENGINE = InnoDB;

-- Insert data

INSERT INTO users VALUES (1, 'proselyte', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);

CREATE TABLE person (
                       id  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(255) NOT NULL,
                       name VARCHAR(100) NOT NULL,
                       surname VARCHAR(100) NOT NULL,
                       pas_ser VARCHAR(100) NOT NULL,
                       pass_num VARCHAR(100) NOT NULL,
                       address VARCHAR(255) NOT NULL,
                       phone VARCHAR(100) NOT NULL,
                       birthdate VARCHAR(100) NOT NULL
                    )
    ENGINE = InnoDB CHARACTER SET=utf8;

alter table users
add unique (username);

INSERT INTO person VALUES (2, 'testuser', 'Вероника', 'Михайлова', 'HB', '2942277', 'г. Минск, ул. Мележа, д.4', '+375333053085', '19.10.2001');

CREATE TABLE account (
                        id  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        username VARCHAR(255) NOT NULL,
                        number VARCHAR(100) NOT NULL,
                        sum float NOT NULL,
                        lim float NOT NULL
)
    ENGINE = InnoDB;



INSERT INTO account VALUES (2, 'testuser', 'BY04AKBB36029110100040000000', 1200, 1000000);

CREATE TABLE card (
                         id  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         username VARCHAR(255) NOT NULL,
                         number VARCHAR(100) NOT NULL,
                         sum float NOT NULL,
                         valid date
)
    ENGINE = InnoDB;

drop table card;

INSERT INTO card VALUES (2, 'testuser', '1910 3948 9347 7364', 600, 01/02/2025);

update card
set valid='2025-02-01' where id=2;

CREATE TABLE credit (
                      id  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                      username VARCHAR(255) NOT NULL,
                      start date,
                      term INT NOT NULL,
                      sum FLOAT NOT NULL,
                      percent FLOAT NOT NULL,
                      payments FLOAT NOT NULL
)
    ENGINE = InnoDB;

INSERT INTO credit VALUES (2, 'testuser', now(), 3, 3000, 9.5, 91.25);

CREATE TABLE deposit (
                        id  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        username VARCHAR(255) NOT NULL,
                        start date,
                        term INT NOT NULL,
                        sum FLOAT NOT NULL,
                        percent FLOAT NOT NULL,
                        profit FLOAT NOT NULL
)
    ENGINE = InnoDB;

INSERT INTO deposit VALUES (2, 'testuser', now(), 12, 1000, 9, 90);
INSERT INTO deposit VALUES (3, 'testuser', now(), 24, 2000, 9, 360);

update credit set term=36 where id=2;

alter table person
    add unique (username);