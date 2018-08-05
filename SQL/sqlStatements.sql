-- TEAM MAKESMART FINAL
-- CST336 Plant Database
-- TEAM MEMBERS Jake McGhee, Pavlos Papadonikolakis, Maco Doussias 
-- 07-27-18

-- ----------------------------------------------------------------SELECT SQL STATEMENTS
-- ----------------------------------------------------------------And MISC SQL STATEMENTS

-- Basic select statements--------------------------------------------------------------------------------
SELECT * FROM admin;
SELECT * FROM customer;
SELECT * FROM lineItem;
SELECT * FROM plant;
SELECT * FROM purchase;

-- Drop statements -----------------------------------------------------------------------------------------
-- Note, because of foreign key contraints, DROPS must be done in the correct order.
-- Below is the correct order to delete drop all tables, if needed for testing purposes.
DROP TABLE admin;
DROP TABLE lineItem;
DROP TABLE plant;
DROP TABLE purchase;
DROP TABLE customer;


-- Please put any useful SQL statements here, so that others may reference.
