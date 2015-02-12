DROP TABLE IF EXISTS api_request;
CREATE TABLE api_request (

   max_wait INT(128),
   api_request_key BIGINT NOT NULL,
   last_updated DATETIME,
   date_created DATETIME,
   version VARCHAR(128),
   request MEDIUMTEXT,
 PRIMARY KEY (api_request_key)
);
DROP TABLE IF EXISTS api_response;
CREATE TABLE api_response (

   api_response_key BIGINT NOT NULL,
   last_updated DATETIME,
   date_created DATETIME,
   api_request_key BIGINT,
   response MEDIUMTEXT,
 PRIMARY KEY (api_response_key)
);
DROP TABLE IF EXISTS user;
CREATE TABLE user (

   user_key BIGINT NOT NULL,
   date_created DATETIME,
   username VARCHAR(128),
   password VARCHAR(128),
 PRIMARY KEY (user_key)
);
