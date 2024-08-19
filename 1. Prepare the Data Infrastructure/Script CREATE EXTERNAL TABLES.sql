IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 FIRST_ROW = 2,
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'adlsnycpayroll-anhnguyen_nycpayrollcontainer_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [adlsnycpayroll-anhnguyen_nycpayrollcontainer_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://adlsnycpayroll-anhnguyen@nycpayrollcontainer.dfs.core.windows.net' 
	)
GO

CREATE EXTERNAL TABLE [dbo].[NYC_Payroll_Summary] (
	[AgencyName] nvarchar(4000),
	[FiscalYear] bigint,
	[TotalPaid] float
	)
	WITH (
	LOCATION = 'dirstaging/**',
	DATA_SOURCE = [adlsnycpayroll-anhnguyen_nycpayrollcontainer_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM [dbo].[NYC_Payroll_Summary]
GO