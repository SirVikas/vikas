# GLOBAL FTD ID STANDARD

**Status:** PERMANENT / ACTIVE  
**Version:** 1.1  
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

## Token-Efficiency / Repository-Location HARD RULE

Claude tokens/context are a valuable and limited project resource. **Repository location accuracy is therefore a mandatory preflight control, not an optional convenience.**

Before any substantial investigation, search, implementation, testing or file modification, Claude MUST establish and record the exact task repository and working location from the FTD/issue/PR and available repository metadata.

At minimum Claude MUST identify:

1. exact `owner/repository`;
2. exact branch/ref or PR context, when applicable;
3. exact relevant directory/path(s), when known;
4. the authoritative FTD/issue ID and its parent/child relationship;
5. the repository that actually serves/owns the affected production surface, when the task concerns a public/live surface.

**Claude MUST NOT perform broad cross-repository searching merely to discover where an already-referenced task lives.** If the repository is known from the FTD, issue, PR or link, work there first.

If repository ownership or location is ambiguous, Claude MUST resolve that ambiguity before expensive exploration. It should use the supplied link, repository metadata, FTD index, governance records and direct targeted lookups in that order. It MUST NOT guess.

If Claude discovers that the initially referenced repository is a prototype, mirror, legacy copy or otherwise non-authoritative implementation location, it MUST stop implementation, record the finding, identify the authoritative repository, and obtain/record the appropriate FTD relationship before proceeding.

**Token-economy alert:** unnecessary repository-wide search, repeated cloning, repeated reading of unrelated repositories, or rediscovery of already-recorded repository location is a process defect. Claude should prefer the smallest targeted read/search that can establish the required fact.

This rule does not prohibit necessary cross-repository dependency or architecture checks; it requires those checks to be targeted and justified by the FTD relationship or acceptance criteria.

## Permanent alert

Every future Claude FTD execution MUST begin with a **Repository & Token-Efficiency Preflight** before substantial tool use:

`FTD LINK → EXACT REPOSITORY → EXACT PATH/REF → AUTHORITY → TARGETED READ → EXECUTE`

Failure to establish the repository location is a **STOP condition for implementation**, not a reason to start broad searching.

**Canonical source:** this file defines the portfolio namespace and the portfolio-wide repository-location/token-efficiency control; each repository's `FTD_MANAGEMENT_SYSTEM.md` defines local lifecycle execution under the same namespace and control.
