---
title: "Date Object"
linkTitle: "Date Object"
weight: 41
description: >
  Format a Date Object from the given values.
---


The _date object_ represents a date/time in _DMScript_. Dates can be created (with the date() or now()_Functions_) or can be retrieved from a _DropZoneFile_ object (which represents a file in the _DropZone_).

The following methods can be called on the _date object_:

| **Method** | **Return Type** | **Description** |
| --- | --- | --- |
| to\_int(secs) | Integer | Returns an integer representing the date as the number of seconds since midnight on January 1st 1970 (epoch). The secs parameter is optional. If specified, the specified number of seconds is added to the date/time before the new value is returned. |
| to\_char(fmt) | String | Formats the date into a string given by the passed fmt string. The fmt string should contain characters as specified below. |

### Date Format Characters

The to\_char() method returns a string which is identical to the passed fmt string with the exception of the special character sequences described below. Where these are present in the fmt string, they are replaced with the relevant _Component_ from the date/time as described below:

| **Sequence** | **Description** |
| --- | --- |
| %a | The abbreviated name of the day of the week according to the current locale. |
| %A | The full name of the day of the week according to the current locale. |
| %b | The abbreviated month name according to the current locale. |
| %B | The full month name according to the current locale. |
| %c | The preferred date and time representation for the current locale. |
| %C | The century number (year/100) as a 2-digit integer. |
| %d | The day of the month as a decimal number (range 01 to 31). |
| %e | Like %d, the day of the month as a decimal number, but a leading zero is replaced by a space. |
| %E | Modifier: use alternative format, see below. |
| %F | Equivalent to %Y-%m-%d (the ISO 8601 date format). |
| %G | The ISO 8601 week-based year with century as a decimal number. The 4-digit year corresponding to the ISO week number (see %V). This has the same format and value as %Y, except that if the ISO week number belongs to the previous or next year, that year is used instead. |
| %g | Like %G, but without century, that is, with a 2-digit year (00-99). |
| %h | Equivalent to %b. |
| %H | The hour as a decimal number using a 24-hour clock (range 00 to 23). |
| %I | The hour as a decimal number using a 12-hour clock (range 01 to 12). |
| %j | The day of the year as a decimal number (range 001 to 366). |
| %k | The hour (24-hour clock) as a decimal number (range 0 to 23); single digits are preceded by a blank. (See also %H.) |
| %l | The hour (12-hour clock) as a decimal number (range 1 to 12); single digits are preceded by a blank. (See also %I.) |
| %m | The month as a decimal number (range 01 to 12). |
| %M | The minute as a decimal number (range 00 to 59). |
| %n | A newline character. |
| %O | Modifier: use alternative format, see below. |
| %p | Either "AM" or "PM" according to the given time value, or the corresponding strings for the current locale. Noon is treated as "PM" and midnight as "AM". |
| %P | Like %p but in lowercase: "am" or "pm" or a corresponding string for the current locale. |
| %r | The time in a.m. or p.m. notation. In the POSIX locale this is equivalent to %I:%M:%S %p. |
| %R | The time in 24-hour notation (%H:%M). For a version including the seconds, see %T below. |
| %s | The number of seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC). |
| %S | The second as a decimal number (range 00 to 60). (The range is up to 60 to allow for occasional leap seconds). |
| %t | A tab character. |
| %T | The time in 24-hour notation (%H:%M:%S). |
| %u | The day of the week as a decimal, range 1 to 7, Monday being 1. (See also %w.) |
| %U | The week number of the current year as a decimal number, range 00 to 53, starting with the first Sunday as the first day ofweek 01. (See also %V and %W.) |
| %V | The ISO 8601 week number of the current year as a decimal number, range 01 to 53, where week 1 is the first week that has at least 4 days in the new year. (See also %U and %W. (Calculated from tm\_year, tm\_yday, and tm\_wday.) |
| %w | The day of the week as a decimal, range 0 to 6, Sunday being 0. See also %u. |
| %W | The week number of the current year as a decimal number, range 00 to 53, starting with the first Monday as the first day of week 01. |
| %x | The preferred date representation for the current locale without the time. |
| %X | The preferred time representation for the current locale without the date. |
| %y | The year as a decimal number without a century (range 00 to 99). |
| %Y | The year as a decimal number including the century. |
| %z | The +hhmm or -hhmm numeric timezone (that is, the hour and minute offset from UTC). |
| %Z | The timezone name or abbreviation. |
| %% | A literal '%' character. |

### Alternate Format Modifiers

Some conversion specifications can be modified by preceding the conversion specifier character by the E or O modifier to indicate that an alternative format should be used. If the alternative format or specification does not exist for the current locale, the behavior will be as if the unmodified conversion specification were used. (SU) The Single UNIX Specification mentions %Ec, %EC, %Ex, %EX, %Ey, %EY, %Od, %Oe, %OH, %OI, %Om, %OM, %OS, %Ou, %OU, %OV, %Ow, %OW, %Oy, where the effect of the O modifier is to use alternative numeric symbols (say, roman numerals), and that of the E modifier is to use a locale-dependent alternative representation.

NOTE: The date is formatted by to\_char using the C _Function_strftime.
