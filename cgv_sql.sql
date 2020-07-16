
-- DCL

use cgv;
commit;
rollback;

-- DDL

DROP TABLE `member`;
DROP TABLE `auth`;
DROP TABLE `rememberMe`;
DROP TABLE `movieInfo`;
DROP TABLE `movieImage`;
DROP TABLE `movieVideo`;
DROP TABLE `review`;
DROP TABLE `cinema`;
DROP TABLE `theater`;
DROP TABLE `movieTime`;
DROP TABLE `movieAndCinema`;
DROP TABLE `movieAndTheater`;
DROP TABLE `payment`;
DROP TABLE `seat`;
DROP TABLE `seatSpace`;
DROP TABLE `seatBooking`;
DROP TABLE `point`;
DROP TABLE `checkLike`;
DROP TABLE `event`;
DROP TABLE `eventImage`;
DROP TABLE `couponInfo`;
DROP TABLE `memberCoupon`;
DROP TABLE `pointHistory`;
DROP TABLE `guest`;

CREATE TABLE `member` (
  `username` varchar(50),
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `birth` varchar(10) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `nick` varchar(20) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `enabled` int(11) default 1,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `auth` (
  `username` varchar(50),
  `auth` varchar(50) DEFAULT NULL,
  KEY `AUTH_USERNAMENUM_FK_idx` (`username`),
  CONSTRAINT `AUTH_USERNAME_FK` FOREIGN KEY (`username`) REFERENCES `member` (`username`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `rememberMe` (
	`series` varchar(64) not null,
    `username` varchar(64) not null,
    `token` varchar(64) not null,
    `last_used` timestamp not null,
    PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `movieInfo` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `titleEng` varchar(50) DEFAULT NULL,
  `runtime` varchar(4) DEFAULT NULL,
  `director` varchar(20) DEFAULT NULL,
  `actor` varchar(255) DEFAULT NULL,
  `ganre` varchar(255) DEFAULT NULL,
  `ageLimit` varchar(5) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `openDate` date DEFAULT NULL,
  `contents` longtext,
  `visitor` int(11) DEFAULT NULL,
  `rate` double(4,1) DEFAULT NULL,
  `errRate` double(4,1) DEFAULT NULL,
  `createAt` date DEFAULT NULL,
  `deleteAt` date DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `movieImage` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `movieNum` int(11) DEFAULT NULL,
  `fileName` varchar(200) DEFAULT NULL,
  `originName` varchar(200) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `MOVIEIMAGE_MOVIENUM_FK_idx` (`movieNum`),
  CONSTRAINT `MOVIEIMAGE_MOVIENUM_FK` FOREIGN KEY (`movieNum`) REFERENCES `movieInfo` (`num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `movieVideo` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `movieImageNum` int(11) DEFAULT NULL,
  `videolink` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `MOVIEVIDEO_MOVIEIMAGENUM_FK_idx` (`movieImageNum`),
  CONSTRAINT `MOVIEVIDEO_MOVIEIMAGENUM_FK` FOREIGN KEY (`movieImageNum`) REFERENCES `movieImage` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `review` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `reservationNum` int(11) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `like1` int(11) DEFAULT NULL,
  `egg` tinyint(1) DEFAULT NULL,
  `charmPoint` tinyint(4) DEFAULT NULL,
  `emotionPoint` tinyint(4) DEFAULT NULL,
  `createAt` date DEFAULT NULL,
  `deleteAt` date DEFAULT NULL,
  `spoiler` int(11) DEFAULT NULL,
  `swearword` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `REVIEW_RESERVATIONNUM_FK_idx` (`reservationNum`),
  CONSTRAINT `REVIEW_RESERVATIONNUM_FK` FOREIGN KEY (`reservationNum`) REFERENCES `reservation` (`num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cinema` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `local` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(13) DEFAULT NULL,
  `totalTheater` int(11) DEFAULT NULL,
  `totalSeat` int(11) DEFAULT NULL,
  `trafficInfo` longtext,
  `parkingInfo` longtext,
  `intro` longtext,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `theater` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `cinemaNum` int(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `seatCount` int(11) DEFAULT NULL,
  `filmType` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `THEATER_CINEMANUM_FK_idx` (`cinemaNum`),
  CONSTRAINT `THEATER_CINEMANUM_FK` FOREIGN KEY (`cinemaNum`) REFERENCES `cinema` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `movieAndCinema` (
  `movieNum` int(11) DEFAULT NULL,
  `cinemaNum` int(11) DEFAULT NULL,
  `screenable` tinyint(1) DEFAULT NULL,
  KEY `MOVIEANDCINEMA_MOVIENUM_FK_idx` (`movieNum`),
  KEY `MOVIEANDCINEMA_CINEMANUM_FK_idx` (`cinemaNum`),
  CONSTRAINT `MOVIEANDCINEMA_CINEMANUM_FK` FOREIGN KEY (`cinemaNum`) REFERENCES `cinema` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `MOVIEANDCINEMA_MOVIENUM_FK` FOREIGN KEY (`movieNum`) REFERENCES `movieInfo` (`num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `movieAndTheater` (
  `movieNum` int(11) DEFAULT NULL,
  `theaterNum` int(11) DEFAULT NULL,
  KEY `MOVIEANDTHEATER_MOVIENUM_FK_idx` (`movieNum`),
  KEY `MOVIEANDTHEATER_THEATERNUM_FK_idx` (`theaterNum`),
  CONSTRAINT `MOVIEANDTHEATER_MOVIENUM_FK` FOREIGN KEY (`movieNum`) REFERENCES `movieInfo` (`num`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `MOVIEANDTHEATER_THEATERNUM_FK` FOREIGN KEY (`theaterNum`) REFERENCES `theater` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `movieTime` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `movieNum` int(11) DEFAULT NULL,
  `theaterNum` int(11) DEFAULT NULL,
  `screenDate` date DEFAULT NULL,
  `screenTime` varchar(5) DEFAULT NULL,
  `remainSeat` int(11) DEFAULT NULL,
  `selectedFirm` int(11) DEFAULT NULL,
  `deleteAt` date DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `MOVIETIME_MOVIENUM_FK_idx` (`movieNum`),
  KEY `MOVIETIME_THEATERNUM_FK_idx` (`theaterNum`),
  CONSTRAINT `MOVIETIME_MOVIENUM_FK` FOREIGN KEY (`movieNum`) REFERENCES `movieInfo` (`num`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `MOVIETIME_THEATERNUM_FK` FOREIGN KEY (`theaterNum`) REFERENCES `theater` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `seat` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `theaterNum` int(11) DEFAULT NULL,
  `rowIdx` varchar(2) DEFAULT NULL,
  `colIdx` int(11) DEFAULT NULL,
  `grade` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `SEAT_THEATERNUM_FK_idx` (`theaterNum`),
  CONSTRAINT `SEAT_THEATERNUM_FK` FOREIGN KEY (`theaterNum`) REFERENCES `theater` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `payment` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `imp_uid` varchar(50) DEFAULT NULL,
  `merchant_uid` varchar(50) DEFAULT NULL,
  `pg` varchar(50) DEFAULT NULL,
  `pay_method` varchar(50) DEFAULT NULL,
  `apply_num` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `reservation` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `movieNum` int(11) DEFAULT NULL,
  `paymentNum` int(11) DEFAULT NULL,
  `movieTimeNum` int(11) DEFAULT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `filmType` int(11) DEFAULT NULL,
  `cinemaName` varchar(10) DEFAULT NULL,
  `theaterName` varchar(10) DEFAULT NULL,
  `seats` varchar(24) DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `common` int(11) DEFAULT NULL,
  `teenager` int(11) DEFAULT NULL,
  `preference` int(11) DEFAULT NULL,
  `createAt` DATE DEFAULT NULL,
  `deleteAt` DATE DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `RESERVATION_MOVIENUM_FK_idx` (`movieNum`),
  CONSTRAINT `RESERVATION_MOVIENUM_FK` FOREIGN KEY (`movieNum`) REFERENCES `movieInfo` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `RESERVATION_PAYMENYNUM_FK_idx` (`paymentNum`),
  CONSTRAINT `RESERVATION_PAYMENYNUM_FK` FOREIGN KEY (`paymentNum`) REFERENCES `payment` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `RESERVATION_MOVIETIMENUM_FK_idx` (`movieTimeNum`),
  CONSTRAINT `RESERVATION_MOVIETIMENUM_FK` FOREIGN KEY (`movieTimeNum`) REFERENCES `movieTime` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `seatSpace` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `theaterNum` int(11) DEFAULT NULL,
  `rowOrCol` tinyint(1) DEFAULT NULL,	-- 0 : row or 1 : col
  `index` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `SEATSPACE_SEATNUM_FK_idx` (`theaterNum`),
  CONSTRAINT `SEATSPACE_SEATNUM_FK` FOREIGN KEY (`theaterNum`) REFERENCES `theater` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `seatBooking` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `seatNum` int(11) DEFAULT NULL,
  `movieTimeNum` int(11) DEFAULT NULL,
  `reservationNum` int(11) DEFAULT NULL,		-- ref 해제, 좌석 사용 불가의 경우 0 값으로 채워주기위해
  PRIMARY KEY (`num`),
  KEY `SEATBOOKING_SEATNUM_FK_idx` (`seatNum`),
  KEY `SEATBOOKING_MOVIETIMENUM_FK_idx` (`movieTimeNum`),
  CONSTRAINT `SEATBOOKING_SEATNUM_FK` FOREIGN KEY (`seatNum`) REFERENCES `seat` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `SEATBOOKING_MOVIETIMENUM_FK` FOREIGN KEY (`movieTimeNum`) REFERENCES `movieTime` (`num`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `point` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `memberNum` VARCHAR(50) NULL,
  `price` INT NULL,
  `type` VARCHAR(20) NULL,
  PRIMARY KEY (`num`),
  INDEX `point_memberNum_FK_idx` (`memberNum` ASC) VISIBLE,
  CONSTRAINT `point_memberNum_FK` FOREIGN KEY (`memberNum`) REFERENCES `cgv`.`member` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `checkLike` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `reviewNum` int(11) DEFAULT NULL,
  `uid` VARCHAR(45) DEFAULT NULL,
  `movieNum` int(11) DEFAULT NULL,
  `check1` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `event` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `kind` VARCHAR(50) NULL,
  `title` VARCHAR(50) NULL,
  `contents` VARCHAR(200) NULL,
  `startDate` Date NULL,
  `endDate` Date NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `eventImage` (
  `num` int NOT NULL AUTO_INCREMENT,
  `eventNum` int DEFAULT NULL,
  `fileName` varchar(200) DEFAULT NULL,
  `originName` varchar(200) DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `eventImage_eventNum_FK_idx` (`eventNum`),
  CONSTRAINT `eventImage_eventNum_FK` FOREIGN KEY (`eventNum`) REFERENCES `event` (`num`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `couponInfo` (
  `num` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `serialNum` varchar(32) DEFAULT NULL,
  `pwd` varchar(10) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `sIssuance` date DEFAULT NULL,
  `eIssuance` date DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `memberCoupon` (
  `num` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL,
  `couponInfoNum` int DEFAULT NULL,
  `deleteAt` DATE DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `MEMBERCOUPON_COUPONINFONUM_FK_IDX` (`couponInfoNum`),
  KEY `MEMBERCOUPON_UID_FK_IDX` (`uid`),
  CONSTRAINT `MEMBERCOUPON_COUPONINFONUM_FK` FOREIGN KEY (`couponInfoNum`) REFERENCES `couponInfo` (`num`) ON DELETE CASCADE,
  CONSTRAINT `MEMBERCOUPON_UID_FK` FOREIGN KEY (`uid`) REFERENCES `member` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pointHistory` (
  `num` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `inputPrice` int DEFAULT NULL,
  `outputPrice` int DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `createAt` date DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `POINTHISTORY_USERNAME_FK_idx` (`username`),
  CONSTRAINT `POINTHISTORY_USERNAME_FK` FOREIGN KEY (`username`) REFERENCES `member` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guest` (
  `reservationNum` int DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  KEY `guest_reservationNum_FK_idx` (`reservationNum`),
  CONSTRAINT `guest_reservationNum_FK` FOREIGN KEY (`reservationNum`) REFERENCES `reservation` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- procedule
delimiter //
DROP PROCEDURE IF EXISTS seatBookingFindOrInsert; 
CREATE PROCEDURE seatBookingFindOrInsert( 
	IN inMovieTimeNum INT
)
BEGIN
	DECLARE i INT;
	DECLARE selectedTheaterNum INT;
    DECLARE countSeatBookingReservationZero INT DEFAULT (SELECT COUNT(DISTINCT movieTimeNum) FROM seatBooking WHERE reservationNum = 0);
   
    SELECT theaterNum FROM movieTime WHERE num = 8;
END //

CALL insertSeatBookingByMovieTimeInsert(1);
