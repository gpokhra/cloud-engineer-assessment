# AWS Hub-and-Spoke Network Architecture

This diagram represents a centralized AWS network using a Transit Gateway with an Inspection VPC enforcing security controls across multiple environments.

## Architecture Diagram

```mermaid
flowchart TB

    Internet((Internet))

    TGW[Transit Gateway]

    subgraph Inspection_VPC ["Inspection VPC (Security Zone)"]
        IGW[Internet Gateway]
        FW[Firewall]
    end

    subgraph Prod_VPC ["Production VPC"]
        Prod[App Servers]
    end

    subgraph Dev_VPC ["Development VPC"]
        Dev[Dev Servers]
    end

    subgraph Shared_VPC ["Shared Services VPC"]
        Shared[CI/CD, Logs]
    end

    Internet --> IGW --> FW --> TGW

    TGW --> Prod
    TGW --> Dev
    TGW --> Shared

    Prod --> TGW
    Dev --> TGW
    Shared --> TGW

    Prod -.-> FW
    Dev -.-> FW
    Shared -.-> FW
