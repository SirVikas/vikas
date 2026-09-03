# CLAUDE HANDOFF MESSAGES

These are the canonical ready-to-send messages for Claude when starting work under the permanent FTD system.

## Message 1 — Introduce Claude to the permanent FTD system

> **Permanent FTD Operating Instruction**
>
> Whenever I give you an FTD GitHub link, that link is your task-entry point. Open the linked repository and read the complete FTD before doing substantial work. Then inspect the applicable repository Constitution/AI Constitution, governance and instruction files, `FTD_MANAGEMENT_SYSTEM.md`, `FTD_INDEX.md`, `FTD_TEMPLATE.md`, the Claude FTD operating protocol, related FTDs, decisions, approvals, holds and relevant implementation.
>
> Determine authority, scope, dependencies, blockers and acceptance criteria first. Execute only within the authorized scope. Use the complete FTD ID in your plan, code/commit/PR references, tests and closure record. Verify/QC against the FTD and repository rules and record evidence, unresolved issues and final status in GitHub.
>
> If an FTD conflicts with higher-priority repository governance, do not guess or silently choose a side: identify and explain the conflict, stop the affected action, record it, and seek the required authority.
>
> New FTDs use the global format `FTD-[REPO-CODE]-YYYYMMDD-HHMM-SSS`. The canonical portfolio namespace is `SirVikas/vikas/00_Governance/FTD_GLOBAL_ID_STANDARD.md`. Legacy FTD IDs remain unchanged.
>
> GitHub is the durable institutional memory. Conversation memory does not replace repository records, and code/content cannot silently create authority.

## Message 2 — Latest gandhi.im portal FTD

> **Work from this FTD:** `https://github.com/SirVikas/LSR-Outreach/issues/87`
>
> FTD: `FTD-20260903-USER-PORTAL` (legacy ID; preserve it exactly). It covers the next portal layer for `https://gandhi.im` and `https://app.gandhi.im`:
>
> 1. Make `gandhi.im` the natural public entry point for supported ordering, with a clear public flow into the existing authenticated ordering/payment/verification journey.
> 2. After login, give each user a proper account/profile area: profile management, account/security preferences, permitted order history/status and permitted documents/data.
> 3. Add an advanced support/ticket system: ticket creation and unique ticket number, subject/category/priority, controlled lifecycle, user/staff conversation, timestamps and actor attribution, attachments where authorized, order/account context, notifications, resolution/closure/reopen, audit trail and staff management.
> 4. Provide structured relationships among account, order, payment/reference, document and ticket so they can be rapidly queried and analysed without exposing unauthorized information.
> 5. Preserve strict public/authenticated/staff separation, server-side authorization, IDOR protection, auditability, responsive UX and TEST-environment safety. Do not expose internal Gate 7A state, staff controls, secrets or client/matter data to public users.
>
> Suggested decomposition: A public ordering hand-off; B profile/account centre; C support/ticket engine; D relationship/index layer; E notifications; F security/QC; G UX/public launch integration.
>
> Existing authentication/registration, order/payment/Gate 7A, email, D1/R2 and public hand-off are dependencies. Treat the FTD issue itself as authoritative for the detailed acceptance criteria and verification package. Do not declare production activation merely because development/testing succeeds; obtain the required authorization.
