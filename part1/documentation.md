# AWS Hub-and-Spoke Network Architecture – Technical Documentation

## 1. Architecture Overview and Design Rationale

This architecture implements a **Hub-and-Spoke network topology** in AWS using a centralized **Transit Gateway (TGW)**. The design connects multiple VPCs, including Production, Development, and Shared Services, through a central hub while enforcing security via a dedicated **Inspection VPC**.

The Inspection VPC contains firewall capabilities (e.g., AWS Network Firewall) and acts as a centralized control point through which all traffic flows. This ensures consistent enforcement of security policies across environments.

### Design Rationale

- **Use of Transit Gateway:**  
  AWS Transit Gateway simplifies network management by providing a scalable hub for connecting multiple VPCs, avoiding the complexity of VPC peering.

- **Centralized Inspection Model:**  
  Routing traffic through a dedicated Inspection VPC ensures uniform security enforcement and improved visibility.

- **Environment Isolation:**  
  Separating Production, Development, and Shared Services into different VPCs reduces risk and improves governance.

---

## 2. Network Segmentation Strategy

The architecture enforces strict segmentation to improve security and reduce the blast radius of failures:

- **Production VPC (High Security Zone):**
  - Hosts critical workloads
  - Strict access control policies
  - No direct communication with Development VPC

- **Development VPC (Medium Security Zone):**
  - Used for testing and development
  - Limited access to Production resources

- **Shared Services VPC:**
  - Hosts centralized services such as logging, CI/CD pipelines, and directory services
  - Accessible by other VPCs through controlled routes

- **Inspection VPC (Security Zone):**
  - Central traffic inspection point
  - Enforces firewall rules and security policies

This segmentation ensures **least privilege access** and prevents unauthorized lateral movement.

---

## 3. Traffic Flow Patterns

### North-South Traffic (External ↔ Internal)

1. Traffic enters via the Internet Gateway (IGW) in the Inspection VPC  
2. It is routed through the firewall for inspection  
3. Approved traffic is forwarded to the Transit Gateway  
4. TGW routes traffic to the appropriate VPC  

### East-West Traffic (VPC ↔ VPC)

1. Traffic between VPCs is routed through the Transit Gateway  
2. Routing policies enforce forwarding to the Inspection VPC  
3. Traffic is inspected before reaching the destination  

This ensures all inter-VPC communication is **secure and controlled**.

---

## 4. Security Controls and Isolation Boundaries

Security is implemented using a layered approach:

- **Firewall (Inspection VPC):**
  - Performs deep packet inspection and filtering
  - Detects and blocks malicious traffic

- **Transit Gateway Route Tables:**
  - Control communication paths between VPCs

- **Security Groups:**
  - Instance-level access control

- **Network ACLs:**
  - Subnet-level filtering

- **IAM Policies:**
  - Restrict who can modify infrastructure
  - Enforce least privilege access

These layers create a **defense-in-depth security model**.

---

## 5. Scalability Considerations

- **Transit Gateway Scalability:**
  - Supports thousands of VPC attachments
  - Simplifies expansion of the network

- **Centralized Security:**
  - Reduces duplication of firewall infrastructure
  - Can scale using Gateway Load Balancer

- **Multi-Account Support:**
  - Easily integrates with AWS Organizations
  - Supports enterprise-scale environments

- **Future Growth:**
  - New VPCs can be added with minimal changes
  - Supports hybrid connectivity (VPN/Direct Connect)

---

## Conclusion

This architecture provides a scalable, secure, and maintainable network foundation by combining centralized connectivity with strong security controls. The use of Transit Gateway and an Inspection VPC ensures efficient traffic management and consistent policy enforcement across all environments.
