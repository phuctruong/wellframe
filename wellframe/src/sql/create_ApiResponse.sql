DROP TABLE IF EXISTS api_response;
CREATE TABLE api_response (

   api_response_key BIGINT NOT NULL,
   last_updated DATETIME,
   date_created DATETIME,
   api_request_key BIGINT,
   response TEXT,
 PRIMARY KEY (api_response_key)
);
