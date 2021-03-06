USE [master]
GO
/****** Object:  Database [recruit]    Script Date: 06/08/2019 17:09:00 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'recruit')
BEGIN
DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE recruit
  ON PRIMARY (NAME = N''recruit'', FILENAME = N''' + @device_directory + N'recruit.mdf'')
  LOG ON (NAME = N''recruit_log'',  FILENAME = N''' + @device_directory + N'recruit.ldf'')')
END
GO
ALTER DATABASE [recruit] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [recruit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [recruit] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [recruit] SET ANSI_NULLS OFF
GO
ALTER DATABASE [recruit] SET ANSI_PADDING OFF
GO
ALTER DATABASE [recruit] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [recruit] SET ARITHABORT OFF
GO
ALTER DATABASE [recruit] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [recruit] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [recruit] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [recruit] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [recruit] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [recruit] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [recruit] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [recruit] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [recruit] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [recruit] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [recruit] SET  DISABLE_BROKER
GO
ALTER DATABASE [recruit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [recruit] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [recruit] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [recruit] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [recruit] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [recruit] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [recruit] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [recruit] SET  READ_WRITE
GO
ALTER DATABASE [recruit] SET RECOVERY SIMPLE
GO
ALTER DATABASE [recruit] SET  MULTI_USER
GO
ALTER DATABASE [recruit] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [recruit] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'recruit', N'ON'
GO
USE [recruit]
GO
/****** Object:  Table [dbo].[collection]    Script Date: 06/27/2019 09:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[collection]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[collection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uName] [nvarchar](50) NOT NULL,
	[pId] [int] NOT NULL,
 CONSTRAINT [PK_collection] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[collection] ON
INSERT [dbo].[collection] ([id], [uName], [pId]) VALUES (10, N'管理员', 47)
INSERT [dbo].[collection] ([id], [uName], [pId]) VALUES (14, N'管理员', 48)
INSERT [dbo].[collection] ([id], [uName], [pId]) VALUES (15, N'user01', 47)
INSERT [dbo].[collection] ([id], [uName], [pId]) VALUES (16, N'user01', 48)
SET IDENTITY_INSERT [dbo].[collection] OFF
/****** Object:  Table [dbo].[city]    Script Date: 06/27/2019 09:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[city]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[city](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[img] [nvarchar](255) NOT NULL
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[city] ON
INSERT [dbo].[city] ([id], [name], [img]) VALUES (1, N'北京', N'image/city1.png')
INSERT [dbo].[city] ([id], [name], [img]) VALUES (2, N'上海', N'image/city2.png')
INSERT [dbo].[city] ([id], [name], [img]) VALUES (3, N'广州', N'image/city3.png')
INSERT [dbo].[city] ([id], [name], [img]) VALUES (4, N'深圳', N'image/city4.png')
INSERT [dbo].[city] ([id], [name], [img]) VALUES (5, N'杭州', N'image/city5.png')
INSERT [dbo].[city] ([id], [name], [img]) VALUES (6, N'天津', N'image/city6.png')
INSERT [dbo].[city] ([id], [name], [img]) VALUES (7, N'西安', N'image/city7.png')
INSERT [dbo].[city] ([id], [name], [img]) VALUES (8, N'苏州', N'image/city8.png')
INSERT [dbo].[city] ([id], [name], [img]) VALUES (9, N'武汉', N'image/city9.png')
INSERT [dbo].[city] ([id], [name], [img]) VALUES (10, N'南京', N'image/city10.png')
INSERT [dbo].[city] ([id], [name], [img]) VALUES (13, N'长沙', N'image/city11.png')
INSERT [dbo].[city] ([id], [name], [img]) VALUES (14, N'成都', N'image/city12.png')
SET IDENTITY_INSERT [dbo].[city] OFF
/****** Object:  Table [dbo].[users]    Script Date: 06/27/2019 09:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[pwd] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[admin] [nvarchar](50) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[users] ON
INSERT [dbo].[users] ([id], [name], [pwd], [phone], [admin]) VALUES (8, N'asp.net', N'012345', N'01234567890', N'true')
INSERT [dbo].[users] ([id], [name], [pwd], [phone], [admin]) VALUES (9, N'user01', N'012345', N'01234567891', N'')
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Table [dbo].[search]    Script Date: 06/27/2019 09:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[search]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[search](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[keyName] [nvarchar](50) NOT NULL,
	[times] [int] NOT NULL,
 CONSTRAINT [PK_search] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[search] ON
INSERT [dbo].[search] ([id], [keyName], [times]) VALUES (1, N'asp.net', 14)
INSERT [dbo].[search] ([id], [keyName], [times]) VALUES (2, N'java', 5)
INSERT [dbo].[search] ([id], [keyName], [times]) VALUES (3, N'ios', 2)
INSERT [dbo].[search] ([id], [keyName], [times]) VALUES (4, N'产品经理', 1)
INSERT [dbo].[search] ([id], [keyName], [times]) VALUES (5, N'销售', 2)
INSERT [dbo].[search] ([id], [keyName], [times]) VALUES (6, N'设计经理', 3)
INSERT [dbo].[search] ([id], [keyName], [times]) VALUES (7, N'android', 3)
INSERT [dbo].[search] ([id], [keyName], [times]) VALUES (8, N'算法', 4)
INSERT [dbo].[search] ([id], [keyName], [times]) VALUES (9, N'php', 2)
INSERT [dbo].[search] ([id], [keyName], [times]) VALUES (10, N'金融', 2)
SET IDENTITY_INSERT [dbo].[search] OFF
/****** Object:  Table [dbo].[position]    Script Date: 06/27/2019 09:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[position]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[position](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[company] [nvarchar](255) NOT NULL,
	[salary] [nvarchar](255) NOT NULL,
	[tag] [nvarchar](255) NOT NULL,
	[description] [text] NOT NULL,
	[sort] [nvarchar](255) NOT NULL,
	[academic] [nvarchar](255) NOT NULL,
	[experience] [nvarchar](255) NOT NULL,
	[place] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_position] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[position] ON
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (1, N'高级Java专家', N'蚂蚁金服', N'25k-50k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1，蚂蚁财富银行，证券等各种理财业务的需求分析，整体架构设计，核心关键模块子系统的设计及实现。</div><div>2，蚂蚁财富银行证券等资产交易服务平台架构设计及核心代码编写</div><div>3,蚂蚁财富用户增长及营销效果效能分析，有用户拉新等增长方面经验优秀。</div><div>4，业务，平台等方向技术带头人，指导带领团队同学达到共同目标 </div>', N'IT·互联网', N'大专', N'经验不限', N'杭州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (2, N'高级Android开发工程师', N'美菜网', N'35k-50k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、负责android客户端相关产品的设计，架构，开发。</div><div>2、承担android性能优化，保障开发进度和效率，主导技术攻关，保证android软件安全，稳定，高效运行</div><div>3、持续发现、评估采用新技术，提升开发效率。</div><div>4、带领团队，培养新人</div>', N'IT·互联网', N'本科', N'1-3年', N'苏州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (3, N'资深测试工程师', N'网易', N'20k-30k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1.本科及以上学历，计算机/软件相关专业优先；</div><div>2.3年以上移动游戏测试经验，熟悉各种类型和平台的游戏，并且对游戏有独特的见解，能快速掌握各种游戏方法；</div><div>3.精通测试用例的设计，对标准软件测试流程有深入理解；</div><div>4.有电商营销H5/微信小游戏等相关领域的测试经验者优先。</div>', N'IT·互联网', N'大专', N'经验不限', N'深圳')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (4, N'高级影像算法', N'OPPO', N'25k-50k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1. 图像处理算法的研发和优化</div><div>2. 3A(AWB/AEC/AF)算法的研发和优化</div><div>3. 利用深度学习进行图像相关的算法设计，主要涉及模型的选型和训练、算法优化及研究等</div>', N'IT·互联网', N'本科', N'1-3年', N'西安')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (5, N'解决方案高级经理', N'今日头条', N'20k-40k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、本科及以上学历，计算机／通信等相关专业；</div><div>2、3年以上企业级to B解决方案规划／设计工作经验，拥有成功案例及行业客户资源优先；</div><div>3、在AI、大数据、云计算等领域B2B企业相关实战经验，有国内外知名IT、互联网公司任职经验优先；</div><div>4、具备良好的沟通与演讲能力，思维敏捷，能够快速相应客户需求；</div><div>5、具备良好的项目管理及组织协调能力，能够承受一定强度的工作压力；</div><div>6、熟悉AI、算法to B行业应用，具备丰富的行业客户资源、项目储备者优先（电商、安防、教育、互联网娱乐、互联网金融等）。</div> ', N'IT·互联网', N'大专', N'1-3年', N'上海')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (6, N'资深IOS开发工程师', N'网易', N'20k-40k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、计算机相关专业，本科及以上学历；</div><div>2、1~3年iOS开发经验；</div><div>3、较强的发现、分析和解决技术问题的能力；</div><div>4、深刻理解iOS平台，精通ObjC/C/C++语言；</div><div>5、有较好的学习与沟通能力，有创新力和责任感； </div>', N'IT·互联网', N'大专', N'5-10年', N'广州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (7, N'3D动画设计总监', N'引力科技西安分公司', N'5k-6k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1.5年以上相关工作经验，3年以上同岗位工作经验。</div><div>2.品牌创建和渠道推广能力。</div><div>3.有一定商务谈判经验。</div><div>4.具有石家庄当地媒体资源者优先。 </div>', N'房地产', N'大专', N'经验不限', N'北京')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (8, N'建筑公司会计主管', N'建开', N'8k-13k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、具有多年施工企业财务工作经验，综合能力强；</div><div>2、熟悉施工企业财务核算及全盘账务处理；</div><div>3、具备融资工作工作经验优先考虑；</div>', N'房地产', N'本科', N'5-10年', N'杭州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (9, N'项目经理', N'奥视数字视觉', N'8k-15k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1.人品端正，对影视、广告、电影CG行业有浓厚兴趣；团队合作意识强，有强烈的责任感和担当</div><div>2、具有较强的学习能力和学习意愿，具有较强的沟通表达能力以及执行力</div><div>3、具有较高的艺术修养，独立编导能力，优秀的创作能力</div><div>4、依据前期方案创意，独立完成影片脚本创作；负责影片的全流程制作和品质把控</div><div>5、对影视镜头语言、画面构成、色彩、音乐节奏情绪、特效及后期整合均有丰富经验</div><div>6、大专以上，艺术院校设计专业，影视行业从业3年以上，有项目及影片全流程把控经历者优先</div>', N'房地产', N'大专', N'1-3年', N'武汉')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (10, N'财务经理', N'泰悦集团', N'9k-12k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、执行、监督公司的财务管理制度，随时检查财务制度的执行情况，发现违反财务制度，及时制止和纠正，重大问题应及时向财务总监汇报。</div><div>2、组织编制和审核会计凭证，做到数字真实、计算准确、内容完整、说明清楚。</div><div>3、督促财务人员做好应收账款的清欠工作，加速资金回笼。</div><div>4、负责办理银行贷款利息支付及还贷手续。</div><div>5、组织财务人员做好税金的核算申报工作，合法纳税。</div>', N'房地产', N'本科', N'5-10年', N'深圳')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (11, N'建筑师助理', N'重庆卓创', N'6k-10k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>招收规划建筑学专业，熟悉CAD制图，熟悉建筑设计规范，对建筑方案设计流程有一定了解。有过任职经历者优先。</div>', N'房地产', N'大专', N'5-10年', N'西安')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (12, N'建筑师', N'深圳建筑设计总院', N'5k-7k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>建筑学专业，本科毕业生，要求踏实肯干，认真负责，有团队精神和职业素养，男女不限，试用期一至两个月。</div>', N'房地产', N'本科', N'经验不限', N'上海')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (13, N'建筑表现师', N'蓝斯设计', N'8k-17k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、建筑设计，城市规划，环境艺术、室内设计、视觉传达等相关专业，或有效果图经验优先考虑。应届毕业生可以提供岗前培训。</div><div>2、熟练掌握3Dmax、Potoshop、CAD（会其中一种即可）；热爱效果图表现，具备良好的色彩感觉；沟通能力强。掌握各种建模或渲染或后期表现技法，能独立而高效地完成高素质的电脑效果图。</div><div>3、对设计工作有热情，善于与设计师进行方案沟通和表达，有良好的理解能力。</div><div>4、良好的工作激情和工作态度，对工作认真负责，积极主动，高度敬业精神和团队合作精神；有责任感，高配合度和执行能力，</div><div>5、面试请带自己的作品</div>', N'房地产', N'大专', N'1-3年', N'广州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (14, N'运维管理经理', N'上海建工四建', N'8k-19k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1.学历本科以上，自动化专业毕业的优先；</div><div>2.工作经验5年以上，对bim有一定的了解或者相关项目经验；</div><div>3.有弱电专业的项目管理经验及设计经验；</div><div>4.思维严谨、敬业负责，具有较强的沟通协调能力和良好的团队合作精神及分析问题、解决问题能力；</div><div>5.户籍不限，按项目需要，能积极服从公司工作安排。</div>', N'房地产', N'本科', N'经验不限', N'北京')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (15, N'资深金融产品经理', N'vivo', N'9k-13k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1. 熟悉支付、消费金融、理财、保险中至少两类金融产品的产品业务逻辑，对业务流程、机构合作方式、风险控制、运营方式有比较深入的理解。</div><div>2. 具备良好的商务沟通和谈判能力，具备良好的文字表达能力和项目协调能力，推动问题的解决和产品方案的落地。</div><div>3. 本科及以上学历，3年以上金融业务经验。</div><div>4. 具有强烈的责任心，良好的团队合作精神，积极主动，能承受较大的工作压力； </div>', N'金融', N'大专', N'1-3年', N'杭州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (16, N'软件测试-金融项目', N'博为峰软件', N'6k-11k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1. 熟悉支付、消费金融、理财、保险中至少两类金融产品的产品业务逻辑，对业务流程、机构合作方式、风险控制、运营方式有比较深入的理解。</div><div>2. 具备良好的商务沟通和谈判能力，具备良好的文字表达能力和项目协调能力，推动问题的解决和产品方案的落地。</div><div>3. 本科及以上学历，3年以上金融业务经验。</div><div>4. 具有强烈的责任心，良好的团队合作精神，积极主动，能承受较大的工作压力； </div>', N'金融', N'大专', N'1-3年', N'武汉')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (17, N'金融顾问', N'房金所', N'8k-17k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1. 熟悉支付、消费金融、理财、保险中至少两类金融产品的产品业务逻辑，对业务流程、机构合作方式、风险控制、运营方式有比较深入的理解。</div><div>2. 具备良好的商务沟通和谈判能力，具备良好的文字表达能力和项目协调能力，推动问题的解决和产品方案的落地。</div><div>3. 本科及以上学历，3年以上金融业务经验。</div><div>4. 具有强烈的责任心，良好的团队合作精神，积极主动，能承受较大的工作压力； </div>', N'金融', N'大专', N'5-10年', N'深圳')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (18, N'金融Java高级', N'货车帮', N'8k-19k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1. 熟悉支付、消费金融、理财、保险中至少两类金融产品的产品业务逻辑，对业务流程、机构合作方式、风险控制、运营方式有比较深入的理解。</div><div>2. 具备良好的商务沟通和谈判能力，具备良好的文字表达能力和项目协调能力，推动问题的解决和产品方案的落地。</div><div>3. 本科及以上学历，3年以上金融业务经验。</div><div>4. 具有强烈的责任心，良好的团队合作精神，积极主动，能承受较大的工作压力； </div>', N'金融', N'本科', N'经验不限', N'西安')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (19, N'金融产品经理', N'深圳萨摩耶金服', N'9k-13k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1. 熟悉支付、消费金融、理财、保险中至少两类金融产品的产品业务逻辑，对业务流程、机构合作方式、风险控制、运营方式有比较深入的理解。</div><div>2. 具备良好的商务沟通和谈判能力，具备良好的文字表达能力和项目协调能力，推动问题的解决和产品方案的落地。</div><div>3. 本科及以上学历，3年以上金融业务经验。</div><div>4. 具有强烈的责任心，良好的团队合作精神，积极主动，能承受较大的工作压力； </div>', N'金融', N'大专', N'5-10年', N'上海')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (20, N'金融内训课程总监', N'金融职业经理人', N'6k-11k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1. 熟悉支付、消费金融、理财、保险中至少两类金融产品的产品业务逻辑，对业务流程、机构合作方式、风险控制、运营方式有比较深入的理解。</div><div>2. 具备良好的商务沟通和谈判能力，具备良好的文字表达能力和项目协调能力，推动问题的解决和产品方案的落地。</div><div>3. 本科及以上学历，3年以上金融业务经验。</div><div>4. 具有强烈的责任心，良好的团队合作精神，积极主动，能承受较大的工作压力； </div>', N'金融', N'本科', N'1-3年', N'广州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (21, N'金融产品经理', N' 深圳萨摩耶金服', N'5k-8k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1. 熟悉支付、消费金融、理财、保险中至少两类金融产品的产品业务逻辑，对业务流程、机构合作方式、风险控制、运营方式有比较深入的理解。</div><div>2. 具备良好的商务沟通和谈判能力，具备良好的文字表达能力和项目协调能力，推动问题的解决和产品方案的落地。</div><div>3. 本科及以上学历，3年以上金融业务经验。</div><div>4. 具有强烈的责任心，良好的团队合作精神，积极主动，能承受较大的工作压力； </div>', N'金融', N'大专', N'5-10年', N'成都')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (22, N'金融产品经理', N'华信金融', N'8k-21k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1. 熟悉支付、消费金融、理财、保险中至少两类金融产品的产品业务逻辑，对业务流程、机构合作方式、风险控制、运营方式有比较深入的理解。</div><div>2. 具备良好的商务沟通和谈判能力，具备良好的文字表达能力和项目协调能力，推动问题的解决和产品方案的落地。</div><div>3. 本科及以上学历，3年以上金融业务经验。</div><div>4. 具有强烈的责任心，良好的团队合作精神，积极主动，能承受较大的工作压力； </div>', N'金融', N'本科', N'5-10年', N'杭州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (23, N'京东自营经理', N'好孩子', N'8k-17k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、负责KA渠道京东、一号店、苏宁、唯品会平台日常运营管理工作，优化排名；</div><div>2、熟悉平台的推广方式,具有打造爆款的能力和经验;</div><div>3、定期策划网店活动,提高店铺点击率、浏览量和转化率，完成每月制定的销售任务；</div><div>4、整理每日,周,月监控的数据:流量数据,营销数据,交易数据,产品管理,客户管理;</div><div>5、具备良好的网络销售技巧,对网络销售的系统管理有一定经验,熟悉网络销售的各类软件使用,有较强的销售意识和服务意识 ;</div>', N'消费品', N'大专', N'经验不限', N'苏州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (24, N'Talent Advisor/Recruiter', N'联合利华服务', N'8k-19k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、负责KA渠道京东、一号店、苏宁、唯品会平台日常运营管理工作，优化排名；</div><div>2、熟悉平台的推广方式,具有打造爆款的能力和经验;</div><div>3、定期策划网店活动,提高店铺点击率、浏览量和转化率，完成每月制定的销售任务；</div><div>4、整理每日,周,月监控的数据:流量数据,营销数据,交易数据,产品管理,客户管理;</div><div>5、具备良好的网络销售技巧,对网络销售的系统管理有一定经验,熟悉网络销售的各类软件使用,有较强的销售意识和服务意识 ;</div>', N'消费品', N'本科', N'3-5年', N'深圳')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (25, N'集团生产总监', N'北京汇源食品饮料有限公司', N'9k-13k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、负责KA渠道京东、一号店、苏宁、唯品会平台日常运营管理工作，优化排名；</div><div>2、熟悉平台的推广方式,具有打造爆款的能力和经验;</div><div>3、定期策划网店活动,提高店铺点击率、浏览量和转化率，完成每月制定的销售任务；</div><div>4、整理每日,周,月监控的数据:流量数据,营销数据,交易数据,产品管理,客户管理;</div><div>5、具备良好的网络销售技巧,对网络销售的系统管理有一定经验,熟悉网络销售的各类软件使用,有较强的销售意识和服务意识 ;</div>', N'消费品', N'大专', N'经验不限', N'南京')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (26, N'渠道通路行销经理', N'欧莱雅中国', N'6k-11k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、负责KA渠道京东、一号店、苏宁、唯品会平台日常运营管理工作，优化排名；</div><div>2、熟悉平台的推广方式,具有打造爆款的能力和经验;</div><div>3、定期策划网店活动,提高店铺点击率、浏览量和转化率，完成每月制定的销售任务；</div><div>4、整理每日,周,月监控的数据:流量数据,营销数据,交易数据,产品管理,客户管理;</div><div>5、具备良好的网络销售技巧,对网络销售的系统管理有一定经验,熟悉网络销售的各类软件使用,有较强的销售意识和服务意识 ;</div>', N'消费品', N'大专', N'1-3年', N'上海')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (27, N'城市主管', N'不凡帝范', N'5k-8k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、负责KA渠道京东、一号店、苏宁、唯品会平台日常运营管理工作，优化排名；</div><div>2、熟悉平台的推广方式,具有打造爆款的能力和经验;</div><div>3、定期策划网店活动,提高店铺点击率、浏览量和转化率，完成每月制定的销售任务；</div><div>4、整理每日,周,月监控的数据:流量数据,营销数据,交易数据,产品管理,客户管理;</div><div>5、具备良好的网络销售技巧,对网络销售的系统管理有一定经验,熟悉网络销售的各类软件使用,有较强的销售意识和服务意识 ;</div>', N'消费品', N'大专', N'1-3年', N'广州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (28, N'媒介传播高级经理', N'光明', N'8k-21k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、负责KA渠道京东、一号店、苏宁、唯品会平台日常运营管理工作，优化排名；</div><div>2、熟悉平台的推广方式,具有打造爆款的能力和经验;</div><div>3、定期策划网店活动,提高店铺点击率、浏览量和转化率，完成每月制定的销售任务；</div><div>4、整理每日,周,月监控的数据:流量数据,营销数据,交易数据,产品管理,客户管理;</div><div>5、具备良好的网络销售技巧,对网络销售的系统管理有一定经验,熟悉网络销售的各类软件使用,有较强的销售意识和服务意识 ;</div>', N'消费品', N'本科', N'5-10年', N'北京')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (29, N'电商策划经理', N'健合(中国)有限公司', N'8k-23k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、负责KA渠道京东、一号店、苏宁、唯品会平台日常运营管理工作，优化排名；</div><div>2、熟悉平台的推广方式,具有打造爆款的能力和经验;</div><div>3、定期策划网店活动,提高店铺点击率、浏览量和转化率，完成每月制定的销售任务；</div><div>4、整理每日,周,月监控的数据:流量数据,营销数据,交易数据,产品管理,客户管理;</div><div>5、具备良好的网络销售技巧,对网络销售的系统管理有一定经验,熟悉网络销售的各类软件使用,有较强的销售意识和服务意识 ;</div>', N'消费品', N'大专', N'经验不限', N'杭州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (30, N'市场设计经理', N'新世界百货', N'9k-14k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、负责KA渠道京东、一号店、苏宁、唯品会平台日常运营管理工作，优化排名；</div><div>2、熟悉平台的推广方式,具有打造爆款的能力和经验;</div><div>3、定期策划网店活动,提高店铺点击率、浏览量和转化率，完成每月制定的销售任务；</div><div>4、整理每日,周,月监控的数据:流量数据,营销数据,交易数据,产品管理,客户管理;</div><div>5、具备良好的网络销售技巧,对网络销售的系统管理有一定经验,熟悉网络销售的各类软件使用,有较强的销售意识和服务意识 ;</div>', N'消费品', N'本科', N'5-10年', N'南京')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (31, N'汽车美容', N'建国汽车', N'6k-12k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、20周岁以上，中专/高中及以上学历，汽修相关专业者优先；</div><div>2、有汽车装饰美容工作经验，有4S店工作经历者优先；</div><div>3、具备较强的沟通协调能力，吃苦耐劳，能够承受较大的工作压力。 </div>', N'汽车·制造', N'大专', N'3-5年', N'深圳')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (32, N'汽车销售', N'花生好车', N'8k-21k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、20周岁以上，中专/高中及以上学历，汽修相关专业者优先；</div><div>2、有汽车装饰美容工作经验，有4S店工作经历者优先；</div><div>3、具备较强的沟通协调能力，吃苦耐劳，能够承受较大的工作压力。 </div>', N'汽车·制造', N'本科', N'5-10年', N'西安')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (33, N'汽车销售', N'花生好车', N'8k-17k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、20周岁以上，中专/高中及以上学历，汽修相关专业者优先；</div><div>2、有汽车装饰美容工作经验，有4S店工作经历者优先；</div><div>3、具备较强的沟通协调能力，吃苦耐劳，能够承受较大的工作压力。 </div>', N'汽车·制造', N'大专', N'5-10年', N'上海')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (34, N'汽车销售经理', N'赢时通', N'8k-19k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、20周岁以上，中专/高中及以上学历，汽修相关专业者优先；</div><div>2、有汽车装饰美容工作经验，有4S店工作经历者优先；</div><div>3、具备较强的沟通协调能力，吃苦耐劳，能够承受较大的工作压力。 </div>', N'汽车·制造', N'本科', N'经验不限', N'广州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (35, N'汽车销售', N'喜相逢汽车', N'9k-13k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、20周岁以上，中专/高中及以上学历，汽修相关专业者优先；</div><div>2、有汽车装饰美容工作经验，有4S店工作经历者优先；</div><div>3、具备较强的沟通协调能力，吃苦耐劳，能够承受较大的工作压力。 </div>', N'汽车·制造', N'大专', N'1-3年', N'北京')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (36, N'汽车销售', N'卓众汽车销售黄石分公司', N'6k-11k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、20周岁以上，中专/高中及以上学历，汽修相关专业者优先；</div><div>2、有汽车装饰美容工作经验，有4S店工作经历者优先；</div><div>3、具备较强的沟通协调能力，吃苦耐劳，能够承受较大的工作压力。 </div>', N'汽车·制造', N'大专', N'经验不限', N'天津')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (37, N'汽车销售', N'喜相逢汽车', N'5k-8k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、20周岁以上，中专/高中及以上学历，汽修相关专业者优先；</div><div>2、有汽车装饰美容工作经验，有4S店工作经历者优先；</div><div>3、具备较强的沟通协调能力，吃苦耐劳，能够承受较大的工作压力。 </div>', N'汽车·制造', N'大专', N'1-3年', N'苏州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (38, N'汽车销售', N'北京联购汽车有限公司', N'8k-21k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、20周岁以上，中专/高中及以上学历，汽修相关专业者优先；</div><div>2、有汽车装饰美容工作经验，有4S店工作经历者优先；</div><div>3、具备较强的沟通协调能力，吃苦耐劳，能够承受较大的工作压力。 </div>', N'汽车·制造', N'本科', N'1-3年', N'深圳')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (39, N'记者（医疗健康方向）', N'猎云网', N'8k-23k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、 热爱并熟悉健康医疗产业，有实际报道经验，有产业内资源积累。</div><div>2、具备优秀的新闻嗅觉和策划意识，对商业、财经等涉及产业有钻研兴趣；对新事物敏感，有独立思考能力。</div><div>3、 有良好的口头表达与外联沟通能力；有独立的人物专访、大事件操盘经验。文字功底扎实，文笔好、行文简洁严谨，能在规定时间内独立完成采访和写稿。</div><div>4、 工作认真负责、细心、敬业、能承受压力，具有良好的团队合作能力。</div><div>5、 有在创投类媒体工作经历的优先；新闻学或财经相关专业者优先</div><div>6、 投递简历时请附带个人代表作。 </div>', N'医疗·化工', N'大专', N'5-10年', N'长沙')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (40, N'医疗健康器械店长', N'盛世东泰', N'9k-14k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、 热爱并熟悉健康医疗产业，有实际报道经验，有产业内资源积累。</div><div>2、具备优秀的新闻嗅觉和策划意识，对商业、财经等涉及产业有钻研兴趣；对新事物敏感，有独立思考能力。</div><div>3、 有良好的口头表达与外联沟通能力；有独立的人物专访、大事件操盘经验。文字功底扎实，文笔好、行文简洁严谨，能在规定时间内独立完成采访和写稿。</div><div>4、 工作认真负责、细心、敬业、能承受压力，具有良好的团队合作能力。</div><div>5、 有在创投类媒体工作经历的优先；新闻学或财经相关专业者优先</div><div>6、 投递简历时请附带个人代表作。 </div>', N'医疗·化工', N'本科', N'经验不限', N'长沙')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (41, N'产品经理', N'火石创造', N'6k-12k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、 热爱并熟悉健康医疗产业，有实际报道经验，有产业内资源积累。</div><div>2、具备优秀的新闻嗅觉和策划意识，对商业、财经等涉及产业有钻研兴趣；对新事物敏感，有独立思考能力。</div><div>3、 有良好的口头表达与外联沟通能力；有独立的人物专访、大事件操盘经验。文字功底扎实，文笔好、行文简洁严谨，能在规定时间内独立完成采访和写稿。</div><div>4、 工作认真负责、细心、敬业、能承受压力，具有良好的团队合作能力。</div><div>5、 有在创投类媒体工作经历的优先；新闻学或财经相关专业者优先</div><div>6、 投递简历时请附带个人代表作。 </div>', N'医疗·化工', N'大专', N'5-10年', N'广州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (42, N'医疗健康省区代理', N'燕鑫康达', N'8k-21k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、 热爱并熟悉健康医疗产业，有实际报道经验，有产业内资源积累。</div><div>2、具备优秀的新闻嗅觉和策划意识，对商业、财经等涉及产业有钻研兴趣；对新事物敏感，有独立思考能力。</div><div>3、 有良好的口头表达与外联沟通能力；有独立的人物专访、大事件操盘经验。文字功底扎实，文笔好、行文简洁严谨，能在规定时间内独立完成采访和写稿。</div><div>4、 工作认真负责、细心、敬业、能承受压力，具有良好的团队合作能力。</div><div>5、 有在创投类媒体工作经历的优先；新闻学或财经相关专业者优先</div><div>6、 投递简历时请附带个人代表作。 </div>', N'医疗·化工', N'本科', N'1-3年', N'北京')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (43, N'企业医疗健康服务经理', N'欢泰健康', N'8k-23k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、 热爱并熟悉健康医疗产业，有实际报道经验，有产业内资源积累。</div><div>2、具备优秀的新闻嗅觉和策划意识，对商业、财经等涉及产业有钻研兴趣；对新事物敏感，有独立思考能力。</div><div>3、 有良好的口头表达与外联沟通能力；有独立的人物专访、大事件操盘经验。文字功底扎实，文笔好、行文简洁严谨，能在规定时间内独立完成采访和写稿。</div><div>4、 工作认真负责、细心、敬业、能承受压力，具有良好的团队合作能力。</div><div>5、 有在创投类媒体工作经历的优先；新闻学或财经相关专业者优先</div><div>6、 投递简历时请附带个人代表作。 </div>', N'医疗·化工', N'大专', N'5-10年', N'杭州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (44, N'产品经理(运动/医疗健康)', N'HiCTO', N'9k-14k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、 热爱并熟悉健康医疗产业，有实际报道经验，有产业内资源积累。</div><div>2、具备优秀的新闻嗅觉和策划意识，对商业、财经等涉及产业有钻研兴趣；对新事物敏感，有独立思考能力。</div><div>3、 有良好的口头表达与外联沟通能力；有独立的人物专访、大事件操盘经验。文字功底扎实，文笔好、行文简洁严谨，能在规定时间内独立完成采访和写稿。</div><div>4、 工作认真负责、细心、敬业、能承受压力，具有良好的团队合作能力。</div><div>5、 有在创投类媒体工作经历的优先；新闻学或财经相关专业者优先</div><div>6、 投递简历时请附带个人代表作。 </div>', N'医疗·化工', N'本科', N'5-10年', N'苏州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (45, N'医疗健康课程咨询师', N'北京福疗交互信息', N'6k-12k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、 热爱并熟悉健康医疗产业，有实际报道经验，有产业内资源积累。</div><div>2、具备优秀的新闻嗅觉和策划意识，对商业、财经等涉及产业有钻研兴趣；对新事物敏感，有独立思考能力。</div><div>3、 有良好的口头表达与外联沟通能力；有独立的人物专访、大事件操盘经验。文字功底扎实，文笔好、行文简洁严谨，能在规定时间内独立完成采访和写稿。</div><div>4、 工作认真负责、细心、敬业、能承受压力，具有良好的团队合作能力。</div><div>5、 有在创投类媒体工作经历的优先；新闻学或财经相关专业者优先</div><div>6、 投递简历时请附带个人代表作。 </div>', N'医疗·化工', N'大专', N'经验不限', N'深圳')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (46, N'医疗健康研究员', N'百e国际', N'5k-9k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1、 热爱并熟悉健康医疗产业，有实际报道经验，有产业内资源积累。</div><div>2、具备优秀的新闻嗅觉和策划意识，对商业、财经等涉及产业有钻研兴趣；对新事物敏感，有独立思考能力。</div><div>3、 有良好的口头表达与外联沟通能力；有独立的人物专访、大事件操盘经验。文字功底扎实，文笔好、行文简洁严谨，能在规定时间内独立完成采访和写稿。</div><div>4、 工作认真负责、细心、敬业、能承受压力，具有良好的团队合作能力。</div><div>5、 有在创投类媒体工作经历的优先；新闻学或财经相关专业者优先</div><div>6、 投递简历时请附带个人代表作。 </div>', N'医疗·化工', N'大专', N'1-3年', N'西安')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (47, N'算法工程师', N'今日头条', N'25k-35k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1. 图像处理算法的研发和优化</div><div>2. 3A(AWB/AEC/AF)算法的研发和优化</div><div>3. 利用深度学习进行图像相关的算法设计，主要涉及模型的选型和训练、算法优化及研究等</div>', N'IT·互联网', N'本科', N'5-10年', N'广州')
INSERT [dbo].[position] ([id], [name], [company], [salary], [tag], [description], [sort], [academic], [experience], [place]) VALUES (48, N'ASP.NET工程师', N'蚂蚁金服', N'25k-35k', N'五险一金/医疗保险/定期体检/年终奖励/股票期权/带薪年假', N'<div>1，蚂蚁财富银行，证券等各种理财业务的需求分析，整体架构设计，核心关键模块子系统的设计及实现。</div>
<div>2，蚂蚁财富银行证券等资产交易服务平台架构设计及核心代码编写</div>
<div>3,蚂蚁财富用户增长及营销效果效能分析，有用户拉新等增长方面经验优秀。</div>
<div>4，业务，平台等方向技术带头人，指导带领团队同学达到共同目标 </div>
', N'IT·互联网', N'本科', N'经验不限', N'广州')
SET IDENTITY_INSERT [dbo].[position] OFF
/****** Object:  Table [dbo].[hot]    Script Date: 06/27/2019 09:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[hot](
	[key] [nvarchar](255) NOT NULL,
	[sort] [nvarchar](255) NOT NULL,
	[kind] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'Java', N'IT·互联网', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'Python', N'IT·互联网', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'PHP', N'IT·互联网', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'iOS', N'IT·互联网', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'产品经理', N'IT·互联网', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'Android', N'IT·互联网', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'UI设计师', N'IT·互联网', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'Html5', N'IT·互联网', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'土建工程师', N'房地产', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'建筑设计师', N'房地产', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'项目工程师', N'房地产', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'景观设计', N'房地产', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'钢结构设计', N'房地产', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'结构工程师', N'房地产', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'室内设计', N'房地产', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'项目经理', N'房地产', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'保险', N'金融', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'期货', N'金融', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'银行', N'金融', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'证券', N'金融', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'信托', N'金融', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'理财规划师', N'金融', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'财务总监', N'金融', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'客户经理', N'金融', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'品牌总监', N'消费品', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'市场经理', N'消费品', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'客户经理', N'消费品', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'销售经理', N'消费品', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'产品开发', N'消费品', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'销售总监', N'消费品', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'活动策划', N'消费品', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'市场总监', N'消费品', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'电气工程师', N'汽车·制造', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'自动化工程师', N'汽车·制造', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'汽车销售', N'汽车·制造', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'模具工程师', N'汽车·制造', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'高级售前顾问', N'汽车·制造', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'质量管理', N'汽车·制造', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'售后服务', N'汽车·制造', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'高级估价师', N'汽车·制造', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'机械工程师', N'医疗·化工', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'结构设计', N'医疗·化工', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'环保工程师', N'医疗·化工', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'工艺工程师', N'医疗·化工', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'地质工程师', N'医疗·化工', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'客户总监', N'医疗·化工', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'QA总监', N'医疗·化工', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'研发工程师', N'医疗·化工', N'职位')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'斗鱼', N'IT·互联网', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'小米', N'IT·互联网', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'迅雷', N'IT·互联网', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'华为', N'IT·互联网', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'京东', N'IT·互联网', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'腾讯', N'IT·互联网', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'万科房产', N'房地产', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'鲁能集团', N'房地产', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'远洋地产', N'房地产', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'绿地集团', N'房地产', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'弘阳集团', N'房地产', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'宝龙地产', N'房地产', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'苏宁', N'金融', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'方正证券', N'金融', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'杉德集团', N'金融', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'渤海证券', N'金融', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'招商银行', N'金融', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'捷信', N'金融', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'娃哈哈', N'消费品', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'森大贸易', N'消费品', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'红蜻蜓', N'消费品', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'梦芭莎', N'消费品', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'全友家私', N'消费品', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'水星家纺', N'消费品', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'永达汽车', N'汽车·制造', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'米其林', N'汽车·制造', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'戴姆勒', N'汽车·制造', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'汽车之家', N'汽车·制造', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'北京奔驰', N'汽车·制造', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'三一集团', N'汽车·制造', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'迪沙药业', N'医疗·化工', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'天亿集团', N'医疗·化工', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'众生药业', N'医疗·化工', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'济民可信', N'医疗·化工', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'远东控股', N'医疗·化工', N'公司')
INSERT [dbo].[hot] ([key], [sort], [kind]) VALUES (N'中国燃气', N'医疗·化工', N'公司')
/****** Object:  Table [dbo].[company]    Script Date: 06/27/2019 09:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[company]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[image] [nvarchar](255) NOT NULL,
	[description] [text] NOT NULL,
	[employee] [nvarchar](50) NOT NULL,
	[sort] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[company] ON
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (1, N'蚂蚁金服', N'北京朝阳区远洋国际中心A座A21', N'image/company/company1.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (2, N'美菜网', N'北京朝阳区远洋国际中心A座A22', N'image/company/company2.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (3, N'网易', N'北京朝阳区远洋国际中心A座A23', N'image/company/company3.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (4, N'OPPO', N'北京朝阳区远洋国际中心A座A24', N'image/company/company4.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (5, N'今日头条', N'北京朝阳区远洋国际中心A座A25', N'image/company/company5.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (6, N'引力科技西安分公司', N'北京朝阳区远洋国际中心A座A26', N'image/company/company6.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'5000-10000人', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (7, N'建开', N'北京朝阳区远洋国际中心A座A27', N'image/company/company7.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (8, N'奥视数字视觉', N'北京朝阳区远洋国际中心A座A28', N'image/company/company8.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (9, N'泰悦集团', N'北京朝阳区远洋国际中心A座A29', N'image/company/company9.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (10, N'重庆卓创', N'北京朝阳区远洋国际中心A座A30', N'image/company/company10.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (11, N'深圳建筑设计总院', N'北京朝阳区远洋国际中心A座A31', N'image/company/company11.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (12, N'蓝斯设计', N'北京朝阳区远洋国际中心A座A32', N'image/company/company12.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (13, N'上海建工四建', N'北京朝阳区远洋国际中心A座A33', N'image/company/company13.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (14, N'vivo', N'北京朝阳区远洋国际中心A座A34', N'image/company/company14.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (15, N'博为峰软件', N'北京朝阳区远洋国际中心A座A35', N'image/company/company15.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (16, N'房金所', N'北京朝阳区远洋国际中心A座A36', N'image/company/company16.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (17, N'货车帮', N'北京朝阳区远洋国际中心A座A37', N'image/company/company17.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (18, N'深圳萨摩耶金服', N'北京朝阳区远洋国际中心A座A38', N'image/company/company18.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (19, N'金融职业经理人', N'北京朝阳区远洋国际中心A座A39', N'image/company/company19.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (20, N' 深圳萨摩耶金服', N'北京朝阳区远洋国际中心A座A40', N'image/company/company20.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (21, N'华信金融', N'北京朝阳区远洋国际中心A座A41', N'image/company/company21.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (22, N'好孩子', N'北京朝阳区远洋国际中心A座A42', N'image/company/company22.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (23, N'联合利华服务', N'北京朝阳区远洋国际中心A座A43', N'image/company/company23.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (24, N'北京汇源食品饮料有限公司', N'北京朝阳区远洋国际中心A座A44', N'image/company/company24.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (25, N'欧莱雅中国', N'北京朝阳区远洋国际中心A座A45', N'image/company/company25.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (26, N'不凡帝范', N'北京朝阳区远洋国际中心A座A46', N'image/company/company26.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (27, N'光明', N'北京朝阳区远洋国际中心A座A47', N'image/company/company27.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (28, N'健合(中国)有限公司', N'北京朝阳区远洋国际中心A座A48', N'image/company/company28.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (29, N'新世界百货', N'北京朝阳区远洋国际中心A座A49', N'image/company/company29.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (30, N'建国汽车', N'北京朝阳区远洋国际中心A座A50', N'image/company/company30.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (31, N'花生好车', N'北京朝阳区远洋国际中心A座A51', N'image/company/company31.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (32, N'赢时通', N'北京朝阳区远洋国际中心A座A52', N'image/company/company32.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (33, N'喜相逢汽车', N'北京朝阳区远洋国际中心A座A53', N'image/company/company33.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (34, N'卓众汽车销售黄石分公司', N'北京朝阳区远洋国际中心A座A54', N'image/company/company34.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (35, N'北京联购汽车有限公司', N'北京朝阳区远洋国际中心A座A55', N'image/company/company35.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (36, N'猎云网', N'北京朝阳区远洋国际中心A座A56', N'image/company/company36.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (37, N'盛世东泰', N'北京朝阳区远洋国际中心A座A57', N'image/company/company37.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (38, N'火石创造', N'北京朝阳区远洋国际中心A座A58', N'image/company/company38.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (39, N'燕鑫康达', N'北京朝阳区远洋国际中心A座A59', N'image/company/company39.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (40, N'欢泰健康', N'北京朝阳区远洋国际中心A座A60', N'image/company/company40.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (41, N'HiCTO', N'北京朝阳区远洋国际中心A座A61', N'image/company/company41.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (42, N'北京福疗交互信息', N'北京朝阳区远洋国际中心A座A62', N'image/company/company42.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
INSERT [dbo].[company] ([id], [name], [address], [image], [description], [employee], [sort]) VALUES (43, N'百e国际', N'北京朝阳区远洋国际中心A座A63', N'image/company/company43.jpg', N'关于亚马逊 About Amazon 亚马逊公司（纳斯达克代码：AMZN）是一家“财富500强”公司，总部位于西雅图，成立于1995年9月，目前已成为全球商品种类最多的网上零售商。亚马逊致力于成为全球最“以客户为中心”的公司，使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。亚马逊和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品、工具、以及汽车和工业产品等。', N'10000人以上', N'移动互联网')
SET IDENTITY_INSERT [dbo].[company] OFF
/****** Object:  Table [dbo].[comment]    Script Date: 06/27/2019 09:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[comment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cContent] [nvarchar](50) NOT NULL,
	[pId] [int] NOT NULL,
	[uName] [nvarchar](50) NOT NULL,
	[time] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Default [DF_user_admin]    Script Date: 06/27/2019 09:56:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_user_admin]') AND parent_object_id = OBJECT_ID(N'[dbo].[users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_user_admin]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_user_admin]  DEFAULT (N'false') FOR [admin]
END


End
GO
/****** Object:  Default [DF_company_employee]    Script Date: 06/27/2019 09:56:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_company_employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[company]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_company_employee]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[company] ADD  CONSTRAINT [DF_company_employee]  DEFAULT (N'10000人以上') FOR [employee]
END


End
GO
/****** Object:  Default [DF_company_sort]    Script Date: 06/27/2019 09:56:27 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_company_sort]') AND parent_object_id = OBJECT_ID(N'[dbo].[company]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_company_sort]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[company] ADD  CONSTRAINT [DF_company_sort]  DEFAULT (N'移动互联网') FOR [sort]
END


End
GO
/****** Object:  ForeignKey [FK_comment_position]    Script Date: 06/27/2019 09:56:27 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_comment_position]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_position] FOREIGN KEY([pId])
REFERENCES [dbo].[position] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_comment_position]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_position]
GO
