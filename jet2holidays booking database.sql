-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2022 at 10:40 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jet2holidays`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_line_1` varchar(255) NOT NULL,
  `address_line_2` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `gps_lat` varchar(255) NOT NULL,
  `gps_long` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_line_1`, `address_line_2`, `postcode`, `gps_lat`, `gps_long`, `city_id`) VALUES
(1, 'Airport Road', 'Belfast', 'BT29 4AB', '54.6557', '6.2169', 8),
(2, 'Cesta Dr. Franje', 'Kaltel', 'CF21217', '43.5467', '11.2145', 1),
(3, 'El Prat de Llobregat ', 'Barcelona', 'PL8820', '33.1234', '7.6134', 5),
(4, 'Palma ', 'Balearic Islands ', 'PA7611', '21.7423', '8.1123', 4),
(5, 'Queens', 'New York', 'NY11430', '40.6411', '-73.4211', 9),
(6, '123 Santo Poco Drive', 'Alhabra', 'SP132', '11.2145', '43.5467', 1),
(7, '43 Granada Preview', 'Menorca', 'ME45', '54.6557', '-21.4723', 4),
(8, '138 Costa Brava', 'Grampa', 'NF42', '7.6134', '-73.4211', 5),
(9, '45 Granton Pass', 'Brunswick', 'MN43', '33.1234', '11.2145', 5),
(10, '52 Nature Way', 'New Granton', 'LM43', '-21.4723', '43.5467', 4),
(11, '57 Nature Way', 'New Granton', 'LM74', '11.2145', '7.6134', 4),
(12, '1600 Bleecker Street', 'Manhattan', 'MN572', '54.6557', '-73.4211', 9),
(13, '1754 Rodeo Drive', 'Manhattan', 'MN721', '33.1234', '7.6134', 9),
(14, '75 Santo Loco Drive', 'Alhabra', 'SP132', '-21.4723', '11.2145', 1),
(15, 'Mountain Pass', 'Rockton', 'LJ67', '54.6557', '43.5467', 10),
(16, 'Cherry Vale Lawn', 'Pugton', 'PL98', '33.1234', '11.2145', 10),
(17, '18 Meadow Lawn', 'Farmley', 'LM73', '11.2145', '-73.4211', 7),
(18, '19 Flint Alley', 'El Hambra', 'EL12', '-21.4723', '11.2145', 4),
(19, '3 Central Avenue', 'Manhattan', 'MN17', '33.1234', '11.2145', 9),
(20, '198 Ormsby Court', 'Pugton', 'PG12', '-21.4723', '-73.4211', 7);

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `airport_id` int(11) NOT NULL,
  `airport_name` varchar(255) NOT NULL,
  `airport_code` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`airport_id`, `airport_name`, `airport_code`, `address_id`) VALUES
(1, 'Belfast International Airport', 'BFS', 1),
(2, 'Split Airport', 'SPU', 2),
(3, 'Barcelona El Prat Airport', 'BCN', 3),
(4, 'Palma de Mallorca Airport', 'PMI', 4),
(5, 'JFK International Airport', 'JFK', 5);

-- --------------------------------------------------------

--
-- Table structure for table `attraction`
--

CREATE TABLE `attraction` (
  `attraction_id` int(11) NOT NULL,
  `attraction_name` varchar(255) NOT NULL,
  `attraction_desc` text NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attraction`
--

INSERT INTO `attraction` (`attraction_id`, `attraction_name`, `attraction_desc`, `address_id`) VALUES
(1, 'Splashy Water Park', 'Family fun for all', 6),
(2, 'Mega Falls Water Park', 'Family fun for all', 7),
(3, 'La Renard Boutique Restaurant', 'Michelin Star Restaurant', 8),
(4, 'Flingers Family Burger Bar', 'Kid-friendly food', 9),
(5, 'Mount Lovely Nature Park', 'Hiking and excellent views', 10),
(6, 'Kickflip Skate Park', 'Skate park for all ages', 11),
(7, 'Empire State Building', 'One of the world\'s tallest buildings', 12),
(8, 'Duncan\'s Toy Chest', 'A famous toy shop', 13);

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

CREATE TABLE `board` (
  `board_id` int(11) NOT NULL,
  `board_name` varchar(255) NOT NULL,
  `board_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`board_id`, `board_name`, `board_desc`) VALUES
(1, 'All-Inclusive', 'Includes buffet-style breakfast lunch and dinner in the main restaurant. Snacks are available at selected times between meals '),
(2, 'Full Board', 'Your breakfast lunch and evening meal are included in the price of a Full Board holiday. That means all you\'ve got to worry about are the drinks! '),
(3, 'Half Board', 'Both your breakfast and evening meal are already paid for in the price of your holiday so all the big meals are taken care of!'),
(4, 'Bed & Breakfast', 'Your breakfast is included in the price of your holiday. '),
(5, 'Self Catering', 'No meals are included with your holiday however you\'ll be provided with some catering facilities in your room.'),
(6, 'Room Only', 'As the name suggests  only the room is included in this option.');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `booking_reference` varchar(255) NOT NULL,
  `booking_made_date` date NOT NULL,
  `booking_start_date` date NOT NULL,
  `booking_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `booking_duration_days` int(11) NOT NULL,
  `price_paid` decimal(10,2) NOT NULL,
  `booking_status` enum('Confirmed','Pending','Cancelled') NOT NULL,
  `depart_flight_id` int(11) NOT NULL,
  `return_flight_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking_line_item`
--

CREATE TABLE `booking_line_item` (
  `booking_line_item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_desc` text NOT NULL,
  `price_paid` decimal(10,2) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `card_type`
--

CREATE TABLE `card_type` (
  `card_type_id` int(11) NOT NULL,
  `card_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `card_type`
--

INSERT INTO `card_type` (`card_type_id`, `card_type_name`) VALUES
(1, 'Mastercard'),
(2, 'VISA'),
(3, 'American Express');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `region_id`) VALUES
(1, 'Split', 1),
(2, 'Dubrovnik', 1),
(3, 'Paris', 2),
(4, 'Majorca', 3),
(5, 'Barcelona', 4),
(6, 'Porto', 5),
(7, 'Torquay', 6),
(8, 'Belfast', 7),
(9, 'New York City', 8),
(10, 'Chicago', 9);

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE `contact_details` (
  `contact_details_id` int(11) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `telephone_number` varchar(255) NOT NULL,
  `emergency_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'Croatia'),
(2, 'France'),
(3, 'Spain'),
(4, 'Portugal'),
(5, 'UK'),
(6, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `lead_customer` tinyint(1) NOT NULL,
  `title_id` int(11) NOT NULL,
  `contact_details_id` int(11) NOT NULL,
  `customer_type_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_type`
--

CREATE TABLE `customer_type` (
  `customer_type_id` int(11) NOT NULL,
  `customer_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_type`
--

INSERT INTO `customer_type` (`customer_type_id`, `customer_type_name`) VALUES
(1, 'Adult'),
(2, 'Child');

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `facility_id` int(11) NOT NULL,
  `facility_name` varchar(255) NOT NULL,
  `facility_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`facility_id`, `facility_name`, `facility_desc`) VALUES
(1, 'Buffet Breakfast', 'A range of breakfast options'),
(2, 'Cooked Breakfast', 'Typically eggs, toast, coffee and extras'),
(3, 'On site restaurant', 'For lunch and dinner'),
(4, 'Swimming Pool', 'A session in the hotel pool'),
(5, 'Gym Session', 'Fully functional gym with cardio machines and weights'),
(6, 'Kid\'s Club', 'Exciting activities for children aged 8 ? 13'),
(7, 'Spa Massage', 'Relaxing '),
(8, 'Garden Maze', 'For the curious...'),
(9, 'Deja Vu', 'Didn\'t we already describe this?'),
(10, 'Coffee Machine', 'It\'ll wake you up'),
(11, 'Mini Bar', 'A selection of drinks and snacks'),
(12, 'Balcony', 'To enjoy the view'),
(13, 'Free Wi-Fi', 'Access the internet'),
(14, 'Ice Cream Expert', 'A premium service with as much ice cream as you can eat');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_id` int(11) NOT NULL,
  `flight_ref` varchar(255) NOT NULL,
  `depart_date_time` datetime NOT NULL,
  `depart_time_zone` varchar(255) NOT NULL,
  `arrival_date_time` datetime NOT NULL,
  `arrival_time_zone` varchar(255) NOT NULL,
  `route_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `flight_price`
--

CREATE TABLE `flight_price` (
  `flight_price_id` int(11) NOT NULL,
  `flight_price` decimal(10,2) NOT NULL,
  `customer_type_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(255) NOT NULL,
  `hotel_desc` text NOT NULL,
  `num_of_rooms` int(11) NOT NULL,
  `star_rating_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `hotel_name`, `hotel_desc`, `num_of_rooms`, `star_rating_id`, `address_id`) VALUES
(1, 'Hotel El Palace', 'Family friendly hotel', 2, 4, 14),
(2, 'Hotel Jazz', 'Cool, modern hotel', 3, 3, 18),
(3, 'Elba Sunset', 'Discount hotel', 7, 2, 7),
(4, 'Hotel Costa Azul', 'Family friendly hotel', 4, 3, 8),
(5, 'Plaza Hotel', 'Very fancy hotel', 5, 5, 19),
(6, 'Hard Rock Hotel ', 'Caters to all tastes', 4, 3, 13),
(7, 'Overlook Hotel', 'A hotel with a lot of atmosphere', 2, 2, 15),
(8, 'Cherry Tree Inn', 'Quaint B&B you won\'t want to leave', 6, 4, 16),
(9, 'Fawlty Towers', 'Don\'t mention the war!', 3, 1, 17),
(10, 'Gleneagles Hotel', 'A standard hotel', 10, 4, 20);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_attraction`
--

CREATE TABLE `hotel_attraction` (
  `hotel_attraction_id` int(11) NOT NULL,
  `distance (miles)` decimal(10,2) NOT NULL,
  `travel_duration_time` time NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_board`
--

CREATE TABLE `hotel_board` (
  `hotel_board_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `board_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_facility`
--

CREATE TABLE `hotel_facility` (
  `hotel_facility` int(11) NOT NULL,
  `hotel_facility_price` decimal(10,2) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_photo`
--

CREATE TABLE `hotel_photo` (
  `hotel_photo` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_status` enum('Completed','Confirmed','Pending','Cancelled') NOT NULL,
  `last_4_digits` varchar(255) NOT NULL,
  `card_type_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_card`
--

CREATE TABLE `payment_card` (
  `payment_card_id` int(11) NOT NULL,
  `cardholder_name` varchar(255) NOT NULL,
  `card_long_number` varbinary(255) NOT NULL,
  `card_expiry_date` date NOT NULL,
  `card_type_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL,
  `photo_path` varchar(255) NOT NULL,
  `photo_alt_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `primary_lang`
--

CREATE TABLE `primary_lang` (
  `primary_lang_id` int(11) NOT NULL,
  `primary_lang_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `primary_lang`
--

INSERT INTO `primary_lang` (`primary_lang_id`, `primary_lang_name`) VALUES
(1, 'Catalan'),
(2, 'Croatian'),
(3, 'English'),
(4, 'Dutch'),
(5, 'French'),
(6, 'Portuguese'),
(7, 'Spanish (Castillian)');

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_id` int(11) NOT NULL,
  `region_name` varchar(255) NOT NULL,
  `primary_lang_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `region_name`, `primary_lang_id`, `country_id`) VALUES
(1, 'Dalmatia', 2, 1),
(2, 'Paris Region', 5, 2),
(3, 'Balearic Islands', 1, 3),
(4, 'Catalonia', 7, 3),
(5, 'Porto District', 6, 4),
(6, 'Devon', 3, 5),
(7, 'County Antrim', 3, 5),
(8, 'New York State', 3, 6),
(9, 'Illinois', 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `room_number` varchar(255) NOT NULL,
  `room_floor` int(11) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room_booking`
--

CREATE TABLE `room_booking` (
  `room_booking_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room_facility`
--

CREATE TABLE `room_facility` (
  `room_facility_id` int(11) NOT NULL,
  `room_facility_price` decimal(10,2) NOT NULL,
  `room_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room_photo`
--

CREATE TABLE `room_photo` (
  `room_photo` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room_price`
--

CREATE TABLE `room_price` (
  `room_price_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `valid_from_date` date NOT NULL,
  `valid_to_date` date NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `room_type_id` int(11) NOT NULL,
  `room_type_name` varchar(255) NOT NULL,
  `room_type_desc` text NOT NULL,
  `room_type_capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`room_type_id`, `room_type_name`, `room_type_desc`, `room_type_capacity`) VALUES
(1, 'Double Room (Standard)', 'A basic room fit for two, with a double bed', 2),
(2, 'Family Room (Standard)', 'A room with a double bed and a pull-out bed', 4),
(3, 'Double Room (Sea View)', 'A room with a double bed and a view of the sea', 2),
(4, 'Family Room (Sea View)', 'A room with a double bed, pull out bed and a view of the sea', 4),
(5, 'Single Room', 'Just a single bed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `route_name` varchar(255) NOT NULL,
  `dep_airport` int(11) NOT NULL,
  `arr_airport` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `route_name`, `dep_airport`, `arr_airport`) VALUES
(1, 'Belfast to Barcelona', 1, 3),
(2, 'Belfast to New York', 1, 5),
(3, 'Belfast to Split', 1, 2),
(4, 'Belfast to Mallorca', 1, 4),
(5, 'Barcelona to Belfast', 3, 1),
(6, 'Barcelona to Mallorca', 3, 4),
(7, 'Split to Belfast', 2, 1),
(8, 'Split to New York', 2, 5),
(9, 'Mallorca to Barcelona', 4, 3),
(10, 'Mallorca to Belfast', 4, 1),
(11, 'New York to Belfast', 5, 1),
(12, 'New York to Split', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `star_rating`
--

CREATE TABLE `star_rating` (
  `star_rating_id` int(11) NOT NULL,
  `star_rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `star_rating`
--

INSERT INTO `star_rating` (`star_rating_id`, `star_rating`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `timezone`
--

CREATE TABLE `timezone` (
  `timezone_id` int(11) NOT NULL,
  `timezone_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timezone`
--

INSERT INTO `timezone` (`timezone_id`, `timezone_name`) VALUES
(1, 'UTC'),
(2, 'UTC+1'),
(3, 'UTC-5');

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

CREATE TABLE `title` (
  `title_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `title`
--

INSERT INTO `title` (`title_id`, `title`) VALUES
(1, 'Mr'),
(2, 'Mrs'),
(3, 'Miss'),
(4, 'Ms');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `FK_city_city_id` (`city_id`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`airport_id`),
  ADD KEY `FK_address_address_id` (`address_id`);

--
-- Indexes for table `attraction`
--
ALTER TABLE `attraction`
  ADD PRIMARY KEY (`attraction_id`),
  ADD KEY `FK_address_address_id_three` (`address_id`);

--
-- Indexes for table `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`board_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `FK_flight_flight_id_four` (`return_flight_id`),
  ADD KEY `FK_flight_flight_id_three` (`depart_flight_id`);

--
-- Indexes for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  ADD PRIMARY KEY (`booking_line_item_id`),
  ADD KEY `FK_booking_booking_id_two` (`booking_id`);

--
-- Indexes for table `card_type`
--
ALTER TABLE `card_type`
  ADD PRIMARY KEY (`card_type_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `FK_region_region_id` (`region_id`);

--
-- Indexes for table `contact_details`
--
ALTER TABLE `contact_details`
  ADD PRIMARY KEY (`contact_details_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `FK_title_title_id` (`title_id`),
  ADD KEY `FK_contact_details_contact_details_id` (`contact_details_id`),
  ADD KEY `FK_customer_type_customer_type_id_two` (`customer_type_id`),
  ADD KEY `FK_booking_booking_id` (`booking_id`),
  ADD KEY `FK_address_address_id_two` (`address_id`);

--
-- Indexes for table `customer_type`
--
ALTER TABLE `customer_type`
  ADD PRIMARY KEY (`customer_type_id`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`facility_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `FK_route_route_id` (`route_id`);

--
-- Indexes for table `flight_price`
--
ALTER TABLE `flight_price`
  ADD PRIMARY KEY (`flight_price_id`),
  ADD KEY `FK_flight_flight_id` (`flight_id`),
  ADD KEY `FK_customer_type_customer_type_id` (`customer_type_id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `FK_address_address_id_four` (`address_id`),
  ADD KEY `FK_star_rating_star_rating_id` (`star_rating_id`);

--
-- Indexes for table `hotel_attraction`
--
ALTER TABLE `hotel_attraction`
  ADD PRIMARY KEY (`hotel_attraction_id`),
  ADD KEY `FK_hotel_hotel_id` (`hotel_id`),
  ADD KEY `FK_attraction_attraction_id` (`attraction_id`);

--
-- Indexes for table `hotel_board`
--
ALTER TABLE `hotel_board`
  ADD PRIMARY KEY (`hotel_board_id`),
  ADD KEY `FK_hotel_hotel_id_two` (`hotel_id`),
  ADD KEY `FK_board_board_id` (`board_id`);

--
-- Indexes for table `hotel_facility`
--
ALTER TABLE `hotel_facility`
  ADD PRIMARY KEY (`hotel_facility`),
  ADD KEY `FK_facility_facility_id` (`facility_id`),
  ADD KEY `FK_hotel_hotel_id_three` (`hotel_id`);

--
-- Indexes for table `hotel_photo`
--
ALTER TABLE `hotel_photo`
  ADD PRIMARY KEY (`hotel_photo`),
  ADD KEY `FK_hotel_hotel_id_four` (`hotel_id`),
  ADD KEY `FK_photo_photo_id` (`photo_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `FK_booking_booking_id_three` (`booking_id`),
  ADD KEY `FK_card_type_card_type_id_two` (`card_type_id`);

--
-- Indexes for table `payment_card`
--
ALTER TABLE `payment_card`
  ADD PRIMARY KEY (`payment_card_id`),
  ADD KEY `FK_card_type_card_type_id` (`card_type_id`),
  ADD KEY `FK_customer_customer_id` (`customer_id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`);

--
-- Indexes for table `primary_lang`
--
ALTER TABLE `primary_lang`
  ADD PRIMARY KEY (`primary_lang_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`),
  ADD KEY `FK_primary_lang_primary_lang_id` (`primary_lang_id`),
  ADD KEY `FK_country_country_id` (`country_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `FK_hotel_hotel_id_five` (`hotel_id`),
  ADD KEY `FK_room_type_room_type_id` (`room_type_id`);

--
-- Indexes for table `room_booking`
--
ALTER TABLE `room_booking`
  ADD PRIMARY KEY (`room_booking_id`),
  ADD KEY `FK_room_room_id_four` (`room_id`),
  ADD KEY `FK_booking_booking_id_four` (`booking_id`);

--
-- Indexes for table `room_facility`
--
ALTER TABLE `room_facility`
  ADD PRIMARY KEY (`room_facility_id`),
  ADD KEY `FK_room_room_id_three` (`room_id`),
  ADD KEY `FK_facility_facility_id_two` (`facility_id`);

--
-- Indexes for table `room_photo`
--
ALTER TABLE `room_photo`
  ADD PRIMARY KEY (`room_photo`),
  ADD KEY `FK_photo_photo_id_two` (`photo_id`),
  ADD KEY `FK_room_room_id` (`room_id`);

--
-- Indexes for table `room_price`
--
ALTER TABLE `room_price`
  ADD PRIMARY KEY (`room_price_id`),
  ADD KEY `FK_room_room_id_two` (`room_id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`room_type_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `FK_airport_airport_id` (`dep_airport`),
  ADD KEY `FK_airport_airport_id_two` (`arr_airport`);

--
-- Indexes for table `star_rating`
--
ALTER TABLE `star_rating`
  ADD PRIMARY KEY (`star_rating_id`);

--
-- Indexes for table `timezone`
--
ALTER TABLE `timezone`
  ADD PRIMARY KEY (`timezone_id`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`title_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `airport`
--
ALTER TABLE `airport`
  MODIFY `airport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attraction`
--
ALTER TABLE `attraction`
  MODIFY `attraction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `board`
--
ALTER TABLE `board`
  MODIFY `board_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  MODIFY `booking_line_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card_type`
--
ALTER TABLE `card_type`
  MODIFY `card_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact_details`
--
ALTER TABLE `contact_details`
  MODIFY `contact_details_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_type`
--
ALTER TABLE `customer_type`
  MODIFY `customer_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `facility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight_price`
--
ALTER TABLE `flight_price`
  MODIFY `flight_price_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `hotel_attraction`
--
ALTER TABLE `hotel_attraction`
  MODIFY `hotel_attraction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel_board`
--
ALTER TABLE `hotel_board`
  MODIFY `hotel_board_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel_facility`
--
ALTER TABLE `hotel_facility`
  MODIFY `hotel_facility` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel_photo`
--
ALTER TABLE `hotel_photo`
  MODIFY `hotel_photo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_card`
--
ALTER TABLE `payment_card`
  MODIFY `payment_card_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `primary_lang`
--
ALTER TABLE `primary_lang`
  MODIFY `primary_lang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_booking`
--
ALTER TABLE `room_booking`
  MODIFY `room_booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_facility`
--
ALTER TABLE `room_facility`
  MODIFY `room_facility_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_photo`
--
ALTER TABLE `room_photo`
  MODIFY `room_photo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_price`
--
ALTER TABLE `room_price`
  MODIFY `room_price_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `room_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `star_rating`
--
ALTER TABLE `star_rating`
  MODIFY `star_rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `timezone`
--
ALTER TABLE `timezone`
  MODIFY `timezone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `title`
--
ALTER TABLE `title`
  MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_city_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- Constraints for table `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `FK_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `attraction`
--
ALTER TABLE `attraction`
  ADD CONSTRAINT `FK_address_address_id_three` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_flight_flight_id_four` FOREIGN KEY (`return_flight_id`) REFERENCES `flight` (`flight_id`),
  ADD CONSTRAINT `FK_flight_flight_id_three` FOREIGN KEY (`depart_flight_id`) REFERENCES `flight` (`flight_id`);

--
-- Constraints for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  ADD CONSTRAINT `FK_booking_booking_id_two` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_region_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_address_address_id_two` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `FK_booking_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `FK_contact_details_contact_details_id` FOREIGN KEY (`contact_details_id`) REFERENCES `contact_details` (`contact_details_id`),
  ADD CONSTRAINT `FK_customer_type_customer_type_id_two` FOREIGN KEY (`customer_type_id`) REFERENCES `customer_type` (`customer_type_id`),
  ADD CONSTRAINT `FK_title_title_id` FOREIGN KEY (`title_id`) REFERENCES `title` (`title_id`);

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `FK_route_route_id` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`);

--
-- Constraints for table `flight_price`
--
ALTER TABLE `flight_price`
  ADD CONSTRAINT `FK_customer_type_customer_type_id` FOREIGN KEY (`customer_type_id`) REFERENCES `customer_type` (`customer_type_id`),
  ADD CONSTRAINT `FK_flight_flight_id` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`);

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `FK_address_address_id_four` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `FK_star_rating_star_rating_id` FOREIGN KEY (`star_rating_id`) REFERENCES `star_rating` (`star_rating_id`);

--
-- Constraints for table `hotel_attraction`
--
ALTER TABLE `hotel_attraction`
  ADD CONSTRAINT `FK_attraction_attraction_id` FOREIGN KEY (`attraction_id`) REFERENCES `attraction` (`attraction_id`),
  ADD CONSTRAINT `FK_hotel_hotel_id` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);

--
-- Constraints for table `hotel_board`
--
ALTER TABLE `hotel_board`
  ADD CONSTRAINT `FK_board_board_id` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`),
  ADD CONSTRAINT `FK_hotel_hotel_id_two` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);

--
-- Constraints for table `hotel_facility`
--
ALTER TABLE `hotel_facility`
  ADD CONSTRAINT `FK_facility_facility_id` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`),
  ADD CONSTRAINT `FK_hotel_hotel_id_three` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);

--
-- Constraints for table `hotel_photo`
--
ALTER TABLE `hotel_photo`
  ADD CONSTRAINT `FK_hotel_hotel_id_four` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`),
  ADD CONSTRAINT `FK_photo_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_booking_booking_id_three` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `FK_card_type_card_type_id_two` FOREIGN KEY (`card_type_id`) REFERENCES `card_type` (`card_type_id`);

--
-- Constraints for table `payment_card`
--
ALTER TABLE `payment_card`
  ADD CONSTRAINT `FK_card_type_card_type_id` FOREIGN KEY (`card_type_id`) REFERENCES `card_type` (`card_type_id`),
  ADD CONSTRAINT `FK_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `FK_country_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  ADD CONSTRAINT `FK_primary_lang_primary_lang_id` FOREIGN KEY (`primary_lang_id`) REFERENCES `primary_lang` (`primary_lang_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `FK_hotel_hotel_id_five` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`),
  ADD CONSTRAINT `FK_room_type_room_type_id` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`room_type_id`);

--
-- Constraints for table `room_booking`
--
ALTER TABLE `room_booking`
  ADD CONSTRAINT `FK_booking_booking_id_four` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `FK_room_room_id_four` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `room_facility`
--
ALTER TABLE `room_facility`
  ADD CONSTRAINT `FK_facility_facility_id_two` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`),
  ADD CONSTRAINT `FK_room_room_id_three` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `room_photo`
--
ALTER TABLE `room_photo`
  ADD CONSTRAINT `FK_photo_photo_id_two` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`),
  ADD CONSTRAINT `FK_room_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `room_price`
--
ALTER TABLE `room_price`
  ADD CONSTRAINT `FK_room_room_id_two` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `FK_airport_airport_id` FOREIGN KEY (`dep_airport`) REFERENCES `airport` (`airport_id`),
  ADD CONSTRAINT `FK_airport_airport_id_two` FOREIGN KEY (`arr_airport`) REFERENCES `airport` (`airport_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
