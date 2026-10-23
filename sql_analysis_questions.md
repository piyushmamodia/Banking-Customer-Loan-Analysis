&#x20;                **Project : Banking \& Loans Risk Analysis**

&#x09;         **File    : 03\_sql\_analysis\_questions.txt**

&#x20;                **Purpose : To analyze banking and loan-related data using SQL, extract meaningful business insights, and evaluate customer**

&#x20;                          **profiles,loans performances and loan risk. this document includes SQL queries with explanation to demonstrate**

&#x20;                          **data analysis and problem solving skills.**



&#x20;

##### &#x20;. **BASIC SQL** **(SELECT,WHERE,BETWEEN,IN,AND,ORDERBY,DESC,LIMIT)**



1. **Find customers whose Creditscore is below 700.**

**Query:** SELECT CUSTOMERID,CUSTOMERNAME,CREDITSCORE FROM CUSTOMERS WHERE CREDITSCORE<700;



**Explanation** : This query retrieves customers whose creditscore is below 700. it display only customer id,name \& credit score.



**2. Find all customers whose Annualincome is between 300000 and 700000.**

**Query:** select customerid,customername,annualincome from customers where annualincome between 300000 and 700000;



**Explanation** : This query identifies customers whose annual income is btw 3L and 7L including both boundary values.



**3. Find customers who live in Delhi,Mumbai or jaipur.**

**Query**: select \* from customers where annualincome between 300000 and 700000;



**Explanation** : This query retrieves customers who live in any of the three specified cities.



**4. Find customers whose credit score is above 700 and annual income is greater than 500000.**

**Query**: select \* from customers where creditscore >700 and annualincome>500000;



**Explanation** : This query identifies customers who satisfy both condition.



**5. Display the 10 customers with the highest annualincome.**

**Query:** select \* from customers order by annualincome desc limit 10;



**Explanation** : This query display 10 customers with the highest annual income, sorted from highest to lowest.







##### . **INTERMEDIATE SQL (GROUPBY,AGGREGATE FUNCTIONS,HAVING,CASE WHEN,CONDITIONAL AGGREGATION)**

##### 

**6**. **Find the total number of loans for each Loan status.**

**Query:** select loanstatus,count(\*) as total\_loans from loans group by loanstatus;



**Explanation** : This query calculate the total number of loans for each loan status .It helps analyze the distribution of loans across different statues.



**7. Calculate the total loans amount and number of loans for each loan type.**



**Query:** select loantype,sum(loanamount)as total\_loan\_amount ,count(\*) as total\_loans from loans group by loantype;



**Explanation** : This query calculates the number of loans and the total loan amount for each loan type.It helps identify which loan types contribute the most to the overall loan portfolio.



**8. Find the average Interest rate for each loan type.**

**Query**: select loantype,round(avg(interestrate),2) as avg\_interest\_rate from loans group by loantype;



**Explanation** : This Query calculate the average interest rate for each loantype.It helps compare interest rates across different loan categories.



**9. calculate the Percentage of loan belonging to each loan status.**

**Query**: select loanstatus,count(\*) as total\_loans,round(count(\*)\*100.0/(select count(\*) from loans),2)as loan\_percentage from loans group by loanstatus order by loan\_percentage desc;



**Explanation** : This query helps to find the number and percentage of loans in each loan status. It helps understand the proportion of active ,closed,overdue and approved loans in the portfolio.



**10.** **Classify loans into small,medium and large categories based on Loanamount.**

**Query:** select loanid,customerid,loantype,case when loanamount<100000 then 'small\_loan' when loanamount<=500000 then 'medium\_loan' else 'large\_loan' end as loan\_category from loans;



**Explanation** : This query categories loans into small,medium and large groups based on their loan amount. It helps segement the loan portfolio for further analysis.





##### **. ADVANCED SQL (WINDOW FUNCTIONS,SUBQUERIES,GROUPING AND FILTERING,PERCENTAGE CALCULATION,BUSINESS ANALYSIS)**



**11. Find the top 3 customers with the highest total loan amount.**

**Query:** select customerid,customername,city,loantype,loanamount,Rankk from (select c.customerid,c.customername,c.city,l.loantype,l.loanamount,sum(l.loanamount), dense\_rank()over( order by l.loanamount desc)as rankk from customers c left join loans l on c.customerid=l.customerid group by c.customerid,c.customername,c.city,l.loantype,l.loanamount)t where rankk<=3;

&#x20;

**Explanation :** This Query Identifies the top 3 customers with the highest total loan amounts. This analysis helps the bank identify customers with high loan exposure and monitor lending concentration.



**12**. **Calculate total loan amount and average interest rate by city**.

**Query:** select c.city, count(l.loanid) as total\_loans, sum(l.loanamount) as total\_amount,round(avg(l.loanamount),2)as avg\_interest\_rate from customers c inner join loans l on c.customerid=l.customerid group by city;



**Explanation** : This Query analyses loan distribution across different cities.The result help management compare lending activity across cities and understand regional loan distribution and interest  rate pattern.



**13. Find Customers whose credit score is above the average.**

**Query:** select customerid,customername,annualincome,creditscore from (select customerid,customername,annualincome,creditscore,avg(creditscore)over() as avg\_creditscore from customers)t where creditscore>avg\_creditscore;



**Explanation :** This Query identifies customers whose credit scores are higher than the overall average credit score.This analysis helps the  bank examine the credit profiles and existing loans of customers with relatively higher credit scores.



1**4. Analyse laon status distribution and percentage.**

**Query:** select loanstatus,count(\*) as Total\_loans,sum(loanamount)as total\_amount,round(count(\*)\*100.0/(select count(\*) from loans),2)as loan\_percentage from loans group by loanstatus ;



**Explanation :** This Query analyses the distribution of loan across different statuses,such as active,closed and overdue.this analysis helps bank monitor its loan portfolio and identify the proportion of overdue loan that may require additional attention.



**15. Find the Top loan type by total loan amount in each city.**

**Query:** select customername, loantype,loanamount,city,top3 from (select c.customername,l.loantype,l.loanamount,c.city,sum(l.loanamount)as total\_loan,dense\_rank()over(partition by city order by sum(l.loanamount) desc)as top3 from customers c inner join loans l on c.customerid=l.customerid group by c.customername,l.loantype,l.loanamount,c.city)t where top3<=3;



**Explanation** : This Query identifies the loan type with the highest total loan amount in each city.This analysis helps management understand which loan products contribute the most to lending activity in different cities.





&#x20;

