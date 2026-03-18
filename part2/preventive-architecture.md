# Preventive Security Architecture using SCPs

## Overview

This architecture implements a preventive security model using AWS Organizations and Service Control Policies (SCPs) to enforce guardrails across multiple AWS accounts. It ensures that non-compliant security configurations, such as overly permissive security group rules, are blocked before they can be applied.

---

## Architecture Diagram

```mermaid
flowchart TB

    Dev[Developer]

    Org[AWS Organizations]
    SCP[Service Control Policy]

    CI[Approved CICD Pipeline]

    Account1[Prod Account]
    Account2[Dev Account]
    Account3[Shared Services Account]

    Dev --> Org
    Org --> SCP

    SCP --> Account1
    SCP --> Account2
    SCP --> Account3

    Dev -->|Denied if non compliant| Account1
    Dev -->|Denied if non compliant| Account2

    CI -->|Approved changes| Account1
    CI -->|Approved changes| Account2
