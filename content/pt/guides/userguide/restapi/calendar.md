---
title: "Environment Calendar API"
linkTitle: "Environment Calendar API"
weight: 27
description: >
  Get an _Environments_ Calendar Event.
---

Retrieves a calendar event for an _Environment_. This call returns a JSON object representing the events in the _Environment_ calendar. Events can be filtered based on the _Environment_ to which the calendar belongs, the _Application_ associated with the event, a date/time range or a combination of all of these.

### REST Api Endpoint

| HTTP Verb | URL                      |
|-----------|--------------------------|
| GET       | /dmadminweb/API/calendar |

### Parameters

| Name      | Located in | Value                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Required | Schema |
|-----------|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|--------|
| env       | query      | Is the identifier of an _Environment_. Either its name, its qualified name with its parent _Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. Specifying the _Environment_ filters the results to those events associated with the given _Environment_.                                                                                                                                                                                                                                                                                                                                                                                                                           | No       | string |
| app       | query      | Is the identifier of an _Application_. Either its name, its qualified name with its parent _Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. Specifying the _Application_ filters the results to those events associated with the given _Application_.                                                                                                                                                                                                                                                                                                                                                                                                                           | No       | string |
| starttime | query      | Is a date/time which - if specified - restricts the result to only include events which start on or before the specified time. If endtime is not provided, the API returns all future events. Values can be: <li>  YYYY:MM:DD - A date represented by a 4 digit year, a 2 digit month number and a 2 digit day of month.</li>  <li>YYYY:MM:DD:hh:mm - A date and time represented by a 4 digit year, a 2 digit month number, a 2 digit day of month and then the hours and minutes. </li> <li> nnnnnnnnnn - An integer number representing the number of seconds since midnight, 1st Jan 1970 (Epoch time) </li>                                                                                            | No       | string |
| endtime   | query      | Is a date/time which - if specified - restricts the result to only include events which start on or after the specified time. If starttime is not provided, the API only returns events that in the future. Specifying a starttime before the current date/time will return historical events. Values can be: <li> YYYY:MM:DD - A date represented by a 4 digit year, a 2 digit month number and a 2 digit day of month.</li> <li> YYYY:MM:DD:hh:mm -  A date and time represented by a 4 digit year, a 2 digit month number, a 2 digit day of month and then the hours and minutes. <li> nnnnnnnnnn - An integer number representing the number of seconds since midnight, 1st Jan 1970 (Epoch time) </li> | No       | string |

{{% include "/guides/userguide/reusable/Model Calendar Event Result.md" %}}
{{% include "/guides/userguide/reusable/Model Calendar Event.md" %}}
{{% include "/guides/userguide/reusable/Model Application.md" %}}
{{% include "/guides/userguide/reusable/Model Event Timestamp.md" %}}
{{% include "/guides/userguide/reusable/Model Event Creator.md" %}}
{{% include "/guides/userguide/reusable/Model Event Environment.md" %}}
