-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 07, 2023 lúc 03:58 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duan1_nhahang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking`
--

CREATE TABLE `booking` (
  `ID_Booking` int(10) NOT NULL,
  `ID_User` int(10) NOT NULL,
  `TableNumber` int(10) NOT NULL DEFAULT 0,
  `Seats` int(10) NOT NULL DEFAULT 0,
  `Image` varchar(200) NOT NULL,
  `Guests` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detailbooking`
--

CREATE TABLE `detailbooking` (
  `ID_DetailBooking` int(10) NOT NULL,
  `ID_Booking` int(10) NOT NULL,
  `ID_Food` int(10) NOT NULL,
  `NumberDishes` int(10) NOT NULL DEFAULT 0,
  `PriceDishes` double(10,3) NOT NULL DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `food`
--

CREATE TABLE `food` (
  `ID_Food` int(10) NOT NULL,
  `ID_TypeFood` int(10) NOT NULL,
  `FoodName` varchar(100) NOT NULL,
  `FoodPrice` double(10,3) NOT NULL DEFAULT 0.000,
  `FoodImage` varchar(200) NOT NULL,
  `Describe` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_food`
--

CREATE TABLE `type_food` (
  `ID_LoaiMonAn` int(10) NOT NULL,
  `TenLoai` varchar(100) NOT NULL,
  `HinhAnh` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `type_food`
--

INSERT INTO `type_food` (`ID_LoaiMonAn`, `TenLoai`, `HinhAnh`) VALUES
(1, 'Đồ Uống', ''),
(2, 'Khai Vị', ''),
(3, 'Món Chính', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `ID_User` int(10) NOT NULL,
  `FullName` varchar(200) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `PhoneNumber` int(10) NOT NULL DEFAULT 0,
  `Address` varchar(200) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`ID_Booking`),
  ADD KEY `fk_booking_user` (`ID_User`);

--
-- Chỉ mục cho bảng `detailbooking`
--
ALTER TABLE `detailbooking`
  ADD PRIMARY KEY (`ID_DetailBooking`),
  ADD KEY `fk_detailbooking_booking` (`ID_Booking`),
  ADD KEY `fk_detailbooking_food` (`ID_Food`);

--
-- Chỉ mục cho bảng `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`ID_Food`),
  ADD KEY `fk_monan_loaimonan` (`ID_TypeFood`);

--
-- Chỉ mục cho bảng `type_food`
--
ALTER TABLE `type_food`
  ADD PRIMARY KEY (`ID_LoaiMonAn`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_User`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `booking`
--
ALTER TABLE `booking`
  MODIFY `ID_Booking` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `detailbooking`
--
ALTER TABLE `detailbooking`
  MODIFY `ID_DetailBooking` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `food`
--
ALTER TABLE `food`
  MODIFY `ID_Food` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `type_food`
--
ALTER TABLE `type_food`
  MODIFY `ID_LoaiMonAn` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `ID_User` int(10) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_booking_user` FOREIGN KEY (`ID_User`) REFERENCES `user` (`ID_User`);

--
-- Các ràng buộc cho bảng `detailbooking`
--
ALTER TABLE `detailbooking`
  ADD CONSTRAINT `fk_detailbooking_booking` FOREIGN KEY (`ID_Booking`) REFERENCES `booking` (`ID_Booking`),
  ADD CONSTRAINT `fk_detailbooking_food` FOREIGN KEY (`ID_Food`) REFERENCES `food` (`ID_Food`);

--
-- Các ràng buộc cho bảng `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `fk_monan_loaimonan` FOREIGN KEY (`ID_TypeFood`) REFERENCES `type_food` (`ID_LoaiMonAn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
