DROP TABLE bookings;
DROP TABLE activities;
DROP TABLE members;

CREATE TABLE members(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  age NUMBER NOT NULL,
  address TEXT NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE activities(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  instructor VARCHAR(255) NOT NULL,
  day VARCHAR(255) NOT NULL,
  start_time NUMBER NOT NULL
);

CREATE TABLE bookings(
  id SERIAL8 PRIMARY KEY,
  member_id INT8 REFERENCES members(id),
  activity_id INT8 REFERENCES activities(id)
);
