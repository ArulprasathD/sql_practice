CREATE DATABASE UBER;


USE UBER;

CREATE TABLE RIDES (
    RIDE_ID INT,
    DRIVER_ID INT,
    RIDER_ID INT,
    PICKUP_LOCATION VARCHAR(100),
    DROPOFF_LOCATION VARCHAR(100),
    RIDE_DATE DATETIME,
    FARE DECIMAL(10,2)
);

INSERT INTO rides (ride_id, driver_id, rider_id, pickup_location, dropoff_location, ride_date, fare)
VALUES
(1,101,201,'Chennai','Coimbatore','2024-12-29 08:00:00',500.00),
(2,102,202,'Bangalore','Hyderabad','2024-12-29 09:00:00',800.00),
(3,103,203,'Chennai','Madurai','2024-12-29 10:00:00',400.00),
(4,104,204,'Coimbatore','Chennai','2024-12-29 11:00:00',600.00),
(5,105,205,'Bangalore','Coimbatore','2024-12-29 12:00:00',700.00),
(6,106,206,'Hyderabad','Chennai','2024-12-29 13:00:00',900.00),
(7,107,207,'Madurai','Trichy','2024-12-29 14:00:00',300.00),
(8,108,208,'Trichy','Salem','2024-12-29 15:00:00',350.00),
(9,109,209,'Salem','Chennai','2024-12-29 16:00:00',550.00),
(10,110,210,'Chennai','Bangalore','2024-12-29 17:00:00',750.00),

(11,111,211,'Coimbatore','Madurai','2024-12-30 08:00:00',450.00),
(12,112,212,'Hyderabad','Bangalore','2024-12-30 09:00:00',850.00),
(13,113,213,'Trichy','Chennai','2024-12-30 10:00:00',500.00),
(14,114,214,'Salem','Madurai','2024-12-30 11:00:00',400.00),
(15,115,215,'Chennai','Salem','2024-12-30 12:00:00',550.00),
(16,116,216,'Bangalore','Chennai','2024-12-30 13:00:00',780.00),
(17,117,217,'Madurai','Coimbatore','2024-12-30 14:00:00',600.00),
(18,118,218,'Trichy','Bangalore','2024-12-30 15:00:00',820.00),
(19,119,219,'Salem','Hyderabad','2024-12-30 16:00:00',910.00),
(20,120,220,'Chennai','Trichy','2024-12-30 17:00:00',350.00);

SELECT *FROM RIDES
WHERE FARE > 500 ;

SELECT *FROM RIDES
WHERE FARE > 500 
ORDER BY FARE;

SELECT *FROM RIDES
WHERE FARE > 500 
ORDER BY FARE DESC ;

SELECT * FROM RIDES
WHERE
FARE > 500 AND DROPOFF_LOCATION = 'CHENNAI'
ORDER BY FARE DESC;

DESC RIDES; 