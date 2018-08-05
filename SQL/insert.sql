-- TEAM MAKESMART FINAL
-- CST336 Plant Database
-- TEAM MEMBERS Jake McGhee, Pavlos Papadonikolakis, Maco Doussias 
-- 07-27-18

-- ----------------------------------------------------------------INSERT SQL STATEMENTS
-- Create the administrator account
INSERT INTO `admin` (`idadmin`, `username`, `password`) VALUES ('1', 'admin', SHA1('secret'));

-- Create a user account
INSERT INTO `customer` (`idcustomer`, `firstName`, `lastName`, `password`, `address`) VALUES ('1', ' Seymour', 'Krelborn', SHA1('secret'), 'sk@apple.com');

-- Create a few plants
INSERT INTO `plant` (`idplant`, `plantName`, `plantDesc`, `priceDollar`, `priceCent`, `imgLink`) VALUES ('1', ' Venus Fly Trap', 'This plant is deadly plant that traps, kills and eats insects. ', '12', '99', 'img/venus.png');

-- Purchase one for customer one
INSERT INTO `purchase` (`idpurchase`, `purchaseDate`, `customer_idcustomer`) VALUES ('1', CURRENT_TIMESTAMP(), '1');
	INSERT INTO `lineItem` (`purchase_idpurchase`, `plant_idplant`, `quantity`, `priceDollar`, `priceCent`) VALUES ('1', '1', '3', '5', '99');
