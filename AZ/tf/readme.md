# Resilient Kube

The intent of this project to establish an opinionated framework of PaaS based Kubernetes platform across multipe public clouds which will provide DR (Disaster Recovery) and/or HA (High Availability) capabilities as a framework.

## Motivation
Over last few years, in cloud workload migrations, the trend has been to adopt Kubernetes than IaaS or PaaS workloads. 
Why - mainly 2 reasons:
1. IaaS costs - It's a no brainer most box to box migrations , while simply migration, can run billing into thousands. Hence PaaS or Containerization makes absolute sense.
Level of portability (not having to lock in for PaaS)
2. While public managed clouds like Azure, AWS and GCP do offer high levels of SLAs and uptime, few outages , either regional or occassionally global with each of these clouds has left level of concern about lock into one particular vendor. Therefore , moving away from PaaS, and use portable containerization orchstration platform, makes more sense. 
What better platform than Kubernetes?

## General Architecture
<a href="https://github.com/vjavle/resilientkube/blob/master/AZ/tf/resilientkube.svg">
    <img src="https://github.com/vjavle/resilientkube/blob/master/AZ/tf/resilientkube.svg" width="100%" height="144">
</a>

## Initial Scope
Initial scope will start with single cloud (Azure), multi region DR/HA implementation.

## Technical Goals
* Use as many as PaaS services as possible in as much as cross cloud compatible way
* Provide choice of Cloud provider and Region selection during implementation
* Provide unified CD pipeline regardless of Cloud Provider or Service

## Expected Challenges/Considerations
* Kuberbetes PaaS differences
    * RBAC implementation
    * DNS Implementation
    * CNI Availability
    * Deployment Security Implementation
* Other PaaS Service differences
    * SQL Persistance
    * Non SQL Persistance
    * In-memory caching
    * Global Load Balancing
* Variable Availability of Services across regions

## Eventual Scope

## Technologies Used

* [Terraform](https://www.terraform.io/) - IaC Provider
* [CloudFlare](https://maven.apache.org/) - Global Load Balancing

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.


## Authors

* **Vasant Javle** - *Initial work* - [resilientkube](https://github.com/vjavle/resilientkube)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details