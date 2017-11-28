DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;


CREATE TABLE tags(
id SERIAL8 primary key,
category VARCHAR(255)
);

CREATE TABLE transactions(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
tag_id INT8 references tags(id),
price NUMERIC,
store VARCHAR(255),
date VARCHAR(255),
comment VARCHAR(255)
);
