--create Temp Table and prepare query for visualization
select * 
into #temp_table from Project.dbo.bestsaler

select * from #temp_table

delete from #temp_table 
 where Count_of_Rating is null
 or Price is null
 or Count_of_Question is null
 or Score_of_Rating is null
 or Score_of_Saler is null

 
select * from #temp_table

-- Make group of every seller by product and show proportion in list of best saler

select Saler,count(Saler) as Count_of_Product from #temp_table
group by Saler

--select top 10 saler in trendyol

select top(8) percent 
Saler,count(Saler)as Count_Product,
round((avg(Count_of_Rating*Score_of_Rating/100)),1) as point_product  
from #temp_table
Group by Saler
order by Count_Product desc,point_product desc

--select best selling clothes of type

select Type_of_Clothes,count(Type_of_Clothes) as How_Many from #temp_table
group by Type_of_Clothes

--Most Expensive Brands
select top(18) percent Brand,avg(Price)as avg_price,Score_of_Rating,Count_of_Question from #temp_table
group by Brand,Score_of_Rating,Count_of_Question
order by avg_price desc

select Link,Saler,Brand,Name_of_Product,
	Type_of_Clothes,Score_of_Rating,concat(Price,'TL'),
	Score_of_Rating from #temp_table

