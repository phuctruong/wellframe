DROP TABLE IF EXISTS api_request;
CREATE TABLE api_request (

   max_wait INT(128),
   api_request_key BIGINT NOT NULL,
   last_updated DATETIME,
   date_created DATETIME,
   version VARCHAR(128),
   request TEXT,
 PRIMARY KEY (api_request_key)
);
