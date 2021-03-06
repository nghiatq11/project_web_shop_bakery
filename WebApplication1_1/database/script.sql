USE [shop]
GO
/****** Object:  Table [dbo].[account]    Script Date: 11/15/2019 9:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_detail_id] [int] NULL,
	[email] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[account_detail]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[mobie] [nvarchar](50) NULL,
	[gender] [int] NULL,
	[address] [nvarchar](1500) NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_account_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_info]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[mobile] [nvarchar](15) NULL,
	[email] [nvarchar](100) NULL,
	[address] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[filter_price]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filter_price](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price_from] [int] NULL,
	[to_price] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_filter_price] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [int] NULL,
	[link_img] [varchar](500) NULL,
	[cover] [bit] NULL,
	[deleted] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_info_id] [int] NULL,
	[total_price] [decimal](18, 0) NULL,
	[note] [nvarchar](1000) NULL,
	[create_date] [date] NULL,
	[status] [int] NULL,
	[account_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[product_name] [nvarchar](200) NULL,
	[product_price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brand_id] [int] NULL,
	[category_id] [int] NULL,
	[name] [nvarchar](200) NULL,
	[price] [float] NULL,
	[description] [nvarchar](500) NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [account_detail_id], [email], [password], [status], [deleted]) VALUES (1, 1, N'nghiatqhe130530@gmail.com', N'123456', 1, 0)
INSERT [dbo].[account] ([id], [account_detail_id], [email], [password], [status], [deleted]) VALUES (2, 2, N'quang@gmail.com', N'123456a', 1, 0)
INSERT [dbo].[account] ([id], [account_detail_id], [email], [password], [status], [deleted]) VALUES (3, 5, N'namdhhe130675@fpt.edu.vn', N'222222', 1, 0)
INSERT [dbo].[account] ([id], [account_detail_id], [email], [password], [status], [deleted]) VALUES (4, 6, N'tien@gmail.com', N'123', 1, 0)
SET IDENTITY_INSERT [dbo].[account] OFF
SET IDENTITY_INSERT [dbo].[account_detail] ON 

INSERT [dbo].[account_detail] ([id], [name], [mobie], [gender], [address], [deleted]) VALUES (1, N'qang nghia', N'1234567891', 1, N'Nam Định', 0)
INSERT [dbo].[account_detail] ([id], [name], [mobie], [gender], [address], [deleted]) VALUES (2, N'tran quang', N'9876543211', 2, N'Mỹ Thắng', 0)
INSERT [dbo].[account_detail] ([id], [name], [mobie], [gender], [address], [deleted]) VALUES (5, N'văn thái', N'1111111111', 1, N'Nam định', 0)
INSERT [dbo].[account_detail] ([id], [name], [mobie], [gender], [address], [deleted]) VALUES (6, N'nam tiến', N'8888888888', 2, N'Ba Vì', 0)
SET IDENTITY_INSERT [dbo].[account_detail] OFF
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (1, N'Bánh Ăn Vặt', 0)
INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (2, N'Bánh Ăn Sáng', 0)
INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (3, N'Bánh Ăn Trưa', 1)
INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (4, N'Bánh Ăn Tối', 0)
INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (5, N'Bánh Trung Thu', 0)
INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (6, N'Bánh Bông Lan', 0)
INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (7, N'Bánh Sinh Nhật', 0)
INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (8, N'Bánh Ăn Kèm Đồ Uống', 0)
INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (31, N'Bánh Socola', 1)
INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (32, N'Bánh Socola', 1)
INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (33, N'Bánh Socola', 1)
INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (34, N'Bánh Socola', 1)
INSERT [dbo].[category] ([id], [name], [deleted]) VALUES (35, N'Bánh Socola', 0)
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[customer_info] ON 

INSERT [dbo].[customer_info] ([id], [name], [mobile], [email], [address]) VALUES (1046, N'tran quang', N'9876543210', N'quang@gmail.com', N'Mỹ Thắng')
INSERT [dbo].[customer_info] ([id], [name], [mobile], [email], [address]) VALUES (1047, N'tran quang', N'9876543210', N'quang@gmail.com', N'Mỹ Thắng')
INSERT [dbo].[customer_info] ([id], [name], [mobile], [email], [address]) VALUES (1048, N'tran quang', N'9876543210', N'quang@gmail.com', N'Mỹ Thắng')
INSERT [dbo].[customer_info] ([id], [name], [mobile], [email], [address]) VALUES (1049, N'', N'1234567890', N'', N'Nam định')
INSERT [dbo].[customer_info] ([id], [name], [mobile], [email], [address]) VALUES (1050, N'nn', N'9999999999', N'quangnghia1105@gmail.com', N'Nam định')
INSERT [dbo].[customer_info] ([id], [name], [mobile], [email], [address]) VALUES (1051, N'qu', N'9999999999', N'quangnghia1105@gmail.com', N'Nam định')
INSERT [dbo].[customer_info] ([id], [name], [mobile], [email], [address]) VALUES (1052, N'tran quang', N'9876543211', N'quang@gmail.com', N'Mỹ Thắng')
INSERT [dbo].[customer_info] ([id], [name], [mobile], [email], [address]) VALUES (1053, N'tran quang', N'9876543211', N'quang@gmail.com', N'Mỹ Thắng')
INSERT [dbo].[customer_info] ([id], [name], [mobile], [email], [address]) VALUES (1054, N'tran quang', N'9876543211', N'quang@gmail.com', N'Mỹ Thắng')
INSERT [dbo].[customer_info] ([id], [name], [mobile], [email], [address]) VALUES (1055, N'quang nghia', N'1234567899', N'quang@gmail.com', N'Nam định')
SET IDENTITY_INSERT [dbo].[customer_info] OFF
SET IDENTITY_INSERT [dbo].[filter_price] ON 

INSERT [dbo].[filter_price] ([id], [price_from], [to_price], [deleted]) VALUES (1, 0, 50000, 0)
INSERT [dbo].[filter_price] ([id], [price_from], [to_price], [deleted]) VALUES (2, 50000, 100000, 0)
INSERT [dbo].[filter_price] ([id], [price_from], [to_price], [deleted]) VALUES (3, 100000, 200000, 0)
INSERT [dbo].[filter_price] ([id], [price_from], [to_price], [deleted]) VALUES (4, 200000, 500000, 0)
INSERT [dbo].[filter_price] ([id], [price_from], [to_price], [deleted]) VALUES (5, 500000, 1000000, 0)
INSERT [dbo].[filter_price] ([id], [price_from], [to_price], [deleted]) VALUES (6, 1000000, 2000000, 0)
INSERT [dbo].[filter_price] ([id], [price_from], [to_price], [deleted]) VALUES (7, 2000000, 5000000, 0)
SET IDENTITY_INSERT [dbo].[filter_price] OFF
SET IDENTITY_INSERT [dbo].[image] ON 

INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1, 1, N'img_main/product_1.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2, 2, N'img_main/product_2.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (3, 3, N'img_main/product_3.jpg', 1, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (4, 4, N'img_main/product_4.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (5, 5, N'img_main/product_5.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (6, 6, N'img_main/product_6.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (7, 7, N'img_main/product_7.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (8, 8, N'img_main/product_8.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (9, 9, N'img_main/product_9.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (10, 1, N'img_sub/product_1sub1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (11, 1, N'img_sub/product_1sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (12, 1, N'img_sub/product_1sub3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (13, 1, N'img_sub/product_1sub4.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (14, 11, N'img_main/banhBongLanTrungMuoi1.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (15, 2, N'img_sub/product_2sub1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (16, 2, N'img_sub/product_2sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (17, 2, N'img_sub/product_2sub3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (18, 2, N'img_sub/product_2sub4.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (19, 3, N'img_sub/product_4.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (20, 3, N'img_sub/product_5.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (21, 3, N'img_sub/product_1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (22, 3, N'img_sub/product_2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (23, 4, N'img_sub/product_4sub1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (24, 4, N'img_sub/product_4sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (25, 4, N'img_sub/product_4sub3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (26, 4, N'img_sub/product_4sub4.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (27, 5, N'img_sub/product_5sub1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (28, 5, N'img_sub/product_5sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (29, 5, N'img_sub/product_5sub3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (30, 5, N'img_sub/product_5sub4.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (31, 6, N'img_sub/product_6sub1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (32, 6, N'img_sub/product_6sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (33, 6, N'img_sub/product_6sub3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (34, 6, N'img_sub/product_6sub4.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (35, 7, N'img_sub/product_7sub1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (36, 7, N'img_sub/product_7sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (37, 7, N'img_sub/product_7sub3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (38, 7, N'img_sub/product_7sub4.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (47, 12, N'img_main/product_1.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (48, 12, N'img_main/product_1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (49, 12, N'img_main/product_1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (50, 12, N'img_main/product_1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (51, 12, N'img_main/product_1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (52, 13, N'img_main/product_10.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (53, 13, N'img_sub/product_10sub1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (54, 13, N'img_sub/product_10sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (55, 13, N'img_sub/product_10sub3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (56, 13, N'img_sub/product_10sub4.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (57, 14, N'img_main/product_11.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (58, 14, N'img_sub/product_11sub1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (59, 14, N'img_sub/product_11sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (60, 14, N'img_sub/product_11sub3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (61, 14, N'img_sub/product_11sub4.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1047, 1012, N'img_main/product_2.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1048, 1012, N'img_sub/product_2sub1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1049, 1012, N'img_sub/product_1sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1050, 1012, N'img_sub/product_1sub3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1051, 1012, N'img_sub/product_1sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1052, 1013, N'img_main/BongLanTraSua.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1053, 1013, N'img_sub/BongLanTraSua_sub_1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1054, 1013, N'img_sub/BongLanTraSua_sub_2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1055, 1014, N'img_main/Coconut angel Food Cake.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1056, 1014, N'img_sub/Coconut angel Food Cake_sub_1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1057, 1014, N'img_sub/Coconut angel Food Cake_sub_2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1058, 1015, N'img_main/bánh Red Velvet.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1059, 1015, N'img_sub/bánh Red Velvet_sub_1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1060, 1015, N'img_sub/bánh Red Velvet_sub_2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1061, 1015, N'img_sub/bánh Red Velvet_sub_3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1062, 1016, N'img_main/BanhTrangGuong.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1063, 1016, N'img_sub/BanshTrangGuongSub_1.png', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1064, 1016, N'img_sub/BanshTrangGuongSub_1.png', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1066, 1040, N'img_main/banhChuoi.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1067, 1040, N'img_sub/banhChuoi_sub1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1068, 1040, N'img_sub/banhChuoi_sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1069, 1040, N'img_sub/banhChuoi_sub3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1077, 1055, N'img_main\BanhBongLanCuon.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1078, 1055, N'img_sub\BanhBongLanCuon_sub_1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1079, 1055, N'img_sub\BanhBongLanCuon_sub_2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1080, 1056, N'img_main\BanhBongLanCuon.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1081, 1056, N'img_sub\BanhBongLanCuon_sub_1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (1082, 1056, N'img_sub\BanhBongLanCuon_sub_2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2081, 2055, N'img_main\73110397_2898507093539574_7384613511424376832_o.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2082, 2055, N'img_sub\74956757_2898507000206250_5730970086496272384_n.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2083, 2055, N'img_sub\75446612_2898507040206246_4902233001154314240_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2088, 2057, N'img_main\73187083_2888068617916755_709835863554523136_o.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2089, 2057, N'img_sub\73352263_2888068547916762_4574515065050365952_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2090, 2057, N'img_sub\73472732_2888068691250081_8395170190337245184_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2091, 2057, N'img_sub\74331134_2888068484583435_1132757668239245312_n.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2102, 2061, N'img_main\71804341_2847838715273079_1504872887440375808_o.jpg', 1, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2103, 2061, N'img_sub\72439280_2847838855273065_206044501905506304_o.jpg', 0, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2104, 2061, N'img_sub\72809512_2847838755273075_3737929103068626944_o.jpg', 0, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2105, 2062, N'img_main\72137487_2847838628606421_7836374634227302400_n.jpg', 1, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2106, 2062, N'img_sub\72439280_2847838855273065_206044501905506304_o.jpg', 0, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2107, 2062, N'img_sub\72809512_2847838755273075_3737929103068626944_o.jpg', 0, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2126, 2068, N'img_main\70349079_2805176962872588_5163072214785851392_n.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2127, 2068, N'img_sub\70427155_2805177312872553_4530960042219798528_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2128, 2068, N'img_sub\70443879_2805177226205895_7957803878060130304_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2129, 2068, N'img_sub\70508031_2805177326205885_4823162322522472448_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2130, 2068, N'img_sub\70954841_2805177246205893_8546443053081034752_o.jpg', 0, 0)
GO
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2074, 2053, N'img_main\Screenshot (11).png', 1, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (39, 8, N'img_sub/product_8sub1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (40, 8, N'img_sub/product_8sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (41, 8, N'img_sub/product_8sub3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (42, 8, N'img_sub/product_8sub4.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (43, 9, N'img_sub/product_9sub1.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (44, 9, N'img_sub/product_9sub2.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (45, 9, N'img_sub/product_9sub3.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (46, 9, N'img_sub/product_9sub4.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2118, 2066, N'img_main\71335425_2836407993082818_4495698966310027264_o.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2119, 2066, N'img_sub\71672221_2836597479730536_3030491914324410368_n.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2120, 2066, N'img_sub\71915866_2836597513063866_4821551834340524032_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2121, 2066, N'img_sub\72230049_2836597583063859_5838067415304372224_n.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2122, 2066, N'img_sub\72268626_2836597596397191_4193725356236079104_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2123, 2067, N'img_main\71562721_2832642146792736_8423165860914397184_o.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2124, 2067, N'img_sub\71668423_2828691380521146_4010111935214256128_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2125, 2067, N'img_sub\71914139_2828692137187737_1570461290067918848_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2075, 2053, N'img_sub\Screenshot (12).png', 0, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2076, 2053, N'img_sub\Screenshot (13).png', 0, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2078, 2054, N'img_main\73059986_2897150850341865_789204462592851968_o.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2079, 2054, N'img_sub\73181173_2897151083675175_5015937853679468544_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2080, 2054, N'img_sub\74649800_2897151017008515_3089042003720142848_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2084, 2056, N'img_main\74522929_2894748180582132_7230096513853030400_o.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2085, 2056, N'img_sub\74595542_2894748057248811_3906540203325521920_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2086, 2056, N'img_sub\75204650_2894748273915456_1889316638465982464_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2087, 2056, N'img_sub\75303398_2894748093915474_1786634170965950464_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2114, 2065, N'img_main\71726690_2845902632133354_4335815454346969088_n.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2115, 2065, N'img_sub\71804727_2845903318799952_5166026585349816320_n.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2116, 2065, N'img_sub\71865211_2845902785466672_2862620184097587200_n.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2117, 2065, N'img_sub\72524524_2845902905466660_5252853588371177472_n.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2131, 2069, N'img_main\70150354_2801177646605853_8445536249615220736_o.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2132, 2069, N'img_sub\70658239_2801177623272522_2057754303648497664_n.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2133, 2069, N'img_sub\70880509_2801177743272510_8941863177147121664_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2077, 2053, N'img_sub\Screenshot (17).png', 0, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2108, 2063, N'img_main\72439280_2847838855273065_206044501905506304_o.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2109, 2063, N'img_sub\72775757_2847838591939758_6644702418552487936_n.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2110, 2063, N'img_sub\72809512_2847838755273075_3737929103068626944_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2092, 2058, N'img_main\72685100_2877957628927854_6945786781417603072_o.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2093, 2058, N'img_sub\74565147_2877957588927858_7167547569386553344_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2094, 2058, N'img_sub\74601334_2877957728927844_7489416249659621376_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2095, 2058, N'img_sub\74670749_2877957715594512_6981281671052001280_o.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2096, 2059, N'img_main\71804341_2847838715273079_1504872887440375808_o.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2097, 2059, N'img_sub\72137487_2847838628606421_7836374634227302400_n.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2098, 2059, N'img_sub\72775757_2847838591939758_6644702418552487936_n.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2099, 2060, N'img_main\71804341_2847838715273079_1504872887440375808_o.jpg', 1, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2100, 2060, N'img_sub\72439280_2847838855273065_206044501905506304_o.jpg', 0, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2101, 2060, N'img_sub\72809512_2847838755273075_3737929103068626944_o.jpg', 0, 1)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2111, 2064, N'img_main\71691493_2846693862054231_8071157397965504512_n.jpg', 1, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2112, 2064, N'img_sub\72192603_2846694242054193_544460677557780480_n.jpg', 0, 0)
INSERT [dbo].[image] ([id], [Product_id], [link_img], [cover], [deleted]) VALUES (2113, 2064, N'img_sub\72282040_2846694542054163_2246885262997061632_n.jpg', 0, 0)
SET IDENTITY_INSERT [dbo].[image] OFF
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [customer_info_id], [total_price], [note], [create_date], [status], [account_id]) VALUES (1038, 1046, CAST(380000 AS Decimal(18, 0)), N'hàng sễ vỡ nhớ nhẹ tay', CAST(N'2019-10-30' AS Date), 0, 0)
INSERT [dbo].[order] ([id], [customer_info_id], [total_price], [note], [create_date], [status], [account_id]) VALUES (1039, 1047, CAST(380000 AS Decimal(18, 0)), N'hàng sễ vỡ nhớ nhẹ tay a j', CAST(N'2019-10-30' AS Date), 0, 0)
INSERT [dbo].[order] ([id], [customer_info_id], [total_price], [note], [create_date], [status], [account_id]) VALUES (1040, 1048, CAST(305000 AS Decimal(18, 0)), N'hàng sễ vỡ nhớ nhẹ tay a j', CAST(N'2019-10-30' AS Date), 0, 2)
INSERT [dbo].[order] ([id], [customer_info_id], [total_price], [note], [create_date], [status], [account_id]) VALUES (1041, 1051, CAST(1200000 AS Decimal(18, 0)), N'hàng sễ vỡ nhớ nhẹ tay', CAST(N'2019-11-04' AS Date), 0, 0)
INSERT [dbo].[order] ([id], [customer_info_id], [total_price], [note], [create_date], [status], [account_id]) VALUES (1042, 1052, CAST(170000 AS Decimal(18, 0)), N'ship đến hà nội', CAST(N'2019-11-11' AS Date), 0, 2)
INSERT [dbo].[order] ([id], [customer_info_id], [total_price], [note], [create_date], [status], [account_id]) VALUES (1043, 1053, CAST(70000 AS Decimal(18, 0)), N'hàng sễ vỡ nhớ nhẹ tay', CAST(N'2019-11-12' AS Date), 0, 2)
INSERT [dbo].[order] ([id], [customer_info_id], [total_price], [note], [create_date], [status], [account_id]) VALUES (1044, 1054, CAST(100000 AS Decimal(18, 0)), N'', CAST(N'2019-11-12' AS Date), 0, 2)
INSERT [dbo].[order] ([id], [customer_info_id], [total_price], [note], [create_date], [status], [account_id]) VALUES (1045, 1055, CAST(15000 AS Decimal(18, 0)), N'hàng sễ vỡ nhớ nhẹ tay', CAST(N'2019-11-12' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[order] OFF
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1099, 1038, 13, N'Bánh Trung Thu Mặt Trăng', CAST(230000 AS Decimal(18, 0)), 1)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1100, 1038, 9, N'Bánh Trung Thu Sung Túc', CAST(150000 AS Decimal(18, 0)), 1)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1101, 1039, 13, N'Bánh Trung Thu Mặt Trăng', CAST(230000 AS Decimal(18, 0)), 1)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1102, 1039, 9, N'Bánh Trung Thu Sung Túc', CAST(150000 AS Decimal(18, 0)), 1)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1103, 1040, 13, N'Bánh Trung Thu Mặt Trăng', CAST(230000 AS Decimal(18, 0)), 1)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1104, 1040, 11, N'Bánh Bông Lan Trứng Muối', CAST(75000 AS Decimal(18, 0)), 1)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1105, 1041, 1015, N'bánh Red Velvet', CAST(400000 AS Decimal(18, 0)), 1)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1106, 1041, 1, N'Bánh Trung Thu Bình An', CAST(200000 AS Decimal(18, 0)), 4)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1107, 1042, 1056, N'Bánh Bông Lan Cuộn', CAST(30000 AS Decimal(18, 0)), 4)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1108, 1042, 1040, N'Bánh Chuối', CAST(50000 AS Decimal(18, 0)), 1)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1109, 1043, 2069, N'Socola Tươi Đen Đắng', CAST(70000 AS Decimal(18, 0)), 1)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1110, 1044, 2069, N'Socola Tươi Đen Đắng', CAST(70000 AS Decimal(18, 0)), 1)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1111, 1044, 2068, N' Bánh Mousse Chanh Dây', CAST(30000 AS Decimal(18, 0)), 1)
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1112, 1045, 2067, N'Bánh rán DORAEMON 2019', CAST(15000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[order_detail] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1, 1, 5, N'Bánh Trung Thu Bình An', 200000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2, 1, 5, N'Bánh Trung Thu Đoàn Viên', 250000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 2, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (3, 1, 5, N'Bánh Trung Thu Hương Liên', 300000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 3, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (4, 1, 5, N'Bánh Trung Thu Tứ Quý', 350000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (5, 1, 5, N'Bánh Trung Thu Lục Cát', 400000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (6, 1, 5, N'Bánh Trung Thu Như Ý', 450000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 2, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (7, 1, 5, N'Bánh Trung Thu Song Tâm', 350000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (8, 1, 5, N'Bánh Trung Thu Sung Túc', 300000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (9, 1, 5, N'Bánh Trung Thu Sung Túc', 150000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 2, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (11, 1, 6, N'Bánh Bông Lan Trứng Muối', 75000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (12, 1, 7, N'Bánh Sinh Nhật Cỡ Lớn', 500000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (13, 1, 5, N'Bánh Trung Thu Mặt Trăng', 230000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (14, 1, 5, N'Bánh Trung Thu Mặt Trời', 240000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1012, 1, 5, N'Bánh Trung Thu Sao Hỏa', 315000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1013, 1, 6, N'Bông Lan Trà Sữa', 70000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1014, 1, 6, N'Coconut angel Food Cake', 150000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1015, 1, 7, N'bánh Red Velvet', 400000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1016, 1, 7, N'Bánh Tráng Gương', 200000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1040, 1, 1, N'Bánh Chuối', 50000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1055, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1056, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1057, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1058, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1059, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1060, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1061, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1062, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1063, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1064, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1065, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1066, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1067, 1, 6, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1068, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1069, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1070, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1071, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1072, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1073, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (1074, 1, 1, N'Bánh Bông Lan Cuộn', 30000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2051, 1, 1, N'áo dài tay', 15000, N'xxx', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2052, 1, 1, N'áo dài tay', 15000, N'ccccccccccccccccccccc', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2053, 1, 1, N'áo dài tay', 15000, N'zzzzz', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2054, 1, 6, N'Bánh Bông Lan Cam', 50000, N'Mộc với sản phẩm bánh luôn đạt tiêu chí Mộc Mạc và chất lượng.ất cả các nguyên vật liệu đều đảm bảo sạch sẽ, nói không với hoá chất và chất bảo quản', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2055, 1, 1, N'MATCHA SOUFFLE', 30000, N'Biết nói gì hôm nay
Khi hai người ngồi ăn ngon mồm rồi 😀 😀
Nhảm nhí và xàm xí nhưng bánh ngon là có thật ☄️☄️☄️
Nay tiệm có mẻ bánh MATCHA SOUFFLE❤️
Bác nào Iêu ẻm thì ib e nhé ☎️☎️☎️', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2056, 1, 2, N'Socola Dâu Tây', 25000, N'Rét này ngồi nhà lại buồn mồm muốn có gì gặm nhấm🥞🍕🥯
😝😝😝Thấu hiểu đến tột cùng nỗi khổ của ce
Tiệm làm bánh này phục vụ chị em. Chị em có thấy phấn khích không ☎️☎️☎️
Đố ce đoán được tên bánh này. Ai đoán đúng có thưởng nha 😍🥰😘', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2057, 1, 1, N'Bánh Trái Cây Rau Củ', 20000, N'👻👻👻Khi ăn hết mình
Khi ngon hết hồn :))
💥💥💥Bánh trái cây, rau củ cực tốt cho sức khỏe và đặc biệt là các bạn nhỏ', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2058, 1, 1, N'Bánh LaVa', 25000, N'Ai là phần của lava thì bơi ngay vào đây nèo
Molten lava cake😍
Ăn siêu ngon, giá siêu mềm, vị siêu chất 😛 😛 😛
', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2059, 1, 8, N'Bánh Quy', 60000, N'“Chiều nay lại có mưa rơi
Sao thèm vị ngọt đôi môi chết người”
Có bác nào như em không ạ, em thèm ngọt nhưng là ngọt của bánh nhé 😀
🌧🌧🌧Mưa này ngồi nhâm nhi tách trà với đĩa bánh quy thì thôi rồi.
👩🏻‍🍳👩🏻‍🍳👩🏻‍🍳Cứ nghĩ đến lại thèm. Mỗi khi ra lò mẻ bánh quy mùi bơ béo ngậy, thơm phức hòa quyện với mùi đặc trưng của các loại hạt lại làm em không kìm lòng được', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2060, 1, 8, N'Bánh Quy Bọc Dừa', 15000, N'“Chiều nay lại có mưa rơi
Sao thèm vị ngọt đôi môi chết người”
Có bác nào như em không ạ, em thèm ngọt nhưng là ngọt của bánh nhé 😀
🌧🌧🌧Mưa này ngồi nhâm nhi tách trà với đĩa bánh quy thì thôi rồi.
👩🏻‍🍳👩🏻‍🍳👩🏻‍🍳Cứ nghĩ đến lại thèm. Mỗi khi ra lò mẻ bánh quy mùi bơ béo ngậy, thơm phức hòa quyện với mùi đặc trưng của các loại hạt lại làm em không kìm lòng được', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2061, 1, 8, N'Bánh Quy Bọc Dừa', 15000, N'“Chiều nay lại có mưa rơi
Sao thèm vị ngọt đôi môi chết người”
Có bác nào như em không ạ, em thèm ngọt nhưng là ngọt của bánh nhé 😀
🌧🌧🌧Mưa này ngồi nhâm nhi tách trà với đĩa bánh quy thì thôi rồi.
👩🏻‍🍳👩🏻‍🍳👩🏻‍🍳Cứ nghĩ đến lại thèm. Mỗi khi ra lò mẻ bánh quy mùi bơ béo ngậy, thơm phức hòa quyện với mùi đặc trưng của các loại hạt lại làm em không kìm lòng được', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2062, 1, 8, N'Bánh Quy Bọc Dừa', 15000, N'“Chiều nay lại có mưa rơi
Sao thèm vị ngọt đôi môi chết người”
Có bác nào như em không ạ, em thèm ngọt nhưng là ngọt của bánh nhé 😀
🌧🌧🌧Mưa này ngồi nhâm nhi tách trà với đĩa bánh quy thì thôi rồi.
👩🏻‍🍳👩🏻‍🍳👩🏻‍🍳Cứ nghĩ đến lại thèm. Mỗi khi ra lò mẻ bánh quy mùi bơ béo ngậy, thơm phức hòa quyện với mùi đặc trưng của các loại hạt lại làm em không kìm lòng được', 1, 1)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2063, 1, 8, N'Bánh Quy Bọc Dừa', 15000, N'“Chiều nay lại có mưa rơi
Sao thèm vị ngọt đôi môi chết người”
Có bác nào như em không ạ, em thèm ngọt nhưng là ngọt của bánh nhé 😀
🌧🌧🌧Mưa này ngồi nhâm nhi tách trà với đĩa bánh quy thì thôi rồi.
👩🏻‍🍳👩🏻‍🍳👩🏻‍🍳Cứ nghĩ đến lại thèm. Mỗi khi ra lò mẻ bánh quy mùi bơ béo ngậy, thơm phức hòa quyện với mùi đặc trưng của các loại hạt lại làm em không kìm lòng được', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2064, 1, 1, N' Bánh Cá Taiyaki', 15000, N'👩🏻‍🍳👩🏻‍🍳👩🏻‍🍳Món bánh cá Taiyaki cực kì được yêu thích tại nhật bản
Với lớp vỏ bánh giòn, thơm mùi bơ hoà quyện cùng lớp nhân đậu bùi ngậy hoặc nhân phô mai mặn có thể hạ gục bất kì ai nếm thử😍😍
⚡️⚡️⚡️Đặc biệt món bánh này cực kì được các bánh nhỏ yêu thích vì vẻ ngoài bắt mắt đáng yêu và quan trọng hơn là cực kì dễ ăn ak
Bánh đã về với nhà Mộc
👍👍👍Tiêu chí: “Ngon, Bổ, Sạch”', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2065, 1, 35, N'Viên Socola', 10000, N'"Muốn được yêu chứ không đơn độc
Muốn vui tươi chứ chẳng mãi u sầu"
🤱💑👩‍🏫Những người mẹ tảo tần nuôi nấng, những người vợ sớm hôm kề vai hay những người cô hết lòng dạy dỗ.
Họ cho đi mà chưa bao giờ đòi nhận lại 🌞🌞
🥰😘😘Vì vậy hãy dẹp bỏ ngại ngùng, trao gửi lời yêu thương tới những người phụ nữ quan trọng của cuộc đời mình trong ngày Phụ nữ Việt Nam.
🤝🤝🤝Mộc luôn đồng hành cùng bạn trong hành trình trao gửi yêu thương.
⚡️⚡️⚡️Các mẫu socola cho ngày 20/10 cả nhà nhé', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2066, 1, 2, N'Bánh Macaron', 15000, N'🇳🇱🇳🇱🇳🇱Bạn yêu mến nước pháp, yêu mến ẩm thực pháp chắc hẳn sẽ không xa lạ với macaron
💃🏻💃🏻💃🏻Được mệnh danh là nàng tiểu thư kiêu kỳ của nước Pháp, Macaron khiến bao người mê mẩn bởi hương vị ngọt ngào,màu sắc đẹp mắt, cùng hình dáng nhỏ nhắn, xinh đẹp
👍👍🤝Bánh phù hợp làm quà tặng, tổ chức sự kiện, tiệc trà...', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2067, 1, 2, N'Bánh rán DORAEMON 2019', 15000, N'- Sản phẩm Bánh yêu thích của các Bé.
- Thay đổi bữa ăn giúp bé ăn ngoan hơn.
- Được làm từ các nguyên liệu sạch có nguồn gốc và được chứng nhận về an toàn thực phẩm.', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2068, 1, 1, N' Bánh Mousse Chanh Dây', 30000, N'☘️☘️☘️Chanh dây được biết đến là một loại quả tốt cho sức khỏe
👩🏻‍🍳👩🏻‍🍳Những loại bánh làm từ chanh dây luôn có hương vị thơm ngon, hấp dẫn và cực kỳ kích thích vị giác
💥💥💥Không thể không kể đến món bánh mousse chanh dây với vị chua chua ngọt ngọt ngon ngất ngây. Ngon hơn người yêu cũ của bạn nhoé :))
Tháng 9 này ai còn sinh nhật thì đây cũng là một sự lựa chọn hoàn hảo 🥰🥰🥰', 1, 0)
INSERT [dbo].[product] ([id], [brand_id], [category_id], [name], [price], [description], [status], [deleted]) VALUES (2069, 1, 35, N'Socola Tươi Đen Đắng', 70000, N'Vừa ra socola tươi cả nhà đặt nhanh nha.
Socola tươi đen đắng mềm mượt, tan mát và quan trọng nhất là sạch, ăn ngon lắm ah 😋😋😋', 1, 0)
SET IDENTITY_INSERT [dbo].[product] OFF
ALTER TABLE [dbo].[account] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[account_detail] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[order] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_account_detail] FOREIGN KEY([account_detail_id])
REFERENCES [dbo].[account_detail] ([id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_account_detail]
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD  CONSTRAINT [FK_image_product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK_image_product]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_customer_info] FOREIGN KEY([customer_info_id])
REFERENCES [dbo].[customer_info] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_customer_info]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_product]
GO
/****** Object:  StoredProcedure [dbo].[pagingSearchProducts]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pagingSearchProducts]
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
GO
/****** Object:  StoredProcedure [dbo].[pagingTopProducts]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pagingTopProducts]
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
GO
/****** Object:  StoredProcedure [dbo].[spGetRecordsByPageAndSize]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetRecordsByPageAndSize]
@Page INT,
@Size INT
AS
BEGIN
	SELECT * FROM product where deleted = 0
	ORDER BY id DESC
	OFFSET (@Page -1) * @Size ROWS
	FETCH NEXT @Size ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[spGetRecordsByPageAndSizeAndCategory]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetRecordsByPageAndSizeAndCategory]
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
GO
/****** Object:  StoredProcedure [dbo].[spGetRecordsByPageAndSizeAndFilterPrice]    Script Date: 11/15/2019 9:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetRecordsByPageAndSizeAndFilterPrice]
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
GO
