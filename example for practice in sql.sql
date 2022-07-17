use mydatabase
--select * from [dbo].[RevenueData]
--select * from [dbo].[MarketingData]
--select * from [dbo].[TargetsData]
--select * from [dbo].[opportunities_data]
--select * from [dbo].[account_lookup]
--select * from [dbo].[calendar_lookup]

--1. What is the total revenue of the company this year? fy21

----select distinct Month_ID from calendar_lookup where Fiscal_Year='fy21'
--select Month_ID,sum(Revenue) as Total_Revenue_fy21 from RevenueData
--where Month_ID in (select distinct Month_ID from calendar_lookup where Fiscal_Year='fy21')
--group by Month_ID


----2. what is the total revenue performance YoY

--select a.Total_Revenue_fy21, b.Total_Revenue_fy20,a.Total_Revenue_fy21-b.Total_Revenue_fy20 as Total_Dif_YoY,a.Total_Revenue_fy21/b.Total_Revenue_fy20-1 as Ratio_Percentage
--from
--	(
--	--fy21
--	select --Month_ID,
--	sum(Revenue) as Total_Revenue_fy21 from RevenueData
--	where Month_ID in (select distinct Month_ID from calendar_lookup where Fiscal_Year='fy21')
--	--group by Month_ID
--	)a,

--	(
--	-- fy20
--	select sum(Revenue) as Total_Revenue_fy20 from RevenueData
--	where Month_ID in (select distinct Month_ID-12 from RevenueData where  Month_ID in
--	(select distinct Month_ID from calendar_lookup where Fiscal_Year='fy21'))
--	)b


----3 What is the MoM revenue performance

--select a.Total_Revenue_This_Month, b.Total_Revenue_Previous_Month,a.Total_Revenue_This_Month-b.Total_Revenue_Previous_Month as Total_Dif_YoY,a.Total_Revenue_This_Month/b.Total_Revenue_Previous_Month-1 as Ratio_Percentage
--from
--	(
--	--this month
--	select --Month_ID,
--	sum(Revenue) as Total_Revenue_This_Month from RevenueData
--	where Month_ID in (select max( Month_ID) from RevenueData)
--	--group by Month_ID
--	)a,

--	(
--	--previous month
--	select --Month_ID,
--	sum(Revenue) as Total_Revenue_Previous_Month from RevenueData
--	where Month_ID in (select max( Month_ID)-1 from RevenueData)
--	)b

------4 What is the total revenue vs target revenu performance for the year

--select a.TotalRevenue, b.TargetRevenue, a.TotalRevenue-b.TargetRevenue as TotalRevenue_Minuse_TargetRevenue, a.TotalRevenue/b.TargetRevenue-1 as TotalRevenu_Div_TargetRevenue
--from
--	(
--	select sum(Revenue) as TotalRevenue from RevenueData where Month_ID in (select distinct Month_ID from calendar_lookup where Fiscal_Year='fy21')
--	)a
--	,
--	(
--	select sum(Target) as TargetRevenue from TargetsData where Month_ID in (select distinct Month_ID from RevenueData where Month_ID in (select distinct Month_ID from calendar_lookup where Fiscal_Year='fy21'))

--	)b

----5 What is the total revenue vs target revenu performance per month

--select a.TotalRevenue, b.TargetRevenue, a.TotalRevenue-b.TargetRevenue as TotalRevenue_Minuse_TargetRevenue, a.TotalRevenue/b.TargetRevenue-1 as TotalRevenu_Div_TargetRevenue
--from
--	(
--	select Month_ID,sum(Revenue) as TotalRevenue from RevenueData 
--	where Month_ID in (select distinct Month_ID from calendar_lookup 
--	where Fiscal_Year='fy21')
--	group by Month_ID
--	)a
--	left join
--	(
--	select Month_ID, sum(Target) as TargetRevenue from TargetsData 
--	where Month_ID in (select distinct Month_ID from RevenueData 
--	where Month_ID in (select distinct Month_ID from calendar_lookup 
--	where Fiscal_Year='fy21'))
--	group by Month_ID
--	)b
--	on a.Month_ID =b.Month_ID
--	left join
--	(select distinct Month_ID, Fiscal_Month from calendar_lookup)C
--	ON A.Month_ID = c.Month_ID
	
--order by a.Month_ID