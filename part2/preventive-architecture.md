# Preventive Security Architecture using SCPs

## Architecture Diagram

```mermaid
flowchart TB

    Dev[Developer / Engineer]

    Org[AWS Organizations]
    SCP[Service Control Policy (SCP)]

    CI[Approved CI/CD Pipeline]

    Account1[Prod Account]
    Account2[Dev Account]
    Account3[Shared Services Account]

    Dev --> Org
    Org --> SCP

    SCP --> AccountA
    SCP --> AccountB
    SCP --> AccountC

    Dev -->|Denied if non-compliant| AccountA
    Dev -->|Denied if non-compliant| AccountB

    CI -->|Approved changes| AccountA
    CI -->|Approved changes| AccountB
