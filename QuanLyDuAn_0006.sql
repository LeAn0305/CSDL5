CREATE DATABASE QuanLyDuAn_0006
GO
USE QuanLyDuAn_0006
GO

CREATE TABLE NhaCungCap(
	MaNCC CHAR(5) NOT NULL,
	Ten NVARCHAR(40),
	Heso INT,
	ThPho NVARCHAR(20),
);

CREATE TABLE VATTU(
	MaVT CHAR(5) NOT NULL,
	Ten NVARCHAR(40),
	Mau NVARCHAR(15),
	TrLuong FLOAT,
	ThPho NVARCHAR(20),
);

CREATE TABLE DUAN(
	MaDA CHAR(5) NOT NULL,
	Ten NVARCHAR(40),
	ThPho NVARCHAR(20),
);

CREATE TABLE CungCap(
	MaNCC CHAR(5) NOT NULL,
	MaVT CHAR(5) NOT NULL,
	MaDA CHAR(5) NOT NULL,
	SLuong INT,
);

/* ============================== TẠO KHÓA CHÍNH VÀ KHÓA PHỤ ============================== */
ALTER TABLE NhaCungCap ADD CONSTRAINT PK_NCC PRIMARY KEY(MaNCC)
ALTER TABLE VATTU      ADD CONSTRAINT PK_VATTU PRIMARY KEY(MaVT)
ALTER TABLE DUAN	   ADD CONSTRAINT PK_DUAN PRIMARY KEY(MaDA)
ALTER TABLE CungCap    ADD CONSTRAINT PK_CC PRIMARY KEY(MaNCC , MaVT , MaDA)

ALTER TABLE CungCap ADD CONSTRAINT FK_CungCap_MaNCC FOREIGN KEY(MaNCC) REFERENCES NhaCungCap(MaNCC)
ALTER TABLE CungCap ADD CONSTRAINT FK_CungCap_MaVT  FOREIGN KEY(MaVT)  REFERENCES VATTU(MaVT)
ALTER TABLE CungCap ADD CONSTRAINT FK_CungCap_MaDA  FOREIGN KEY(MaDA)  REFERENCES DUAN(MaDA)

/* ================================ THÊM DỮ LIỆU VÀO BẢNG ================================= */
INSERT INTO NhaCungCap(MaNCC, Ten, Heso, ThPho) VALUES
('S1', N'SƠN', 20, N'TP.HCM'),
('S2', N'TRÂN', 10, N'HÀ NỘI'),
('S3', N'BÁCH', 30, N'HÀ NỘI'),
('S4', N'LẬP', 20, N'TP.HCM'),
('S5', N'ÁNH', 30, N'ĐÀ NẴNG')

INSERT INTO DUAN(MaDA, Ten, ThPho) VALUES 
('J1', N'MÁY PHÂN LOẠI', N'HÀ NỘI'),
('J2', N'MÀN HÌNH', N'VIỆT TRÌ'),
('J3', N'OCR', N'ĐÀ NẴNG'),
('J4', N'BẢNG ĐIỀU KHIỂN', N'ĐÀ NẴNG'),
('J5', N'RAID', N'TP.HCM'),
('J6', N'EDS', N'HẢI PHÒNG'),
('J7', N'BẢNG TỪ', N'TP.HCM')

INSERT INTO VATTU(MaVT, Ten, Mau, TrLuong, ThPho) VALUES
('P1', N'ĐAI ỐC', N'ĐỎ', 12.0, N'TP.HCM'),
('P2', N'BÙ LON', N'XANH LÁ', 17.0, N'HÀ NỘI'),
('P3', N'ĐINH VÍT', N'XANH DƯƠNG', 17.0, N'HẢI PHÒNG'),
('P4', N'ĐINH VÍT', N'ĐỎ', 14.0, N'TP.HCM'),
('P5', N'CAM', N'XANH DƯƠNG', 12.0, N'HÀ NỘI'),
('P6', N'BÁNH RĂNG', N'ĐỎ', 19.0, N'TP.HCM')

INSERT INTO CungCap(MaNCC, MaVT, MaDA, SLuong) VALUES
('S1', 'P1', 'J1', 200),
('S1', 'P1', 'J4', 700),
('S2', 'P3', 'J1', 400),
('S2', 'P3', 'J2', 200),
('S2', 'P3', 'J3', 200),
('S2', 'P3', 'J4', 500),
('S2', 'P3', 'J5', 600),
('S2', 'P3', 'J6', 400),
('S2', 'P3', 'J7', 800),
('S2', 'P5', 'J2', 100),
('S3', 'P3', 'J1', 200),
('S3', 'P4', 'J2', 500),
('S4', 'P6', 'J3', 300),
('S4', 'P6', 'J7', 300),
('S5', 'P2', 'J2', 200),
('S5', 'P2', 'J4', 100),
('S5', 'P5', 'J5', 500),
('S5', 'P5', 'J7', 100),
('S5', 'P6', 'J2', 200),
('S5', 'P1', 'J4', 100),
('S5', 'P3', 'J4', 200),
('S5', 'P4', 'J4', 800),
('S5', 'P5', 'J4', 400),
('S5', 'P6', 'J4', 500)

/* ================================ Bài Làm ================================= */
--Câu 1 : Cho Biết Quy Cách Màu Và Thành Phố Của Các Vật Tư Không Được T rữ Tại Hà Nội Có Trọng Lượng Lớn Hơn 10.
SELECT VT.Mau [Màu] , VT.ThPho [Thành Phố] , VT.TrLuong [Trọng Lượng]
FROM VATTU VT
WHERE VT.ThPho != N'Hà Nội' AND VT.TrLuong > 10

--Câu 2 : Cho Biết Thông Tin Chi Tiết Của Tất Cả Các Dự Án
SELECT DA.MaDA [Mã Dự Án] , DA.Ten [Tên Dự Án] , DA.ThPho [ Tên Thành Phố]
FROM DUAN DA

--Câu 3 : Cho Biết Thông Tin Chi Tiết Của Tất Cả Các Dự Án Ở TP.HCM
SELECT DA.MaDA [Mã Dự Án] , DA.Ten [Tên Dự Án] , DA.ThPho [ Tên Thành Phố]
FROM DUAN DA
WHERE DA.ThPho LIKE 'TP.HCM'

--Câu 4 : Cho Biết Tên Nhà Cung Cấp , Cung Cấp Vật Tư Cho Dự Án J1
SELECT NCC.Ten [Tên Nhà Cung Cấp Cho Dự Án J1]
FROM NhaCungCap NCC
JOIN CungCap CC ON NCC.MaNCC = CC.MaNCC
WHERE CC.MaDA = 'J1'

--Câu 5 : Cho Biết Tên Nhà Cung Cấp , Tên Vật Tư Và Tên Dự Án Mà Số Lượng Vật Tư Được Cung Cấp Cho Dự Án Bởi Nhà Cung Cấp Lớn Hơn 300 và Nhỏ Hơn 750
SELECT NCC.Ten [Tên Nhà Cung Cấp] , VT.Ten [Tên Vật Tư] , DA.Ten [Tên Dự Án] , CC.SLuong [Số Lượng Cung Cấp Cho Dự Án]
FROM NhaCungCap NCC
JOIN CungCap CC ON NCC.MaNCC = CC.MaNCC
JOIN VATTU VT ON CC.MaVT = VT.MaVT
JOIN DUAN DA ON CC.MaDA = DA.MaDA
WHERE CC.SLuong > 300 AND CC.SLuong < 750

--Câu 6 : Cho Biết Thông Tin Chi Tiết Của Các Vật Tư Được Cung Cấp Bởi Các Nhà Cung Cấp Ở TP.HCM
SELECT DISTINCT VT.MaVT , VT.Ten , VT.Mau , VT.TrLuong , VT.ThPho
FROM VATTU VT
JOIN CungCap CC ON VT.MaVT = CC.MaVT
JOIN NhaCungCap NCC ON CC.MaNCC = NCC.MaNCC
WHERE NCC.ThPho = 'TP.HCM'

--Câu 7 : Cho Biết Mã Số Các Vật Tư Được Cung Cấp Cho Các Dự Án Tại TP.HCM Bởi Các Nhà Cung Cấp Ở TP.HCM
SELECT CC.MaNCC , VT.MaVT , DA.MaDA , CC.SLuong
FROM VATTU VT
JOIN CungCap CC ON VT.MaVT = CC.MaVT
JOIN NhaCungCap NCC ON CC.MaNCC = NCC.MaNCC
JOIN DUAN DA ON CC.MaDA = DA.MaDA
WHERE NCC.ThPho = 'TP.HCM' AND DA.ThPho = 'TP.HCM'

--Câu 8 : Liệt Kê Các Cặp Tên Thành Phố Mà Nhà Cung Cấp Ở Thành Phố Thứ Nhất Cung Cấp Vật Tư Được Trữ Tại Thành Phố Thứ 2 
SELECT DISTINCT NCC.MaNCC [Mã Nhà Cung Cấp] ,VT.MaVT [Mã Vật Tư] , NCC.ThPho [Tên Thành Phố Thứ 1 ] , VT.ThPho [Tên Thành Phố Thứ 2 ]
FROM NhaCungCap NCC
JOIN CungCap CC ON NCC.MaNCC = CC.MaNCC
JOIN VATTU VT ON CC.MaVT = VT.MaVT
WHERE NCC.ThPho <> VT.ThPho

--Câu 9 : Liệt Kê Các Cặp Tên Thành Phố Mà Nhà Cung Cấp Ở Thành Phố Thứ Nhất Cung Cấp Vật Tư Cho Dự Án Tại Thành Phố Thứ 2 
SELECT DISTINCT NCC.MaNCC [Mã Nhà Cung Cấp] ,VT.MaVT [Mã Vật Tư] , DA.MaDA [Mã Dự Án] , NCC.ThPho [Tên Thành Phố Thứ 1] , DA.ThPho [Thành Phố Tứ 2 ]
FROM NhaCungCap NCC
JOIN CungCap CC ON NCC.MaNCC = CC.MaNCC
JOIN VATTU VT ON CC.MaVT = VT.MaVT
JOIN DUAN DA ON CC.MaDA = DA.MaDA
WHERE NCC.ThPho <> DA.ThPho 

--Câu 10 : Liệt Kê Các Cặp Mã Số Nhà Cung Cấp Ở Cùng Một Thành Phố
SELECT DISTINCT NCC1.MaNCC [Mã Số Nhà Cung Cấp Thứ  1] , NCC2.MaNCC [Mã Số Nhà Cung Cấp Thứ 2]
FROM NhaCungCap NCC1
JOIN NhaCungCap NCC2 ON NCC1.ThPho = NCC2.ThPho AND NCC1.MaNCC < NCC2.MaNCC

--Câu 11 : Cho Biết Mã Số Và Tên Các Vật Tư Được Cung Cấp Cho Dự Án Cùng Thành Phố Với Nhà Cung Cấp
SELECT DISTINCT NCC.MaNCC [Mã Nhà Cung Cấp] , VT.MaVT [Mã Vật Tư] , CC.MaDA [Mã Dự Án] , VT.Ten [Tên Vặt Tư] 
FROM VATTU VT 
JOIN CungCap CC ON VT.MaVT = CC.MaVT
JOIN DUAN DA ON CC.MaDA = DA.MaDA
JOIN NhaCungCap NCC ON CC.MaNCC = NCC.MaNCC
WHERE NCC.ThPho = DA.ThPho

--Câu 12 : Cho Biết Mã Số Và Tên Các Dự Án Được Cung Cấp Vật Tư Bởi Ít Nhất Một Nhà Cung Cấp Không Cùng Thành Phố
SELECT DISTINCT DA.MaDA [Mã Dự Án] , DA.Ten [Tên Dự Án] , NCC.ThPho [Tên Thành Phố] ,DA.ThPho [Tên Thành Phố]
FROM DUAN DA
JOIN CungCap CC ON DA.MaDA = CC.MaDA
JOIN NhaCungCap NCC ON CC.MaNCC = NCC.MaNCC
JOIN VATTU VT ON CC.MaVT = VT.MaVT
WHERE NCC.ThPho <> DA.ThPho

--Câu 13 : Cho Biết Mã Số Nhà Cung Cấp Và Cặp Mã Số Vật Tư Được Cung Cấp Bởi Nhà Cung Cấp
SELECT DISTINCT CC1.MaNCC [Mã Nhà Cung Cấp] , CC1.MaVT [Mã Số Vật Tư Thứ 1] , CC2.MaVT [Mã Số Vật Tư Thứ 2]
FROM CungCap CC1
JOIN CungCap CC2 ON CC1.MaNCC = CC2.MaNCC AND CC1.MaVT < CC2.MaVT

--Câu 14 : Cho Biết Mã Số Các Vật Tư Được Cung Cấp Bởi Nhiều Hơn Một Nhà Cung Cấp
SELECT CC.MaVT [Mã Số Vật Tư Có Nhiều Hơn Một Nhà Cung Cấp]
FROM CungCap CC
GROUP BY CC.MaVT
HAVING COUNT(DISTINCT MaNCC) > 1 

--Câu 15 : Với Mỗi Vật Tư Cho Biết Mã Số Và Tổng Số Lượng Được Cung Cấp Cho Các Dự Án
SELECT CC.MaVT [Mã Vật Tư] , COUNT(CC.SLuong) [Số Lượng Cung Cấp Cho Dự Án]
FROM CungCap CC
GROUP BY CC.MaVT

--Câu 16 : Cho Biết Tổng Số Các Dự Án Được Cung Cấp Vật Tư Bởi Nhà Cung Cấp S1
SELECT COUNT(DISTINCT DA.MaDA) [Tổng Số Dự Án Được Cung Cấp Vật Tư Bởi Nhà Cung Cấp S1]
FROM DUAN DA
JOIN CungCap CC ON DA.MaDA = CC.MaDA
JOIN NhaCungCap NCC ON CC.MaNCC = NCC.MaNCC
WHERE NCC.MaNCC = 'S1'

--Câu 17 : Cho Biết Tổng Số Lượng Vật Tư P1 Được Cung Cấp Bởi Nhà Cung Cấp S1
SELECT SUM(CC.SLuong) [Tổng Số Lượng Vật Tư P1 Được Cung Cấp Bởi Nhà Cung Cấp S1]
FROM VATTU VT
JOIN CungCap CC ON VT.MaVT = CC.MaVT
JOIN NhaCungCap NCC ON CC.MaNCC = NCC.MaNCC
WHERE NCC.MaNCC = 'S1' AND CC.MaVT = 'P1'

--Câu 18 : Với Mỗi Vật Tư Được Cung Cấp Cho Một Dự Án , Cho Biết Mã Số , Tên Vật Tư , Tên Dự Án , Và Tổng Số Lượng Vật Tư Tương Ứng
SELECT VT.MaVT [Mã Vật Tư] , VT.Ten [Tên Vật Tư] , DA.Ten [Tên Dự Án] , SUM(CC.SLuong) [Tổng Số Lượng Vật Tư]
FROM VATTU VT
JOIN CungCap CC ON VT.MaVT = CC.MaVT
JOIN DUAN DA ON CC.MaDA = DA.MaDA
GROUP BY VT.MaVT , VT.Ten , DA.Ten

--Câu 19 : Cho Biết Mã Số , Tên Các Vật Tư Và Tên Dự Án Có Số Lượng Vật Tư Trung Bình Cung Cấp Cho Dự Án Lớn Hơn 350
SELECT VT.MaVT [Mã Vật Tư] , VT.Ten [Tên Vật Tư] ,DA.Ten [Tên Dự Án], AVG(CC.SLuong) AS [Số Lượng Vật Tư Trung Bình]
FROM CungCap CC
JOIN VATTU VT ON CC.MaVT = VT.MaVT
JOIN DUAN DA ON CC.MaDA = DA.MaDA
GROUP BY VT.MaVT , VT.Ten , DA.Ten
HAVING AVG(CC.SLuong) > 350
ORDER BY [Số Lượng Vật Tư Trung Bình]

--Câu 20 : Cho Biết Tên Các Dự Án Được Cung Cấp Vật Tư Bởi Nhà Cung Cấp S1
SELECT NCC.MaNCC [Mã Nhà Cung Cấp ] ,DA.Ten [Tên Dự Án]
FROM DUAN DA
JOIN CungCap CC ON DA.MaDA = CC.MaDA
JOIN NhaCungCap NCC ON CC.MaNCC = NCC.MaNCC
WHERE NCC.MaNCC = 'S1'

--Câu 21 : Cho Biết Quy Cách Màu Của Các Vật Tư Được Cung Cấp Bởi Nhà Cung Cấp S1
SELECT NCC.MaNCC [Mã Nhà Cung Cấp] , VT.MaVT [Mã Vật Tư] , VT.Ten [Tên Vật Tư] , VT.Mau [Quy Cách Màu]
FROM VATTU VT
JOIN CungCap CC ON VT.MaVT = CC.MaVT
JOIN NhaCungCap NCC ON CC.MaNCC = NCC.MaNCC
WHERE NCC.MaNCC = 'S1'

--Câu 22 : Cho Biết Mã Số Và Tên Các Vật Tư Được Cung Cấp Cho Một Dự Án Bất Kỳ Ở TP.HCM
SELECT VT.MaVT [Mã Vật Tư] , VT.Ten [Tên Vật Tư]
FROM VATTU VT
JOIN CungCap CC ON VT.MaVT = CC.MaVT
JOIN DUAN DA ON CC.MaDA = DA.MaDA
WHERE DA.ThPho = 'TP.HCM'

--Câu 23 : Cho Biết Mã Số Và Tên Các Dự Án Sử Dụng Vật Tư Có Thể Được Cung Cấp Bởi Nhà Cung Cấp S1
SELECT  DA.MaDA [Mã Dự Án] , DA.Ten [Tên Dự Án] , NCC.MaNCC [Mã Nhà Cung Cấp]
FROM DUAN DA
JOIN CungCap CC ON DA.MaDA = CC.MaDA
JOIN VATTU VT ON CC.MaVT = VT.MaVT
JOIN NhaCungCap NCC ON CC.MaNCC = NCC.MaNCC
WHERE VT.MaVT IN(SELECT MaVT FROM CungCap WHERE MaNCC = 'S1')

--Câu 24 : Cho Biết Mã Số Và Tên Nhà Cung Cấp Có Cung Cấp Vật Tư Có Quy Cách Màu Đỏ
SELECT DISTINCT NCC.MaNCC [Mã Nhà Cung Cấp] , NCC.Ten [Tên Nhà Cung Cấp]
FROM NhaCungCap NCC
JOIN CungCap CC ON NCC.MaNCC = CC.MaNCC
JOIN VATTU VT ON CC.MaVT = VT.MaVT
WHERE VT.Mau = N'ĐỎ'

--Câu 25 : Cho Biết Tên Các Nhà Cung Cấp Có Chỉ Số Xếp Hạng Nhỏ Hơn Chỉ Số Lớn Nhất
SELECT NCC.Ten [Tên Nhà Cung Cấp] , NCC.Heso [Chỉ Số Xếp Hạng]
FROM NhaCungCap NCC
WHERE NCC.Heso > (SELECT MIN(Heso) FROM NhaCungCap);

--Câu 26 : Cho Biết Tên Các Nhà Cung Cấp Không Cung Cấp Vật Tư P2
SELECT DISTINCT  NCC.Ten [Tên Nhà Cung Cấp Không Cung Cấp Vật Tư P2]
FROM NhaCungCap NCC
WHERE NCC.MaNCC NOT IN (SELECT CC.MaNCC FROM CungCap CC WHERE CC.MaVT = 'P2');

--Câu 27 : Cho Biết Mã Số Và Tên Các Nhà Cung Cấp Đang Cung Cấp Vật Tư Được Cung Cấp Bởi Nhà Cung Cấp Có Cung Cấp Vật Tư Với Quy Cách Màu Đỏ
SELECT DISTINCT NCC.MaNCC [Mã Nhà Cung Cấp] , NCC.Ten [Tên Cung Cấp]
FROM NhaCungCap NCC
JOIN CungCap CC ON NCC.MaNCC = CC.MaNCC
JOIN VATTU VT ON CC.MaVT = VT.MaVT
WHERE VT.Mau LIKE N'ĐỎ'

--Câu 28 : Cho Biết Mã Số Và Tên Các Nhà Cung Cấp Có Chỉ Số Xếp Hạng Cao Hơn Nhà Cung Cấp S1
SELECT NCC.MaNCC [Mã Nhà Cung Cấp] , NCC.Ten [Tên Nhà Cung Cấp] , NCC.Heso [Chỉ Số Xếp Hạng]
FROM NhaCungCap NCC
WHERE NCC.Heso > (SELECT DISTINCT Heso FROM NhaCungCap WHERE MaNCC LIKE 'S1' )

--Câu 29 : Cho Biết Mã Số Và Tên Các Dự Án Được Cung Cấp Vật Tư P1 Với Số Lượng Vật Tư Trung Bình Lớn Hơn Tất Cả Các Số Lượng Vật Tư Được Cung Cấp Cho Dự Án J1
SELECT CC.MaNCC [Mã Nhà Cung Cấp] , CC.MaVT [Mã Vật Tư] , DA.MaDA [Mã Dự Án] , DA.Ten [Tên Dự Án] , AVG(CC.SLuong) [Số Lượng Trung Bình]
FROM DUAN DA
JOIN CungCap CC ON DA.MaDA = CC.MaDA
WHERE CC.MaVT = 'P1'
GROUP BY CC.MaDA , CC.MaVT , DA.MaDA , DA.Ten , CC.MaNCC
HAVING AVG(CC.SLuong) > ALL(
	SELECT CC.SLuong
	FROM CungCap CC
	JOIN DUAN DA ON CC.MaDA = DA.MaDA
	WHERE DA.MaDA = 'J1'
);

--Câu 30 : Cho Biết Mã Số Và Tên Các Nhà Cung Cấp Vật Tư P1 Cho Một Dự Án Nào Đó Với Số Lượng Lớn Hơn Số Lượng Trung Bình Của Vật Tư P1 Được Cung Cấp Cho Dự Án Đó
SELECT NCC.MaNCC [Mã Nhà Cung Cấp] , NCC.Ten [Tên Nhà Cung Cấp]  , CC.SLuong [Số Lượng ]
FROM NhaCungCap NCC
JOIN CungCap CC ON NCC.MaNCC = CC.MaNCC
WHERE CC.MaVT = 'P1' 
AND CC.SLuong > (
	SELECT AVG(CC1.SLuong)
	FROM CungCap CC1
	WHERE CC.MaVT = 'P1' AND CC1.MaDA = CC.MaDA
)

--Câu 31 : Cho Biết Mã Số Và Tên Các Dự Án Không Được Cung Cấp Vật Tư Nào Có Quy Cách Màu Đỏ Bởi Một Nhà Cung Cấp Bất Kỳ Ở TP.HCM
SELECT DISTINCT DA.MaDA [Mã Dự Án] , DA.Ten [Tên Dự Án]
FROM DUAN DA
WHERE NOT EXISTS ( 
	SELECT 1
	FROM CungCap CC 
	JOIN VATTU VT ON CC.MaVT = VT.MaVT
	JOIN NhaCungCap NCC ON CC.MaNCC = NCC.MaNCC
	WHERE DA.MaDA = CC.MaDA AND	NCC.ThPho = 'TP.HCM' AND VT.Mau  LIKE N'ĐỎ%'
)

--Câu 32 : Cho Biết Mã Số Và Tên Các Dự Án Được Cung Cấp Toàn Bộ Vật Tư Bởi Nhà Cung Cấp S1
SELECT DA.MaDA [Mã Dự Án] , DA.Ten [Tên Dự Án]
FROM DUAN DA
JOIN CungCap CC ON DA.MaDA = CC.MaDA
JOIN VATTU VT ON CC.MaVT = VT.MaVT
JOIN NhaCungCap NCC ON CC.MaNCC = NCC.MaNCC
WHERE NCC.MaNCC = 'S1'
GROUP BY DA.MaDA , DA.Ten
HAVING COUNT(DISTINCT CC.MaVT) = (SELECT COUNT(DISTINCT MaVT) FROM CungCap WHERE MaDa = DA.MaDA )

--Câu 33 : Cho Biết Tên Các Nhà Cung Cấp Tất Cả Các Vật Tư
SELECT DISTINCT NCC.Ten [Tên Nhà Cung Cấp]
FROM NhaCungCap NCC
JOIN CungCap CC ON NCC.MaNCC = CC.MaNCC
GROUP BY NCC.Ten
HAVING COUNT(DISTINCT CC.MaVT) = (SELECT COUNT(DISTINCT MaVT) FROM VATTU)

--Câu 34 : Cho Biết Mã Số Và Tên Các Vật Tư Được Cung Cấp Cho Tất Cả Các Dự Án Tại TP.HCM
SELECT VT.MaVT [Mã Vật Tư] , VT.Ten [Tên] FROM VATTU VT 
JOIN CungCap CC ON VT.MaVT = CC.MaVT
JOIN DUAN DA ON CC.MaDA = DA.MaDA
WHERE DA.ThPho = 'TP.HCM'
GROUP BY VT.MaVT , VT.Ten 
HAVING COUNT(DISTINCT DA.MaDA ) = (SELECT COUNT(MaDA) FROM DUAN WHERE ThPho = 'TP.HCM');

--Câu 35 : Cho Biết Mã Số Và Tên Các Nhà Cung Cấp , Cung Cấp Cùng Một Vật Tư Cho Tất Cả Các Dự Án
SELECT NCC.MaNCC [Mã Nhà Cung Cấp] , NCC.Ten [Tên Nhà Cung Cấp] , CC.MaVT [Mã Vật Tư]
FROM NhaCungCap NCC  
JOIN CungCap CC ON NCC.MaNCC = CC.MaNCC
GROUP BY NCC.MaNCC , NCC.Ten , CC.MaVT
HAVING COUNT(DISTINCT CC.MaVT) = 1 AND COUNT(DISTINCT CC.MaDA) = (SELECT COUNT(MaDA) FROM DUAN)

--Câu 36 : Cho Biết Mã Số Và Tên Các Dự Án Được Cung Cấp Tất Cả Các Vật Tư Có Thể Được Cung Cấp Bởi Nhà Cung Cấp S1
SELECT DA.MaDA [Mã Dự Án] , DA.Ten [Tên Dự Án]
FROM DUAN DA 
JOIN CungCap CC ON DA.MaDA = CC.MaDA
GROUP BY DA.MaDA , DA.Ten
HAVING COUNT(DISTINCT CC.MaVT) = ( SELECT COUNT(DISTINCT MaVT) FROM CungCap WHERE MaNCC = 'S1');

--Câu 37 : Cho Biết Tất Cả Thành Phố Mà Nơi Đó Có Ít Nhất Một Nhà Cung Cấp , Trữ Ít Nhất Một Vật Tư Hoặc Có Ít Nhất Một Dự Án
SELECT DISTINCT ThPho
FROM ( SELECT ThPho FROM NhaCungCap	
	   UNION 
	   SELECT ThPho FROM VATTU 
	   UNION 
	   SELECT ThPho FROM DUAN 
) AS[Thành Phố Buồn]

--Câu 38 : Cho Biết Mã Số Các Vật Tư Hoặc Được Cung Cấp Bởi Một Nhà Cung Cấp Ở TP.HCM Hoặc Cung Cấp Cho Một Dự Án Tại TP.HCM
SELECT VT.MaVT [Mã Vật Tư]
FROM VATTU VT
JOIN CungCap CC ON VT.MaVT = CC.MaVT
JOIN NhaCungCap NCC ON CC.MaNCC= NCC.MaNCC
JOIN DUAN DA ON CC.MaDA = DA.MaDA
WHERE NCC.ThPho = 'TP.HCM' OR DA.ThPho = 'TP.HCM'

--Câu 39 : Liệt Kê Các Cặp ( Mã Số Nhà Cung Cấp , Mã Số Vật Tư ) Mà Nhà Cung Cấp Không Cấp Vật Tư
SELECT NCC.MaNCC [Mã Số Nhà Cung Cấp] , VT.MaVT [Mã Vật Tư]
FROM NhaCungCap NCC
JOIN VATTU VT ON 1=1
LEFT JOIN CungCap CC ON VT.MaVT = CC.MaVT AND NCC.MaNCC = CC.MaNCC
WHERE CC.MaNCC IS NULL

--Câu 40 : Liệt Kê Các Cặp Mã Số Nhà Cung Cấp Có Thể Cung Cấp Cùng Tất Cả Các Loại Vật Tư
SELECT  CC1.MaNCC [Mã Nhà Cung Cấp 1] , CC2.MaNCC [Mã Nhà Cung Cấp 2]
FROM CungCap CC1
JOIN CungCap CC2 ON  CC1.MaNCC < CC2.MaNCC
GROUP BY CC1.MaNCC , CC2.MaNCC
HAVING COUNT(DISTINCT CC1.MaVT) = COUNT(DISTINCT CC2.MaVT)

--Câu 41: Cho Biết Tên Các Thành Phố Trữ Nhiều Hơn 5 Vật Tư Có Quy Cách Màu Đỏ
SELECT ThPho AS [Tên Thành Phố]
FROM VATTU
WHERE Mau = N'ĐỎ'
GROUP BY ThPho
HAVING COUNT(DISTINCT MaVT) > 5;
