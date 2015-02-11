--/// <foreachEntityProperty where="type=tableInfo">
--///   <token name="tableName" replaceText="template_test_table" />
DROP TABLE IF EXISTS template_test_table;
CREATE TABLE template_test_table (

 --/// <foreachEntityProperty where="dataType=integer">
 --///   <token name="fieldName" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
 --///   <token name="length" replaceText="11"/>
   integer_field INT(11),
 --/// </foreachEntityProperty>

 --/// <foreachEntityProperty where="dataType=long, pk=true">
 --///   <token name="fieldName" replaceText="long_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
   long_field BIGINT NOT NULL,
 --/// </foreachEntityProperty>

 --/// <foreachEntityProperty where="dataType=boolean">
 --///   <token name="fieldName" replaceText="boolean_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
   boolean_field SMALLINT(1) DEFAULT -1,
 --/// </foreachEntityProperty>

 --/// <foreachEntityProperty where="dataType=date">
 --///   <token name="fieldName" replaceText="date_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
   date_field DATETIME,
 --/// </foreachEntityProperty>

 --/// <foreachEntityProperty where="dataType=float">
 --///   <token name="fieldName" replaceText="float_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
   float_field FLOAT,
 --/// </foreachEntityProperty>

 --/// <foreachEntityProperty where="dataType=decimal">
 --///   <token name="fieldName" replaceText="decimal_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
 --///   <token name="length" replaceText="16, 4" />
   decimal_field DECIMAL(16, 4),
 --/// </foreachEntityProperty>

 --/// <foreachEntityProperty where="dataType=long, pk!=true">
 --///   <token name="fieldName" replaceText="long_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
   long_field BIGINT,
 --/// </foreachEntityProperty>

 --/// <foreachEntityProperty where="dataType=entity">
 --///   <token name="fieldName" replaceText="entity_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
   entity_field BIGINT,
 --/// </foreachEntityProperty>

 --/// <foreachEntityProperty where="dataType=filesystemFile">
 --///   <token name="fieldName" replaceText="filesystem_file_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
 --///   <token name="length" replaceText="255" />
   filesystem_file_field VARCHAR(255),
 --/// </foreachEntityProperty>

 --/// <foreachEntityProperty where="dataType=string, length!=text">
 --///   <token name="fieldName" replaceText="string_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
 --///   <token name="length" replaceText="255" />
   string_field VARCHAR(255),
 --/// </foreachEntityProperty>

 --/// <foreachEntityProperty where="dataType=string, length=text">
 --///   <token name="fieldName" replaceText="string_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
 --///   <token name="length" replaceText="255" />
   string_field TEXT,
 --/// </foreachEntityProperty>


 --/// <foreachEntityProperty where="dataType=vector">
 --///   <token name="fieldName" replaceText="vector_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
   vector_field VARCHAR(255),
 --/// </foreachEntityProperty>

 --/// <foreachEntityProperty where="dataType=file">
 --///   <token name="fieldName" replaceText="file_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
   file_field VARCHAR(255),
 --/// </foreachEntityProperty>

 --/// <foreachEntityProperty where="pk=true">
 --///   <token name="fieldName" replaceText="long_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
 PRIMARY KEY (long_field)
 --/// </foreachEntityProperty>
);
--/// </foreachEntityProperty>


--/// <foreachEntityProperty where="dataType=foreignVector">
--///   <token name="foreignTableName" replaceText="template_test_link_table" />
--///   <token name="foreignKey" replaceText="long_field" />
--///   <token name="linkKey" replaceText="link_key" />
DROP TABLE IF EXISTS template_test_link_table;
CREATE TABLE template_test_link_table (
   long_field BIGINT,
   link_key BIGINT,
   sequence_order INTEGER
);
--/// </foreachEntityProperty>

