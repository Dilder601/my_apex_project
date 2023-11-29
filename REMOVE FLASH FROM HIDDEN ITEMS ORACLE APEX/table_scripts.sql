create sequence payment_method_seq 
    start with 1
    increment by 1;
/

create table payment_method (
    id number,
    method_name varchar2(255),
    constraint payment_method_pk 
        primary key (id)
);
/

create or replace trigger payment_method_biu
    before insert or update 
        on payment_method
       for each row
begin
    if :new.id is null then
        :new.id := payment_method_seq.nextval;
    end if;
end payment_method_biu;

/
insert all
    into payment_method (method_name) values ('Apple Pay')
    into payment_method (method_name) values ('PayPal')
    into payment_method (method_name) values ('Debit/Credit Card')
select * from dual;
/

/*PACKAGE SPEC CODE*/
create or replace package payment_method_utils_pkg as 
/********************************************************************************/
    function get_payment_method_id (p_method_name in payment_method.method_name%type) 
        return payment_method.id%type;
/********************************************************************************/
end payment_method_utils_pkg;
/
/*PACKAGE BODY CODE*/
create or replace package body payment_method_utils_pkg as 
/********************************************************************************/
    function get_payment_method_id (p_method_name in payment_method.method_name%type) 
        return payment_method.id%type
    is
        l_id payment_method.id%type;
    begin
        begin
            select id
              into l_id
              from payment_method
             where upper(method_name) = upper(p_method_name);
        exception 
            when no_data_found then
                null;
        end;
        return l_id;
    end get_payment_method_id;
/********************************************************************************/
end payment_method_utils_pkg;