-- --------------------------------------------------------

-- Show all flights available from Belfast between May and September

SELECT * FROM flight INNER JOIN route on flight.route_id = route.route_id WHERE route_name LIKE 'Belfast%'
AND depart_date_time >= '2023-05-01 00:00:00' AND depart_date_time <= '2023-09-01 00:00:00';

-- Return flights
SELECT * FROM flight INNER JOIN route on flight.route_id = route.route_id WHERE route_name LIKE '%Belfast'
AND depart_date_time >= '2023-05-01 00:00:00' AND depart_date_time <= '2023-09-01 00:00:00';

-- --------------------------------------------------------
 -- Return all hotels in Spain, order by city name

 SELECT hotel_id, hotel_name AS 'hotel', city_name AS 'city', region_name AS 'region', country_name AS 'country' FROM hotel
INNER JOIN address ON hotel.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN region ON city.region_id = region.region_id
INNER JOIN country ON region.country_id = country.country_id
WHERE country_name = 'Spain' ORDER BY city_name;

 -- Of those hotels, which have All-inclusive board, with swimming pool
 SELECT hotel.hotel_id, hotel_name AS 'hotel', board_name AS 'board', facility_name AS 'facility' FROM hotel
 INNER JOIN hotel_board on hotel.hotel_id = hotel_board.hotel_id
 INNER JOIN board on hotel_board.board_id = board.board_id
 INNER JOIN hotel_facility ON hotel.hotel_id = hotel_facility.hotel_id
 INNER JOIN facility ON hotel_facility.facility_id = facility.facility_id
 WHERE hotel.hotel_id IN (SELECT hotel.hotel_id FROM hotel_facility WHERE facility_id = 4)
 AND board_name = 'All-Inclusive' AND hotel_facility.hotel_id IN (SELECT hotel_facility.hotel_id
   FROM hotel_facility WHERE facility.facility_name = 'Swimming Pool') AND hotel.hotel_id IN (2,3,4,11,12,13);;


-- Of those hotels, which have a 4 star rating

SELECT hotel.hotel_id, hotel_name AS 'hotel' , star_rating AS 'Star Rating - out of 5' FROM hotel
INNER JOIN star_rating ON hotel.star_rating_id = star_rating.star_rating_id
WHERE hotel_id IN (2,11,13) AND star_rating >= 3 ORDER BY star_rating DESC;

-- nearby water park

SELECT hotel_name AS 'hotel', attraction_name AS 'attraction', distance_miles AS 'distance from hotel', travel_duration_time AS 'travel duration from hotel' FROM hotel INNER JOIN hotel_attraction ON hotel.hotel_id = hotel_attraction.hotel_id
INNER JOIN attraction ON hotel_attraction.attraction_id = attraction.attraction_id
WHERE hotel.hotel_id = 2 OR 13 AND attraction_name LIKE '%Water Park';

--within 10 miles

SELECT hotel_name AS 'hotel', attraction_name AS 'attraction', distance_miles AS 'distance from hotel', travel_duration_time AS 'travel duration from hotel' FROM hotel INNER JOIN hotel_attraction ON hotel.hotel_id = hotel_attraction.hotel_id
INNER JOIN attraction ON hotel_attraction.attraction_id = attraction.attraction_id
WHERE hotel.hotel_id = 2 OR 13 AND attraction_name LIKE '%Water Park'AND distance_miles < 10;

-- show available rooms at hotel
SELECT room_id, room_num AS 'room number', room_floor AS 'floor'FROM room
WHERE hotel_id = 2;

SELECT room_id, room_num AS 'room number', room_floor AS 'floor'FROM room
WHERE room_id NOT IN (SELECT room_id FROM room_booking) AND hotel_id = 2;

-- show available rooms at hotel  (July) - cheapest first
SELECT room.room_id, room_num AS 'room number', room_floor AS 'floor', room_type_name
AS 'room type', room_price.price FROM room
INNER JOIN room_type on room.room_type_id = room_type.room_type_id
INNER JOIN room_price on room.room_id = room_price.room_id
WHERE hotel_id = 2 AND room.room_id IN (13,15,16)
AND valid_from_date >= '2023-07-01' AND valid_to_date <= '2023-07-31' ORDER BY price ASC;

--MIN
SELECT room.room_id, room_num AS 'room number',room_floor AS 'floor', room_type_name AS 'room type',
MIN(room_price.price) AS 'Cheapest' FROM room
INNER JOIN room_type on room.room_type_id = room_type.room_type_id
INNER JOIN room_price on room.room_id = room_price.room_id
WHERE hotel_id = 2 AND room.room_id IN (13,15,16)
AND valid_from_date >= '2023-07-01' AND valid_to_date <= '2023-07-31';


-- Show total bill

SELECT (x.price*7) AS 'room price', (y.flight_price*2) AS 'flight price for 2',
(x.price*7) + (y.flight_price*2) AS 'Total Price for 2'
 FROM
(SELECT * FROM room_price WHERE room_price_id = 3) AS x,
(SELECT * FROM flight_price WHERE flight_price_id =2) AS y;;


-- INSERT BOOKING

START TRANSACTION;

INSERT INTO `booking` (`booking_id`, `booking_reference`, `booking_made_date`, `booking_start_date`, `booking_timestamp`,
  `booking_duration_days`, `price_paid`, `booking_status`, `depart_flight_id`, `return_flight_id`)
  VALUES (NULL, 'BN1345', '2022-11-01', '2023-07-11', current_timestamp(), '7', '1020', 'Confirmed', '4', '16');
  SET @last_id_in_booking = LAST_INSERT_ID();

INSERT INTO `address` (`address_id`, `address_line_1`, `address_line_2`, `postcode`, `gps_lat`, `gps_long`, `city_id`)
VALUES (NULL, '31 Botanic Avenue', 'Belfast', 'BT713 JH', '46', '45', '8');
  SET @last_id_in_address = LAST_INSERT_ID();

INSERT INTO `contact_details` (`contact_details_id`, `email_address`, `telephone_number`, `emergency_number`)
VALUES (NULL, 'michaelmclaughling@gmail.com', '07835889541', '02877741564');
  SET @last_id_in_contact_details = LAST_INSERT_ID();

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `date_of_birth`, `lead_customer`, `title_id`,
  `contact_details_id`, `customer_type_id`, `booking_id`, `address_id`)
  VALUES (NULL, 'Michael', 'McLaughlin', '1987-11-01', '1', '1', @last_id_in_contact_details, '1', @last_id_in_booking, @last_id_in_address);

  INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `date_of_birth`, `lead_customer`, `title_id`,
    `contact_details_id`, `customer_type_id`, `booking_id`, `address_id`)
   VALUES (NULL, 'Aoife', 'Kelly', '1988-08-21', '0', '3', @last_id_in_contact_details, '1', @last_id_in_booking, @last_id_in_address);

  COMMIT;


-- --------------------------------------------------------
-- Booking line item  sum group by having

-- Sum up total price of items in booking line table
START TRANSACTION;

SELECT @totalCost := SUM(booking_line_item.price_paid) FROM booking
INNER JOIN booking_line_item ON booking.booking_id = booking_line_item.booking_id
WHERE booking.booking_id = 3;

-- Update the price paid in the booking table

UPDATE booking SET price_paid = @totalCost WHERE booking.booking_id = 3;

COMMIT;


-- --------------------------------------------------------
-- Show card encyption

/* Cardholder details to be stored */

/* Get the cardholder details to be stored */
SET @cardholdername = 'Mr Michael McLaughlin';
SET @cardlongnumber = '1234 5678 1234 5678';
SET @cardenddate= '2031-10-08';
SET @cardType = 3;

/* A very simple secret password */
SET @secretPasssword = 'needmorecoffee';

/* Start (very) basic data encryption */
SET @cardlongnumber = AES_ENCRYPT(@cardlongnumber,@secretPasssword);

/* Insert the record with the encrypted data */
INSERT INTO payment_card (payment_card_id, cardholder_name, card_long_number, card_expiry_date, card_type_id, customer_id)
VALUES (NULL, @cardholdername, @cardlongnumber, @cardenddate, @cardType, XXX);

- --------------------------------------------------------

-- Seasonal pricing  AS july price -- November Price

SELECT room.room_id, room_num AS 'room number',room_floor AS 'floor', room_type_name AS 'room type',
room_price.price as 'July Price'
FROM room INNER JOIN room_type on room.room_type_id = room_type.room_type_id
INNER JOIN room_price on room.room_id = room_price.room_id
WHERE hotel_id = 2 AND room.room_id IN (13,15,16)
AND valid_from_date >= '2023-07-01' AND valid_to_date <= '2023-07-31' ORDER BY price ASC;

SELECT room.room_id, room_num AS 'room number',room_floor AS 'floor', room_type_name AS 'room type',  room_price.price as 'November Price' FROM room
INNER JOIN room_type on room.room_type_id = room_type.room_type_id
INNER JOIN room_price on room.room_id = room_price.room_id
WHERE hotel_id = 2 AND room.room_id IN (13,15,16)
AND valid_from_date >= '2023-11-01' AND valid_to_date <= '2023-11-30' ORDER BY price ASC;

-- --------------------------------------------------------
Extra functionality.

-- Show languages spoken in Regions

SELECT * FROM `primary_lang` RIGHT JOIN region ON primary_lang.primary_lang_id = region.primary_lang_id;
