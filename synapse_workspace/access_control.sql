-- master db
create login [aaa@bbb.ccc] from external provider;
-- db
create user u_nm from login [aaa@bbb.ccc];
alter role db_datareader add member u_nm;
grant REFERENCES on database scoped credential::AzureStorageCredential to u_nm;
