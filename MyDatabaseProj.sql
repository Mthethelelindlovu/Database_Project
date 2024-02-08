CREATE DATABASE Customers;
USE Customers;
CREATE TABLE Person ( PersonID INT NOT NULL, 
					  LastName VARCHAR(20) NOT NULL,
                      FirstName VARCHAR (20) NOT NULL,
                      Age INT NOT NULL);
ALTER TABLE Person
ADD PRIMARY KEY (PersonID);

INSERT  INTO Person ( PersonID, LastName, FirstName, Age)
VALUES(1, "Hansen", "Ola", 30);

INSERT INTO Person (PersonID, LastName, FirstName, Age) 
VALUES (2, "Svendson", "Tove", 23);

INSERT INTO Person (PersonID, LastName, FirstName, Age) 
VALUES (3, "Petersen", "Kari", 20);

CREATE TABLE Orders ( OrderID INT NOT NULL, 
                      OrderNumber INT NOT NULL,
                      PersonID INT NOT NULL,
                      PRIMARY KEY (OrderID),
                      FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
                      );
-- Inserting values into Orders Table
INSERT INTO Orders (OrderID, OrderNumber, PersonID)
VALUES (1, 77895, 3);

INSERT INTO Orders (OrderID, OrderNumber, PersonID)
VALUES (2, 44678, 3);

INSERT INTO Orders (OrderID, OrderNumber, PersonID)
VALUES (3, 22456, 2);

INSERT INTO Orders (OrderID, OrderNumber, PersonID)
VALUES (4, 24562, 1);

SELECT * FROM Person;
SELECT LastName, Age FROM Person;
SELECT LastName, Age FROM Person ORDER BY Age DESC;
SELECT LastName, Age FROM Person  WHERE LastName = "Petersen";
SELECT * from Orders;
SELECT OrderNumber, PersonID FROM Orders
ORDER BY OrderNumber;
SELECT * FROM Orders LIMIT 2;
SELECT PersonID, OrderID FROM Orders WHERE OrderNumber < 30000;
SELECT count(Age), Age FROM Person GROUP BY Age ;

SELECT LastName, FirstName, Age 
FROM Person 
WHERE PersonID in(SELECT PersonID
FROM Orders 
WHERE OrderNumber = 22456);

