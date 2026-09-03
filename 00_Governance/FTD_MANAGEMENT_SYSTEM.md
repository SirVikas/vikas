# FTD MANAGEMENT SYSTEM

**Status:** PERMANENT / ACTIVE  
**System:** FTD-MS v2.1  
**Canonical index:** `00_Governance/FTD_INDEX.md`  
**Canonical template:** `00_Governance/FTD_TEMPLATE.md`  
**Claude protocol:** `00_Governance/FTD-CLAUDE-OPERATING-PROTOCOL.md`

Repository-local Constitution, instructions, Founder decisions, approved registers, security rules and domain controls remain controlling.

## Global Unique ID Rule

FTD IDs MUST be globally unique across all repositories governed by this FTD system. Repository-local numbering alone is not sufficient.

Canonical format:

`FTD-[REPO-CODE]-YYYYMMDD-HHMM-SSS`

Example:

`FTD-LSR-OUTREACH-20260903-1130-001`

`REPO-CODE` is the stable uppercase repository namespace. It MUST be unique within the user's repository portfolio. `YYYYMMDD` is the IST creation date, `HHMM` is the 24-hour IST creation time, and `SSS` is the sequence for that repository/date-time block.

Every record MUST also store the ISO-8601 UTC timestamp. IDs are immutable and MUST NEVER be reused, including after cancellation or supersession.

For legacy FTDs that predate this global namespace, preserve their historical IDs. Do not rename historical records merely to satisfy the new format. New FTDs MUST use the global format.

## Fast path

When substantial work is requested, create/register the FTD before or at the start of execution: allocate a globally unique ID, timestamp IST+UTC, create the record from the template, classify it, record authority/dependencies, add it to the index, link related FTDs, then proceed with authorized execution.

## Lifecycle

`IDENTIFY → REGISTER → CLASSIFY → AUTHORITY → DEPENDENCIES/HOLDS → APPROVE → IMPLEMENT → VERIFY/QC → CLOSE → OUTCOME`

Primary statuses: `DRAFT`, `REGISTERED`, `APPROVED`, `IN_PROGRESS`, `BLOCKED`, `VERIFICATION`, `CLOSED`. Terminal exceptions: `CANCELLED`, `SUPERSEDED`.

## Relationships

Use explicit typed relationships: `PARENT`, `CHILD`, `DEPENDS-ON`, `BLOCKED-BY`, `BLOCKS`, `RELATED`, `IMPLEMENTS`, `VERIFIED-BY`, `SUPERSEDES`, `SUPERSEDED-BY`, `CONFLICTS-WITH`, `DUPLICATES`.

## Index and cross-repository analysis

`FTD_INDEX.md` is the rapid operational lookup surface. Every new FTD gets an entry immediately. Cross-repository references MUST use the complete global FTD ID and, where useful, the repository name/link.

## Authority / conflict

An FTD never bypasses higher authority. On conflict: `IDENTIFY → EXPLAIN → STOP AFFECTED ACTION → RECORD → SEEK AUTHORITY`. Recency alone creates no authority.

## Closure

`CLOSED` requires appropriate verification/QC evidence or an authorized recorded reason verification is not required. Preserve historical records; mark obsolete work `SUPERSEDED` or `CANCELLED` rather than deleting it.

## Claude

When an FTD GitHub link is supplied, Claude MUST follow `FTD-CLAUDE-OPERATING-PROTOCOL.md`, inspect the complete FTD and applicable repository governance before substantial work, and use GitHub as the durable source of truth.

## Isolation

This generic lifecycle does not copy repository-specific legal, professional, client/matter, data, architecture, security, pricing or domain rules between repositories.

**Canonical principle:** repository = durable institutional memory; FTD = durable task record; index = rapid navigation/relationship surface; execution = authority + evidence.
