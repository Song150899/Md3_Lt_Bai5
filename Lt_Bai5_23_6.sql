create database TicketFilm;

create table tblPhong(
PhongID int auto_increment primary key,
Ten_phong varchar(50),
Trang_thai varchar (50)
);

create table tblGhe(
GheID int auto_increment primary key,
PhongID int,
So_ghe varchar(10),
foreign key (PhongID) references tblPhong (PhongID)
);

create table tblVe(
PhimId int ,
GheID int,
Ngay_chieu datetime,
Trang_thai varchar(20),
primary key ( GheID,PhimId),
foreign key (GheID) references tblghe(GheID),
foreign key (PhimId) references tblPhim(PhimId)
);

create table tblPhim(
PhimId int auto_increment primary key,
Ten_phim varchar (30),
Loai_phim varchar(25),
Thoi_gian varchar(15)
);

INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheID`, `Ngay_chieu`, `Trang_thai`) VALUES ('1', '1', '2008-10-20', 'Đã bán');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheID`, `Ngay_chieu`, `Trang_thai`) VALUES ('1', '3', '2008-11-20', 'Đã bán');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheID`, `Ngay_chieu`, `Trang_thai`) VALUES ('1', '4', '2008-12-23', 'Đã bán');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheID`, `Ngay_chieu`, `Trang_thai`) VALUES ('2', '1', '2009-2-14', 'Đã bán');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheID`, `Ngay_chieu`, `Trang_thai`) VALUES ('3', '1', '2009-2-14', 'Đã bán');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheID`, `Ngay_chieu`, `Trang_thai`) VALUES ('2', '5', '2009-8-3', 'Chưa bán');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheID`, `Ngay_chieu`, `Trang_thai`) VALUES ('2', '3', '2009-8-3', 'Chưa bán');

-- 2.Hiển thị danh sách các phim (chú ý: danh sách phải được sắp xếp theo trường Thoi_gian)	
select*
from tblphim order by Thoi_gian desc;

-- 3. Hiển thị Ten_phim có thời gian chiếu dài nhất

select Ten_phim, max(Thoi_gian)
from tblphim ;

-- 4. Hiển thị Ten_Phim có thời gian chiếu ngắn nhất
select Ten_phim , min(Thoi_gian)
from tblphim;

-- 5. Hiển thị danh sách So_Ghe mà bắt đầu bằng chữ ‘A’
select So_ghe
from tblghe where So_ghe like 'A%' order by So_ghe;
-- 6.Sửa cột Trang_thai của bảng tblPhong sang kiểu nvarchar(25)			
alter table tblPhong change column Trang_thai status nvarchar(25);

-- 7. Cập nhật giá trị cột Trang_thai của bảng tblPhong theo các luật sau:			
-- Nếu Trang_thai=0 thì gán Trang_thai=’Đang sửa’
-- Nếu Trang_thai=1 thì gán Trang_thai=’Đang sử dụng’
-- Nếu Trang_thai=null thì gán Trang_thai=’Unknow’
-- Sau đó hiển thị bảng tblPhong 
update tblPhong 
set Trang_thai = if( Trang_thai = 0,'Đang Sửa',if(Trang_thai = 1,'Đang sử dụng', 'unknow')) where PhongId>0;

-- 8.Hiển thị danh sách tên phim mà  có độ dài >15 và < 25 ký tự 			
select * from tblphim where length(tblPhim.ten_phim) between 15 and 25;

-- 9. Hiển thị Ten_Phong và Trang_Thai trong bảng tblPhong  trong 1 cột với tiêu đề ‘Trạng thái phòng chiếu
select(concat(tblphong.ten_phong, ' - ', tblphong.status))as 'Trạng thái phòng chiếu'  from tblphong;

-- 10. Tạo bảng mới có tên tblRank với các cột sau: STT(thứ hạng sắp xếp theo Ten_Phim), TenPhim, Thoi_gian
create table tblRank(
select Ten_phim , Thoi_gian from tblphim order by ten_Phim);

-- 11. Trong bảng tblPhim :
-- Thêm trường Mo_ta kiểu nvarchar(max)						
-- Cập nhật trường Mo_ta: thêm chuỗi “Đây là bộ phim thể loại  ” + nội dung trường LoaiPhim										
-- Hiển thị bảng tblPhim sau khi cập nhật				
-- Cập nhật trường Mo_ta: thay chuỗi “bộ phim” thành chuỗi “film”
-- Hiển thị bảng tblPhim sau khi cập nhật	
alter table tblphim add column Mota nvarchar(255);
update tblphim set Mota = (concat ('Đây là một bộ phim thể loại ',loai_phim)) where phimid>0;
select * from tblphim;

update tblphim set Mota = (concat ('Đây là phim thể loại ',loai_phim)) where phimid>0;
select * from tblphim;

-- 12 .Xóa tất cả các khóa ngoại trong các bảng trên.						
alter table tblGhe
drop foreign key tblghe_ibfk_1;

alter table tblVe
drop foreign key tblve_ibfk_1;

alter table tblVe
drop foreign key tblve_ibfk_2;


-- 13. Xóa dữ liệu ở bảng tblGhe
delete from tblGhe;

-- 14.   Hiển thị ngày giờ hiện tại và ngày giờ hiện tại cộng thêm 5000 phút
Select ADDTIME(CURRENT_TIME(), getTime() );


