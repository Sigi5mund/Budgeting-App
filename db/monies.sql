DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS vendors;

CREATE TABLE vendors(
id SERIAL8 primary key,
name VARCHAR(255)
);

CREATE TABLE tags(
id SERIAL8 primary key,
category VARCHAR(255)
);

CREATE TABLE transactions(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
tag_id INT8 references tags(id) ON DELETE CASCADE,
price NUMERIC,
vendor_id INT8 references vendors(id) ON DELETE CASCADE,
date VARCHAR(255),
comment VARCHAR(255)
);
