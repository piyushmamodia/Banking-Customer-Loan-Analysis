                 Project : Banking & Loans Risk Analysis
	             File    : 03_sql_analysis_questions.txt
                 Purpose : To analyze banking and loan-related data using SQL, extract meaningful business insights, and evaluate customer
                           profiles,loans performances and loan risk. this document includes SQL queries with explanation to demonstrate
                           data analysis and problem solving skills.

 
 . BASIC SQL (SELECT,WHERE,BETWEEN,IN,AND,ORDERBY,DESC,LIMIT)

Find customers whose Creditscore is below 700.
Query: SELECT CUSTOMERID,CUSTOMERNAME,CREDITSCORE FROM CUSTOMERS WHERE CREDITSCORE<700;


2. Find all customers whose Annualincome is between 300000 and 700000.
Query: select customerid,customername,annualincome from customers where annualincome between 300000 and 700000;


3. Find customers who live in Delhi,Mumbai or jaipur.
Query: select * from customers where city in ('delhi','mumbai','jaipur');


4. Find customers whose credit score is above 700 and annual income is greater than 500000.
Query: select * from customers where creditscore >700 and annualincome>500000;


5. Display the 10 customers with the highest annualincome.
Query: select * from customers order by annualincome desc limit 10;



. INTERMEDIATE SQL (GROUPBY,AGGREGATE FUNCTIONS,HAVING,CASE WHEN,CONDITIONAL AGGREGATION)

6. Find the total number of loans for each Loan status.
Query: select loanstatus,count(*) as total_loans from loans group by loanstatus;


7. Calculate the total loans amount and number of loans for each loan type.

Query: select loantype,sum(loanamount)as total_loan_amount ,count(*) as total_loans from loans group by loantype;



8. Find the average Interest rate for each loan type.
Query: select loantype,round(avg(interestrate),2) as avg_interest_rate from loans group by loantype;


9. calculate the Percentage of loan belonging to each loan status.
Query: select loanstatus,count(*) as total_loans,round(count(*)*100.0/(select count(*) from loans),2)as loan_percentage from loans group by loanstatus order by loan_percentage desc;


10. Classify loans into small,medium and large categories based on Loanamount.
Query: select loanid,customerid,loantype,case when loanamount<100000 then 'small_loan' when loanamount<=500000 then 'medium_loan' else 'large_loan' end as loan_category from loans;



. ADVANCED SQL (WINDOW FUNCTIONS,SUBQUERIES,GROUPING AND FILTERING,PERCENTAGE CALCULATION,BUSINESS ANALYSIS)

11. Find the top 3 customers with the highest total loan amount.
Query: select customerid,customername,city,loantype,loanamount,Rankk from (select c.customerid,c.customername,c.city,l.loantype,l.loanamount,sum(l.loanamount), dense_rank()over( order by l.loanamount desc)as rankk from customers c left join loans l on c.customerid=l.customerid group by c.customerid,c.customername,c.city,l.loantype,l.loanamount)t where rankk<=3;
 

12. Calculate total loan amount and average interest rate by city.
Query: select c.city, count(l.loanid) as total_loans, sum(l.loanamount) as total_amount,round(avg(l.loanamount),2)as avg_interest_rate from customers c inner join loans l on c.customerid=l.customerid group by city;


13. Find Customers whose credit score is above the average.
Query: select customerid,customername,annualincome,creditscore from (select customerid,customername,annualincome,creditscore,avg(creditscore)over() as avg_creditscore from customers)t where creditscore>avg_creditscore;


14. Analyse laon status distribution and percentage.
Query: select loanstatus,count(*) as Total_loans,sum(loanamount)as total_amount,round(count(*)*100.0/(select count(*) from loans),2)as loan_percentage from loans group by loanstatus ;


15. Find the Top loan type by total loan amount in each city.
Query: select customername, loantype,loanamount,city,top3 from (select c.customername,l.loantype,l.loanamount,c.city,sum(l.loanamount)as total_loan,dense_rank()over(partition by city order by sum(l.loanamount) desc)as top3 from customers c inner join loans l on c.customerid=l.customerid group by c.customername,l.loantype,l.loanamount,c.city)t where top3<=3;


 
