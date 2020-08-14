---
title: "Sleep"
linkTitle: "Sleep"
weight: 97
description: >
  Pause a DMScript execution.
---

_Sleep_ pauses _DMScript_ execution for the specified number of seconds. If used inside a parallel block, only the parallel thread is suspended for the duration of the specified delay – the other threads continue execution.

_sleep_ takes a single named parameter:

|Parameter| Description |
|---|---|
|delay |The number of seconds to wait|

## Example

```bash
Suspend the current thread for 30 seconds

sleep(delay: 30);
```
