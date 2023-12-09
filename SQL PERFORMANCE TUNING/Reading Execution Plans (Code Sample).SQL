 SELECT /* my query */ p.prod_id,p.prod_name, s.amount_sold, s.quantity_sold
  FROM sales s, products p
  WHERE s.prod_id = p.prod_id
  and p.prod_id = 13;
 
select * from v$sql where sql_text like '%my query%';
 
select * from table(dbms_xplan.display_cursor(''));