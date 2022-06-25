CREATE DATABASE QLBH;

-- KHACHANG
CREATE TABLE KHACHHANG(
	MAKH	char(4) not null,	
	HOTEN	varchar(40),
	DCHI	varchar(50),
	SODT	varchar(20),
	NGSINH	datetime,
	NGDK	datetime,
	DOANHSO	double,
	constraint pk_kh primary key(MAKH)
);
---------------------------------------------
-- NHANVIEN
CREATE TABLE NHANVIEN(
	MANV	char(4) not null,	
	HOTEN	varchar(40),
	SODT	varchar(20),
	NGVL	datetime	,
	constraint pk_nv primary key(MANV)
);
---------------------------------------------
-- SANPHAM
CREATE TABLE SANPHAM(
	MASP	char(4) not null,
	TENSP	varchar(40),
	DVT	varchar(20),
	NUOCSX	varchar(40),
	GIA	double,
	constraint pk_sp primary key(MASP)	
);
---------------------------------------------
-- HOADON
CREATE TABLE HOADON(
	SOHD	int not null,
	NGHD 	datetime,
	MAKH 	char(4),
	MANV 	char(4),
	TRIGIA	double,
	constraint pk_hd primary key(SOHD)
);
---------------------------------------------
-- CTHD
   CREATE TABLE CTHD(
	SOHD	int,
	MASP	char(4),
	SL	int,
	constraint pk_cthd primary key(SOHD,MASP)
);

-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH);
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV);
-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD);
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP);
-----------------------------------------------------
-----------------------------------------------------
-- set dateformat dmy;
-------------------------------
-- KHACHHANG
insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','1960-10-22','2006-7-22',13060000);
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','1974-4-3','2006-7-30',280000);
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','1980-6-12','2006-5-8',3860000);
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','1965-3-9','2006-2-10',250000);
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','1950-3-10','2006-10-28',21000);
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','1981-12-31','2006-11-24',915000);
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','1971-4-6','2006-1-12',12500);


-------------------------------
-- NHANVIEN
insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','2006-4-13');
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','2006-4-21');
insert into nhanvien values('NV03','Nguyen Van B','997047382','2006-4-27');
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','2006-6-24');

-------------------------------
-- SANPHAM
insert into sanpham values('BC01','But chi','cay','Singapore',3000);
insert into sanpham values('BC02','But chi','cay','Singapore',5000);
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500);
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000);
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000);
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000);
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000);
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500);
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500);
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000);
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500);
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000);
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000);
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000);
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000);
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000);
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000);
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000);
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000);
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000);
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000);
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000);
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000);

-------------------------------
-- HOADON
insert into hoadon values(1001,'2006-7-23','KH01','NV01',320000);
insert into hoadon values(1002,'2006-8-12','KH01','NV02',840000);
insert into hoadon values(1003,'2006-8-23','KH02','NV01',100000);
insert into hoadon values(1004,'2006-9-1','KH02','NV01',180000);
insert into hoadon values(1005,'2006-10-20','KH01','NV02',3800000);
insert into hoadon values(1006,'2006-10-16','KH01','NV03',2430000);
insert into hoadon values(1007,'2006-10-28','KH03','NV03',510000);
insert into hoadon values(1008,'2006-10-28','KH01','NV03',440000);
insert into hoadon values(1009,'2006-10-28','KH03','NV04',200000);
insert into hoadon values(1010,'2006-11-1','KH01','NV01',5200000);
insert into hoadon values(1011,'2006-11-4','KH04','NV03',250000);
insert into hoadon values(1012,'2006-11-30','KH05','NV03',21000);
insert into hoadon values(1013,'2006-12-12','KH06','NV01',5000);
insert into hoadon values(1014,'2006-12-31','KH03','NV02',3150000);
insert into hoadon values(1015,'2007-1-1','KH06','NV01',910000);
insert into hoadon values(1016,'2007-1-1','KH07','NV02',12500);
insert into hoadon values(1017,'2007-1-2','KH08','NV03',35000);
insert into hoadon values(1018,'2007-1-13','KH08','NV03',330000);
insert into hoadon values(1019,'2007-1-13','KH01','NV03',30000);
insert into hoadon values(1020,'2007-1-14','KH09','NV04',70000);
insert into hoadon values(1021,'2007-1-16','KH10','NV03',67500);
insert into hoadon values(1022,'2007-1-16',Null,'NV03',7000);
insert into hoadon values(1023,'2007-1-17',Null,'NV01',330000);

-------------------------------
-- CTHD
insert into cthd values(1001,'TV02',10);
insert into cthd values(1001,'ST01',5);
insert into cthd values(1001,'BC01',5);
insert into cthd values(1001,'BC02',10);
insert into cthd values(1001,'ST08',10);
insert into cthd values(1002,'BC04',20);
insert into cthd values(1002,'BB01',20);
insert into cthd values(1002,'BB02',20);
insert into cthd values(1003,'BB03',10);
insert into cthd values(1004,'TV01',20);
insert into cthd values(1004,'TV02',10);
insert into cthd values(1004,'TV03',10);
insert into cthd values(1004,'TV04',10);
insert into cthd values(1005,'TV05',50);
insert into cthd values(1005,'TV06',50);
insert into cthd values(1006,'TV07',20);
insert into cthd values(1006,'ST01',30);
insert into cthd values(1006,'ST02',10);
insert into cthd values(1007,'ST03',10);
insert into cthd values(1008,'ST04',8);
insert into cthd values(1009,'ST05',10);
insert into cthd values(1010,'TV07',50);
insert into cthd values(1010,'ST07',50);
insert into cthd values(1010,'ST08',100);
insert into cthd values(1010,'ST04',50);
insert into cthd values(1010,'TV03',100);
insert into cthd values(1011,'ST06',50);
insert into cthd values(1012,'ST07',3);
insert into cthd values(1013,'ST08',5);
insert into cthd values(1014,'BC02',80);
insert into cthd values(1014,'BB02',100);
insert into cthd values(1014,'BC04',60);
insert into cthd values(1014,'BB01',50);
insert into cthd values(1015,'BB02',30);
insert into cthd values(1015,'BB03',7);
insert into cthd values(1016,'TV01',5);
insert into cthd values(1017,'TV02',1);
insert into cthd values(1017,'TV03',1);
insert into cthd values(1017,'TV04',5);
insert into cthd values(1018,'ST04',6);
insert into cthd values(1019,'ST05',1);
insert into cthd values(1019,'ST06',2);
insert into cthd values(1020,'ST07',10);
insert into cthd values(1021,'ST08',5);
insert into cthd values(1021,'TV01',7);
insert into cthd values(1021,'TV02',10);
insert into cthd values(1022,'ST07',1);
insert into cthd values(1023,'ST04',6);
-- ----------------------------------------------------------------
-- ----------------------------------------------------------------
-- 1.Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT MASP)
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE YEAR(NGHD) = 2006;

-- 2.Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(TRIGIA) AS MAX, MIN(TRIGIA) AS MIN
FROM HOADON;

-- 3.Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA) TB
FROM HOADON;

-- 4. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006;
-- 5.Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD
FROM HOADON
WHERE TRIGIA = (SELECT MAX(TRIGIA)
FROM HOADON);

-- 6.Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT HOTEN
FROM KHACHHANG K INNER JOIN HOADON H
ON K.MAKH = H.MAKH 
AND SOHD = (SELECT SOHD
			FROM HOADON
			WHERE TRIGIA = (SELECT MAX(TRIGIA)
							FROM HOADON));
-- 7.In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
SELECT  MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC
LIMIT 3;

-- 8.In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN (SELECT DISTINCT  GIA
			  FROM SANPHAM
			  ORDER BY GIA DESC)
              LIMIT 3;
              
-- 9.In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'THAI LAN' AND GIA IN (SELECT DISTINCT  GIA
FROM SANPHAM
ORDER BY GIA DESC)
LIMIT 3;
-- 10. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC' AND GIA IN (SELECT DISTINCT  GIA
FROM SANPHAM
ORDER BY GIA DESC)
LIMIT 3;

-- 11.* In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
SELECT  MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC
LIMIT 3;

-- 12. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT COUNT(DISTINCT MASP)
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC';

-- 13.Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(DISTINCT MASP) AS TONGSOSANPHAM
FROM SANPHAM
GROUP BY NUOCSX;

-- 14. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT NUOCSX, MAX(GIA) AS MAX, MIN(GIA) AS MIN, AVG(GIA) AS AVG
FROM SANPHAM
GROUP BY NUOCSX;
-- 15.Tính doanh thu bán hàng mỗi ngày.
SELECT NGHD, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
GROUP BY NGHD;
-- 16.Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT MASP, COUNT(DISTINCT MASP) AS TONGSO
FROM SANPHAM
WHERE MASP IN(SELECT MASP
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006)
GROUP BY MASP;

-- 17. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD);

-- 18. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT *
FROM HOADON
WHERE SOHD IN(SELECT SOHD
FROM CTHD
WHERE SL >= 4);

-- 19.Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT *
FROM HOADON
WHERE SOHD IN(SELECT SOHD
FROM CTHD C INNER JOIN SANPHAM S
ON C.MASP = S.MASP
WHERE NUOCSX = 'VIET NAM' AND SL >= 3);

-- 20 -Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT MAKH, HOTEN
FROM KHACHHANG
WHERE MAKH = (SELECT  MAKH
FROM HOADON
GROUP BY MAKH
ORDER BY COUNT(DISTINCT SOHD) DESC)
limit 1 ;

SELECT khachhang.makh, khachhang.hoten,count(hoadon.sohd)
FROM khachhang JOIN hoadon 
               ON hoadon.makh = khachhang.makh
GROUP BY khachhang.makh
HAVING count(hoadon.sohd) = ( SELECT count(sohd)
                              from hoadon
                              GROUP BY makh
							  ORDER BY count(sohd) desc
                              LIMIT 1);
-- 21 - Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT MONTH(NGHD) AS THANG_DOANHSO_MAX
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC
limit 1;

-- 22 - Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.


select sanpham.masp, sanpham.tensp, count(cthd.sl) as 'số lượng bán ra'
from sanpham join cthd on cthd.masp = sanpham.masp join hoadon on hoadon.sohd = cthd.sohd 
where year(hoadon.nghd) = 2006
group by sanpham.masp
having count(cthd.sl) = (
select count(cthd.sl)
from cthd
group by masp
order by count(cthd.sl)
limit 1
);
-- 23 - *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT NUOCSX, MAX(GIA) AS MAX
FROM SANPHAM
GROUP BY NUOCSX;

SELECT B.NUOCSX, MASP, TENSP
FROM (SELECT NUOCSX, MAX(GIA) AS MAX
FROM SANPHAM
GROUP BY NUOCSX) AS B LEFT JOIN SANPHAM S 
ON S.GIA = B.MAX 
WHERE B.NUOCSX = S.NUOCSX;
-- 24 - Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT sp.NUOCSX
FROM SANPHAM sp
GROUP BY sp.NUOCSX
HAVING count(distinct sp.GIA)>=3;

-- 25 - *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.

-- 10 khách hàng có doanh số cao nhất;
SELECT MAKH
FROM KHACHHANG
ORDER BY DOANHSO DESC
LIMIT 10;

-- Khách hàng và số lần mua
SELECT MAKH, COUNT(SOHD)
FROM HOADON
GROUP BY MAKH;


SELECT hd1.MAKH, DS1.HOTEN
FROM 
(
    SELECT  kh1.MAKH, KH1.HOTEN
    FROM KHACHHANG kh1
    WHERE kh1.MAKH is not null
    ORDER BY kh1.DOANHSO DESC
    LIMIT 10
) DS1, HOADON hd1
WHERE DS1.MAKH = hd1.MAKH
GROUP BY hd1.MAKH, DS1.HOTEN
 
HAVING COUNT(HD1.SOHD)>=
ALL(
 
    SELECT count(hd.SOHD)
    FROM 
    (
        SELECT  kh.MAKH
        FROM KHACHHANG kh
        WHERE kh.MAKH is not null
        ORDER BY kh.DOANHSO DESC
        LIMIT 10
    ) DS, HOADON hd
    WHERE DS.MAKH = hd.MAKH
    GROUP BY hd.MAKH 
);

--- Câu Này k hỉu, k bít làm :((