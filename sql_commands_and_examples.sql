use mydatabase
--select * from opportunities_data
--select New_Account_NO, Opportunity_ID from opportunities_data

----example 1-1 condition: =
--select * from opportunities_data where Product_Category='Services'

----example 2-1 condition: <> (not equal)
--select * from opportunities_data where Opportunity_Stage <> 'Stage-0'
----example 3-1 condition: in
--select * from opportunities_data where Opportunity_Stage in ('Stage - 0','Stage - 1','Stage - 2','Stage - 3')
--example 4-1 condition: not in
--select * from opportunities_data where Opportunity_Stage not in ('Stage - 0','Stage - 1','Stage - 2','Stage - 3')

----example 5-1 condition: like
--select * from opportunities_data where New_Opportunity_Name like '%Phase - 1%'
----example 5-1 condition: not like
--select * from opportunities_data where New_Opportunity_Name not like '%Phase - 1%'
----example 6-1 condition: and
--select * from opportunities_data where Product_Category='Services' and Opportunity_Stage = 'Stage - 5'
----example 7-1 condition: or
--select * from opportunities_data where Product_Category='Services' or Opportunity_Stage = 'Stage - 5'
----example 8--1 condition: and & or
--select * from opportunities_data where Product_Category='Services' and Opportunity_Stage = 'Stage - 5' or New_Opportunity_Name like '%Phase - 2%'
----example 8--1 condition: >
--select * from opportunities_data where Est_Opportunity_Value>5000
----example 8--1 condition: between
--select * from opportunities_data where Est_Opportunity_Value between 5000 and 20000
----------------------- Where Clause with Subqueries-------------------
--select * from account_lookup
--select * from opportunities_data
--select * from calendar_lookup
--select * from account_lookup where New_Account_No in (select New_Account_No from account_lookup where Sector='Banking')
--select * from opportunities_data where Est_Completion_Month_ID in (select distinct Month_ID from calendar_lookup where Fiscal_Year='FY19')
----------------------------- iff & case statment -------------------------
--select New_Account_No, Opportunity_ID, New_Opportunity_Name, Est_Completion_Month_ID,	iif (Product_Category= 'Services', 'Service&Marketing', Product_Category) as Prodect_Category,
--Opportunity_Stage, Est_Opportunity_Value from opportunities_data

-- multibple iif statments with a new column
--select * from
--	(
--	select*,
--	iif (New_Opportunity_Name like '%Phase - 1%', 'Phase 1',
--	iif (New_Opportunity_Name like '%Phase - 2%', 'Phase 2',
--	iif (New_Opportunity_Name like '%Phase - 3%', 'Phase 3',
--	iif (New_Opportunity_Name like '%Phase - 4%', 'Phase 4',
--	iif (New_Opportunity_Name like '%Phase - 5%', 'Phase 5', 'Need Mapping'))))) as Opps_Phase from opportunities_data
--	)a
--where Opps_Phase= 'Need Mapping'

------ case -----

--select New_Account_No,Opportunity_ID, New_Opportunity_Name, Est_Completion_Month_ID,
--case 
--	when Product_Category='Services' then 'Services & Marketing'
--	else Product_Category
--	end as Product_Category, Opportunity_Stage, Est_Opportunity_Value from opportunities_data

----- case with multiple conditions
--select *,
--case 
--	when New_Opportunity_Name like '%Phase - 1%' then 'Phase 1'
--	when New_Opportunity_Name like '%Phase - 2%' then 'Phase 2'
--	when New_Opportunity_Name like '%Phase - 3%' then 'Phase 3'
--	when New_Opportunity_Name like '%Phase - 4%' then 'Phase 4'
--	when New_Opportunity_Name like '%Phase - 5%' then 'Phase 5'
--	else 'Need Mapping'
--	end as Opps_Phase from opportunities_data
------- update & replace & insert into & delte ---------------
--select * from account_lookup
---- renaming a column

--select *, iif(Sector='Capital Markets/Securities', 'Capital Makets',Sector) as Sector2 from account_lookup

--update account_lookup
--set Sector= iif(Sector='Capital Markets/Securities', 'Capital Makets',Sector)
--select Sector from account_lookup

--select *, iif(Sector='Capital Markets/Securities', 'Capital Mrakets',Sector) as Sector2,  replace (Account_Segment, 'PS', 'Public Sector')
--as Account_Segment2 from account_lookup

--update account_lookup
--set Account_Segment = replace (Account_Segment, 'Public Sector', 'Private Sector')

--select Account_Segment from account_lookup

--- insert into -------
--insert into account_lookup
--select '1234567890', 'maxi','IT','Data Science','Private Sector', Null,'Sadi Evren Seker','Siyar Oner'

--select * from account_lookup where Industry_Manager='Siyar Oner'

-- deleting data
--delete from account_lookup where Industry_Manager='Siyar Oner'

------------------- main aggregate function ---------
-- sum
--select Product_Category, sum (Est_Opportunity_Value) as Sum_Of_Est_Opportunity from opportunities_data
--group by Product_Category

--select Product_Category, Opportunity_Stage, sum (Est_Opportunity_Value) as Sum_Of_Est_Opportunity from opportunities_data
--where Opportunity_Stage= 'Stage - 4'
--group by Product_Category,Opportunity_Stage

--select Product_Category, Opportunity_Stage, sum (Est_Opportunity_Value) as Sum_Of_Est_Opportunity from opportunities_data
--group by Product_Category,Opportunity_Stage
--order by Product_Category,Opportunity_Stage

--select Product_Category, Opportunity_Stage, sum (Est_Opportunity_Value) as Sum_Of_Est_Opportunity from opportunities_data
--group by Product_Category,Opportunity_Stage
--order by Product_Category,Opportunity_Stage desc --asc

-------- count
--select Product_Category, count (Opportunity_ID) as NO_Of_Opportunities from opportunities_data
--group by Product_Category
--order by count (Opportunity_ID) desc

------------ max
--select Product_Category, max (Opportunity_ID) as max_Of_Opportunities from opportunities_data
--group by Product_Category

------------ min
--select Product_Category, min (Opportunity_ID) as min_Of_Opportunities from opportunities_data
--group by Product_Category