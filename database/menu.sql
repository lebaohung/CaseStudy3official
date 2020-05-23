create table menu (
    menuId int(11) not null auto_increment primary key,
    name varchar(60) not null ,
    price varchar(10) not null ,
    descr text not null ,
    image varchar(150) not null ,
    kind varchar (10) not null
);

insert into menu ()
values (1, 'Combo 99', '99.000đ', 'Chỉ với 99k bạn được đánh chén một bữa lẩu no nê, ngập mặt Bò Úc, và tất nhiên, không chỉ ngập mặt Bò Úc đâu, bạn sẽ được đắm chìm trong các món ăn kèm như: Bánh bao chiên, Váng đậu, Quẩy, Rau, Đậu hũ, Gáy heo Hàn Quốc. Và đương nhiên, không thể thiếu trong các bữa lẩu đó là mì tôm.', '/images/combo99.jpg', 'combo');
insert into menu ()
values (2, 'Combo 129', '129.000đ', 'Chính thức ngập mặt Thịt Bò khi set 129k bao gồm 8 món cũ trong set 99k và update thêm 8 món mới cực kì hấp dẫn: “Bò Popcorn” rất ngon lại rất lạ,  “Thịt bắp bò, Gầu Bò, Gân bò” cực kì thơm ngon khó cưỡng, “Quẩy hải sản sốt trứng", ăn miễn chê, “Salad rong biển trứng của" cực đỉnh, “Khoai Lang Kén" không kém phần hấp dẫn. Và không thể thiếu HOT TREND của mùa hè đó là “Chè Dừa Dầm”', '/images/combo129.jpg', 'combo');
insert into menu ()
values (3, 'Combo 199', '199.000đ', 'Nào là ghẹ farci ngọt nước đậm đà, Tôm lớt vỏ mỏng tang, thịt sần sật cắn ngập răng, Cá trắm fillet giữ nguyên vị tươi ngọt, Đặc biệt là món Mực trứng và râu mực bùi béo hấp dẫn, Còn cả đậu hũ phomai thanh cua, chả cả ăn thật đã mới thôi ', '/images/combo199.jpg', 'combo');
insert into menu ()
values (4, 'Bắp bò Úc', '49.000đ', 'Có vị đậm đà bởi những đường gân đan xen, thớ thịt nhỏ mịn, săn chắc tại nên một hương vị tuyệt hảo khi nhúng lẩu.', '/images/bapbo.png', 'food');
insert into menu ()
values (5, 'Gân bò Úc', '39.000đ', 'Giòn và một chút dai, khi nhúng lẩu lại mang hương vị mềm đặc biệt.', '/images/gaubo.png', 'food');
insert into menu ()
values (6, 'Khoai', '19.000đ', 'Vị khoai hấp dẫn', '/images/khoaimon.png', 'food');
insert into menu ()
values (7, 'Tháp Pepsi tươi', '9.000đ','Uống thả ga không giới hạn', '/images/pepsi.png', 'drink');
insert into menu ()
values (8, 'Rượu Soju', '89.000đ', 'Chạm vào Soju đánh bay cơn khát', '/images/soju.png', 'drink');
insert into menu ()
values (9, 'Bia Saigon', '30.000đ', 'Nhậu hết nấc không lo về giá', 'images/bia.png', 'drink');