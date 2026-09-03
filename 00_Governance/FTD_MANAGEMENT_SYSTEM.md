# FTD MANAGEMENT SYSTEM

**Status:** PERMANENT / ACTIVE  
**System:** FTD-MS v2.0  
**Index:** `00_Governance/FTD_INDEX.md`  
**Template:** `00_Governance/FTD_TEMPLATE.md`

Repository-local Constitution, instructions, Founder decisions, approved registers, security rules and domain controls remain controlling.

## Fast path
When substantial work is requested, **create/register the FTD immediately**. “FTD बना दो” means: allocate the next immutable ID, timestamp it in IST and UTC, create the record from the template, classify it, record authority/dependencies, add it to the index, link related FTDs, then proceed with authorized execution.

## ID standard
`FTD-YYYYMMDD-HHMM-SSS`  
Example: `FTD-20260903-1105-001`

`YYYYMMDD` = date; `HHMM` = 24-hour IST creation time; `SSS` = repository-local sequence for that date/time block. Record ISO-8601 UTC timestamp too. Never reuse an ID.

## Lifecycle
`IDENTIFY → REGISTER → CLASSIFY → AUTHORITY → DEPENDENCIES/HOLDS → APPROVE → IMPLEMENT → VERIFY/QC → CLOSE → OUTCOME`

Primary statuses: `DRAFT`, `REGISTERED`, `APPROVED`, `IN_PROGRESS`, `BLOCKED`, `VERIFICATION`, `CLOSED`. Terminal exceptions: `CANCELLED`, `SUPERSEDED`.

Priority: `P0` critical, `P1` high, `P2` normal, `P3` low. Classes: `GOV`, `SEC`, `ARCH`, `FEAT`, `FIX`, `OPS`, `DOC`, `QC`, `RESEARCH`.

## Required record
ID/title; IST+UTC timestamps; objective/success condition; scope/non-scope; repository/components; source/requester; class/priority; authority/approval; dependencies/holds; parent/child/related/conflict/supersession links; implementation PR/commit/release; verification/QC evidence; risks/unresolved issues; owner; status; closure timestamp/outcome.

## Typed relationships
Use explicit links: `PARENT`, `CHILD`, `DEPENDS-ON`, `BLOCKED-BY`, `BLOCKS`, `RELATED`, `IMPLEMENTS`, `VERIFIED-BY`, `SUPERSEDES`, `SUPERSEDED-BY`, `CONFLICTS-WITH`, `DUPLICATES`.

Use dependency relations for execution analysis; do not hide dependencies in prose.

## Rapid index
`FTD_INDEX.md` is the first operational lookup surface. It records every active/historical FTD with ID, timestamp, status, priority, class, objective, relationships, dependency/blocker chain, implementation, verification and last update. The full FTD record remains authoritative for detail/evidence.

The index must make these questions answerable quickly: active work; P0/P1; blocked chains; dependency chains; parent/child trees; conflicts; supersession; unverified work; implementation evidence.

## Authority / conflict
An FTD never bypasses higher authority. On conflict: `IDENTIFY → EXPLAIN → STOP AFFECTED ACTION → RECORD → SEEK AUTHORITY`. Recency alone creates no authority.

## Closure
`CLOSED` requires appropriate verification/QC evidence or an authorized recorded reason verification is not required. Preserve history; mark obsolete work `SUPERSEDED` or `CANCELLED` rather than deleting it.

## Isolation
This generic layer does not copy repository-specific legal, professional, client/matter, data, architecture, security, pricing or other domain rules between repositories.

**Canonical principle:** repository = durable institutional memory; FTD = durable task record; index = rapid navigation/relationship surface; execution = authority + evidence.
