DROP TABLE IF EXISTS user;
CREATE TABLE user (

   user_key BIGINT NOT NULL,
   date_created DATETIME,
   username VARCHAR(128),
   password VARCHAR(128),
 PRIMARY KEY (user_key)
);
