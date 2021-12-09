use DB104;
/*DROP TABLE Category;*/
CREATE TABLE Category
				(code INT PRIMARY KEY ,
				c_description VARCHAR(50),
				name VARCHAR(50));

INSERT into Category (code, c_description, name) Values (1, ' open_ceiling ', ' hatchback ');
INSERT into Category (code, c_description, name) Values (2, ' utilitarian ', ' microcar ');
INSERT into Category (code, c_description, name) Values (3, ' luxury ', ' SUV ');
INSERT into Category (code, c_description, name) Values (4, 'comfortable', 'jeep');
INSERT into Category (code, c_description, name) Values (5, 'well-designed', 'cabrio');

CREATE TABLE Car
				(plate_number INT NOT NULL,
				company VARCHAR(15), 
				purchase_date DATE, 
				model VARCHAR(15),
				colour VARCHAR(15),
				code INT NOT NULL, 
				CONSTRAINT PK_Car PRIMARY KEY(plate_number),
				CONSTRAINT FK_Car FOREIGN KEY (code) REFERENCES Category);

INSERT into Car (plate_number, code, company, purchase_date, model, colour) Values (1,1, ' renault ','2010-01-21',' cleo ', ' black ' );
INSERT into Car (plate_number, code, company, purchase_date, model, colour) Values (2,2, ' smart ', '2010-03-14',' crosstown ',' red ');
INSERT into Car (plate_number, code, company, purchase_date, model, colour) Values (3,3,' landrover ', '2011-05-05',' rangerover ',' white ');
INSERT into Car (plate_number, code, company, purchase_date, model, colour) Values (4, 4, 'toyota ', '2010-07-03', 'chr', 'green');
INSERT into Car (plate_number, code, company, purchase_date, model, colour) Values (5, 5, 'volkswagen', '2010-06-02', 'golf', 'white');


/*DROP TABLE Category;
DROP TABLE Car;*/


/*DROP TABLE Departement;*/
CREATE TABLE Departement
				(code INT PRIMARY KEY,
				d_population INTEGER,
				name VARCHAR(15),
				av_an_income REAL);

INSERT INTO Departement (code, d_population, name, av_an_income) Values (1, 633506,'Crete', 134.5);
INSERT INTO Departement (code, d_population, name, av_an_income) Values (2, 115500,'Peloponnisos', 152.6);
INSERT INTO Departement (code, d_population, name, av_an_income) Values (3, 375679, 'Attiki ', 115.9);
INSERT INTO Departement (code, d_population, name, av_an_income) Values (4, 10483, 'Karditsa', 112.2);
INSERT INTO Departement (code, d_population, name, av_an_income) Values (5, 1934, 'Volos', 93.4);



CREATE TABLE Customer
				(code INT PRIMARY KEY,
				c_address VARCHAR(50),
				phone INTEGER,
				fullname VARCHAR(50),
				dep_code INT NOT NULL,
				FOREIGN KEY(dep_code) REFERENCES Departement);

INSERT INTO Customer (code, c_address, phone, fullname, dep_code) Values (1,' Evrou 9 ', 694432,' Rafaela Kara ', 1);
INSERT INTO Customer (code, c_address, phone, fullname, dep_code) Values (2,' Kolokotroni 24 ', 698213,' Maria kouli ', 2);
INSERT INTO Customer (code, c_address, phone, fullname, dep_code) Values (3,' Kosma Aitwlou 8 ', 53534,' Giorgos Papi',3);
INSERT INTO Customer (code, c_address, phone, fullname, dep_code) Values (4, 'Voukourestiou 23', 13567, 'Maria Papadaki',4);
INSERT INTO Customer (code, c_address, phone, fullname, dep_code) Values (5, 'Kolokotroni 32', 13225, 'Kostas Alexakis',5);

 /*
DROP TABLE Category;
DROP TABLE Departement;
DROP TABLE Customer;*/
CREATE TABLE Corporate
				(code INT NOT NULL,
				 discount_rate REAL,
				 company_vat INTEGER NOT NULL,
				 CONSTRAINT PKCorporate PRIMARY KEY(company_vat, code),
				 CONSTRAINT FKCorporate FOREIGN KEY(code)
									REFERENCES Customer(code));

INSERT INTO Corporate (code, discount_rate, company_vat) Values (1, 25.9, 13612);
INSERT INTO Corporate (code, discount_rate, company_vat) Values (2, 30.6, 93521);
INSERT INTO Corporate (code, discount_rate, company_vat) Values (4,28.2, 13454);

/* DROP TABLE Corporate; */

CREATE TABLE Simplec
				(code INT NOT NULL,
				birthdate DATE,
				CONSTRAINT PKSimplec PRIMARY KEY(birthdate, code),
				CONSTRAINT FKSimplec FOREIGN KEY(code)
									REFERENCES Customer(code));

INSERT INTO Simplec (code, birthdate) Values (3, '1987-03-04');
INSERT INTO Simplec (code, birthdate) Values (5, '1942-05-06');

/* DROP TABLE Simplec */

CREATE TABLE Driver
				(fullname VARCHAR(50) NOT NULL,
				code INT NOT NULL,
				age INTEGER,
				PRIMARY KEY(fullname, code),
				FOREIGN KEY(code) REFERENCES Customer(code));

INSERT INTO Driver (code, fullname, age) Values (3,'  Giorgos Konstantinidis ', 48);
INSERT INTO Driver (code, fullname, age) Values (3,' Eirini Papadaki ', 26);
INSERT INTO Driver (code, fullname, age) Values (3,' Marios Nikolaou ', 32);
/*DROP TABLE Customer
DROP TABLE Departement
DROP TABLE Corporate
DROP TABLE Simplec
DROP TABLE Driver*/

/*DROP TABLE Location;*/
CREATE TABLE Location
				(code INT PRIMARY KEY,
				pertinent_name VARCHAR(50),
				street VARCHAR(50),
				number INTEGER,
				postcode INTEGER);

INSERT INTO Location (code, pertinent_name, street, number, postcode) Values (1,' Giannis Papadakis ',' marousi ', 5, 42139);
INSERT INTO Location (code, pertinent_name, street, number, postcode) Values (2,' Konstantina Panagiotou ',' ippokratous ', 13, 72819);
INSERT INTO Location (code, pertinent_name, street, number, postcode) Values (3,' Marilena Xatziantoniou ',' kipseli ', 21, 98376);
INSERT INTO Location (code, pertinent_name, street, number, postcode) Values (4, 'Maria Papadaki', 'kipseli', 12, 1324);
INSERT INTO Location (code, pertinent_name, street, number, postcode) Values (5, 'Manos Pervolarakis', 'kentro', 21,3947);

CREATE TABLE Phones
				(code INT NOT NULL,
				phone INTEGER NOT NULL,
				PRIMARY KEY(code, phone),
				FOREIGN KEY(code) REFERENCES Location);

INSERT INTO Phones (code, phone) Values (1, 69783);
INSERT INTO Phones (code, phone) Values (2, 21097);
INSERT INTO Phones (code, phone) Values (3, 28106);
INSERT INTO Phones (code, phone) Values (4, 21030);
INSERT INTO Phones (code, phone) Values (5, 12432);

/*DROP TABLE Location;
DROP TABLE Phones;*/

CREATE TABLE Rental
				(code INT NOT NULL,
				value REAL,
				first_day DATE,
				last_day DATE,
				plate_number INT NOT NULL,
				cust_code INT NOT NULL,
				pickup_locid INT NOT NULL,
				return_locid INT NOT NULL,
				CONSTRAINT PK_Rental PRIMARY KEY(code),
				CONSTRAINT FK_Rental1 FOREIGN KEY(plate_number) REFERENCES Car(plate_number),
				CONSTRAINT FK_Rental2 FOREIGN KEY(cust_code) REFERENCES Customer(code),
				CONSTRAINT FK_Rental3 FOREIGN KEY(pickup_locid) REFERENCES Location(code),
				CONSTRAINT FK_Rental4 FOREIGN KEY(return_locid) REFERENCES Location(code));



INSERT INTO Rental (code,value, plate_number, cust_code, pickup_locid, return_locid,first_day, last_day) Values (1,52.3,1,1,1, 3, '2010-02-02', '2010-03-04');  
INSERT INTO Rental (code,value, plate_number, cust_code, pickup_locid, return_locid,first_day, last_day) Values (2,48.5,2, 2,2,2, '2010-01-03', '2010-04-05');
INSERT INTO Rental (code,value, plate_number, cust_code, pickup_locid, return_locid,first_day, last_day) Values (3,36.2,3,3,3,1, '2010-11-04', '2010-02-07');
INSERT INTO Rental (code,value, plate_number, cust_code, pickup_locid, return_locid,first_day, last_day) Values (4,72.5,4,4,4,4, '2010-06-01', '2010-06-30');
INSERT INTO Rental (code,value, plate_number, cust_code, pickup_locid, return_locid,first_day, last_day) Values (5,81.3,5,5,5,5, '2009-12-05',' 2010-07-08');


CREATE TABLE Payment
				(confirmation_number INT  NOT NULL,
				amount REAL,
				p_date DATE,
			    number INT ,
				final_date DATE,
				r_code INT NOT NULL,
				CONSTRAINT PK_Payment PRIMARY KEY(confirmation_number),
				CONSTRAINT FK_Payment FOREIGN KEY(r_code) REFERENCES Rental(code));

INSERT INTO Payment (confirmation_number, amount, p_date, number, final_date, r_code) Values (1, 56.7, '2010-03-24',6932,'2010-06-22', 1);  
INSERT INTO Payment (confirmation_number, amount, p_date, number, final_date, r_code) Values (2, 46.8, '2010-12-15', 6935, '2011-02-28', 2);
INSERT INTO Payment (confirmation_number, amount, p_date, number, final_date, r_code) Values (3,29.4, '2010-04-19', 6982, '2010-07-19', 3);

/*
DROP TABLE Payment;
DROP TABLE Rental;
DROP TABLE Phones;
DROP TABLE Location;
DROP TABLE Driver;
DROP TABLE Simplec;
DROP TABLE Corporate;
DROP TABLE Customer;
DROP TABLE Departement;
DROP TABLE Car;
DROP TABLE Category;
*/
