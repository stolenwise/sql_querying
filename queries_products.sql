-- Comments in SQL Start with dash-dash --

-- Query 1: Add a product with the name “chair”, price 44.00, can_be_returned of false.
INSERT INTO products (name, price, can_be_returned) 
VALUES ('chair', 44.00, false);

-- Query 2: Add a product to the table with the name of “stool”, price of 25.99, and can_be_returned of true.
INSERT INTO products (name, price, can_be_returned) 
VALUES ('stool', 25.99, true);

-- Query 3: Add a product to the table with the name of “table”, price of 124.00, and can_be_returned of false.
INSERT INTO products (name, price, can_be_returned) 
VALUES ('table', 124.00, false);

-- Query 4: Display all of the rows and columns in the table.
SELECT * FROM products;
 id |   name    | price | can_be_returned 
----+-----------+-------+-----------------
  1 | Product A | 10.99 | t
  2 | Product B |  25.5 | f
  3 | Product C |    15 | t
  4 | chair     |    44 | f
  5 | stool     | 25.99 | t
  6 | table     |   124 | f
(6 rows)

-- Query 5: Display all of the names of the products.
SELECT name FROM products;
   name    
-----------
 Product A
 Product B
 Product C
 chair
 stool
 table
(6 rows)

-- Query 6:Display all of the names and prices of the products.
SELECT name, price FROM products;
   name    | price 
-----------+-------
 Product A | 10.99
 Product B |  25.5
 Product C |    15
 chair     |    44
 stool     | 25.99
 table     |   124
(6 rows)

-- Query 7: Add a new product - make up whatever you would like!
INSERT INTO products (name, price, can_be_returned) 
VALUES ('couch', 200.00, true);

-- Query 8: Display only the products that can_be_returned
SELECT name, can_be_returned FROM products WHERE can_be_returned = true;
   name    | can_be_returned 
-----------+-----------------
 Product A | t
 Product C | t
 stool     | t
 couch     | t
(4 rows)

-- Query 9: Display only the products that have a price less than 44.00.
SELECT * FROM products WHERE price < 44.00;
 id |   name    | price | can_be_returned 
----+-----------+-------+-----------------
  1 | Product A | 10.99 | t
  2 | Product B |  25.5 | f
  3 | Product C |    15 | t
  5 | stool     | 25.99 | t
(4 rows)

-- Query 10: Display only the products that have a price in between 22.50 and 99.99.
SELECT * FROM products WHERE price > 22.49 AND price < 100.00;
 id |   name    | price | can_be_returned 
----+-----------+-------+-----------------
  2 | Product B |  25.5 | f
  4 | chair     |    44 | f
  5 | stool     | 25.99 | t
(3 rows)

-- Query 11: There’s a sale going on: Everything is $20 off! Update the database accordingly.
UPDATE products SET price = price - 20; -- price check kept getting in the way but solution says this is valid.
-- OR
UPDATE products
SET price = CASE 
              WHEN price > 20 THEN price - 20 
              ELSE 1 
            END;

-- Query 12: Because of the sale, everything that costs less than $25 has sold out. Remove all products whose price meets this criteria.
DELETE FROM products WHERE price < 25;

-- Query 13: And now the sale is over. For the remaining products, increase their price by $20.
UPDATE products SET price = price + 20;

-- Query 14: There is a new company policy: everything is returnable. Update the database accordingly.
UPDATE products SET can_be_returned = 't';