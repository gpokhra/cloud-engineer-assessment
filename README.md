# Cloud Engineer Take-Home Assessment – [Your Name]

## Overview

This repository contains my submission for the Cloud Engineer Take-Home Assessment. The solution demonstrates my approach to designing scalable AWS infrastructure, implementing security automation, and leveraging AI tools to improve productivity and accuracy.

The assessment is divided into three parts:
- Part 1: Network Architecture Design and Analysis
- Part 2: Security Automation and Guardrails
- Part 3: Client-Facing Technical Proposal

---


---

## Part 1: Architecture Design

Designed a scalable AWS Hub-and-Spoke network architecture using Transit Gateway with centralized inspection.

### Highlights:
- Central Transit Gateway connecting multiple VPCs
- Dedicated Inspection VPC for traffic filtering
- Segmentation across Production, Development, and Shared Services
- Secure east-west and north-south traffic flow

Includes:
- Mermaid diagram
- Technical documentation
- AI critique and personal analysis

---

## Part 2: Security Automation

Implemented reactive and preventive mechanisms to handle security group drift.

### Reactive Remediation:
- Event-driven architecture using EventBridge and Lambda
- Automatic detection and rollback of non-compliant security group rules
- Logging via CloudWatch and alerting via SNS

### Preventive Controls:
- Service Control Policies (SCPs) to block insecure configurations
- Centralized governance using AWS Organizations
- CI/CD-based approval workflow

Includes:
- Architecture diagrams
- Terraform implementation
- Strategy and explanation

---

## Part 3: IAM Modernization Proposal

Proposed migration from IAM users to AWS IAM Identity Center to improve security and support SOC 2 compliance.

### Key Benefits:
- Eliminates long-lived credentials
- Centralized access management
- Improved auditability
- Scalable for multi-account environments

---

## AI Usage and Prompting Strategy

I used AI tools to:
- Generate initial architecture designs
- Refine technical documentation
- Identify gaps and improve solutions

All prompts and iterations are included in the `ai-transcript/` directory.

---

## How to View Diagrams

All diagrams are written in Mermaid format and can be viewed:
- Directly on GitHub
- Using https://mermaid.live

---

## Assumptions

- Multi-account AWS environment using AWS Organizations
- Terraform used for infrastructure as code
- Centralized security and governance model

---

## Conclusion

This solution demonstrates a scalable, secure, and practical approach to cloud infrastructure design and security automation, aligned with real-world engineering practices.

