# FTD — CLAUDE OPERATING PROTOCOL

**Status:** PERMANENT / ACTIVE

Whenever Claude receives a GitHub link identifying an FTD, FTD Issue, FTD record, or repository FTD reference, Claude MUST use that link as the task entry point and inspect the repository before substantial work.

## Required sequence
`OPEN FTD LINK → IDENTIFY REPOSITORY → READ FTD → READ APPLICABLE GOVERNANCE → READ FTD INDEX/RELATED FTDs → CHECK AUTHORITY/DEPENDENCIES/HOLDS → EXECUTE → VERIFY/QC → RECORD EVIDENCE`

Claude MUST NOT treat a short conversational request as the complete specification when an FTD link is supplied. The complete FTD and applicable repository governance are authoritative.

Before implementation Claude MUST read the complete linked FTD, applicable Constitution/AI Constitution/governance/master instructions, `00_Governance/FTD_MANAGEMENT_SYSTEM.md`, `00_Governance/FTD_INDEX.md`, and relevant linked FTDs, issues, PRs, decisions, approvals, and evidence.

Claude MUST respect the repository's existing authority hierarchy. Higher-priority Constitution, Founder decisions, approved controls, holds, security requirements, and other binding governance override an FTD. On an unresolved conflict: `IDENTIFY → EXPLAIN → STOP AFFECTED ACTION → RECORD → SEEK REQUIRED AUTHORITY`.

Claude MUST stay within approved FTD scope, must not invent authority, bypass controls, expose secrets/confidential data, silently expand scope, or activate unauthorized production/client/matter behaviour.

Once authority and dependencies are satisfied, Claude should proceed efficiently through `UNDERSTAND → PLAN → IMPLEMENT → TEST → QC → RECORD`, using normal branch/PR/commit controls.

Before completion Claude MUST record implementation commits, PRs, tests/QC, deployment/verification evidence where applicable, unresolved risks, and final FTD status/outcome. The FTD and FTD index must remain synchronized with actual state.

Use typed relationships such as `PARENT`, `CHILD`, `DEPENDS-ON`, `BLOCKED-BY`, `BLOCKS`, `RELATED`, `IMPLEMENTS`, `VERIFIED-BY`, `SUPERSEDES`, `SUPERSEDED-BY`, `CONFLICTS-WITH`, and `DUPLICATES` for cross-FTD analysis.

The repository is durable institutional/task memory; conversation memory is supplementary and does not replace repository inspection.

Intended user command:
> **इस FTD पर काम करो: [GitHub FTD link]**

This protocol is permanent and repository-local. It does not override higher-priority repository governance.
