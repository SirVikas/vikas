# FTD MANAGEMENT SYSTEM

**Status:** PERMANENT / ACTIVE  
**Scope:** This repository  
**Authority:** Repository-local Constitution, governing instructions, Founder decisions and approved registers remain controlling.

## 1. Purpose

This document establishes the permanent repository-level management lifecycle for FTDs. It is a governance control and durable institutional record. It does not replace or override any repository-specific Constitution, Master Instruction, approved decision, architecture, specification, security rule, or legal/business constraint.

## 2. Standing rule

Before substantial work is started, the applicable FTD must be identified and its current repository record inspected. A substantial change must not be silently performed as an unregistered task.

Trivial maintenance that cannot materially affect governance, architecture, security, data, public behaviour, production state, or an approved deliverable may be performed without creating a new FTD, unless repository-local rules require one.

## 3. FTD lifecycle

Every applicable FTD follows this controlled lifecycle:

`IDENTIFY → REGISTER → CLASSIFY → CHECK AUTHORITY → CHECK DEPENDENCIES/HOLDS → APPROVE WHEN REQUIRED → IMPLEMENT → VERIFY/QC → CLOSE → RECORD OUTCOME`

An FTD may remain OPEN, BLOCKED, HELD, or PENDING when its conditions are not satisfied. Status must reflect evidence; it must never be inferred from activity alone.

## 4. Minimum FTD record

Each FTD record should contain, as applicable:

- FTD ID and title;
- objective and scope;
- repository and affected component(s);
- source/request;
- classification and priority;
- dependencies, blockers and holds;
- authority/approval required and decision record;
- planned implementation;
- implementation commit/PR/reference;
- tests, verification and QC evidence;
- unresolved issues and risks;
- final status;
- closure date and outcome;
- links to related records.

## 5. Authority and conflict rule

An FTD is not permission to bypass higher authority. Where an FTD conflicts with the repository Constitution, Master Instruction, approved Founder decision, security control, legal/compliance constraint, or active hold:

`IDENTIFY CONFLICT → EXPLAIN → STOP AFFECTED ACTION → RECORD → SEEK REQUIRED AUTHORITY`

Recency alone does not create authority.

## 6. Change control

A governance change must be classified as an amendment, addition, clarification, temporary decision, or implementation change and recorded through the repository's approved governance process. Code/content changes must not be used to silently create governance authority.

## 7. Evidence and completion

No FTD is considered complete merely because code or documents were changed. Completion requires appropriate verification/QC evidence and a durable record of what changed, what did not change, tests/checks performed, findings, unresolved matters, and the resulting status.

## 8. Repository isolation

This common FTD system is intentionally generic. Repository-specific identities, professional rules, client/matter rules, data restrictions, architectures, credentials, pricing, legal positions and other domain controls must remain local to the repository in which they are authoritative. Nothing in this file authorizes copying such rules between repositories.

## 9. Permanent operation

This file is a standing control. Future FTD work in this repository must use this lifecycle unless a higher-priority repository-local rule expressly requires a different process.

**Canonical principle:** The repository is the durable institutional memory; the FTD record is the durable task-level record; execution follows authority and evidence, not conversation memory or assumption.
