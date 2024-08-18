# Data Integration Pipelines for NYC Payroll Data Analytics
## Project Overview
The City of New York would like to develop a Data Analytics platform on Azure Synapse Analytics to accomplish two primary objectives:

1. Analyze how the City's financial resources are allocated and how much of the City's budget is being devoted to overtime.
2. Make the data available to the interested public to show how the City’s budget is being spent on salary and overtime pay for all municipal employees.

The source data resides in Azure Data Lake and needs to be processed in a NYC data warehouse. The source datasets consist of [CSV files](https://video.udacity-data.com/topher/2022/May/6283aff5_data-nyc-payroll/data-nyc-payroll.zip) with Employee master data and monthly payroll data entered by various City agencies.

<p align="center">
<img src="https://video.udacity-data.com/topher/2024/January/65b989ea_nyc-payroll-db-schema/nyc-payroll-db-schema.jpeg" align="center">
<br>
    <em>NYC Payroll DB Schema.</em>
</p>  
In this project, I will use Azure Data Factory to create Data views in Azure SQL DB from the source data files in DataLake Gen2. Then I build the dataflows and pipelines to create payroll aggregated data to be exported to a target directory in DataLake Gen2 storage over which Synapse Analytics external table is built. At a high level, my pipeline will look like below:

<p></p>
<p align="center">
<img src="https://video.udacity-data.com/topher/2024/January/65b98a0f_data-integration-pipelines-overview/data-integration-pipelines-overview.jpeg" align="center" >
<br>
    <em>High level Pipeline Overview.</em>
</p> 
