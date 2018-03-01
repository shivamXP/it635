DELIMITER $$
CREATE PROCEDURE insertItem(IN name varchar(20),IN stock varchar(20),IN price int(3),IN category varchar(20), IN description varchar(200))

 BEGIN
 INSERT INTO items (name,stock,price,category) values(name,stock,price,category);
 
	
 END $$
DELIMITER ;
