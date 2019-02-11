DROP TABLE bookings;
DROP TABLE activities;
DROP TABLE members;

CREATE TABLE members
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  age INT8 NOT NULL,
  address TEXT NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE activities
(
  id SERIAL8 PRIMARY KEY,
  activity VARCHAR(255) NOT NULL,
  instructor VARCHAR(255) NOT NULL,
  day VARCHAR(255) NOT NULL,
  start_time TIME NOT NULL,
  capacity INT8 DEFAULT 0
);

CREATE TABLE bookings
(
  id SERIAL8 PRIMARY KEY,
  member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
  activity_id INT8 REFERENCES activities(id) ON DELETE CASCADE
);
