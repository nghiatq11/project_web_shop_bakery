create table [order](
	id int identity,
	customer_info_id int,
	total_price decimal(18),
	note nvarchar(1000),
	create_date date default getdate(),
	status int,
	primary key(id)
)

create table order_detail(
	id int identity,
	order_id int ,
	product_id int,
	product_name nvarchar(200),
	product_price decimal(18),
	quantity int,
	primary key (id)
)

create table customer_info(
	id int identity,
	name nvarchar(100),
	mobile nvarchar(15),
	email nvarchar(100),
	address nvarchar(2000),
	primary key (id)
)