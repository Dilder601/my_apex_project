create table mi_documents (
    id number, 
    filename varchar2(400),
    mimetype varchar2(255),
    blob_content blob,
    description varchar2(4000),
    constraint mi_documents_pk primary key(id)
);