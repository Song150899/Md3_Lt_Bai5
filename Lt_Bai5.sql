create database studentTest;

create table test(
testId int auto_increment primary key,
name varchar(50)
);

create table student(
RN int auto_increment primary key,
name varchar(50),
age int,
status bit
);

create table StudentTest(
RN int ,
testid int,
date date,
mark int,
primary key(RN, testid),
foreign key (RN) references student(RN),
foreign key (testid) references test(testid)
);

-- Câu 2: Hiển thị danh sách các học viên đã tham gia thi, các môn thi được thi bởi các học viên đó
select *
from test join studenttest on test.testId = studenttest.testid
join student on studenttest.RN = student.RN;



-- Câu 5 hiển thị danh sách học viên và điểm trung bình các môn đã thi, sắp xếp theo giảm dần
select  student.name, avg(mark) as avg
from test join studenttest on test.testId = studenttest.testid
join student on studenttest.RN = student.RN
group by student.name
order by avg desc;

-- Câu 6:Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất

create view avg
as
select  student.name, avg(mark) as avgt
from studenttest join student on studenttest.RN = student.RN
group by student.name;


select  student.name, avg(mark) as avgt
from studenttest join student on studenttest.RN = student.RN
group by student.name
having avgt=(select max(avgt)
from avg);

-- Câu 7: Hiển thị điểm cao nhất của từng môn học
select test.name, max(mark) 
from studenttest join test on  studenttest.testid = test.testId
group by test.name
order by test.name;

-- Câu 8: Hiển thị danh sách tất cả các học viên và môn học mà các học viên đó đã thi nếu học viên chưa thi môn nào thì phần tên môn học để Null
select *
from studenttest join test on  studenttest.testid = test.testId
                right join student on studenttest.RN = student.RN;
                
-- Câu 9: Sửa (Update) tuổi của tất cả các học viên mỗi người lên một tuổi
update student
set age  = age +1
where RN > 0;

-- Câu 10: Thêm trường tên là Status có kiểu Varchar(10) vào bảng Student.
alter table student
change status status varchar(50);

-- Câu 11:Cập nhật(Update) trường Status sao cho những học viên nhỏ hơn 30 tuổi sẽ nhận giá trị ‘Young’, trường hợp còn lại nhận giá trị ‘Old’ sau đó hiển thị toàn bộ nội dung bảng Student
update student
set status = ( case when age <30 then 'young' else 'old'end)
where RN > 0;

-- Câu 12: Tạo view tên là vwStudentTestList hiển thị danh sách học viên và điểm thi, dánh sách phải sắp xếp tăng dần theo ngày thi 
create view vwStudentTestList
as
select student.*, mark
from studenttest join student  on studenttest.RN = student.RN
order by date;

select * from vwStudentTestList;

-- Câu 13:Tạo một trigger tên là tgSetStatus sao cho khi sửa tuổi của học viên thi trigger này sẽ tự động cập nhật status theo quy tắc sau:( Nếu tuổi nhỏ hơn 30 thì Status=’Young’ ), ( Nếu tuổi lớn hơn hoặc bằng 30 thì Status=’Old’ )
delimiter $$
create trigger tgSetStatus 
before update on student 
for each row
begin 
if (new.age <30)
then
set new.status = 'young';
else
set new.status = 'old';
end if;
end$$

-- Câu 14:
-- Tạo một stored procedure tên là spViewStatus, stored procedure này nhận vào 2 tham số:	[2.5]
-- Tham số thứ nhất là tên học viên					
-- Tham số thứ 2 là tên môn học
-- Nếu tên học viên hoặc tên môn học không tìm thây trong cơ sở dữ liệu thì hiện ra màn hình thông báo: ‘Khong tim thay’
-- Trường hợp còn lại thi hiển thị trạng thái của học viên đó với môn học đó theo quy tắc sau:
-- Hiển thị ‘Chua thi’ nếu học viên đó chưa thi môn đó
-- Hiển thị ‘Do’ nếu đã thi rồi và điểm lơn hơn hoặc bằng 5
-- Hiển thị ‘Trượt’ nếu đã thi rồi và điểm thi nhỏ hơn 5

delimiter $$
Create  procedure spViewStatus(nameHV varchar(50), nameMH varchar(50))
begin
select student.name, test.name, (case when mark > 5 then 'qua môn'  when mark < 5 then ' trượt ' else 'chưa thi' end ) as 'học lực '
from studenttest join test on studenttest.testid = test.testid
             right join student on studenttest.RN = student.RN;

end$$


