1. CHARINDEX   

CHARINDEX ( expressionToFind , expressionToSearch [ , start_location ] )
This function searches for one character expression inside a second character expression, 
returning the starting position of the first expression if found.

declare @var varchar(20)='abcd@erg'
select CHARINDEX('@',@var)

return 
5

2. TRY_CAST
Returns a value cast to the specified data type if the cast succeeds; otherwise, returns null.
TRY_CAST ( expression AS data_type [ ( length ) ] )

select
Name,Size,TRY_cast(size as int)
from Production.Product
where Size is not null 
	and TRY_cast(Size as int) like 42 or TRY_cast(Size as char) like 'M'
order by size

3. SUBSTRING 
Returns part of a character, binary, text, or image expression in SQL Server
SUBSTRING ( expression, start, length ) 

declare @var varchar(20)='abcd@erg'
select substring(@var,CHARINDEX('@',@var)+1,len(@var)-CHARINDEX('@',@var))

return erg

4. TRIM
Removes the space character char(32) or other specified characters from the start and end of a string.
TRIM ( [ characters FROM ] string )

declare @a varchar(25)='(The title of the book('
select trim(both '(' from @a)

5. CONCAT_WS
This function returns a string resulting from the concatenation, or joining, of two or more string values in an end-to-end manner.
It separates those concatenated string values with the delimiter specified in the first function argument.
(CONCAT_WS indicates concatenate with separator.)
CONCAT_WS ( separator , argument1 , argument2 [ , argumentN ] ... )
[ ; ]

select top 10
concat_ws(' ',FirstName,MiddleName,LastName)
from Person.Person

6. DATEADD 
This function adds a number (a signed integer) to a datepart of an input date, and returns a modified date/time value. 
DATEADD (datepart , number , date )

SELECT DATEADD(DAY,50,'20231116');

2024-01-05 00:00:00.000

7. DATEFROMPARTS 
This function returns a date value that maps to the specified year, month, and day values.
DATEFROMPARTS ( year, month, day )  

SELECT DATEFROMPARTS(2023,11,16);
2023-11-16

8. TRANSLATE
Returns the string provided as a first argument, 
after some characters specified in the second argument are translated into a destination set of characters, 
specified in the third argument.

TRANSLATE ( inputString, characters, translations )

SELECT TRANSLATE('/Titlul cartii este/', '/', '"');

returns: "Titlul cartii este"

9. PATINDEX 
Returns the starting position of the first occurrence of a pattern in a specified expression, 
or zero if the pattern is not found, on all valid text and character data types.

PATINDEX ( '%pattern%' , expression ) 

cauta pozitia oricarui caracter care nu este numar sau litera
SELECT patindex('%[^0-9A-Za-z]%', 'Plea!se ensure the door is locked!'); 

returns 5

10. REVERSE

Returns the reverse order of a string value.
REVERSE ( string_expression ) 

declare @a char(20)='12345abc6789'
select reverse(@a)

returns:         9876cba54321

11. LOWER 
Returns a character expression after converting uppercase character data to lowercase.
LOWER ( character_expression ) 

declare @a char(20)='Am o MINGE MICA'
select LOWER(@a)

returns: am o minge mica     

12. EOMONTH 
This function returns the last day of the month containing a specified date, with an optional offset.
EOMONTH ( start_date [ , month_to_add ] )

DECLARE @a DATETIME = '2023-11-17';
SELECT day(EOMONTH ( @a )) AS 'The last day of the month is';

returns: 30

13.DATETRUNC 
The DATETRUNC function returns an input date truncated to a specified datepart.
DATETRUNC ( datepart, date )

declare @a date='2023-11-17'
select 'Month',DATETRUNC(MONTH,@a)
select 'Year',DATETRUNC(year,@a) 

Returns:
Month   2023-11-01
Year	2023-01-01

14. DATEFROMPARTS 
This function returns a date value that maps to the specified year, month, and day values.
DATEFROMPARTS ( year, month, day )  

select DATEFROMPARTS(2023,11,17)
returns: 2023-11-17

15.FORMAT 
Returns a value formatted with the specified format and optional culture.
 Use the FORMAT function for locale-aware formatting of date/time and number values as strings.
 For general data type conversions, use CAST or CONVERT.


int=0724051061
declare @b int=0723282094
select 'Nr telefon a este',format(@a,'+04####-###-###') 
select 'Nr telefon b este',format(@b,'+04####-###-###') 
returns:
Nr telefon a este +040724-051-061
Nr telefon b este +040723-282-094

16. STUFF 
The STUFF function inserts a string into another string. 
It deletes a specified length of characters in the first string 
at the start position and then inserts the second string into the first string at the start position

STUFF ( character_expression , start , length , replace_with_expression )

declare @a char(20)='Robinson Crusoe'
declare @b char(20)='Daniel Defoe'
select 'Autorul cartii',@a,'este:',STUFF(@a,1,len(@a),@b)

returns:
Autorul cartii Robinson Crusoe este Daniel Defoe

17. REPLICATE 
Repeats a string value a specified number of times.
REPLICATE ( string_expression , integer_expression )   

declare @a char(25)='a'
select replicate('A',4)+@a

returns: AAAAa         

18. POWER 
Returns the value of the specified expression to the specified power.
POWER ( float_expression , y )  

declare @a int=2
declare @b int=4
declare @c int=6
select power(@a,5)+power(@b,2)-power(@c,2)

returns 12

19. SQRT 
Returns the square root of the specified float value.
SQRT ( float_expression )  

declare @a int=16825
select sqrt(@a)
returns 129,711217710728

20. ROUND 
Returns a numeric value, rounded to the specified length or precision.
ROUND ( numeric_expression , length [ ,function ] )  

declare @a int=16825
select round(sqrt(@a),2)

returns: 129,71               



