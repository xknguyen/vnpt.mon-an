-- --------------------------------------------------------
-- Host:                         HUY-REAL\HUY
-- Server version:               Microsoft SQL Server 2012 - 11.0.2100.60
-- Server OS:                    Windows NT 6.2 <X64> (Build 9200: )
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for order
CREATE DATABASE IF NOT EXISTS "order";
USE "order";

-- Dumping structure for table order.Account
CREATE TABLE IF NOT EXISTS "Account" (
	"Id" INT(10,0) NOT NULL,
	"Username" NVARCHAR(50) NULL DEFAULT NULL,
	"Password" NVARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY ("Id")
);

-- Dumping data for table order.Account: -1 rows
/*!40000 ALTER TABLE "Account" DISABLE KEYS */;
INSERT INTO "Account" ("Id", "Username", "Password") VALUES
	(1, 'admin', 'admin'),
	(2, 'huy', 'huy');
/*!40000 ALTER TABLE "Account" ENABLE KEYS */;

-- Dumping structure for table order.Categories
CREATE TABLE IF NOT EXISTS "Categories" (
	"Id" INT(10,0) NOT NULL,
	"Name" NVARCHAR(100) NULL DEFAULT NULL,
	"RestaurantId" INT(10,0) NULL DEFAULT NULL,
	"Icon" NVARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY ("Id")
);

-- Dumping data for table order.Categories: -1 rows
/*!40000 ALTER TABLE "Categories" DISABLE KEYS */;
INSERT INTO "Categories" ("Id", "Name", "RestaurantId", "Icon") VALUES
	(1, 'Trà sữa', 1, 'ios-leaf'),
	(2, 'Kem', 1, 'ios-ice-cream'),
	(3, 'Nước ngọt', 1, 'ios-cafe'),
	(4, 'Bánh', 1, 'ios-pizza'),
	(5, 'Trái cây', 2, 'ios-nutrition'),
	(6, 'Bánh kẹo', 2, 'ios-basket-outline'),
	(7, 'Mứt', 2, 'ios-baseball'),
	(8, 'Đồ chiên', 2, 'ios-beer'),
	(9, 'Trà sữa', 3, 'ios-leaf'),
	(10, 'Kem', 3, 'ios-ice-cream'),
	(11, 'Nước ngọt', 3, 'ios-cafe'),
	(12, 'Bánh', 3, 'ios-pizza'),
	(13, 'Trái cây', 4, 'ios-nutrition'),
	(14, 'Bánh kẹo', 4, 'ios-basket-outline'),
	(15, 'Mứt', 4, 'ios-baseball'),
	(16, 'Đồ Nướng', 4, 'ios-beer');
/*!40000 ALTER TABLE "Categories" ENABLE KEYS */;

-- Dumping structure for table order.Detail
CREATE TABLE IF NOT EXISTS "Detail" (
	"Id" INT(10,0) NOT NULL,
	"OrderId" INT(10,0) NULL DEFAULT NULL,
	"SessionId" INT(10,0) NULL DEFAULT NULL,
	"AccountId" INT(10,0) NULL DEFAULT NULL,
	PRIMARY KEY ("Id")
);

-- Dumping data for table order.Detail: -1 rows
/*!40000 ALTER TABLE "Detail" DISABLE KEYS */;
/*!40000 ALTER TABLE "Detail" ENABLE KEYS */;

-- Dumping structure for function order.fn_diagramobjects
DELIMITER //

	CREATE FUNCTION dbo.fn_diagramobjects() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	//
DELIMITER ;

-- Dumping structure for table order.Food
CREATE TABLE IF NOT EXISTS "Food" (
	"Id" INT(10,0) NOT NULL,
	"Name" NVARCHAR(50) NULL DEFAULT NULL,
	"Image" NVARCHAR(100) NULL DEFAULT NULL,
	"Price" DECIMAL(18,0) NULL DEFAULT NULL,
	"CategoryId" INT(10,0) NULL DEFAULT NULL,
	"RestaurantId" INT(10,0) NULL DEFAULT NULL,
	PRIMARY KEY ("Id")
);

-- Dumping data for table order.Food: -1 rows
/*!40000 ALTER TABLE "Food" DISABLE KEYS */;
INSERT INTO "Food" ("Id", "Name", "Image", "Price", "CategoryId", "RestaurantId") VALUES
	(1, 'Bia', 'https://img.sosanhgia.com/images/500x0/336cc509349b45b5adb69a2f41c679ae/bia-heineken.jpeg', 10000, 1, 1),
	(2, 'Cocacola', 'https://cdn.tgdd.vn/Products/Images/2443/83757/nuoc-giai-khat-coca-cola-250ml-lon-do-1-700x467-1.jpg', 10000, 1, 1),
	(3, 'Sting dâu', 'https://img.websosanh.vn/v2/users/root_product/images/I3TI-RUPIoYU.jpg', 10000, 1, 1),
	(4, 'Bia', 'https://img.sosanhgia.com/images/500x0/336cc509349b45b5adb69a2f41c679ae/bia-heineken.jpeg', 10000, 1, 1),
	(5, 'Ổi', 'http://suckhoedoisong.vn/Images/hohuong/2016/11/22/oi-vi-thuoc-dan-gian-tuyet-voi1479802704.jpg', 5000, 1, 1),
	(6, 'Xoài', 'https://znews-photo-td.zadn.vn/w660/Uploaded/sgorvz/2016_06_14/qua_xoai_1.jpg', 8000, 1, 1),
	(7, 'Quýt', 'http://fruitshop.com.vn/image/cache/data/images%20(7)-700x700.jpg', 5000, 2, 1),
	(8, 'Dừa', 'https://tribenhdaday.info/wp-content/uploads/2017/07/chua-dau-da-day-bang-dua-1.jpg', 10000, 2, 1),
	(9, 'Cocacola', 'https://cdn.tgdd.vn/Products/Images/2443/83757/nuoc-giai-khat-coca-cola-250ml-lon-do-1-700x467-1.jpg', 10000, 2, 1),
	(10, 'Sting dâu', 'https://img.websosanh.vn/v2/users/root_product/images/I3TI-RUPIoYU.jpg', 10000, 2, 1),
	(11, 'Bia', 'https://img.sosanhgia.com/images/500x0/336cc509349b45b5adb69a2f41c679ae/bia-heineken.jpeg', 10000, 2, 1),
	(12, 'Ổi', 'http://suckhoedoisong.vn/Images/hohuong/2016/11/22/oi-vi-thuoc-dan-gian-tuyet-voi1479802704.jpg', 5000, 2, 1),
	(13, 'Xoài', 'https://znews-photo-td.zadn.vn/w660/Uploaded/sgorvz/2016_06_14/qua_xoai_1.jpg', 8000, 3, 1),
	(14, 'Quýt', 'http://fruitshop.com.vn/image/cache/data/images%20(7)-700x700.jpg', 5000, 3, 1),
	(15, 'Dừa', 'https://tribenhdaday.info/wp-content/uploads/2017/07/chua-dau-da-day-bang-dua-1.jpg', 10000, 3, 1),
	(16, 'Cocacola', 'https://cdn.tgdd.vn/Products/Images/2443/83757/nuoc-giai-khat-coca-cola-250ml-lon-do-1-700x467-1.jpg', 10000, 3, 1),
	(17, 'Sting dâu', 'https://img.websosanh.vn/v2/users/root_product/images/I3TI-RUPIoYU.jpg', 10000, 3, 1),
	(18, 'Bia', 'https://img.sosanhgia.com/images/500x0/336cc509349b45b5adb69a2f41c679ae/bia-heineken.jpeg', 10000, 3, 1),
	(19, 'Ổi', 'http://suckhoedoisong.vn/Images/hohuong/2016/11/22/oi-vi-thuoc-dan-gian-tuyet-voi1479802704.jpg', 5000, 4, 1),
	(20, 'Xoài', 'https://znews-photo-td.zadn.vn/w660/Uploaded/sgorvz/2016_06_14/qua_xoai_1.jpg', 8000, 4, 1),
	(21, 'Quýt', 'http://fruitshop.com.vn/image/cache/data/images%20(7)-700x700.jpg', 5000, 4, 1),
	(22, 'Dừa', 'https://tribenhdaday.info/wp-content/uploads/2017/07/chua-dau-da-day-bang-dua-1.jpg', 10000, 4, 1),
	(23, 'Cocacola', 'https://cdn.tgdd.vn/Products/Images/2443/83757/nuoc-giai-khat-coca-cola-250ml-lon-do-1-700x467-1.jpg', 10000, 4, 1),
	(24, 'Sting dâu', 'https://img.websosanh.vn/v2/users/root_product/images/I3TI-RUPIoYU.jpg', 10000, 4, 1),
	(25, 'Bia', 'https://img.sosanhgia.com/images/500x0/336cc509349b45b5adb69a2f41c679ae/bia-heineken.jpeg', 10000, 5, 2),
	(26, 'Ổi', 'http://suckhoedoisong.vn/Images/hohuong/2016/11/22/oi-vi-thuoc-dan-gian-tuyet-voi1479802704.jpg', 5000, 5, 2),
	(27, 'Xoài', 'https://znews-photo-td.zadn.vn/w660/Uploaded/sgorvz/2016_06_14/qua_xoai_1.jpg', 8000, 5, 2),
	(28, 'Quýt', 'http://fruitshop.com.vn/image/cache/data/images%20(7)-700x700.jpg', 5000, 5, 2),
	(31, 'Bia', 'https://img.sosanhgia.com/images/500x0/336cc509349b45b5adb69a2f41c679ae/bia-heineken.jpeg', 10000, 5, 2),
	(32, 'Ổi', 'http://suckhoedoisong.vn/Images/hohuong/2016/11/22/oi-vi-thuoc-dan-gian-tuyet-voi1479802704.jpg', 5000, 5, 2),
	(33, 'Xoài', 'https://znews-photo-td.zadn.vn/w660/Uploaded/sgorvz/2016_06_14/qua_xoai_1.jpg', 8000, 6, 2),
	(34, 'Quýt', 'http://fruitshop.com.vn/image/cache/data/images%20(7)-700x700.jpg', 5000, 6, 2),
	(35, 'Dừa', 'https://tribenhdaday.info/wp-content/uploads/2017/07/chua-dau-da-day-bang-dua-1.jpg', 10000, 6, 2),
	(36, 'Cocacola', 'https://cdn.tgdd.vn/Products/Images/2443/83757/nuoc-giai-khat-coca-cola-250ml-lon-do-1-700x467-1.jpg', 10000, 6, 2),
	(37, 'Sting dâu', 'https://img.websosanh.vn/v2/users/root_product/images/I3TI-RUPIoYU.jpg', 10000, 6, 2),
	(38, 'Bia', 'https://img.sosanhgia.com/images/500x0/336cc509349b45b5adb69a2f41c679ae/bia-heineken.jpeg', 10000, 6, 2),
	(39, 'Ổi', 'http://suckhoedoisong.vn/Images/hohuong/2016/11/22/oi-vi-thuoc-dan-gian-tuyet-voi1479802704.jpg', 5000, 7, 2),
	(40, 'Xoài', 'https://znews-photo-td.zadn.vn/w660/Uploaded/sgorvz/2016_06_14/qua_xoai_1.jpg', 8000, 7, 2),
	(41, 'Quýt', 'http://fruitshop.com.vn/image/cache/data/images%20(7)-700x700.jpg', 5000, 7, 2),
	(42, 'Bia', 'https://img.sosanhgia.com/images/500x0/336cc509349b45b5adb69a2f41c679ae/bia-heineken.jpeg', 10000, 7, 2),
	(43, 'Ổi', 'http://suckhoedoisong.vn/Images/hohuong/2016/11/22/oi-vi-thuoc-dan-gian-tuyet-voi1479802704.jpg', 5000, 7, 2),
	(44, 'Xoài', 'https://znews-photo-td.zadn.vn/w660/Uploaded/sgorvz/2016_06_14/qua_xoai_1.jpg', 8000, 7, 2),
	(45, 'Quýt', 'http://fruitshop.com.vn/image/cache/data/images%20(7)-700x700.jpg', 5000, 8, 2),
	(46, 'Dừa', 'https://tribenhdaday.info/wp-content/uploads/2017/07/chua-dau-da-day-bang-dua-1.jpg', 10000, 8, 2),
	(47, 'Cocacola', 'https://cdn.tgdd.vn/Products/Images/2443/83757/nuoc-giai-khat-coca-cola-250ml-lon-do-1-700x467-1.jpg', 10000, 8, 2),
	(48, 'Sting dâu', 'https://img.websosanh.vn/v2/users/root_product/images/I3TI-RUPIoYU.jpg', 10000, 8, 2),
	(49, 'Bia', 'https://img.sosanhgia.com/images/500x0/336cc509349b45b5adb69a2f41c679ae/bia-heineken.jpeg', 10000, 8, 2),
	(50, 'Ổi', 'http://suckhoedoisong.vn/Images/hohuong/2016/11/22/oi-vi-thuoc-dan-gian-tuyet-voi1479802704.jpg', 5000, 8, 2),
	(51, 'Xoài', 'https://znews-photo-td.zadn.vn/w660/Uploaded/sgorvz/2016_06_14/qua_xoai_1.jpg', 8000, 9, 3),
	(52, 'Quýt', 'http://fruitshop.com.vn/image/cache/data/images%20(7)-700x700.jpg', 5000, 9, 3);
/*!40000 ALTER TABLE "Food" ENABLE KEYS */;

-- Dumping structure for table order.Order
CREATE TABLE IF NOT EXISTS "Order" (
	"Id" INT(10,0) NOT NULL,
	"FoodId" INT(10,0) NULL DEFAULT NULL,
	"Name" NVARCHAR(50) NULL DEFAULT NULL,
	"Qty" INT(10,0) NULL DEFAULT NULL,
	"Price" DECIMAL(18,0) NULL DEFAULT NULL,
	"Total" DECIMAL(18,0) NULL DEFAULT NULL,
	PRIMARY KEY ("Id")
);

-- Dumping data for table order.Order: -1 rows
/*!40000 ALTER TABLE "Order" DISABLE KEYS */;
/*!40000 ALTER TABLE "Order" ENABLE KEYS */;

-- Dumping structure for table order.Restaurant
CREATE TABLE IF NOT EXISTS "Restaurant" (
	"Id" INT(10,0) NOT NULL,
	"SessionId" INT(10,0) NULL DEFAULT NULL,
	"Name" NVARCHAR(50) NULL DEFAULT NULL,
	"Phone" NVARCHAR(50) NULL DEFAULT NULL COMMENT '',
	"Address" NVARCHAR(50) NULL DEFAULT NULL,
	"Image" NVARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY ("Id")
);

-- Dumping data for table order.Restaurant: -1 rows
/*!40000 ALTER TABLE "Restaurant" DISABLE KEYS */;
INSERT INTO "Restaurant" ("Id", "SessionId", "Name", "Phone", "Address", "Image") VALUES
	(1, NULL, 'Quán A', '123456789', '01 Nguyễn Công Trứ', 'https://www.vntrip.vn/cam-nang/wp-content/uploads/2016/07/quan-an-vat-o-hue-banh-beo-ba-do.jpg'),
	(2, NULL, 'Quán B', '123456789', '02 Nguyễn Công Trứ', 'http://hue360.net/wp-content/uploads/2017/06/dia-diem-quan-phu-hop-vat-tai-hue1.jpg'),
	(3, NULL, 'Quán C', '123456789', '03 Nguyễn Công Trứ', 'http://imagesfb.tintuc.vn/upload/images/khanhhoa/20170823/untitled.png'),
	(4, NULL, 'Quán D', '123456789', '04 Nguyễn Công Trứ', 'https://i.ytimg.com/vi/GHQlkw8pYMc/maxresdefault.jpg');
/*!40000 ALTER TABLE "Restaurant" ENABLE KEYS */;

-- Dumping structure for table order.Session
CREATE TABLE IF NOT EXISTS "Session" (
	"Id" INT(10,0) NOT NULL,
	"RestaurantId" INT(10,0) NULL DEFAULT NULL COMMENT '',
	"Date" DATETIME(3) NULL DEFAULT NULL,
	"Status" BIT NULL DEFAULT NULL,
	PRIMARY KEY ("Id")
);

-- Dumping data for table order.Session: -1 rows
/*!40000 ALTER TABLE "Session" DISABLE KEYS */;
/*!40000 ALTER TABLE "Session" ENABLE KEYS */;

-- Dumping structure for procedure order.sp_alterdiagram
DELIMITER //

	CREATE PROCEDURE dbo.sp_alterdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	//
DELIMITER ;

-- Dumping structure for procedure order.sp_creatediagram
DELIMITER //

	CREATE PROCEDURE dbo.sp_creatediagram
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	//
DELIMITER ;

-- Dumping structure for procedure order.sp_dropdiagram
DELIMITER //

	CREATE PROCEDURE dbo.sp_dropdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	//
DELIMITER ;

-- Dumping structure for procedure order.sp_helpdiagramdefinition
DELIMITER //

	CREATE PROCEDURE dbo.sp_helpdiagramdefinition
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	//
DELIMITER ;

-- Dumping structure for procedure order.sp_helpdiagrams
DELIMITER //

	CREATE PROCEDURE dbo.sp_helpdiagrams
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	//
DELIMITER ;

-- Dumping structure for procedure order.sp_renamediagram
DELIMITER //

	CREATE PROCEDURE dbo.sp_renamediagram
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	//
DELIMITER ;

-- Dumping structure for procedure order.sp_upgraddiagrams
DELIMITER //

	CREATE PROCEDURE dbo.sp_upgraddiagrams
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	//
DELIMITER ;

-- Dumping structure for table order.sysdiagrams
CREATE TABLE IF NOT EXISTS "sysdiagrams" (
	"name" NVARCHAR(128) NOT NULL,
	"principal_id" INT(10,0) NOT NULL,
	"diagram_id" INT(10,0) NOT NULL,
	"version" INT(10,0) NULL DEFAULT NULL,
	"definition" VARBINARY(max) NULL DEFAULT NULL,
	PRIMARY KEY ("diagram_id"),
	UNIQUE KEY ("principal_id","name")
);

-- Dumping data for table order.sysdiagrams: -1 rows
/*!40000 ALTER TABLE "sysdiagrams" DISABLE KEYS */;
INSERT INTO "sysdiagrams" ("name", "principal_id", "diagram_id", "version", "definition") VALUES
	('Diagram_Order', 1, 2, 1, ÐÏà¡±á                >  þÿ	                               þÿÿÿ        ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿýÿÿÿ   þÿÿÿ               	   
                     þÿÿÿþÿÿÿ                        þÿÿÿ      þÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿR o o t   E n t r y                                               ÿÿÿÿÿÿÿÿ                               PÂ|Ö:Ô   @
      f                                                                ÿÿÿÿÿÿÿÿÿÿÿÿ                                        z      o                                                                      ÿÿÿÿ                                       µ       C o m p O b j                                                  ÿÿÿÿÿÿÿÿÿÿÿÿ                                       _                               	   
                                    þÿÿÿ   þÿÿÿþÿÿÿ                      !   "   #   $   %   &   '   þÿÿÿþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ 4 
P  €#    ÿÿP   #    }  åL  /=  &Œ  8m  bþÿÿ¤ÿÿÞ€[ñ•Ð°  ª ½Ë\   0         < k   	       Ùæ°éÐ­Q  ÉW9ô;„aÇC…5)†áÕRø 2}²Øb•B˜'<%¢Ú-  ( C       SDMÒÑŽc `—ÒßH4ÉÒwywØp [„œ  ( C       QDMÒÑŽc `—ÒßH4ÉÒwywØp [„œ   „   ‘  0 ¥	    €       €    €SchGrid‰²>  ìÈÿÿAccount‰  4 ¥	    €   ¦   €  
  €SchGrid ^  NÁÿÿCategories    , ¥	    €   š   €    €SchGrid tõÿÿìÈÿÿFood  l ¥	    €   R   €  A  €Control Â
  ëÇÿÿRelationship 'FK_Food_Categories' between 'Categories' and 'Food'     ( µ    €   1   W   €  Control `  1Êÿÿ  0 ¥	    €   œ   €    €SchGrid œ  TÙÿÿOrderid   4 ¥	    €   ¦   €  
  €SchGrid ž  ð¦ÿÿRestaurant    x ¥	    €   R   €  M  €Control ]  §·ÿÿRelationship 'FK_Categories_Restaurant' between 'Restaurant' and 'Categories' Ë  ( µ    €	   1   c   €  Control    À½ÿÿ  l ¥	    €
   R   €  A  €Control   §·ÿÿRelationship 'FK_Food_Restaurant' between 'Restaurant' and 'Food'     ( µ    €   1   W   €  Control üÿÿ¿Àÿÿ  0 ¥	    €       €    €SchGrid ˜:  P°ÿÿSession   0 ¥	    €   ž   €    €SchGrid‰˜:  ¬ÛÿÿDetaild‰  p ¥	    €   R   €  G  €Control ú  O¯ÿÿRelationship 'FK_Restaurant_Session' between 'Session' and 'Restaurant'   ( µ    €   1   ]   €  Control‰³#  •±ÿÿ  ` ¥	    €   R   €  7  €Control Â
  SØÿÿRelationship 'FK_Order_Food' between 'Food' and 'Order'   ( µ    €   1   M   €  Control L  ™Úÿÿ       þÿ
  ÿÿÿÿ                   Microsoft DDS Form 2.0    Embedded Object     ô9²q                                             !C4   —    xV4     A c c o u n t   ­ 2â´j";´j   (°| ÿÿÿÿ   e“×Ýÿ €        (°| 	wj uj® yâ´jH3´j   (°| ÿÿÿÿT   (°| 	wj uj¯ ½â´jË?´j	   (°| ÿÿÿÿ   (°| 	wj uj° ã´jÕ?´j   (°| ÿÿÿÿº  (°|  	wj uj± Lã´jÕ?´j   (°| ÿÿÿÿo   O“ùÝâ €        (°                T   ,   ,   ,   4           ")  e      -             	  b  £  H  I  ì  ì  î  ì  6  G         —                      æ
         9  z                    	         9  4                      	          Ñ1  	#                     	  ª
    xV4   X                                        	   
      d b o      A c c o u n t   !C4   r  ò  xV4     C a t e g o r i e s   »Ý  €        (°| èwj ujŠ Ú´j'?´j   (°| ÿÿÿÿ    (°| ðwj uj‹ ¨´j4´j   (°| ÿÿÿÿ    (°| øwj ujŒ UÚ´j-?´j   (°| ÿÿÿÿ}  (°|  wj uj Sx´j6?´j   (°| ÿÿÿÿ|  ““ÍÝ €        (°| èwj ujª lá´jR6´j                 T   ,   ,   ,   4           ")  e      -             	  b  £  H  I  ì  ì  î  ì  6  G         r  ò                    ×
         9  À                    	         9  4                      	          Ñ1  	#                     	  ª
    xV4   ^                                        	   
      d b o      C a t e g o r i e s   !C4   z  0  xV4     F o o d   vj ujq             (°| ÿÿÿÿ   (°| ˆåvj ujs             (°| ÿÿÿÿ   (°| ”åvj ujt             (°| ÿÿÿÿ    (°|  åvj uju             (°| ÿÿÿÿ    ³Ü
 €        (°| Üåvj ujz             (°| ÿÿÿÿ    (°| èåvj uj{                   T   ,   ,   ,   4           ")  «      -             	  b  £  H  I  ì  ì  î  ì  6  G         z  0                    ×
         9  
                    	         9  4                      	          Ñ1  	#                     	  ª
    xV4   R                                        	   
      d b o      F o o d     ^  ‚Éÿÿî  ‚Éÿÿ       ððð                           `  1ÊÿÿD  X  6       D  X         €  €       DB Tahoma F K _ F o o d _ C a t e g o r i e s !C4   z  Ä  xV4     O r d e r   	   (°| ÿÿÿÿ  ð?(°|  wj uj¡ ß´j?´j   (°| ÿÿÿÿ    Q“Ý  €        (°| t	wj ujº …å´jþ?´j   (°| ÿÿÿÿ   (°| |	wj uj» Âå´j¸.´j   (°| ÿÿÿÿB   (°| „	wj uj¼ æ´j@´j   (°| ÿÿÿÿ    (°| Œ	wj uj½ Aæ´j@´j   (°| ÿÿ                T   ,   ,   ,   4           ")  e      -             	  b  £  H  I  ì  ì  î  ì  6  G         z  Ä                    ×
         9  4                      	         9  4                      	          Ñ1  	#                     	  ª
    xV4   T                                        	   
      d b o      O r d e r   !C4   ˆ  n  xV4     R e s t a u r a n t   uj¨ Üà´jH3´j   (°| ÿÿÿÿ  @(°| àwj uj© %á´j‹?´j   (°| ÿÿÿÿ   @“?Ý  €        (°|  
wj ujË õæ´jA@´j   (°| ÿÿÿÿ  @(°| Ä
wj ujÙ ç´jò=´j   (°| ÿÿÿÿ   @(°| Ø
wj ujÛ ç´jç5´j   (°| ÿÿÿÿ    (°|  åvj                 T   ,   ,   ,   4           ")  e      -             	  b  £  H  I  ì  ì  î  ì  6  G         ˆ  n                    ×
         9  z                    	         9  4                      	          Ñ1  	#                     	  ª
    xV4   ^                                        	   
      d b o      R e s t a u r a n t     ô  ^ºÿÿô  NÁÿÿ       ððð                    	          À½ÿÿ¥  X  <       ¥  X         €  €       DB Tahoma F K _ C a t e g o r i e s _ R e s t a u r a n t   4  ^ºÿÿ4  ìÈÿÿ       ððð                           üÿÿ¿Àÿÿ}  X  0       }  X       ÿÿÿ   €       DB Tahoma F K _ F o o d _ R e s t a u r a n t !C4   ˆ  Ù  xV4     S e s s i o n   Àa¹LLÖ                         `q@     @p@      ð?                                                                    ð?        Ä«–n        „l—nX—n    hLÖ                                       ‚C  ‚Ã                              T   ,   ,   ,   4           ")  e      -             	  b  £  H  I  ì  ì  î  ì  6  G         ˆ  Ù                    ×
         9  4                      	         9  4                      	          Ñ1  	#                     	  ª
    xV4   X                                        	   
      d b o      S e s s i o n   !C4   {  W  xV4     D e t a i l     @a¹´RÖ                   @      m@      1@      ð?                                                                    ð?        Ä«–n        „l—nX—n    ÐRÖ                                @      ˜A  ˆÁ   @                          T   ,   ,   ,   4           ")  «      -             	  b  £  H  I  ì  ì  î  ì  6  G         {  W                    ×
         9  z                    	         9  4                      	          Ñ1  	#                     	  ª
    xV4   V                                        	   
      d b o      D e t a i l     ˜:  æ°ÿÿ&  æ°ÿÿ       ððð                           ³#  •±ÿÿ×  X  @       ×  X       ÿÿÿ   €       DB Tahoma F K _ R e s t a u r a n t _ S e s s i o n   î  êÙÿÿœ  êÙÿÿ       ððð                           L  ™Úÿÿ  X  :         X       ÿÿÿ   €       DB Tahoma F K _ O r d e r _ F o o d                                                                             D d s S t r e a m                                                     ÿÿÿÿ                                       µ      S c h e m a   U D V   D e f a u l t                             &  ÿÿÿÿÿÿÿÿÿÿÿÿ                                              D S R E F - S C H E M A - C O N T E N T S                       ,       ÿÿÿÿ                                       „      S c h e m a   U D V   D e f a u l t   P o s t   V 6             6  ÿÿÿÿÿÿÿÿÿÿÿÿ                                    (             bþÿÿ¤ÿÿ &   s c h _ l a b e l s _ v i s i b l e            Ýÿÿ5—ÿÿVT  ©j  d                                               Ð   (   A c t i v e T a b l e V i e w M o d e          1       T a b l e V i e w M o d e : 0       :   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 , 1 8 9 0 , 5 , 1 2 6 0       T a b l e V i e w M o d e : 1          2 , 0 , 2 8 4 , 0 , 2 7 9 0       T a b l e V i e w M o d e : 2          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 3          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 4       >   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 2 , 2 7 3 0 , 1 1 , 1 6 8 0                         Ð   (   A c t i v e T a b l e V i e w M o d e          1       T a b l e V i e w M o d e : 0       :   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 , 1 8 9 0 , 5 , 1 2 6 0       T a b l e V i e w M o d e : 1          2 , 0 , 2 8 4 , 0 , 2 7 7 5       T a b l e V i e w M o d e : 2          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 3          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 4       >   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 2 , 2 7 3 0 , 1 1 , 1 6 8 0                         Ð   (   A c t i v e T a b l e V i e w M o d e          1       T a b l e V i e w M o d e : 0       :   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 , 1 8 9 0 , 5 , 1 2 6 0       T a b l e V i e w M o d e : 1          2 , 0 , 2 8 4 , 0 , 2 7 7 5       T a b l e V i e w M o d e : 2          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 3          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 4       >   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 2 , 2 7 3 0 , 1 1 , 1 6 8 0             6   ‹H   d b o   F K _ F o o d _ C a t e g o r i e s           Ä                ÚÃ ÚÃ        ­                           Ð   (   A c t i v e T a b l e V i e w M o d e          1       T a b l e V i e w M o d e : 0       :   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 , 1 8 9 0 , 5 , 1 2 6 0       T a b l e V i e w M o d e : 1          2 , 0 , 2 8 4 , 0 , 2 7 7 5       T a b l e V i e w M o d e : 2          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 3          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 4       >   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 2 , 2 7 3 0 , 1 1 , 1 6 8 0                         Ð   (   A c t i v e T a b l e V i e w M o d e          1       T a b l e V i e w M o d e : 0       :   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 , 1 8 9 0 , 5 , 1 2 6 0       T a b l e V i e w M o d e : 1          2 , 0 , 2 8 4 , 0 , 2 7 7 5       T a b l e V i e w M o d e : 2          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 3          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 4       >   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 2 , 2 7 3 0 , 1 1 , 1 6 8 0             B   ¸Ïp   d b o   F K _ C a t e g o r i e s _ R e s t a u r a n t           Ä    	   	         ØÃ ØÃ        ­     
   
       6   ‹H   d b o   F K _ F o o d _ R e s t a u r a n t           Ä          
      ÙÃ ÙÃ        ­                           Ð   (   A c t i v e T a b l e V i e w M o d e          1       T a b l e V i e w M o d e : 0       :   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 , 1 8 9 0 , 5 , 1 2 6 0       T a b l e V i e w M o d e : 1          2 , 0 , 2 8 4 , 0 , 2 7 7 5       T a b l e V i e w M o d e : 2          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 3          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 4       >   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 2 , 2 7 3 0 , 1 1 , 1 6 8 0                         Ð   (   A c t i v e T a b l e V i e w M o d e          1       T a b l e V i e w M o d e : 0       :   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 , 1 8 9 0 , 5 , 1 2 6 0       T a b l e V i e w M o d e : 1          2 , 0 , 2 8 4 , 0 , 2 7 7 5       T a b l e V i e w M o d e : 2          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 3          2 , 0 , 2 8 4 , 0 , 2 3 1 0       T a b l e V i e w M o d e : 4       >   4 , 0 , 2 8 4 , 0 , 2 3 1 0 , 1 2 , 2 7 3 0 , 1 1 , 1 6 8 0             <   ¿   d b o   F K _ R e s t a u r a n t _ S e s s i o n           Ä                ÕÃàÕÃ        ­               ,         d b o   F K _ O r d e r _ F o o d           Ä                ÕÃ ÕÃ        ­                 d   K            ƒ   J            A       
            >            J   k                                                                                            Na¼                                           Ûæ°éÐ­Q  ÉW9   ÐÅqÖ:Ô  HE                 Ä  D a t a   S o u r c e = H U Y - R E A L \ H U Y ; I n i t i a l   C a t a l o g = o r d e r ; I n t e g r a t e d   S e c u r i t y = T r u e ; M u l t i p l e A c t i v e R e s u l t S e t s = F a l s e ; C o n n e c t   T i m e o u t = 3 0 ; T r u s t S e r v e r C e r t i f i c a t e = F a l s e ; P a c k e t   S i z e = 4 0 9 6 ; A p p l i c a t i o n   N a m e = " M i c r o s o f t   S Q L   S e r v e r   M a n a g e m e n t   S t u d i o "    €    D i a g r a m _ O r d e r    &    D e t a i l      d b o    &    S e s s i o n      d b o    &    R e s t a u r a n t      d b o    &    O r d e r      d b o    & 
   F o o d      d b o    &    C a t e g o r i e s      d b o    $    A c c o u n t      d b o      Ö…	³»kòEš¸7dð2p N   { 1 6 3 4 C D D 7 - 0 8 8 8 - 4 2 E 3 - 9 F A 2 - B 6 D 3 2 5 6 3 B 9 1 D }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           bˆR);
/*!40000 ALTER TABLE "sysdiagrams" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
