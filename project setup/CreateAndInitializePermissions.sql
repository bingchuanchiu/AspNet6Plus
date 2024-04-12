use [SeedSolution];

/******************************* DROP AND CREATE PERMISSIONS TABLE *******************************************/

-- REMOVES BACK THE PK/FK RELATIONSHIP
ALTER TABLE [dbo].[RoleAssignedPermissions] DROP CONSTRAINT [FK_RoleAssignedPermissions_Permissions]
ALTER TABLE [dbo].[Permissions] DROP CONSTRAINT [PK_Permissions]

-- DROPS TABLE TO RESET INDEX, UNLESS I CAN FIND A WAY TO RESET INDEX WITHOUT DROPPING TABLE
DROP TABLE IF EXISTS [Permissions]

-- CREATES TABLE
CREATE TABLE [dbo].[Permissions](
	[permission_id] [int] IDENTITY(1,1) NOT NULL,
	[table_name] [nvarchar](100) NULL,
	[permission_name] [nvarchar](100) NULL,
	[display_name] [nvarchar](100) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- ADDS BACK THE PK/FK RELATIONSHIP
ALTER TABLE [dbo].[RoleAssignedPermissions] ADD CONSTRAINT [FK_RoleAssignedPermissions_Permissions] FOREIGN KEY(permission_id) 
REFERENCES [dbo].[Permissions] (permission_id) 


/******************************* INITIALIZE PERMISSIONS TABLE *******************************************/
-- WILL INITIALIZE PERMISSIONS FOR ALL TABLES WITH READ, WRITE, UPDATE, DELETE
if object_id('#tmp1') is not null
 drop table #tmp1 else drop table #tmp1

SELECT * INTO #tmp1
FROM 
(select distinct 
tbl.TABLE_NAME as 'table_name', 
tbl.TABLE_NAME + '_Read' as 'code'  , 
tbl.TABLE_NAME + ' Read' as 'display'   
FROM INFORMATION_SCHEMA.COLUMNS as tbl 
WHERE tbl.TABLE_NAME != 'sysdiagrams') as a;

INSERT INTO [dbo].[Permissions]([table_name],[permission_name],[display_name],[created_at])
SELECT t.table_name,t.code, t.display, CURRENT_TIMESTAMP
FROM  #tmp1 as t

if object_id('#tmp2') is not null
 drop table #tmp2 else drop table #tmp2

SELECT * INTO #tmp2
FROM 
(select distinct 
tbl.TABLE_NAME as 'table_name', 
tbl.TABLE_NAME + '_Write' as 'code',
tbl.TABLE_NAME + ' Write' as 'display'
FROM INFORMATION_SCHEMA.COLUMNS as tbl 
WHERE tbl.TABLE_NAME != 'sysdiagrams') as b

INSERT INTO [dbo].[Permissions]([table_name],[permission_name],[display_name],[created_at])
SELECT t.table_name,t.code, t.display, CURRENT_TIMESTAMP
FROM  #tmp2 as t

if object_id('#tmp3') is not null
 drop table #tmp3 else drop table #tmp3

SELECT * INTO #tmp3
FROM 
(select distinct 
tbl.TABLE_NAME as 'table_name', 
tbl.TABLE_NAME +'_Update' as 'code',
tbl.TABLE_NAME +' Update' as 'display'
FROM INFORMATION_SCHEMA.COLUMNS as tbl 
WHERE tbl.TABLE_NAME != 'sysdiagrams') as c

INSERT INTO [dbo].[Permissions]([table_name],[permission_name],[display_name],[created_at])
SELECT t.table_name,t.code, t.display, CURRENT_TIMESTAMP
FROM  #tmp3 as t

if object_id('#tmp4') is not null
 drop table #tmp4 else drop table #tmp4

SELECT * INTO #tmp4
FROM 
(select distinct 
tbl.TABLE_NAME as 'table_name', 
tbl.TABLE_NAME +'_Delete' as 'code',
tbl.TABLE_NAME +' Delete' as 'display'
FROM INFORMATION_SCHEMA.COLUMNS as tbl 
WHERE tbl.TABLE_NAME != 'sysdiagrams') as d

INSERT INTO [dbo].[Permissions]([table_name],[permission_name],[display_name],[created_at])
SELECT t.table_name,t.code, t.display, CURRENT_TIMESTAMP
FROM  #tmp4 as t

/******************************* ADD SPECIAL PERMISSIONS *******************************************/
-- ADD WHATEVER EXTRA PERMISSIONS THAT ARE NOT REFERENCE ANY TABLE
INSERT INTO [dbo].[Permissions]([permission_name], [display_name], [created_at])
VALUES 
('AdministrativeControlPanel','Administrative Control Panel',CURRENT_TIMESTAMP)
 ,('PrimaryNavigation','Primary Navigation',CURRENT_TIMESTAMP)
 ,('SecondaryNavigation','Secondary Navigation',CURRENT_TIMESTAMP)
 
  /******************************* ADD SPECIAL PERMISSIONS, EACH PLANT GROUP WILL HAVE THEIR CORRESPONDING PLANT PERMISSION, ADMIN GROUP WILL HAVE ALL PLANT PERMISSIONS ATTACHED *******************************************/
 ,('WardsIsland','Wards Island',CURRENT_TIMESTAMP)
 ,('NorthRiver','North River',CURRENT_TIMESTAMP)
 ,('HuntsPoints','Hunts Points',CURRENT_TIMESTAMP)
 ,('NewtownCreek','Newtown Creek',CURRENT_TIMESTAMP)
 ,('26thWard','26th Ward',CURRENT_TIMESTAMP)
 ,('ConeyIsland','Coney Island',CURRENT_TIMESTAMP)
 ,('RedHook','Red Hook',CURRENT_TIMESTAMP)
 ,('OwlsHead','Owls Head',CURRENT_TIMESTAMP)
 ,('TallmanIsland','Tallman Island',CURRENT_TIMESTAMP)
 ,('Jamaica','Jamaica',CURRENT_TIMESTAMP)
 ,('BoweryBay','Bowery Bay',CURRENT_TIMESTAMP)
 ,('Rockaway','Rockaway',CURRENT_TIMESTAMP)
 ,('PortRichmond','Port Richmond',CURRENT_TIMESTAMP)
 ,('OakwoodBeach','Oakwood Beach',CURRENT_TIMESTAMP)

 /******************************* ADD SPECIAL PERMISSIONS, DASHBOARD WIGITS - NOT INITIALIZED YET *******************************************/
 /* 
 // COLORED BOX WIGITS
 ActiveInspections: Active Containers
 ContainersRemovalReady: Containers Ready For Removal
 ContainersRecentlyRemoved: Containers Recently Removed
 DEPContainerRemovalRequests: DEP Internal Removal Requests
 ContractorContainerRemovalRequests: Contractor Removal Requests
 UnassignedContractorContainerRemovals: Contractor Containers in Transit
 UnassignedDepContainerRemovals: DEP Containers in Transit
 ConflictedContainers: Conflicted Containers
 */
 ,('Dashboard_ActiveInspections','Active Containers',CURRENT_TIMESTAMP)
 ,('Dashboard_ContainersRemovalReady','Containers Ready For Removal',CURRENT_TIMESTAMP)
 ,('Dashboard_ContainersRecentlyRemoved','Containers Recently Removed',CURRENT_TIMESTAMP)
 ,('Dashboard_DEPContainerRemovalRequests','DEP Internal Removal Requests',CURRENT_TIMESTAMP)
 ,('Dashboard_ContractorContainerRemovalRequests','Contractor Removal Requests',CURRENT_TIMESTAMP)
 ,('Dashboard_UnassignedContractorContainerRemovals','Contractor Containers in Transit',CURRENT_TIMESTAMP)
 ,('Dashboard_UnassignedDepContainerRemovals','DEP Containers in Transit',CURRENT_TIMESTAMP)
 ,('Dashboard_ConflictedContainers','Conflicted Containers',CURRENT_TIMESTAMP)
 
 /*


 //GRAY BOX GRAPH WIGITS
 ContainersRemovedPerDriver: Containers Removed Per Driver
 */
 ,('Dashboard_ContainersRemovedPerDriver','Containers Removed Per Driver',CURRENT_TIMESTAMP)
 /*
 //GRAY BOX WIGITS
 ContainerRemovalRequestsPerFacility: Container Removal Requests Per Facility
 SystemNotificationsPanel: System Notifications Panel

 */
 ,('Dashboard_ContainerRemovalRequestsPerFacility','Container Removal Requests Per Facility',CURRENT_TIMESTAMP)
 ,('Dashboard_SystemNotificationsPanel','System Notifications Panel',CURRENT_TIMESTAMP)


/******************************* INITIALIZE ROLES TABLE - NOT INITIALIZED YET *******************************************/

INSERT INTO [dbo].[Roles] 
	--([role_name] ,[display_name] ,[description] ,[created_by] ,[updated_by] ,[created_at] ,[updated_at] ,[deleted_at])
	([role_name] ,[display_name], [description] ,[created_at])
     --VALUES (<role_name, nvarchar(100),> ,<display_name, nvarchar(100),> ,<description, nvarchar(max),> ,<created_by, int,> ,<updated_by, int,> ,<created_at, datetime2(7),> ,<updated_at, datetime2(7),> ,<deleted_at, datetime2(7),>)
VALUES 
('Administrator','Administrator',NULL,CURRENT_TIMESTAMP)
 ,('ApplicationSupport','Application Support',NULL,CURRENT_TIMESTAMP)
 ,('Executive','Executive','Commissioner, Deputy Commissioner',CURRENT_TIMESTAMP)
 ,('Manager','Manager', 'Director, Facility Manager, Plant Chief, Division Chief, Chief, Project Manager',CURRENT_TIMESTAMP)
 ,('Supervisor','Supervisor','Senior Section Stationary Engineer Electrical (SSEE), Senior Sewage Treatment Worker (SSTW)',CURRENT_TIMESTAMP)
 ,('Professional','Professional', 'Stationary Engineer Electrical (SEE), Stationary Engineer (SE), Sewage Treatment Worker (STW), Dispatchers',CURRENT_TIMESTAMP)
 ,('Administrative','Administrative', 'Drivers, Administrative Staff, Interns',CURRENT_TIMESTAMP)
 ,('Contractor','Contractor', 'Contractor',CURRENT_TIMESTAMP)




/******************************* INITIALIZE GROUPS TABLE - NOT INITIALIZED YET *******************************************/ 

INSERT INTO [dbo].[GroupTypes]
           ([group_type_name]
           ,[description])
     VALUES --(<group_type_name, nvarchar(100),> ,<description, nvarchar(max),>)
           ('permissions',null)
		   ,('plants',null)



INSERT INTO [dbo].[Groups] --([group_type_id],[group_name] ,[display_name] ,[description] ,[enabled] ,[created_at] ,[updated_at] ,[deleted_at])
	([group_type_id],[group_name] ,[display_name], [description] ,[created_at])
--     VALUES (<group_name, nvarchar(100),> ,<display_name, nvarchar(100),> ,<description, nvarchar(max),> ,<enabled, bit,> ,<created_at, datetime2(7),> ,<updated_at, datetime2(7),> ,<deleted_at, datetime2(7),>)

VALUES 
(1,'Administrators','Administrators',NULL,CURRENT_TIMESTAMP)
 ,(1,'ApplicationSupports','Application Supports',NULL,CURRENT_TIMESTAMP)
 ,(1,'Executives','Executives','Commissioner, Deputy Commissioner',CURRENT_TIMESTAMP)
 ,(1,'Managers','Managers', 'Director, Facility Manager, Plant Chief, Division Chief, Chief, Project Manager',CURRENT_TIMESTAMP)
 ,(1,'Supervisors','Supervisors','Senior Section Stationary Engineer Electrical (SSEE), Senior Sewage Treatment Worker (SSTW)',CURRENT_TIMESTAMP)
 ,(1,'Professionals','Professionals', 'Stationary Engineer Electrical (SEE), Stationary Engineer (SE), Sewage Treatment Worker (STW), Dispatchers',CURRENT_TIMESTAMP)
 ,(1,'Dispatchers','Dispatchers', 'TBD',CURRENT_TIMESTAMP)
 ,(1,'AdministrativeStaffs','Administrative Staffs', 'This is a restricted group with limited access to adding new entries to a specific area. TBD',CURRENT_TIMESTAMP) 
 ,(1,'Drivers','Drivers', 'This is a restricted group with limited access. May just be used for the purpose of tracking their location via mobile device.',CURRENT_TIMESTAMP) 
 ,(1,'Contractors','Contractors', 'This is a restricted user with limited access. TBD',CURRENT_TIMESTAMP)

 ,(2,'WardsIsland','Wards Island', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'NorthRiver','North River', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'HuntsPoints','Hunts Points', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'NewtownCreek','Newtown Creek', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'26thWard','26th Ward', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'ConeyIsland','Coney Island', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'RedHook','Red Hook', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'OwlsHead','Owls Head', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'TallmanIsland','Tallman Island', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'Jamaica','Jamaica', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'BoweryBay','Bowery Bay', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'Rockaway','Rockaway', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'PortRichmond','Port Richmond', 'Will be able to access this plant.',CURRENT_TIMESTAMP)
 ,(2,'OakwoodBeach','Oakwood Beach', 'Will be able to access this plant.',CURRENT_TIMESTAMP)


/******************************* ADD APPLICATION SPECIFIC PERMISSIONS & OMIT THE ONES ALREADY ENTERED *******************************************/

-- GET ALL TABLE THAT ALREADY HAS PERMISSIONS
