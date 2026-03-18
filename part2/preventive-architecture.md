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
