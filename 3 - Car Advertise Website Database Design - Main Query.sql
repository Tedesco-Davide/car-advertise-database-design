------------ Tables creation ------------

-- Brands

USE CarAdvertise
CREATE TABLE Brands (
	brand_id INT IDENTITY(1,1),
	brand_name VARCHAR(50),
    CONSTRAINT PK_Brands PRIMARY KEY(brand_id)
)

-- Models

USE CarAdvertise
CREATE TABLE Models (
	model_id INT IDENTITY(1,1),
	model_name VARCHAR(50),
    CONSTRAINT PK_Models PRIMARY KEY(model_id)
)

-- Bodies

USE CarAdvertise
CREATE TABLE Bodies (
	body_id INT IDENTITY(1,1),
	body_type VARCHAR(50),
    CONSTRAINT PK_Bodies PRIMARY KEY(body_id)
)

-- Users

USE CarAdvertise
CREATE TABLE Users (
	user_id INT IDENTITY(1,1),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(255),
	username VARCHAR(50),
    CONSTRAINT PK_Users PRIMARY KEY(user_id)
)

-- Cars

USE CarAdvertise
CREATE TABLE Cars (
	car_id INT IDENTITY(1,1),
	user_id INT,
	brand_id INT,
	model_id INT,
	body_id INT,
	year INT,
	description VARCHAR(255),
	CONSTRAINT PK_Cars PRIMARY KEY(car_id),
	CONSTRAINT FK_Car_Brands FOREIGN KEY(brand_id) REFERENCES Brands(brand_id),
	CONSTRAINT FK_Car_Models FOREIGN KEY(model_id) REFERENCES Models(model_id),
	CONSTRAINT FK_Car_Bodies FOREIGN KEY(body_id) REFERENCES Bodies(body_id),
	CONSTRAINT FK_Users FOREIGN KEY(body_id) REFERENCES Users(user_id),
)

-- Pictures

USE CarAdvertise
CREATE TABLE Pictures (
	picture_id INT IDENTITY(1,1),
	car_id INT,
	path VARBINARY(MAX),
	CONSTRAINT PK_Pictures PRIMARY KEY(picture_id),
	CONSTRAINT FK_Car_Pictures FOREIGN KEY(car_id) REFERENCES Cars(car_id)
)