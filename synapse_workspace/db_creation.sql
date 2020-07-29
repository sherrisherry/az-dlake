-- master db
CREATE DATABASE synadb COLLATE SQL_Latin1_General_CP1_CS_AS;

-- db
CREATE MASTER KEY;
CREATE DATABASE SCOPED CREDENTIAL AzureStorageCredential
WITH IDENTITY='SHARED ACCESS SIGNATURE',
    SECRET = ''
;
CREATE EXTERNAL DATA SOURCE defaultlake
WITH (
    LOCATION = '',
    CREDENTIAL = AzureStorageCredential
);
CREATE EXTERNAL FILE FORMAT u8stin
WITH (
    FORMAT_TYPE = DelimitedText,
    FORMAT_OPTIONS (FIELD_TERMINATOR = ',',
    FIRST_ROW = 1,
    Encoding = 'UTF8')
);
CREATE EXTERNAL FILE FORMAT u8stin_cmp
WITH (
    FORMAT_TYPE = DelimitedText,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.GzipCodec',
    FORMAT_OPTIONS (FIELD_TERMINATOR = ',',
    FIRST_ROW = 1,
    Encoding = 'UTF8')
);
