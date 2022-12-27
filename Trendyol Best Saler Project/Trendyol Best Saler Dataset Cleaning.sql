
--keep just numeric character in Price column
with saler
as
(select * from Project.dbo.bestsaler)
update saler
set Price=substring(Price,30,7)
where Price like('%!%')

with saler
as
(select * from Project.dbo.bestsaler)
update saler
set Price=substring(Price,1,charindex('T',Price)-1)
where price like ('%TL%')

select * from Project.dbo.bestsaler

--remove alphabetic characters in column that Count of Rating
with saler
as
(select * from Project.dbo.bestsaler)
update saler
set Count_of_Rating=substring(Count_of_Rating,1,charindex('D',Count_of_Rating)-1)
where Count_of_Rating like ('%De%')

select * from Project.dbo.bestsaler

--remove alphabetic characters in column that Count of Question
with saler
as
(select * from Project.dbo.bestsaler)
update saler
set Count_of_Question=substring(Count_of_Question,1,charindex('S',Count_of_Question)-1)
where Count_of_Question like ('%S%')

--if saler is null change with Brand,if Brand is null chance with saler
--firstly ý need to rows remove that both of column is null 

select * from Project.dbo.bestsaler
where Saler is null 
and brand is null

delete from Project.dbo.bestsaler
where Saler is null
and brand is null
-- Now I will just change rows that brand is trendyolmilla because thats saler is trenyol its so obvious.
update Project.dbo.bestsaler
set Saler='Trendyol'
where Saler is null
and Brand='TRENDYOLMÝLLA'


select F1,Saler,Brand from Project.dbo.bestsaler
where Saler is null 

--creat a temp table
select * 
into #temp_table2 from Project.dbo.bestsaler
select * from #temp_table2
--Now I can chance 
update Project.dbo.bestsaler
set Saler=Brand
where Saler is null
--for brand
update Project.dbo.bestsaler
set Brand=Saler
where Brand is null

select Saler,Brand from Project.dbo.bestsaler
where Saler is null or Brand is null

 
 --Ýf name of product is null add Brand + Type of Clother and make a name

 update Project.dbo.bestsaler
 set Name_of_Product=Type_of_Clothes+' '+Brand
 where Name_of_Product is null

 select * from Project.dbo.bestsaler
 --nulls in Score of Sale For general in Trendyol.thats ý checked the currently score of sales at trendyol.com and ý changed it(8.6) 
 update Project.dbo.bestsaler
 set Score_of_Saler=8.6
 where Score_of_Saler is null and Saler='Trendyol'
 -- there is a 69 rows that rating,score,price and questions ,this rows useless for my visualization
 select * from Project.dbo.bestsaler
 where Score_of_Saler is null 
 and Count_of_Rating is null
 and Price is null
 and Count_of_Question is null
 --delete
 delete from Project.dbo.bestsaler
 where Score_of_Saler is null 
 and Count_of_Rating is null
 and Price is null
 and Count_of_Question is null

 select * from Project.dbo.bestsaler

--I  will convert nvarchar to float in every numeric columns 
--first of all ? need to rplace ',' to '.'
select * from Project.dbo.bestsaler 
--Price
update Project.dbo.bestsaler
set Price=replace(Price,',','.')

alter table Project.dbo.bestsaler
alter column Price float

--Score of Saler
update Project.dbo.bestsaler
set Score_of_Saler=replace(Score_of_Saler,',','.')

alter table Project.dbo.bestsaler
alter column Score_of_Saler float

--Score of Rating
update Project.dbo.bestsaler
set Score_of_Rating=replace(Score_of_Rating,',','.')

alter table Project.dbo.bestsaler
alter column Score_of_Rating float

--Count of Rating
alter table Project.dbo.bestsaler
alter column Count_of_Rating float
--Count of Question
alter table Project.dbo.bestsaler
alter column Count_of_Question float


-- Create a temp table and delete all rows that has got a null value

select * 
into #temp_table from Project.dbo.bestsaler

select * from #temp_table

delete from #temp_table 
 where Count_of_Rating is null
 or Price is null
 or Count_of_Question is null
 or Score_of_Rating is null
 or Score_of_Saler is null





 
 
