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
-- All images and plant info retrieved 08-04-18 from https://en.wikipedia.org/wiki/List_of_poisonous_plants
INSERT INTO `plant` (`idplant`, `plantName`, `plantDesc`, `priceDollar`, `priceCent`, `imgLink`) VALUES ('1', 'Rosary Pea', 'The rosary pea gets its name from its beautiful red seeds.  It has effects similar to ricin.', '12', '99', 'img/rosarypea.png');
INSERT INTO `plant` (`idplant`, `plantName`, `plantDesc`, `priceDollar`, `priceCent`, `imgLink`) VALUES ('2', 'Aconite', 'This entire plant is poisonous.   It is best to avoid skin contact as it can cause cardiac arrest.', '12', '99', 'img/aconite.png');
INSERT INTO `plant` (`idplant`, `plantName`, `plantDesc`, `priceDollar`, `priceCent`, `imgLink`) VALUES ('3', 'White Baneberry', 'This plant is especially poisonous in its berry.  Be careful not to ingest as it can cause cardiac arrest.', '12', '99', 'img/baneberry.png');
INSERT INTO `plant` (`idplant`, `plantName`, `plantDesc`, `priceDollar`, `priceCent`, `imgLink`) VALUES ('4', 'White Snakeroot', 'This plant is often dangerous when livestock like cattle ingest it, as it can be present in the milk they produce.', '12', '99', 'img/whitesnakeroot.png');
INSERT INTO `plant` (`idplant`, `plantName`, `plantDesc`, `priceDollar`, `priceCent`, `imgLink`) VALUES ('5', 'Frangipani', 'The latex of this plant is more annoying than poisonous as it can cause irritation.  However, it can be bad in large doses.', '12', '99', 'img/frangipani.png');


-- Purchase one for customer one
INSERT INTO `purchase` (`idpurchase`, `purchaseDate`, `customer_idcustomer`) VALUES ('1', CURRENT_TIMESTAMP(), '1');
	INSERT INTO `lineItem` (`purchase_idpurchase`, `plant_idplant`, `quantity`, `priceDollar`, `priceCent`) VALUES ('1', '1', '3', '5', '99');

-- Purchase two for customer one
INSERT INTO `purchase` (`idpurchase`, `purchaseDate`, `customer_idcustomer`) VALUES ('2', CURRENT_TIMESTAMP(), '1');
	INSERT INTO `lineItem` (`purchase_idpurchase`, `plant_idplant`, `quantity`, `priceDollar`, `priceCent`) VALUES ('2', '1', '1', '10', '99');
	
-- Purchase three for customer one
INSERT INTO `purchase` (`idpurchase`, `purchaseDate`, `customer_idcustomer`) VALUES ('3', CURRENT_TIMESTAMP(), '1');
	INSERT INTO `lineItem` (`purchase_idpurchase`, `plant_idplant`, `quantity`, `priceDollar`, `priceCent`) VALUES ('3', '2', '7', '15', '99');

-- Purchase four for customer one
INSERT INTO `purchase` (`idpurchase`, `purchaseDate`, `customer_idcustomer`) VALUES ('4', CURRENT_TIMESTAMP(), '1');
	INSERT INTO `lineItem` (`purchase_idpurchase`, `plant_idplant`, `quantity`, `priceDollar`, `priceCent`) VALUES ('4', '3', '2', '8', '99');
			
-- Purchase five for customer one
INSERT INTO `purchase` (`idpurchase`, `purchaseDate`, `customer_idcustomer`) VALUES ('5', CURRENT_TIMESTAMP(), '1');
	INSERT INTO `lineItem` (`purchase_idpurchase`, `plant_idplant`, `quantity`, `priceDollar`, `priceCent`) VALUES ('5', '4', '3', '7', '50');
