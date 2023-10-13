create table STAGING
(ID int, Case_ tinyint, CC3 varchar(100), Country varchar(100),
 Year smallint, 
 SystemCrisisID tinyint, Systemic_Crisis varchar(100), 
 exch_usd float, 
 DomesticDebtID tinyint, Domestic_Debt_In_Default varchar(100), 
 ExternalDebtID tinyint, Sovereign_External_Debt_Default varchar(100),
 GDP_Weighted_Default float, 
 Inflation_Annual_CPI float, 
 IndependenceID tinyint, Independence varchar(100),
 CurrencyCrisesID tinyint, Currency_Crises varchar(100),
 InflationCrisesID tinyint, Inflation_Crises varchar(100),
 BankingCrisisID tinyint, Banking_Crisis varchar(100) );
 select * from STAGING;
  
drop table STAGING;

 alter table STAGING alter column CC3 varchar(100);
 alter table STAGING alter column ID int;
 

 create table ID_DIM
 (ID int identity(1,1) primary key, Case_ tinyint, CC3 varchar(100), 
 Country varchar(100), Year smallint);
 select * from ID_DIM;

 drop table ID_DIM;

 create table Systemic_Crisis_DIM
 (SystemCrisisID tinyint primary key, Systemic_Crisis varchar(100) );
 insert Systemic_Crisis_DIM (SystemCrisisID, Systemic_Crisis)
 values (0, 'no systemic crisis'),
		(1, 'systemic crisis');
select * from Systemic_Crisis_DIM;

drop table Systemic_Crisis_DIM;


create table Domestic_Debt_DIM
 (DomesticDebtID tinyint primary key, Domestic_Debt_In_Default varchar(100) );
 insert Domestic_Debt_DIM (DomesticDebtID, Domestic_Debt_In_Default)
 values (0, 'no sovereign domestic debt default'),
		(1, 'sovereign domestic debt default');
select * from Domestic_Debt_DIM;

drop table Domestic_Debt_DIM;


 
create table External_Debt_DIM
 (ExternalDebtID tinyint primary key, Sovereign_External_Debt_Default varchar(100) );
 insert External_Debt_DIM (ExternalDebtID, Sovereign_External_Debt_Default)
 values (0, 'no sovereign external debt default'),
		(1, 'sovereign external debt default');
select * from External_Debt_DIM;

drop table External_Debt_DIM;


create table Independence_DIM
 (IndependenceID tinyint primary key, Independence varchar(100) );
 insert Independence_DIM (IndependenceID, Independence)
 values (0, 'no independence'),
		(1, 'independence');
select * from Independence_DIM;

drop table Independence_DIM;


create table Currency_Crises_DIM
 (CurrencyCrisesID tinyint primary key, Currency_Crises varchar(100) );
 insert Currency_Crises_DIM (CurrencyCrisesID, Currency_Crises)
 values (0, 'no currency crisis'),
		(1, 'currency crisis'),
		(2, 'other');
select * from Currency_Crises_DIM;

drop table Currency_Crises_DIM;


create table Inflation_Crises_DIM
 (InflationCrisesID tinyint primary key, Inflation_Crises varchar(100) );
 insert Inflation_Crises_DIM (InflationCrisesID, Inflation_Crises)
 values (0, 'no inflation crisis'),
		(1, 'inflation crisis');
select * from Inflation_Crises_DIM;

drop table Inflation_Crises_DIM;


create table Banking_Crisis_DIM
 (BankingCrisisID tinyint primary key, Banking_Crisis varchar(100) );
 insert Banking_Crisis_DIM (BankingCrisisID, Banking_Crisis)
 values (0, 'no_crisis'),
		(1, 'crisis');
select * from Banking_Crisis_DIM;

drop table Banking_Crisis_DIM;


create table FACT
(ID int primary key,
 exch_usd float, 
 GDP_Weighted_Default float, 
 Inflation_Annual_CPI float,
 SystemCrisisID tinyint, 
 DomesticDebtID tinyint, 
 ExternalDebtID tinyint, 
 IndependenceID tinyint, 
 CurrencyCrisesID tinyint, 
 InflationCrisesID tinyint, 
 BankingCrisisID tinyint);
 select * from FACT;

 
 alter table STAGING add ID tinyint identity(1,1) primary key;
 alter table FACT drop ID;
 
 drop table FACT;
 

 select * from FACT;

 select Year, count(distinct SystemCrisisID) as NumberofCrisisCountry, 
		count(distinct CountryID) as TotalCountry,
		count(distinct SystemCrisisID)/count(distinct CountryID) as pct
	from Fact 
	group by Year 
	order by 2 desc;


select * from STAGING;
select * from FACT;
select * from ID_DIM;
select * from Systemic_Crisis_DIM;
select * from Domestic_Debt_DIM;
select * from External_Debt_DIM;
select * from Independence_DIM;
select * from Currency_Crises_DIM;
select * from Inflation_Crises_DIM;
select * from Banking_Crisis_DIM;
