-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th12 27, 2018 lúc 10:00 AM
-- Phiên bản máy phục vụ: 10.1.37-MariaDB
-- Phiên bản PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `weather`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dict`
--

CREATE TABLE `dict` (
  `id` int(11) NOT NULL,
  `english` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vietnamese` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dict`
--

INSERT INTO `dict` (`id`, `english`, `vietnamese`) VALUES
(1, 'Cloudy', 'có mây'),
(2, 'Fog', 'sương mù'),
(3, 'Partly Cloudy', 'nhiều mây'),
(4, 'Rain', 'mưa'),
(5, 'AM Showers', 'Sáng mưa rào'),
(6, 'PM Showers', 'Chiều mưa rào'),
(7, 'Mostly Sunny', 'nắng ráo'),
(8, 'Sunny', 'nắng'),
(9, 'Mostly Clear', 'quang đãng'),
(10, 'Light Rain', 'mưa nhỏ'),
(11, 'AM Clouds/PM Sun', 'sáng mây chiều nắng'),
(12, 'Showers', 'Mưa rào'),
(13, 'mostly sunny', 'Phần lớn là nắng'),
(14, 'mostly cloudy', 'Chủ yếu là mây'),
(15, 'AM Thunderstorms', 'Ngày có dông'),
(16, 'AM Light Rain', 'sáng mưa nhỏ'),
(17, 'PM Light Rain', 'chiều mưa nhỏ'),
(18, 'Scattered Showers', 'Mưa rào rải rác'),
(19, 'Scattered Thunderstorms', 'Sấm chớp rải rác'),
(20, 'Scattered Thunderstorms', 'Sấm chớp rải rác');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `province`
--

CREATE TABLE `province` (
  `provinceid` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  `alias` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `province`
--

INSERT INTO `province` (`provinceid`, `name`, `type`, `alias`) VALUES
('01', 'Hà Nội', 'Thành Phố', 'ha_noi'),
('02', 'Hà Giang', 'Tỉnh', 'ha_giang'),
('04', 'Cao Bằng', 'Tỉnh', 'cao_bang'),
('06', 'Bắc Kạn', 'Tỉnh', 'bac_kan'),
('08', 'Tuyên Quang', 'Tỉnh', 'tuyen_quang'),
('10', 'Lào Cai', 'Tỉnh', 'lao_cai'),
('100', 'Đông Hà', 'Thành Phố', 'dong_ha'),
('11', 'Điện Biên', 'Tỉnh', 'dien_bien'),
('12', 'Lai Châu', 'Tỉnh', 'lai_chau'),
('14', 'Sơn La', 'Tỉnh', 'son_la'),
('15', 'Yên Bái', 'Tỉnh', 'yen_bai'),
('17', 'Hòa Bình', 'Tỉnh', 'hoa_binh'),
('19', 'Thái Nguyên', 'Tỉnh', 'thai_nguyen'),
('20', 'Lạng Sơn', 'Tỉnh', 'lang_son'),
('22', 'Quảng Ninh', 'Tỉnh', 'quang_ninh'),
('24', 'Bắc Giang', 'Tỉnh', 'bac_giang'),
('25', 'Phú Thọ', 'Tỉnh', 'phu_tho'),
('26', 'Vĩnh Phúc', 'Tỉnh', 'vinh_phuc'),
('27', 'Bắc Ninh', 'Tỉnh', 'bac_ninh'),
('30', 'Hải Dương', 'Tỉnh', 'hai_duong'),
('31', 'Hải Phòng', 'Thành Phố', 'hai_phong'),
('33', 'Hưng Yên', 'Tỉnh', 'hung_yen'),
('34', 'Thái Bình', 'Tỉnh', 'thai_binh'),
('35', 'Hà Nam', 'Tỉnh', 'ha_nam'),
('36', 'Nam Định', 'Tỉnh', 'nam_dinh'),
('37', 'Ninh Bình', 'Tỉnh', 'ninh_binh'),
('38', 'Thanh Hóa', 'Tỉnh', 'thanh_hoa'),
('40', 'Nghệ An', 'Tỉnh', 'nghe_an'),
('42', 'Hà Tĩnh', 'Tỉnh', 'ha_tinh'),
('44', 'Quảng Bình', 'Tỉnh', 'kwang_binh'),
('45', 'Quảng Trị', 'Tỉnh', 'quang_tri'),
('46', 'Thừa Thiên Huế', 'Tỉnh', 'thua_thien_hue'),
('48', 'Đà Nẵng', 'Thành Phố', 'da_nang'),
('49', 'Quảng Nam', 'Tỉnh', 'quang_nam'),
('51', 'Quảng Ngãi', 'Tỉnh', 'quang_ngai'),
('52', 'Bình Định', 'Tỉnh', 'binh_dinh'),
('54', 'Phú Yên', 'Tỉnh', 'phu_yen'),
('56', 'Khánh Hòa', 'Tỉnh', 'khanh_hoa'),
('58', 'Ninh Thuận', 'Tỉnh', 'ninh_thuan'),
('60', 'Bình Thuận', 'Tỉnh', 'binh_thuan'),
('62', 'Kon Tum', 'Tỉnh', 'kon_tum'),
('64', 'Gia Lai', 'Tỉnh', 'gia_lai'),
('66', 'Đắk Lắk', 'Tỉnh', 'dak_lak'),
('67', 'Đắk Nông', 'Tỉnh', 'dak_nong'),
('68', 'Lâm Đồng', 'Tỉnh', 'lam_dong'),
('70', 'Bình Phước', 'Tỉnh', 'binh_phuoc'),
('72', 'Tây Ninh', 'Tỉnh', 'tay_ninh'),
('74', 'Bình Dương', 'Tỉnh', 'binh_duong'),
('75', 'Đồng Nai', 'Tỉnh', 'dong_nai'),
('77', 'Vũng Tàu', 'Tỉnh', 'vung_tau'),
('79', 'Hồ Chí Minh', 'Thành Phố', 'ho_chi_minh'),
('80', 'Long An', 'Tỉnh', 'long_an'),
('82', 'Tiền Giang', 'Tỉnh', 'tien_giang'),
('83', 'Bến Tre', 'Tỉnh', 'ben_tre'),
('84', 'Trà Vinh', 'Tỉnh', 'tra_vinh'),
('86', 'Vĩnh Long', 'Tỉnh', 'vinh_long'),
('87', 'Đồng Tháp', 'Tỉnh', 'dong_thap'),
('89', 'An Giang', 'Tỉnh', 'an_giang'),
('91', 'Kiên Giang', 'Tỉnh', 'kien_giang'),
('92', 'Cần Thơ', 'Thành Phố', 'can_tho'),
('93', 'Hậu Giang', 'Tỉnh', 'hau_giang'),
('94', 'Sóc Trăng', 'Tỉnh', 'soc_trang'),
('95', 'Bạc Liêu', 'Tỉnh', 'bac_lieu'),
('96', 'Cà Mau', 'Tỉnh', 'ca_mau'),
('97', 'Huế', 'Thành Phố', 'hue'),
('98', 'Vũng Tàu', 'Thành Phố', 'vung_tau'),
('99', 'Đà Lạt', 'Thành Phố', 'da_lat');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `weather`
--

CREATE TABLE `weather` (
  `id` int(11) NOT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngay` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `temperature` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `weather` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `dict`
--
ALTER TABLE `dict`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`provinceid`);

--
-- Chỉ mục cho bảng `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `dict`
--
ALTER TABLE `dict`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `weather`
--
ALTER TABLE `weather`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22006;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
