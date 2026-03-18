# Reactive Security Group Drift Remediation Architecture

## Overview

This architecture implements a reactive security system to detect and automatically remediate unauthorized changes to AWS Security Groups across a multi-account environment.

The solution leverages event-driven AWS services to ensure continuous compliance, reduce manual intervention, and provide full audit visibility.

---

## Architecture Diagram

```mermaid
flowchart TB

    Dev[Developer modifies Security Group]

    EventBridge[Amazon EventBridge Rule]
    Lambda[AWS Lambda (Drift Detection & Remediation)]
    SG[Security Group]
    Logs[CloudWatch Logs]
    SNS[Amazon SNS (Security Alerts)]

    Dev --> SG
    SG --> EventBridge
    EventBridge --> Lambda

    Lambda --> SG
    Lambda --> Logs
    Lambda --> SNS
