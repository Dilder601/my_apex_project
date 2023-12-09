explain plan for
  SELECT p.prod_id,p.prod_name, s.amount_sold, s.quantity_sold
  FROM sales s, products p, customers c
  WHERE s.prod_id = p.prod_id
  and s.CUST_ID = c.CUST_ID
  and s.cust_id in (2,3,4,5);
 
select * from table(dbms_xplan.display());
 
explain plan for  
SELECT p.prod_id,p.prod_name, s.amount_sold, s.quantity_sold
  FROM sales s, products p, customers c
  WHERE s.prod_id = p.prod_id
  and s.CUST_ID = c.CUST_ID
  and s.cust_id between 2 and 5;
 
select * from table(dbms_xplan.display());