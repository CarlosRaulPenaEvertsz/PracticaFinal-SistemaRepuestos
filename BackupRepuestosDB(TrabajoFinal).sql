USE [master]
GO
/****** Object:  Database [RepuestoJCDB]    Script Date: Sep/19/2020 12:06:44 PM ******/
CREATE DATABASE [RepuestoJCDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RepuestoJCDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RepuestoJCDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RepuestoJCDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RepuestoJCDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RepuestoJCDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RepuestoJCDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RepuestoJCDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RepuestoJCDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RepuestoJCDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RepuestoJCDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RepuestoJCDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET RECOVERY FULL 
GO
ALTER DATABASE [RepuestoJCDB] SET  MULTI_USER 
GO
ALTER DATABASE [RepuestoJCDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RepuestoJCDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RepuestoJCDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RepuestoJCDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RepuestoJCDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RepuestoJCDB] SET QUERY_STORE = OFF
GO
USE [RepuestoJCDB]
GO
/****** Object:  Table [dbo].[MenuUsers]    Script Date: Sep/19/2020 12:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuUsers](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuDescripcion] [varchar](100) NULL,
	[MenuPadre] [int] NULL,
	[MenuPadreDescripcion] [varchar](100) NULL,
	[MenuControl] [varchar](100) NULL,
	[MenuView] [varchar](100) NULL,
	[MenuIcon] [varchar](100) NULL,
	[MenuUrl] [varchar](100) NULL,
	[MenuActivo] [bit] NULL,
	[MenuCreadoEn] [date] NULL,
	[MenuCreadoPor] [varchar](50) NULL,
	[MenuModificadoEn] [date] NULL,
	[MenuModificacoPor] [varchar](50) NULL,
 CONSTRAINT [PK_MenuUsers] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: Sep/19/2020 12:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleDescripcion] [varchar](50) NULL,
	[RoleEstatus] [bit] NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccesosUsuarios]    Script Date: Sep/19/2020 12:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccesosUsuarios](
	[AccesoID] [int] NOT NULL,
	[AccesoMenuID] [int] NULL,
	[AccesoMenuPadre] [int] NULL,
	[AccesoRoleID] [int] NULL,
	[AccesoActivo] [bit] NULL,
	[AccesoCreadoEn] [date] NULL,
	[AccesoCreadoPor] [varchar](50) NULL,
	[AccesoModificadoEn] [date] NULL,
	[AccesoModificadoPor] [varchar](50) NULL,
 CONSTRAINT [PK_AccesosUsuarios] PRIMARY KEY CLUSTERED 
(
	[AccesoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwPermisosRoles]    Script Date: Sep/19/2020 12:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPermisosRoles]
AS
SELECT        dbo.UserRoles.RoleID, dbo.UserRoles.RoleDescripcion, dbo.UserRoles.RoleEstatus, dbo.AccesosUsuarios.AccesoID, dbo.AccesosUsuarios.AccesoMenuID, dbo.AccesosUsuarios.AccesoMenuPadre, 
                         dbo.AccesosUsuarios.AccesoActivo, dbo.AccesosUsuarios.AccesoCreadoEn, dbo.AccesosUsuarios.AccesoCreadoPor, dbo.AccesosUsuarios.AccesoModificadoEn, dbo.AccesosUsuarios.AccesoModificadoPor, 
                         dbo.MenuUsers.MenuDescripcion, dbo.MenuUsers.MenuIcon, dbo.MenuUsers.MenuUrl, dbo.MenuUsers.MenuActivo, dbo.MenuUsers.MenuCreadoEn, dbo.MenuUsers.MenuCreadoPor, dbo.MenuUsers.MenuModificadoEn, 
                         dbo.MenuUsers.MenuModificacoPor, dbo.MenuUsers.MenuControl, dbo.MenuUsers.MenuView
FROM            dbo.MenuUsers RIGHT OUTER JOIN
                         dbo.AccesosUsuarios ON dbo.MenuUsers.MenuID = dbo.AccesosUsuarios.AccesoMenuID RIGHT OUTER JOIN
                         dbo.UserRoles ON dbo.AccesosUsuarios.AccesoRoleID = dbo.UserRoles.RoleID
WHERE        (dbo.UserRoles.RoleEstatus = 1) AND (dbo.AccesosUsuarios.AccesoActivo = 1) AND (dbo.MenuUsers.MenuActivo = 1)
GO
/****** Object:  Table [dbo].[CarroCompras]    Script Date: Sep/19/2020 12:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarroCompras](
	[Id_CarroCompras] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cliente] [int] NULL,
	[Id_Articulo] [int] NULL,
	[Cantidad] [int] NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_CarroCompras] PRIMARY KEY CLUSTERED 
(
	[Id_CarroCompras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: Sep/19/2020 12:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](256) NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: Sep/19/2020 12:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellidos] [varchar](100) NULL,
	[Sexo] [varchar](1) NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Tipo_Documento] [varchar](20) NOT NULL,
	[Num_Documento] [varchar](11) NOT NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[Estatus] [bit] NULL,
	[TipoNCF] [varchar](3) NULL,
	[LoginID] [int] NULL,
	[CliImagen] [varchar](100) NULL,
	[NombreComercial] [varchar](100) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientesMetodosPago]    Script Date: Sep/19/2020 12:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientesMetodosPago](
	[ID_Tipo_Pago] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NULL,
	[Pago_Cuenta] [varchar](30) NULL,
	[Pago_Tipo_Cuenta] [varchar](20) NULL,
	[Fecha_Expiracion] [varchar](20) NULL,
	[CCV] [int] NULL,
	[Institucion_Bancaria] [varchar](50) NULL,
 CONSTRAINT [PK_ClientesMetodosPago] PRIMARY KEY CLUSTERED 
(
	[ID_Tipo_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CredencialesUsuarios]    Script Date: Sep/19/2020 12:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CredencialesUsuarios](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](20) NULL,
	[PasswordUsuario] [varchar](20) NULL,
	[TipoUsuario] [int] NULL,
	[UserImagen] [varchar](100) NULL,
	[Nombre] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK_CredencialesUsuarios] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleMovInventario]    Script Date: Sep/19/2020 12:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleMovInventario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Ingreso] [int] NOT NULL,
	[Id_Articulo] [int] NOT NULL,
	[Precio_Compra] [decimal](18, 4) NOT NULL,
	[Precio_Venta] [decimal](18, 4) NOT NULL,
	[Stock_Inicial] [int] NOT NULL,
	[Stock_Actual] [int] NOT NULL,
	[Fecha_produccion] [date] NOT NULL,
	[Fecha_vencimiento] [date] NOT NULL,
	[Estatus] [bit] NULL,
	[Id_Ventas] [int] NULL,
	[Requisicion] [varchar](20) NULL,
 CONSTRAINT [PK_DetalleIngreso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVentas]    Script Date: Sep/19/2020 12:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVentas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Venta] [int] NOT NULL,
	[Id_Articulo] [int] NOT NULL,
	[Id_MovInventario] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitarioVenta] [decimal](18, 4) NOT NULL,
	[PrecioVenta] [decimal](18, 2) NOT NULL,
	[DescuentoVenta] [decimal](18, 2) NOT NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_detalle_venta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: Sep/19/2020 12:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Sexo] [varchar](1) NOT NULL,
	[Fecha_Nac] [date] NOT NULL,
	[Num_Documento] [varchar](8) NOT NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](15) NULL,
	[Email] [varchar](200) NULL,
	[NivelAcceso] [int] NOT NULL,
	[Estatus] [bit] NULL,
	[Cedula] [varchar](11) NULL,
	[Fecha_Ingreso] [date] NULL,
	[LoginID] [int] NULL,
	[EmpImagen] [varchar](100) NULL,
 CONSTRAINT [PK_trabajador] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpresaConfig]    Script Date: Sep/19/2020 12:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpresaConfig](
	[EmpresaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreEmpresa] [varchar](50) NULL,
	[RNC] [varchar](15) NULL,
	[NCF01_Proximo] [int] NOT NULL,
	[NCF02_Proximo] [int] NOT NULL,
	[NCF03_Proximo] [int] NOT NULL,
	[NCF04_Proximo] [int] NOT NULL,
	[NCF14_Proximo] [int] NOT NULL,
	[NCF15_Proximo] [int] NOT NULL,
	[TasaItbisActual] [float] NOT NULL,
	[ArchivoLogo] [varchar](50) NULL,
	[ArchivoTipografia] [varchar](50) NULL,
 CONSTRAINT [PK_EmpresaConfig] PRIMARY KEY CLUSTERED 
(
	[EmpresaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventarioArticulos]    Script Date: Sep/19/2020 12:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventarioArticulos](
	[Id_Articulo] [int] IDENTITY(1,1) NOT NULL,
	[Id_Trabajador] [int] NOT NULL,
	[Id_Proveedor] [int] NOT NULL,
	[Codigo] [varchar](50) NULL,
	[Descripcion] [varchar](1024) NULL,
	[Marca] [varchar](50) NULL,
	[Modelo] [varchar](50) NULL,
	[Year] [int] NULL,
	[Id_Categoria] [int] NULL,
	[Id_Presentacion] [int] NULL,
	[Fecha_Entrada] [date] NULL,
	[CostoUnitario] [decimal](18, 4) NULL,
	[PrecioUnitarioVenta] [decimal](18, 4) NULL,
	[CantidadDisponible] [int] NULL,
	[CantidadReposicion] [int] NULL,
	[Estatus] [bit] NULL,
	[Almacen] [varchar](30) NULL,
	[Tramo] [varchar](30) NULL,
	[ArtImagen] [varchar](100) NULL,
 CONSTRAINT [PK_InventarioProductos] PRIMARY KEY CLUSTERED 
(
	[Id_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: Sep/19/2020 12:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[ConfirmPassword] [varchar](max) NULL,
	[PersonalName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[LoginRoleID] [int] NULL,
	[LoginEstatus] [bit] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainMenu]    Script Date: Sep/19/2020 12:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainMenu](
	[MainMenuID] [int] IDENTITY(1,1) NOT NULL,
	[MainDescripcion] [varchar](100) NULL,
	[MainEstatus] [bit] NULL,
 CONSTRAINT [PK_MainMenu] PRIMARY KEY CLUSTERED 
(
	[MainMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentacion]    Script Date: Sep/19/2020 12:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](256) NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_Presentacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: Sep/19/2020 12:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Razon_Social] [varchar](150) NOT NULL,
	[Sector_Comercial] [varchar](150) NOT NULL,
	[RNC] [varchar](20) NULL,
	[Tipo_Documento] [varchar](20) NULL,
	[Num_Documento] [varchar](11) NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](10) NULL,
	[Email] [varchar](200) NULL,
	[Url] [varchar](200) NULL,
	[Estatus] [bit] NULL,
	[ProvImagen] [varchar](100) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: Sep/19/2020 12:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleDescripcion] [varchar](100) NULL,
	[RoleEstatus] [bit] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubMenu]    Script Date: Sep/19/2020 12:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubMenu](
	[SubID] [int] IDENTITY(1,1) NOT NULL,
	[SubDescripcion] [varchar](100) NULL,
	[SubController] [varchar](100) NULL,
	[SubAction] [varchar](100) NULL,
	[SubMenuID] [int] NULL,
	[SubRoleID] [int] NULL,
 CONSTRAINT [PK_SubMenu] PRIMARY KEY CLUSTERED 
(
	[SubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: Sep/19/2020 12:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cliente] [int] NOT NULL,
	[Id_Trabajador] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[ComprobanteFiscal] [varchar](20) NULL,
	[Serie] [varchar](4) NULL,
	[Correlativo] [varchar](7) NULL,
	[Igv] [decimal](4, 2) NULL,
	[Estatus] [bit] NULL,
	[MontoGravado] [decimal](11, 2) NULL,
	[MontoExento] [decimal](11, 2) NULL,
	[MontoDescuento] [decimal](11, 2) NULL,
	[MontoItbis] [decimal](11, 2) NULL,
 CONSTRAINT [PK_venta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [Codigo], [Descripcion], [Estatus]) VALUES (1, N'PM01', N'PARTES MOTOR
', 1)
INSERT [dbo].[Categoria] ([Id], [Codigo], [Descripcion], [Estatus]) VALUES (2, N'PC01', N'PARTES CARROCERIA
', 1)
INSERT [dbo].[Categoria] ([Id], [Codigo], [Descripcion], [Estatus]) VALUES (3, N'PCH01', N'PARTES CHASIS
', 1)
INSERT [dbo].[Categoria] ([Id], [Codigo], [Descripcion], [Estatus]) VALUES (4, N'AAC', N'AIRE ACOND
ICIONADO', 1)
INSERT [dbo].[Categoria] ([Id], [Codigo], [Descripcion], [Estatus]) VALUES (5, N'MAN01', N'MANTENIMIENTO
', 1)
INSERT [dbo].[Categoria] ([Id], [Codigo], [Descripcion], [Estatus]) VALUES (6, N'CAR01', N'CARROCERIA', 1)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([Id], [Codigo], [Nombre], [Apellidos], [Sexo], [Fecha_Nacimiento], [Tipo_Documento], [Num_Documento], [Direccion], [Telefono], [Email], [Estatus], [TipoNCF], [LoginID], [CliImagen], [NombreComercial]) VALUES (1, N'CLICONTADO', N'', N'', N'', CAST(N'2020-01-01' AS Date), N'02', N'', N'', N'', N'', 1, N'02', 0, N'p1.jpg', N'VENTAS AL CONTADO')
INSERT [dbo].[Clientes] ([Id], [Codigo], [Nombre], [Apellidos], [Sexo], [Fecha_Nacimiento], [Tipo_Documento], [Num_Documento], [Direccion], [Telefono], [Email], [Estatus], [TipoNCF], [LoginID], [CliImagen], [NombreComercial]) VALUES (2, N'CLI01', N'Rafael', N'Perez', N'M', CAST(N'1985-09-10' AS Date), N'01', N'10002400010', N'Direccion de Rafael Perez', N'8099998989', N'rperez@correo.com', 1, N'01', NULL, N'fotoj.jpg', N'Rafael Perez')
INSERT [dbo].[Clientes] ([Id], [Codigo], [Nombre], [Apellidos], [Sexo], [Fecha_Nacimiento], [Tipo_Documento], [Num_Documento], [Direccion], [Telefono], [Email], [Estatus], [TipoNCF], [LoginID], [CliImagen], [NombreComercial]) VALUES (3, N'CLI02', N'', N'', N'', CAST(N'1985-01-01' AS Date), N'01', N'101274531', N'Calle 27 de Febrero No. 123', N'809-330-5555', N'info@repazuano.com', 1, N'01', NULL, N'foto2.jpg', N'Repuestos El Azuano, SRL')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
SET IDENTITY_INSERT [dbo].[DetalleMovInventario] ON 

INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (1, 0, 1, CAST(0.0000 AS Decimal(18, 4)), CAST(26200.0000 AS Decimal(18, 4)), 10, 8, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 1, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (2, 0, 3, CAST(0.0000 AS Decimal(18, 4)), CAST(7000.0000 AS Decimal(18, 4)), 25, 23, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 1, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (3, 0, 25, CAST(0.0000 AS Decimal(18, 4)), CAST(9500.0000 AS Decimal(18, 4)), 10, 9, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 1, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (4, 0, 1, CAST(0.0000 AS Decimal(18, 4)), CAST(26200.0000 AS Decimal(18, 4)), 8, 6, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 2, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (5, 0, 3, CAST(0.0000 AS Decimal(18, 4)), CAST(7000.0000 AS Decimal(18, 4)), 23, 22, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 2, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (6, 0, 25, CAST(0.0000 AS Decimal(18, 4)), CAST(9500.0000 AS Decimal(18, 4)), 9, 7, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 2, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (7, 0, 2, CAST(0.0000 AS Decimal(18, 4)), CAST(12800.0000 AS Decimal(18, 4)), 15, 14, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 3, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (8, 0, 3, CAST(0.0000 AS Decimal(18, 4)), CAST(7000.0000 AS Decimal(18, 4)), 22, 20, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 3, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (9, 0, 3, CAST(0.0000 AS Decimal(18, 4)), CAST(7000.0000 AS Decimal(18, 4)), 20, 18, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 4, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (10, 0, 3, CAST(0.0000 AS Decimal(18, 4)), CAST(7000.0000 AS Decimal(18, 4)), 18, 17, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 5, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (11, 0, 3, CAST(0.0000 AS Decimal(18, 4)), CAST(7000.0000 AS Decimal(18, 4)), 17, 16, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 6, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (12, 0, 2, CAST(0.0000 AS Decimal(18, 4)), CAST(12800.0000 AS Decimal(18, 4)), 14, 13, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 7, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (13, 0, 1, CAST(0.0000 AS Decimal(18, 4)), CAST(26200.0000 AS Decimal(18, 4)), 6, 5, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 8, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (14, 0, 2, CAST(0.0000 AS Decimal(18, 4)), CAST(12800.0000 AS Decimal(18, 4)), 13, 12, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 9, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (15, 0, 1, CAST(0.0000 AS Decimal(18, 4)), CAST(26200.0000 AS Decimal(18, 4)), 5, 4, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-18' AS Date), 1, 12, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (16, 0, 1, CAST(0.0000 AS Decimal(18, 4)), CAST(26200.0000 AS Decimal(18, 4)), 4, 3, CAST(N'2020-09-19' AS Date), CAST(N'2020-09-19' AS Date), 1, 13, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (17, 0, 1, CAST(0.0000 AS Decimal(18, 4)), CAST(27000.0000 AS Decimal(18, 4)), 3, 2, CAST(N'2020-09-19' AS Date), CAST(N'2020-09-19' AS Date), 1, 14, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (18, 0, 1, CAST(0.0000 AS Decimal(18, 4)), CAST(27000.0000 AS Decimal(18, 4)), 2, 0, CAST(N'2020-09-19' AS Date), CAST(N'2020-09-19' AS Date), 1, 15, N'')
INSERT [dbo].[DetalleMovInventario] ([Id], [Id_Ingreso], [Id_Articulo], [Precio_Compra], [Precio_Venta], [Stock_Inicial], [Stock_Actual], [Fecha_produccion], [Fecha_vencimiento], [Estatus], [Id_Ventas], [Requisicion]) VALUES (19, 0, 3, CAST(0.0000 AS Decimal(18, 4)), CAST(7000.0000 AS Decimal(18, 4)), 16, 14, CAST(N'2020-09-19' AS Date), CAST(N'2020-09-19' AS Date), 1, 16, N'')
SET IDENTITY_INSERT [dbo].[DetalleMovInventario] OFF
SET IDENTITY_INSERT [dbo].[DetalleVentas] ON 

INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (1, 1, 1, 1, 2, CAST(26200.0000 AS Decimal(18, 4)), CAST(52400.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (2, 1, 3, 2, 2, CAST(7000.0000 AS Decimal(18, 4)), CAST(14000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (3, 1, 25, 3, 1, CAST(9500.0000 AS Decimal(18, 4)), CAST(9500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (4, 2, 1, 4, 2, CAST(26200.0000 AS Decimal(18, 4)), CAST(52400.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (5, 2, 3, 5, 1, CAST(7000.0000 AS Decimal(18, 4)), CAST(7000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (6, 2, 25, 6, 2, CAST(9500.0000 AS Decimal(18, 4)), CAST(19000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (7, 3, 2, 7, 1, CAST(12800.0000 AS Decimal(18, 4)), CAST(12800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (8, 3, 3, 8, 2, CAST(7000.0000 AS Decimal(18, 4)), CAST(14000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (9, 4, 3, 9, 2, CAST(7000.0000 AS Decimal(18, 4)), CAST(14000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (10, 5, 3, 10, 1, CAST(7000.0000 AS Decimal(18, 4)), CAST(7000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (11, 6, 3, 11, 1, CAST(7000.0000 AS Decimal(18, 4)), CAST(7000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (12, 7, 2, 12, 1, CAST(12800.0000 AS Decimal(18, 4)), CAST(12800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (13, 8, 1, 13, 1, CAST(26200.0000 AS Decimal(18, 4)), CAST(26200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (14, 9, 2, 14, 1, CAST(12800.0000 AS Decimal(18, 4)), CAST(12800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (15, 12, 1, 15, 1, CAST(26200.0000 AS Decimal(18, 4)), CAST(26200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (16, 13, 1, 16, 1, CAST(26200.0000 AS Decimal(18, 4)), CAST(26200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (17, 14, 1, 17, 1, CAST(27000.0000 AS Decimal(18, 4)), CAST(27000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (18, 15, 1, 18, 2, CAST(27000.0000 AS Decimal(18, 4)), CAST(54000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[DetalleVentas] ([Id], [Id_Venta], [Id_Articulo], [Id_MovInventario], [Cantidad], [PrecioUnitarioVenta], [PrecioVenta], [DescuentoVenta], [Estatus]) VALUES (19, 16, 3, 19, 2, CAST(7000.0000 AS Decimal(18, 4)), CAST(14000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[DetalleVentas] OFF
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([Id], [Nombre], [Apellido], [Sexo], [Fecha_Nac], [Num_Documento], [Direccion], [Telefono], [Email], [NivelAcceso], [Estatus], [Cedula], [Fecha_Ingreso], [LoginID], [EmpImagen]) VALUES (1, N'Maria', N'Jimenez', N'F', CAST(N'1980-01-15' AS Date), N'03789542', N'Direccion Maria Jimenez', N'809-258-6598', N'mjimenez@correo.com', 2, 1, N'03787965327', CAST(N'2018-01-25' AS Date), NULL, N'p4.jpg')
INSERT [dbo].[Empleados] ([Id], [Nombre], [Apellido], [Sexo], [Fecha_Nac], [Num_Documento], [Direccion], [Telefono], [Email], [NivelAcceso], [Estatus], [Cedula], [Fecha_Ingreso], [LoginID], [EmpImagen]) VALUES (2, N'Jose', N'Hernandez', N'M', CAST(N'1980-01-10' AS Date), N'12369874', N'Direccion Jose Hernandez', N'829-987-6582', N'jhernandez@correo.com', 2, 1, N'03769874521', CAST(N'2017-01-25' AS Date), NULL, N'p2.jpg')
INSERT [dbo].[Empleados] ([Id], [Nombre], [Apellido], [Sexo], [Fecha_Nac], [Num_Documento], [Direccion], [Telefono], [Email], [NivelAcceso], [Estatus], [Cedula], [Fecha_Ingreso], [LoginID], [EmpImagen]) VALUES (3, N'Juan Carlos', N'Mejia Rosario', N'M', CAST(N'1979-05-15' AS Date), N'12369891', N'Direccion de Juan Carlos', N'8293659887', N'jmejia@correo.com', 1, 1, N'03714588888', CAST(N'2002-09-01' AS Date), NULL, N'p1.jpg')
INSERT [dbo].[Empleados] ([Id], [Nombre], [Apellido], [Sexo], [Fecha_Nac], [Num_Documento], [Direccion], [Telefono], [Email], [NivelAcceso], [Estatus], [Cedula], [Fecha_Ingreso], [LoginID], [EmpImagen]) VALUES (5, N'Pablo', N'Rosario', N'M', CAST(N'1979-05-10' AS Date), N'12369833', N'Direccion de Pablo', N'8293659887', N'prosario@correo.com', 2, 1, N'03745879632', NULL, NULL, N'p4.jpg')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
SET IDENTITY_INSERT [dbo].[EmpresaConfig] ON 

INSERT [dbo].[EmpresaConfig] ([EmpresaID], [NombreEmpresa], [RNC], [NCF01_Proximo], [NCF02_Proximo], [NCF03_Proximo], [NCF04_Proximo], [NCF14_Proximo], [NCF15_Proximo], [TasaItbisActual], [ArchivoLogo], [ArchivoTipografia]) VALUES (1, N'Empresa Prueba 1', N'00156478935', 8, 11, 3, 4, 5, 6, 0.18, N'Prod5.jpg', N'Prod5.jpg')
SET IDENTITY_INSERT [dbo].[EmpresaConfig] OFF
SET IDENTITY_INSERT [dbo].[InventarioArticulos] ON 

INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (1, 0, 1, N'CSF89', N'ALTERNADOR HONDA CIVIC 2006-2011 GENUINO ', N'HONDA', NULL, 2011, 1, 1, CAST(N'2020-01-01' AS Date), CAST(26017.6400 AS Decimal(18, 4)), CAST(27000.0000 AS Decimal(18, 4)), 0, 3, NULL, NULL, NULL, N'001.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (2, 1, 1, N'CSD73', N'ALTERNADOR HONDA CIVIC 1999-2006 REMPLAZO', N'HONDA', NULL, 2006, 1, 1, CAST(N'2020-01-01' AS Date), CAST(11200.0000 AS Decimal(18, 4)), CAST(12800.0000 AS Decimal(18, 4)), 12, 5, 1, N'', N'', N'002.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (3, 1, 1, N'FW2583GTY', N'VIDRIO DELANTERO ORIGINAL HONDA CIVIC  2006-2011', N'HONDA', NULL, 2011, 1, 1, CAST(N'2020-01-01' AS Date), CAST(6550.0000 AS Decimal(18, 4)), CAST(7000.0000 AS Decimal(18, 4)), 14, 5, 1, N'', N'', N'003.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (4, 2, 1, N'BS26010750', N'DISCOS DE FRENO TRASEROS HONDA CIVIC 2006-2011', N'HONDA', N'CIVIC', 2011, 3, 1, CAST(N'2020-01-01' AS Date), CAST(6100.0000 AS Decimal(18, 4)), CAST(6100.0000 AS Decimal(18, 4)), 5, 2, 1, N'', N'', N'004.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (5, 1, 1, N'M5545', N'AMORTIGUADOR TRASERO HONDA CIVIC 2016-2020', N'HONDA', N'CIVIC', 2020, 3, 1, CAST(N'2020-01-01' AS Date), CAST(4060.0000 AS Decimal(18, 4)), CAST(4060.0000 AS Decimal(18, 4)), 10, 5, 1, N'', N'', N'005.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (6, 2, 2, N'73111-TVA-A11', N'VIDRIO DELANTERO ORIGINAL HONDA ACCORD  2006-2011', N'HONDA', N'ACCORD', 2019, 2, 1, CAST(N'2020-01-01' AS Date), CAST(19452.0000 AS Decimal(18, 4)), CAST(19452.0000 AS Decimal(18, 4)), 15, 5, 1, N'', N'', N'006.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (7, 2, 2, N'43022-TA0-A00', N'JUEGO DE BANDAS DE FRENO HONDA ACCORD 2006-2011', N'HONDA', N'ACCORD', 2006, 3, 1, CAST(N'2020-01-01' AS Date), CAST(4110.0000 AS Decimal(18, 4)), CAST(4110.0000 AS Decimal(18, 4)), 11, 3, 1, N'', N'', N'007.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (8, 1, 2, N'171286R', N'AMORTIGUADOR TRASERO HONDA ACCORD 2006-2011', N'HONDA', N'ACCORD', 2011, 3, 1, CAST(N'2020-01-01' AS Date), CAST(7657.0000 AS Decimal(18, 4)), CAST(7657.0000 AS Decimal(18, 4)), 7, 10, 1, N'', N'', N'008.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (9, 1, 2, N'210-0432', N'ALTERNADOR TOYOTA COROLLA 1998-2002', N'TOYOTA', N'COROLLA', 2002, 1, 1, CAST(N'2020-01-01' AS Date), CAST(8352.0000 AS Decimal(18, 4)), CAST(8352.0000 AS Decimal(18, 4)), 5, 3, 1, N'', N'', N'009.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (10, 1, 2, N'106850', N'AMORTIGUADOR TRASERO TOYOTA COROLLA 2014-2018', N'TOYOTA', N'COROLLA', 2018, 3, 1, CAST(N'2020-01-01' AS Date), CAST(2900.0000 AS Decimal(18, 4)), CAST(2900.0000 AS Decimal(18, 4)), 3, 5, 1, N'', N'', N'010.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (12, 1, 1, N'06245-172940', N'AMORTIGUADOR DELANTERO TOYOTA CAMRY 2012-2016', N'TOYOTA', N'CAMRY', 2016, 3, 1, CAST(N'2020-01-01' AS Date), CAST(37050.0000 AS Decimal(18, 4)), CAST(37050.0000 AS Decimal(18, 4)), 10, 5, 1, N'', N'', N'012.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (13, 2, 1, N'11178JC', N'COMPRESOR AIRE ACOND. TOYOTA CAMRY 2007-2009', N'TOYOTA', N'CAMRY', 2009, 4, 1, CAST(N'2020-01-01' AS Date), CAST(7940.0000 AS Decimal(18, 4)), CAST(7940.0000 AS Decimal(18, 4)), 5, 6, 1, N'', N'', N'013.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (14, 2, 1, N'Z665SX', N'EVAPORADOR AIRE ACOND. TOYOTA CAMRY 2007-2009', N'TOYOTA', N'CAMRY', 2009, 4, 1, CAST(N'2020-01-01' AS Date), CAST(13200.0000 AS Decimal(18, 4)), CAST(13200.0000 AS Decimal(18, 4)), 2, 3, 1, N'', N'', N'014.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (15, 1, 1, N'8850102222', N'EVAPORADOR AIRE ACOND. TOYOTA COROLLA 2007-2009', N'TOYOTA ', N'COROLLA', 2009, 4, 1, CAST(N'2020-01-01' AS Date), CAST(7600.0000 AS Decimal(18, 4)), CAST(7600.0000 AS Decimal(18, 4)), 3, 2, 1, N'', N'', N'015.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (16, 2, 2, N'04152-YZZA6', N'FILTRO DE ACEITE TOYOTA COROLLA 2009-2018', N'TOYOTA ', N'COROLLA', 2015, 5, 1, CAST(N'2020-01-01' AS Date), CAST(700.0000 AS Decimal(18, 4)), CAST(700.0000 AS Decimal(18, 4)), 25, 20, 1, N'', N'', N'016.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (17, 1, 2, N'04152-YZZA1', N'FILTRO DE ACEITE TOYOTA CAMRY 2007-2009', N'TOYOTA ', N'CAMRY', 2009, 5, 1, CAST(N'2020-01-01' AS Date), CAST(900.0000 AS Decimal(18, 4)), CAST(900.0000 AS Decimal(18, 4)), 50, 20, 1, N'', N'', N'017.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (18, 2, 2, N'15400-PLM-A02', N'FILTRO DE ACEITE HONDA CIVIC 2019-2020', N'HONDA ', N'CIVIC', 2020, 5, 1, CAST(N'2020-01-01' AS Date), CAST(900.0000 AS Decimal(18, 4)), CAST(900.0000 AS Decimal(18, 4)), 50, 20, 1, N'', N'', N'018.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (19, 2, 2, N'80211TBAA11', N'EVAPORADOR AIRE ACOND. HONDA CIVIC 2019-2020', N'HONDA ', N'CIVIC', 2020, 4, 1, CAST(N'2020-01-01' AS Date), CAST(8200.0000 AS Decimal(18, 4)), CAST(8200.0000 AS Decimal(18, 4)), 7, 5, 1, N'', N'', N'019.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (20, 2, 2, N'71501-TBA-A010', N'BUMPER TRASERO HONDA CIVIC 2016-2018', N'HONDA ', N'CIVIC', 2018, 6, 2, CAST(N'2020-01-01' AS Date), CAST(9020.0000 AS Decimal(18, 4)), CAST(9020.0000 AS Decimal(18, 4)), 3, 5, 1, N'', N'', N'020.JPG')
INSERT [dbo].[InventarioArticulos] ([Id_Articulo], [Id_Trabajador], [Id_Proveedor], [Codigo], [Descripcion], [Marca], [Modelo], [Year], [Id_Categoria], [Id_Presentacion], [Fecha_Entrada], [CostoUnitario], [PrecioUnitarioVenta], [CantidadDisponible], [CantidadReposicion], [Estatus], [Almacen], [Tramo], [ArtImagen]) VALUES (25, 0, 1, N'71501-TBA-A010', N'BUMPER TRASERO HONDA CIVIC 2016-2018', NULL, NULL, 2018, 1, 1, CAST(N'2020-01-01' AS Date), CAST(9020.0000 AS Decimal(18, 4)), CAST(9500.0000 AS Decimal(18, 4)), 7, 5, 1, N'', N'', N'020.JPG')
SET IDENTITY_INSERT [dbo].[InventarioArticulos] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([LoginID], [UserName], [Password], [ConfirmPassword], [PersonalName], [Email], [LoginRoleID], [LoginEstatus]) VALUES (1, N'Admin', N'admin', NULL, N'Jerlis Medina', N'jmedina@correo.com', 1, 1)
INSERT [dbo].[Login] ([LoginID], [UserName], [Password], [ConfirmPassword], [PersonalName], [Email], [LoginRoleID], [LoginEstatus]) VALUES (2, N'Manager', N'manager', NULL, N'Director Empresa', N'demp@correo.com', 2, 1)
INSERT [dbo].[Login] ([LoginID], [UserName], [Password], [ConfirmPassword], [PersonalName], [Email], [LoginRoleID], [LoginEstatus]) VALUES (3, N'User', N'user', NULL, N'Usuario Empresa', N'uemp@correo.com', 3, 1)
INSERT [dbo].[Login] ([LoginID], [UserName], [Password], [ConfirmPassword], [PersonalName], [Email], [LoginRoleID], [LoginEstatus]) VALUES (4, N'mperez', N'123', NULL, N'Maria Perez Jimenez', N'mperez@correo.com', 4, 1)
INSERT [dbo].[Login] ([LoginID], [UserName], [Password], [ConfirmPassword], [PersonalName], [Email], [LoginRoleID], [LoginEstatus]) VALUES (5, N'cpena', N'123', N'123', N'Carlos Peña', N'cpena@correo.com', 1, 1)
INSERT [dbo].[Login] ([LoginID], [UserName], [Password], [ConfirmPassword], [PersonalName], [Email], [LoginRoleID], [LoginEstatus]) VALUES (6, N'cperalta', N'321', N'321', N'Cristina Peralta', N'cperalta@gmail.com', 4, 1)
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[MainMenu] ON 

INSERT [dbo].[MainMenu] ([MainMenuID], [MainDescripcion], [MainEstatus]) VALUES (1, N'Mantenimiento', 1)
INSERT [dbo].[MainMenu] ([MainMenuID], [MainDescripcion], [MainEstatus]) VALUES (2, N'Consultas', 1)
INSERT [dbo].[MainMenu] ([MainMenuID], [MainDescripcion], [MainEstatus]) VALUES (3, N'Reportes', 1)
INSERT [dbo].[MainMenu] ([MainMenuID], [MainDescripcion], [MainEstatus]) VALUES (4, N'Sistema', 1)
SET IDENTITY_INSERT [dbo].[MainMenu] OFF
SET IDENTITY_INSERT [dbo].[MenuUsers] ON 

INSERT [dbo].[MenuUsers] ([MenuID], [MenuDescripcion], [MenuPadre], [MenuPadreDescripcion], [MenuControl], [MenuView], [MenuIcon], [MenuUrl], [MenuActivo], [MenuCreadoEn], [MenuCreadoPor], [MenuModificadoEn], [MenuModificacoPor]) VALUES (1, N'Mantenimiento', 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-09-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[MenuUsers] ([MenuID], [MenuDescripcion], [MenuPadre], [MenuPadreDescripcion], [MenuControl], [MenuView], [MenuIcon], [MenuUrl], [MenuActivo], [MenuCreadoEn], [MenuCreadoPor], [MenuModificadoEn], [MenuModificacoPor]) VALUES (2, N'Consultas', 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-09-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[MenuUsers] ([MenuID], [MenuDescripcion], [MenuPadre], [MenuPadreDescripcion], [MenuControl], [MenuView], [MenuIcon], [MenuUrl], [MenuActivo], [MenuCreadoEn], [MenuCreadoPor], [MenuModificadoEn], [MenuModificacoPor]) VALUES (3, N'Reportes', 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-09-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[MenuUsers] ([MenuID], [MenuDescripcion], [MenuPadre], [MenuPadreDescripcion], [MenuControl], [MenuView], [MenuIcon], [MenuUrl], [MenuActivo], [MenuCreadoEn], [MenuCreadoPor], [MenuModificadoEn], [MenuModificacoPor]) VALUES (4, N'Sistema', 0, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2020-09-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[MenuUsers] ([MenuID], [MenuDescripcion], [MenuPadre], [MenuPadreDescripcion], [MenuControl], [MenuView], [MenuIcon], [MenuUrl], [MenuActivo], [MenuCreadoEn], [MenuCreadoPor], [MenuModificadoEn], [MenuModificacoPor]) VALUES (5, N'Productos', 1, N'Mantenimiento', N'Productos', N'Index', NULL, NULL, 1, NULL, NULL, CAST(N'2020-09-14' AS Date), NULL)
INSERT [dbo].[MenuUsers] ([MenuID], [MenuDescripcion], [MenuPadre], [MenuPadreDescripcion], [MenuControl], [MenuView], [MenuIcon], [MenuUrl], [MenuActivo], [MenuCreadoEn], [MenuCreadoPor], [MenuModificadoEn], [MenuModificacoPor]) VALUES (6, N'Proveedores', 1, NULL, N'Proveedores', N'Index', NULL, NULL, 1, CAST(N'2020-09-14' AS Date), NULL, NULL, NULL)
INSERT [dbo].[MenuUsers] ([MenuID], [MenuDescripcion], [MenuPadre], [MenuPadreDescripcion], [MenuControl], [MenuView], [MenuIcon], [MenuUrl], [MenuActivo], [MenuCreadoEn], [MenuCreadoPor], [MenuModificadoEn], [MenuModificacoPor]) VALUES (7, N'Catalogo Productos', 2, NULL, N'Productos', N'CatalogoProductos', NULL, NULL, 1, CAST(N'2020-09-14' AS Date), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MenuUsers] OFF
SET IDENTITY_INSERT [dbo].[Presentacion] ON 

INSERT [dbo].[Presentacion] ([Id], [Codigo], [Descripcion], [Estatus]) VALUES (1, N'PRES01', N'Unidad', 1)
INSERT [dbo].[Presentacion] ([Id], [Codigo], [Descripcion], [Estatus]) VALUES (2, N'PRES02', N'Docena', 1)
INSERT [dbo].[Presentacion] ([Id], [Codigo], [Descripcion], [Estatus]) VALUES (3, N'PRES03', N'Galones', 1)
SET IDENTITY_INSERT [dbo].[Presentacion] OFF
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([Id], [Codigo], [Razon_Social], [Sector_Comercial], [RNC], [Tipo_Documento], [Num_Documento], [Direccion], [Telefono], [Email], [Url], [Estatus], [ProvImagen]) VALUES (1, N'PROV01', N'Indomotoca, SRL', N'Piezas en Gral', N'1-9852683-2', N'Doc Prueba 1', N'00198756328', N'Direccion Prueba 1', N'8096589999', N'correo@prueba1.com', NULL, 1, N'p2.jpg')
INSERT [dbo].[Proveedores] ([Id], [Codigo], [Razon_Social], [Sector_Comercial], [RNC], [Tipo_Documento], [Num_Documento], [Direccion], [Telefono], [Email], [Url], [Estatus], [ProvImagen]) VALUES (2, N'PROV02', N'Distribuidora Dominicana, S. A.', N'Lubricantes', N'2-9852683-2', N'Doc Prueba 2', N'00298756329', N'Direccion Prueba 2', N'8096589988', N'correo@prueba2.com', NULL, 1, N'p3.png')
INSERT [dbo].[Proveedores] ([Id], [Codigo], [Razon_Social], [Sector_Comercial], [RNC], [Tipo_Documento], [Num_Documento], [Direccion], [Telefono], [Email], [Url], [Estatus], [ProvImagen]) VALUES (4, N'PROV04', N'Century, SRL', N'Amortiguadores', N'12546123', NULL, N'12369654', N'Direccion Prueba Cuatro', N'8099999999', N'emailprueba@cuatro.com', NULL, 1, N'p1.jpg')
INSERT [dbo].[Proveedores] ([Id], [Codigo], [Razon_Social], [Sector_Comercial], [RNC], [Tipo_Documento], [Num_Documento], [Direccion], [Telefono], [Email], [Url], [Estatus], [ProvImagen]) VALUES (5, N'PROV05', N'Proveedor Prueba 5', N'Sector Prueba 5', N'12546931', N'Doc Prueba 5', N'12369812', N'Direccion Prueba Cinco', N'8099709875', N'emailprueba@cinco.com', NULL, 1, N'p4.jpg')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleDescripcion], [RoleEstatus]) VALUES (1, N'Administrador', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleDescripcion], [RoleEstatus]) VALUES (2, N'Manager', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleDescripcion], [RoleEstatus]) VALUES (3, N'User', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleDescripcion], [RoleEstatus]) VALUES (4, N'Vendedor', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[SubMenu] ON 

INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (1, N'Productos', N'Productos', N'Index', 1, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (2, N'Proveedores', N'Proveedores', N'Index', 1, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (3, N'Clientes', N'Clientes', N'Index', 1, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (4, N'Empleados', N'Empleados', N'Index', 1, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (5, N'Catalogo Productos', N'Productos', N'CatalogoProductos', 2, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (6, N'Listado Proveedores', N'Proveedores', N'Proveedores', 2, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (8, N'Crear Sub-Menu', N'SubMenu', N'Index', 4, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (9, N'Crear Menu', N'Menu', N'Index', 4, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (10, N'Crear Usuarios', N'Usuario', N'Index', 4, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (11, N'Catalogo Productos', N'Productos', N'CatalogoProductos', 2, 3)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (13, N'Roles de Usuarios', N'Roles', N'Index', 4, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (14, N'Empresas', N'Empresas', N'Index', 4, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (15, N'Ventas', N'Ventas', N'Index', 4, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (16, N'Clientes', N'Clientes', N'Clientes', 2, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (17, N'Empleados', N'Empleados', N'Empleados', 2, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (18, N'Listado de Ventas', N'Reportes', N'ReporteFacturas', 3, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (19, N'Movimientos Inventario', N'Reportes', N'ReporteMovInventario', 3, 1)
INSERT [dbo].[SubMenu] ([SubID], [SubDescripcion], [SubController], [SubAction], [SubMenuID], [SubRoleID]) VALUES (20, N'Listado de Inventario', N'Reportes', N'ReporteArticulos', 3, 1)
SET IDENTITY_INSERT [dbo].[SubMenu] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([RoleID], [RoleDescripcion], [RoleEstatus]) VALUES (1, N'Administrador', 1)
INSERT [dbo].[UserRoles] ([RoleID], [RoleDescripcion], [RoleEstatus]) VALUES (2, N'Visitante', 1)
INSERT [dbo].[UserRoles] ([RoleID], [RoleDescripcion], [RoleEstatus]) VALUES (3, N'Vendedor', 1)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (1, 1, 0, CAST(N'2020-09-16' AS Date), N'B0200000002', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(75900.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(13662.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (2, 2, 0, CAST(N'2020-09-16' AS Date), N'B0100000001', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(78400.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(14112.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (3, 2, 0, CAST(N'2020-09-16' AS Date), N'B0100000002', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(26800.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(4824.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (4, 1, 0, CAST(N'2020-09-17' AS Date), N'B0200000003', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(14000.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(2520.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (5, 1, 0, CAST(N'2020-09-17' AS Date), N'B0200000004', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(7000.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(1260.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (6, 2, 0, CAST(N'2020-09-17' AS Date), N'B0100000003', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(7000.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(1260.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (7, 2, 0, CAST(N'2020-09-17' AS Date), N'B0100000004', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(12800.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(2304.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (8, 1, 0, CAST(N'2020-09-18' AS Date), N'B0200000005', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(26200.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(4716.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (9, 1, 0, CAST(N'2020-09-18' AS Date), N'B0200000006', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(12800.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(2304.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (12, 3, 0, CAST(N'2020-09-18' AS Date), N'B0100000005', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(26200.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(4716.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (13, 3, 0, CAST(N'2020-09-19' AS Date), N'B0100000006', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(26200.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(4716.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (14, 1, 0, CAST(N'2020-09-19' AS Date), N'B0200000009', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(27000.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(4860.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (15, 1, 0, CAST(N'2020-09-19' AS Date), N'B0200000010', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(54000.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(9720.00 AS Decimal(11, 2)))
INSERT [dbo].[Ventas] ([Id], [Id_Cliente], [Id_Trabajador], [Fecha], [ComprobanteFiscal], [Serie], [Correlativo], [Igv], [Estatus], [MontoGravado], [MontoExento], [MontoDescuento], [MontoItbis]) VALUES (16, 3, 0, CAST(N'2020-09-19' AS Date), N'B0100000007', NULL, N'', CAST(0.00 AS Decimal(4, 2)), 1, CAST(14000.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(0.00 AS Decimal(11, 2)), CAST(2520.00 AS Decimal(11, 2)))
SET IDENTITY_INSERT [dbo].[Ventas] OFF
ALTER TABLE [dbo].[AccesosUsuarios] ADD  CONSTRAINT [DF_AccesosUsuarios_AccesoCreadoEn]  DEFAULT (getdate()) FOR [AccesoCreadoEn]
GO
ALTER TABLE [dbo].[MenuUsers] ADD  CONSTRAINT [DF_MenuUsers_MenuPadre]  DEFAULT ((0)) FOR [MenuPadre]
GO
ALTER TABLE [dbo].[MenuUsers] ADD  CONSTRAINT [DF_MenuUsers_MenuCreadoEn]  DEFAULT (getdate()) FOR [MenuCreadoEn]
GO
ALTER TABLE [dbo].[DetalleMovInventario]  WITH CHECK ADD  CONSTRAINT [FK_DetalleMovInventario_InventarioArticulos] FOREIGN KEY([Id_Articulo])
REFERENCES [dbo].[InventarioArticulos] ([Id_Articulo])
GO
ALTER TABLE [dbo].[DetalleMovInventario] CHECK CONSTRAINT [FK_DetalleMovInventario_InventarioArticulos]
GO
ALTER TABLE [dbo].[DetalleMovInventario]  WITH CHECK ADD  CONSTRAINT [FK_DetalleMovInventario_Ventas] FOREIGN KEY([Id_Ventas])
REFERENCES [dbo].[Ventas] ([Id])
GO
ALTER TABLE [dbo].[DetalleMovInventario] CHECK CONSTRAINT [FK_DetalleMovInventario_Ventas]
GO
ALTER TABLE [dbo].[DetalleVentas]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVentas_InventarioArticulos] FOREIGN KEY([Id_Articulo])
REFERENCES [dbo].[InventarioArticulos] ([Id_Articulo])
GO
ALTER TABLE [dbo].[DetalleVentas] CHECK CONSTRAINT [FK_DetalleVentas_InventarioArticulos]
GO
ALTER TABLE [dbo].[DetalleVentas]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVentas_Ventas] FOREIGN KEY([Id_Venta])
REFERENCES [dbo].[Ventas] ([Id])
GO
ALTER TABLE [dbo].[DetalleVentas] CHECK CONSTRAINT [FK_DetalleVentas_Ventas]
GO
ALTER TABLE [dbo].[InventarioArticulos]  WITH CHECK ADD  CONSTRAINT [FK_InventarioArticulos_Categoria] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[InventarioArticulos] CHECK CONSTRAINT [FK_InventarioArticulos_Categoria]
GO
ALTER TABLE [dbo].[InventarioArticulos]  WITH CHECK ADD  CONSTRAINT [FK_InventarioArticulos_Presentacion] FOREIGN KEY([Id_Presentacion])
REFERENCES [dbo].[Presentacion] ([Id])
GO
ALTER TABLE [dbo].[InventarioArticulos] CHECK CONSTRAINT [FK_InventarioArticulos_Presentacion]
GO
ALTER TABLE [dbo].[InventarioArticulos]  WITH CHECK ADD  CONSTRAINT [FK_InventarioArticulos_Proveedores] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedores] ([Id])
GO
ALTER TABLE [dbo].[InventarioArticulos] CHECK CONSTRAINT [FK_InventarioArticulos_Proveedores]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Roles] FOREIGN KEY([LoginRoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Roles]
GO
ALTER TABLE [dbo].[SubMenu]  WITH CHECK ADD  CONSTRAINT [FK_SubMenu_MainMenu] FOREIGN KEY([SubMenuID])
REFERENCES [dbo].[MainMenu] ([MainMenuID])
GO
ALTER TABLE [dbo].[SubMenu] CHECK CONSTRAINT [FK_SubMenu_MainMenu]
GO
ALTER TABLE [dbo].[SubMenu]  WITH CHECK ADD  CONSTRAINT [FK_SubMenu_Roles] FOREIGN KEY([SubRoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[SubMenu] CHECK CONSTRAINT [FK_SubMenu_Roles]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Clientes] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Clientes]
GO
/****** Object:  StoredProcedure [dbo].[ListaMenuActivo]    Script Date: Sep/19/2020 12:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListaMenuActivo]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT MenuID
      ,MenuDescripcion
      ,MenuPadre
	  ,MenuControl
	  ,MenuView
      ,MenuIcon
      ,MenuUrl
      ,MenuActivo
      ,MenuCreadoEn
      ,MenuCreadoPor
      ,MenuModificadoEn
      ,MenuModificacoPor
	FROM MenuUsers
	WHERE MenuActivo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ListaMenuDesactivado]    Script Date: Sep/19/2020 12:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListaMenuDesactivado]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT MenuID
      ,MenuDescripcion
      ,MenuPadre
	  ,MenuControl
	  ,MenuView
      ,MenuIcon
      ,MenuUrl
      ,MenuActivo
      ,MenuCreadoEn
      ,MenuCreadoPor
      ,MenuModificadoEn
      ,MenuModificacoPor
	FROM MenuUsers
	WHERE MenuActivo = 0
END
GO
/****** Object:  StoredProcedure [dbo].[ListaMenuTodos]    Script Date: Sep/19/2020 12:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListaMenuTodos]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT MenuID
      ,MenuDescripcion
      ,MenuPadre
	  ,MenuControl
	  ,MenuView
      ,MenuIcon
      ,MenuUrl
      ,MenuActivo
      ,MenuCreadoEn
      ,MenuCreadoPor
      ,MenuModificadoEn
      ,MenuModificacoPor
	FROM MenuUsers
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MenuUsers"
            Begin Extent = 
               Top = 6
               Left = 494
               Bottom = 216
               Right = 692
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccesosUsuarios"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 206
               Right = 456
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "UserRoles"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 168
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 20
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPermisosRoles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPermisosRoles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPermisosRoles'
GO
USE [master]
GO
ALTER DATABASE [RepuestoJCDB] SET  READ_WRITE 
GO
