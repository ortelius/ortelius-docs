---
title: "Change Request"
linkTitle: "Change Request"
weight: 26
description: >
  Get a Change Request (issue). 
---

The _Change Request_ object represents a change request record associated with either a _Component_ or an _Application_. Arrays of _Change Request_ objects are returned by accessing the requests property of an _Application_ or _Component_ object or the requests() method of an _Application_.

The following properties can be accessed for a _Change Request_ object:

| id | String | The change request id. |
| --- | --- | --- |
| name | String | The change request description. |
| status | String | The change request status. |
| api\_url | String | A URL which - if passed to restful\_get - will return an array containing the full details of the change request from the external change tracking system. Useful for getting more information than the id / description / status combination which is stored in Ortelius. |
| html\_url | String | A URL which will direct a browser to the page describing the change request in the external change tracking system. |
