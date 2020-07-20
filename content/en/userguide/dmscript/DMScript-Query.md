---
title: "Query"
linkTitle: "Query"
weight: 87  
description: >
   Run a query against a Data Source Object. 
---


_Query_ runs a query against a _Data Source_, returning a _resultset_ into a named array. The array is keyed on the returned column (or attribute) name. The body of the query is executed once for each returned row.

query requires named parameters. The parameters required will differ depending on whether the _Data Source_ is of type ODBC or LDAP.

The parameters are:
| Parameter | Description |
| --- |--- |
| datasource | Mandatory: The name of the _Data Source_ to query. |
| result | Mandatory: The name of the array in which each result row should be written. |
| attributes | Mandatory for LDAP _Data Sources_ only: An array of attributes to retrieve from the LDAP record. |
| filter | Mandatory for LDAP _Data Sources_ only: A string indicating the LDAP Search Filter in RFC 2254 format. |
| searchbase | Optional. LDAP _Data Sources_ only: The starting point of the search in the LDAP hierarchy. |
| sql | Optional. ODBC _Data Sources_ only: The SQL to execute against the specified _Data Source_. If the SQL is a query (SELECT) then the resulting rows are returned into the array specified by the result parameter. |

**Example:**

In the following examples, assume there is a table called "customers" defined as follows:

```bash
customers(

id int,

first\_name char(30),

last\_name char(30));

Example: Execute a query against an ODBC connection and print the results:

// Print out each matching record from the database

query(datasource: "myodbc",

sql: "select \* from customers",

result: arr) {

echo "customer id: ${arr.id}";

echo "first name: ${arr.first\_name}";

echo "last name: ${arr.last\_name}";

echo "\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*";

}
~
