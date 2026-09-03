# GLOBAL FTD ID STANDARD

**Status:** PERMANENT / ACTIVE  
**Version:** 1.0  
**Authority:** Repository governance / Founder-controlled governance where applicable

## Purpose

This document defines the portfolio-wide namespace for Future Task Documents (FTDs) so an FTD can be referenced unambiguously across repositories, Claude sessions, issues, pull requests, commits and verification records.

## Canonical ID

`FTD-[REPO-CODE]-YYYYMMDD-HHMM-SSS`

- `REPO-CODE`: stable uppercase code assigned to exactly one repository.
- `YYYYMMDD-HHMM`: creation timestamp in IST.
- `SSS`: sequence within the same repository/time block.
- The FTD record MUST additionally preserve the exact UTC ISO-8601 creation timestamp.

IDs are immutable and never reused.

## Repository namespace registry

| Repository | REPO-CODE |
|---|---|
| `SirVikas/vikas` | `VIKAS` |
| `SirVikas/Gandhi_House` | `GANDHI-HOUSE` |
| `SirVikas/EOW_Profit_Engine` | `EOW-PROFIT-ENGINE` |
| `SirVikas/EOW_HYBRID_CORE` | `EOW-HYBRID-CORE` |
| `SirVikas/EOW-Quant-Engine` | `EOW-QUANT-ENGINE` |
| `SirVikas/EOW-Quant-Engine-ChatGPT-` | `EOW-QUANT-ENGINE-CHATGPT` |
| `SirVikas/DIRECT_EXE_BUILDER` | `DIRECT-EXE-BUILDER` |
| `SirVikas/CCS-MEERUT` | `CCS-MEERUT` |
| `SirVikas/DEMOCRACY_SAVED` | `DEMOCRACY-SAVED` |
| `SirVikas/LSR` | `LSR` |
| `SirVikas/TOOLS` | `TOOLS` |
| `SirVikas/LSR-Outreach` | `LSR-OUTREACH` |
| `SirVikas/gandhi-im-website` | `GANDHI-IM-WEBSITE` |

## Allocation rule

Before creating a new FTD, confirm the repository code and timestamp/sequence do not duplicate an existing ID. The repository's FTD index is the operational registration point; this document is the canonical namespace registry.

A repository MUST NOT use another repository's code. If a repository is renamed, retain its established code unless a deliberate governance change records the migration and preserves aliases.

## Legacy records

Existing IDs created before this standard remain valid historical identifiers. They must not be silently renamed. New FTDs use the global format and may explicitly relate to legacy records using `RELATED`, `SUPERSEDES`, `IMPLEMENTS`, `PARENT`, `CHILD`, or other approved relationship types.

## Cross-repository analysis

When referencing an FTD outside its home repository, always use its complete global ID plus repository name/link where practical. Do not rely on bare numeric or local IDs.

## Claude execution rule

When Claude receives an FTD GitHub link, it must read that FTD and its repository governance, then use the complete FTD ID for all planning, implementation, verification and closure references. If the FTD is legacy-numbered, preserve the legacy ID while recording the repository and relationships explicitly.

**Canonical source:** this file defines the portfolio namespace; each repository's `FTD_MANAGEMENT_SYSTEM.md` defines local lifecycle execution under the same namespace.
