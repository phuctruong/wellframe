--/// <loop times="5">
--/// <foreachEntityProperty where="dataType=tableInfo">
--///   <token name="tableName" replaceText="template_test_table" />
INSERT INTO template_test_table 
--/// </foreachEntityProperty>
   (
 --/// <foreachEntityProperty where="pk=true">
 --///   <token name="fieldName" replaceText="--integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    --integer_field,
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=integer, pk!=true">
 --///   <token name="fieldName" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    integer_field, 
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=boolean, pk!=true">
 --///   <token name="fieldName" replaceText="boolean_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    boolean_field, 
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=date, pk!=true">
 --///   <token name="fieldName" replaceText="date_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    date_field, 
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=float, pk!=true">
 --///   <token name="fieldName" replaceText="float_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    float_field,
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=long, pk!=true">
 --///   <token name="fieldName" replaceText="long_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    long_field,
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=string, pk!=true">
 --///   <token name="fieldName" replaceText="string_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
 --///   <token name="length" replaceText="255" />
    string_field, 
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=vector, pk!=true">
 --///   <token name="fieldName" replaceText="vector_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    vector_field
 --/// </foreachEntityProperty>

    ) 
VALUES 
   (
 --/// <foreachEntityProperty where="pk=true">
 --///   <token name="_SEQUENCE" replaceText="--1" />
    --1, 
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=integer, pk!=true">
 --///   <token name="_RANDOM_INTEGER" replaceText="1" />
    1, 
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=boolean, pk!=true">
 --///   <token name="fieldName" replaceText="boolean_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    0, 
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=date, pk!=true">
 --///   <token name="_RANDOM_DATE" replaceText="04-JUL-2002 01:00:00" />
    '04-JUL-2002 01:00:00', 
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=float, pk!=true">
 --///   <token name="fieldName" replaceText="float_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    12.23, 2636, 
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=string, pk!=true">
 --///   <token name="fieldName" replaceText="string_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
 --///   <token name="length" replaceText="255" />
    'Get in the zoomlane', 
 --/// </foreachEntityProperty>
 --/// <foreachEntityProperty where="dataType=vector, pk!=true">
 --///   <token name="fieldName" replaceText="vector_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    'a~b~c'
 --/// </foreachEntityProperty>
    );

--/// </loop>


