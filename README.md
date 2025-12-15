# GOBLIN

**"GOBLIN"** stands for **"General Orchestration Backend for Lazy Interactive Nerds"**. 😈

**"GOBLIN"** is a clean, wrapped backend framework designed as a **starter foundation for secondary development**: you
don’t start from a blank folder—you start from a backend that already behaves like a “real product backend” should.

It focuses on giving you the boring-but-critical stuff up front:

- **A sane project layout** (modules/layers, clear package boundaries, consistent naming)
- **Unified API conventions** (standard response shape, pagination, error codes, DTO/VO separation)
- **Production-friendly plumbing** (config profiles, logging strategy, exception handling, validation)
- **Security scaffolding** (authentication + authorization hooks, permission boundaries, request context)
- **Engineering defaults** (coding standards, dependency management, extensibility points)

The goal is simple: **ship features faster** because the base already handles the “backend hygiene” work you’d otherwise
rebuild every time.

---

## Backend Tech Stack (Typical / Recommended)

### Core

- **Java** (commonly Java 8/11/17)
- **Spring Boot** (Web / MVC)
- **Maven**

### Security

- **Spring Security**
- **JWT**
- **RBAC / Permission model** (roles + permissions)

### Data Layer

- **MySQL**
- **MyBatis / MyBatis-Plus**
- **Flyway / Liquibase**

### Cache & Messaging (Optional)

- **Redis** (cache, rate limit, session, distributed lock)
- **MQ** (RabbitMQ / Kafka, if your orchestration needs events)

### Observability & Ops

- **SLF4J + Logback** (logging)
- **Actuator + Micrometer** (metrics/health checks, optional)
- **Docker** (deployment, optional)

### API & Tooling

- **OpenAPI/Swagger** (API docs)
- **Hibernate Validator** (request validation)
- **Jackson** (JSON serialization)
- **Lombok** (optional, reduce boilerplate)

### Testing

- **JUnit 5**
- **Mockito**
- **Spring Boot Test**
