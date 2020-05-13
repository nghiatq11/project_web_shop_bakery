/**Phan trang theo category**/
alter PROC spGetRecordsByPageAndSizeAndCategory
@Page INT,
@Size INT,
@Category INT
AS
BEGIN
	SELECT * FROM product where deleted = 0 and category_id = @category
	ORDER BY id desc
	OFFSET (@Page -1) * @Size ROWS
	FETCH NEXT @Size ROWS ONLY
END

select * from product
EXECUTE spGetRecordsByPageAndSizeAndCategory 1, 9 , 5

/**Phan trang filter Price san pham**/
alter PROC spGetRecordsByPageAndSizeAndFilterPrice
@Page INT,
@Size INT,
@priceFrom INT,
@toPrice INT
AS
BEGIN
	SELECT * FROM product where deleted = 0 and price >= @priceFrom and price < @toPrice
	ORDER BY id desc
	OFFSET (@Page -1) * @Size ROWS
	FETCH NEXT @Size ROWS ONLY
END

select * from product
EXECUTE spGetRecordsByPageAndSizeAndFilterPrice 2, 9 , 200000, 500000

/**Phan trang all san pham**/
alter PROC spGetRecordsByPageAndSize
@Page INT,
@Size INT
AS
BEGIN
	SELECT * FROM product where deleted = 0
	ORDER BY id DESC
	OFFSET (@Page -1) * @Size ROWS
	FETCH NEXT @Size ROWS ONLY
END

select * from product
EXECUTE spGetRecordsByPageAndSize 1, 9

/**Phan trang top sản phẩm mới nhất**/
alter PROC pagingTopProducts
@Page INT,
@Size INT,
@numberTop int
AS
BEGIN
	select * from 
	(SELECT top (@numberTop)* FROM product WHERE deleted = 0
	ORDER BY id desc) as table1
	ORDER BY id desc
	OFFSET (@Page -1) * @Size ROWS
	FETCH NEXT @Size ROWS ONLY
END
select * from product
EXECUTE pagingTopProducts 1, 8, 8

/**Phan trang sanr phaamr search**/
alter PROC pagingSearchProducts
@Page INT,
@Size INT,
@string varchar(100)
AS
BEGIN
	select * from 
	(select * from product WHERE name LIKE N'%'+@string+'%' and deleted = 0
	) as table1
	ORDER BY id asc
	OFFSET (@Page -1) * @Size ROWS
	FETCH NEXT @Size ROWS ONLY
END

EXECUTE pagingSearchProducts 1, 9, ''

select * from product WHERE name LIKE N'%bánh%' and deleted = 0