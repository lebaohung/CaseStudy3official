create table branch (
  branchId int(10) not null auto_increment primary key,
  phone varchar(50) not null unique ,
  name varchar(100) not null ,
  address varchar(200) not null
);

INSERT INTO `case_M3`.`branch` (`name`, `phone`, `address`) VALUES ('Lẩu Phan Moncity', '09636465666', 'TT02 MonCity, ngõ 4 Hàm Nghi, Mỹ Đình 1, Cầu Giấy, Hà Nội');
INSERT INTO `case_M3`.`branch` (`name`, `phone`, `address`) VALUES ('Lẩu Phan Hải Phòng', '0983686878', 'SN21 LÔ 8A4 ĐƯỜNG LÊ HỒNG PHONG');
INSERT INTO `case_M3`.`branch` (`name`, `phone`, `address`) VALUES ('Lẩu Phan Phùng Khoang', '0167002589', '21/2 Ngõ 67 Phùng Khoang,Từ Liêm,Hà Nội');
INSERT INTO `case_M3`.`branch` (`name`, `phone`, `address`) VALUES ('Lẩu Phan Ðào Duy Anh', '19002808', 'Số 7 Ðào Duy Anh , Ðống Ða, Hà Nội');
INSERT INTO `case_M3`.`branch` (`name`, `phone`, `address`) VALUES ('Lẩu Phan Nguyễn Văn Cừ', '0127986996333', 'Số 485 Nguyễn Văn Cừ , Long Biên , Hà Nội');
