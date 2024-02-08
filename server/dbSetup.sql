

CREATE TABLE frogs(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name TEXT NOT NULL,
  color ENUM ('green', 'brown'),
  age INT NOT NULL,
  likes TEXT,
  isToad BOOLEAN DEFAULT false,
  diet ENUM('flies','ants','fish', 'worms', 'birds', 'spiders', 'rodent')
);

INSERT INTO frogs
(name, color, likes, isToad, diet, age)
VALUES
-- ("Barney", "brown", "rolling in mud", true, "worms", 6);
-- ("Timbo", "green", "Eating flies", false, "flies", 4);
-- ("Sally", "green", "Lilypad Flirting in the rain", false, "fish", 5);


SELECT id, name, age, isToad, diet FROM frogs;

SELECT 
*
 FROM frogs
 WHERE color = 'green'
 ;

 SELECT
 *
 FROM frogs
 WHERE id =2;

-- NOTE transactions are not needed, but are very useful as they can be "rolledback" if you accidentally MODIFY or DELETE data you did not mean to.
START TRANSACTION;
 DELETE FROM frogs WHERE id = 9;

 ROLLBACK;
 COMMIT;
 

UPDATE frogs SET
name = 'Sally'
WHERE id = 7;

UPDATE frogs SET
age = 2
WHERE id = 8;

UPDATE frogs SET
diet = 'rodent'
WHERE isToad = false;


CREATE TABLE cars(
  id INT AUTO_INCREMENT PRIMARY KEY,
  make VARCHAR(20) NOT NULL,
  model VARCHAR(50) NOT NULL,
  year INT NOT NULL,
  price BIGINT NOT NULL,
  description VARCHAR(1000),
  imgUrl VARCHAR(500) NOT NULL,
  color VARCHAR(10)
);

INSERT INTO cars
(make, model, year, price, description, imgUrl, color)
VALUES
-- ('Luigi', 'Kart', 2019, 50, "Wawhhwhahwhwaa", 'https://images.unsplash.com/photo-1599409673963-8f304a658f4e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', '#00ff00');
-- ('Mario', 'Kart', 2019, 50, "Yahoo.", 'https://images.unsplash.com/photo-1591462392228-2bb4ed2babff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFyaW8lMjBrYXJ0fGVufDB8fDB8fHww', '#ff0000');
('mazda', 'miata', 2000, 10000, "Jeremy drives this to school each day, and drifts around the Micky D's drive through.", 'https://images.unsplash.com/photo-1552615526-40e47a79f9d7?q=80&w=2176&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', '#ffff00');

SELECT * FROM cars WHERE id = LAST_INSERT_ID();

CREATE TABLE houses(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  sqft INT NOT NULL,
  bedrooms INT NOT NULL,
  bathrooms DOUBLE NOT NULL,
  imgUrl VARCHAR(500) NOT NULL,
  description VARCHAR(255) NOT NULL,
  price INT NOT NULL,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
) default charset utf8 COMMENT '';

INSERT INTO houses
(sqft, bedrooms, bathrooms, imgUrl, description, price)
VALUES
-- (200, 1, 0, 'https://outlookmoney.com/public/uploads/story/544f82520cfdcf50f1d9132f05db2e1a.jpg', "home home in palm", 20);
(100, 2, 2.5, 'https://i.redd.it/dmpjjktw40151.jpg', "pineabble unda da sea", 3000);

SELECT * FROM houses WHERE id = LAST_INSERT_ID();