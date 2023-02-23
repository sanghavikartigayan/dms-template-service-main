# dms-template-service

Reference project for microservices using Java. Please read this guide carefully to understand dependencies and development environment setup.

# Quality Gateway

(to be updated after following Getting Started steps)

[![Quality Gate Status](https://sonarqube.non-prod-pen-gcp.omers.com/api/project_badges/measure?project=com.omers%3Amarriage-breakdown-service&metric=alert_status)](https://sonarqube.non-prod-pen-gcp.omers.com/dashboard?id=com.omers%3Amarriage-breakdown-service)
[![Coverage](https://sonarqube.non-prod-pen-gcp.omers.com/api/project_badges/measure?project=com.omers%3Amarriage-breakdown-service&metric=coverage)](https://sonarqube.non-prod-pen-gcp.omers.com/dashboard?id=com.omers%3Amarriage-breakdown-service)
[![Code Smells](https://sonarqube.non-prod-pen-gcp.omers.com/api/project_badges/measure?project=com.omers%3Amarriage-breakdown-service&metric=code_smells)](https://sonarqube.non-prod-pen-gcp.omers.com/dashboard?id=com.omers%3Amarriage-breakdown-service)
[![Bugs](https://sonarqube.non-prod-pen-gcp.omers.com/api/project_badges/measure?project=com.omers%3Amarriage-breakdown-service&metric=bugs)](https://sonarqube.non-prod-pen-gcp.omers.com/dashboard?id=com.omers%3Amarriage-breakdown-service)
[![Maintainability Rating](https://sonarqube.non-prod-pen-gcp.omers.com/api/project_badges/measure?project=com.omers%3Amarriage-breakdown-service&metric=sqale_rating)](https://sonarqube.non-prod-pen-gcp.omers.com/dashboard?id=com.omers%3Amarriage-breakdown-service)
[![Reliability Rating](https://sonarqube.non-prod-pen-gcp.omers.com/api/project_badges/measure?project=com.omers%3Amarriage-breakdown-service&metric=reliability_rating)](https://sonarqube.non-prod-pen-gcp.omers.com/dashboard?id=com.omers%3Amarriage-breakdown-service)
[![Security Rating](https://sonarqube.non-prod-pen-gcp.omers.com/api/project_badges/measure?project=com.omers%3Amarriage-breakdown-service&metric=security_rating)](https://sonarqube.non-prod-pen-gcp.omers.com/dashboard?id=com.omers%3Amarriage-breakdown-service)
[![Technical Debt](https://sonarqube.non-prod-pen-gcp.omers.com/api/project_badges/measure?project=com.omers%3Amarriage-breakdown-service&metric=sqale_index)](https://sonarqube.non-prod-pen-gcp.omers.com/dashboard?id=com.omers%3Amarriage-breakdown-service)

## Quickstart

- use `docker-compose -f src/main/docker/kafka.yml up` to start up apache kafka along with zookeeper and confluent control center
- use `docker-compose -f src/main/docker/postgresql.yml up` to start up postgres server
- use `./gradlew bootRun --args='--spring.profiles.active=local'` to start the application
- you can now interact with the `http://localhost:9244/v1/journeys` endpoint
- API Documentation can be found at `http://localhost:9244/swagger-ui/`
- See the attached `postman` directory containing calls with auth token embedded

## Prerequisites

### PGAdmin

- For accessing PostgreSQL database, optionally install pgAdmin [here](https://www.pgadmin.org/download/)

### JDK

#### Manual installation:

- Download OpenJDK 11 for Mac OSX from http://jdk.java.net/
- Unarchive the OpenJDK tar, and place the resulting folder (i.e. jdk-11.jdk) into your /Library/Java/JavaVirtualMachines/ folder since this is the standard and expected location of JDK installs.

#### homebrew installation:

- `brew update`
- `brew tap homebrew/cask-versions`
- `brew search java`
- `brew cask install java11`

After the JDK installation, import existing project in IntelliJ.
For further troubleshooting, ensure project settings (`file -> project structure -> SDKs`) is set to the OpenJDK 11.
`IntelliJ -> preferences -> build, execution, deployment -> gradle -> gradle JVM` should be set to JVM 11 as well.

### Lombok

Java is a great language but it sometimes gets too verbose.
[Project Lombok](https://projectlombok.org/) is a Java library tool that is used to minimize boilerplate code.

#### Enabling Annotation Processing

Lombok uses annotation processing through APT, so, when the compiler calls it, the library generates new source files based on annotations in the originals.

Annotation processing isn't enabled by default, though.

So, the first thing for us to do is to enable annotation processing in our project.

We need to go to the `Preferences | Build, Execution, Deployment | Compiler | Annotation Processors` and make sure of the following:

- Enable annotation processing box is checked
- Obtain processors from project classpath option is selected

#### Installing the IDE Plugin

As Lombok generates code only during compilation, the IDE highlights errors in raw source code.
There is a dedicated plugin which makes IntelliJ aware of the source code to be generated.

We need to go to the `Preferences | Plugins`, open the `Marketplace` tab, type `lombok` and search for `Lombok Plugin`.

Click on `Install plugin` and `Restart IDE` after installation.

It is recommended that to install SonarLint plugin from SonarSource.
https://plugins.jetbrains.com/plugin/7973-sonarlint
- Once installed you'll have SonarLint enabled by default. The analysis is triggered on the fly while coding or manually by actions,
which can be directly accessed with key bindings, editor popup menu or in the SonarLint console. Look for it in the bottom tabs.

## Getting Started

- Fork this project from Gitlab interface
- Change Gitlab settings (Settings -> General -> Advanced) and update the path from `java-microservice-starter` to another name. Also update the `project name` under Settings
- Update `CODEOWNERS` file to include your team members' Gitlab IDs
- Update `gradle.properties` to use the correct project name in `rootProject.name` property
- Update `rootProject.name` in `settings.gradle` as well as `include` if you're including the domain model package
- Note: This application publishes 2 Maven (JAR) packages. One of them is the domain model (`marriage-breakdown-model`) intended to publish a simple domain model (list of POJOs/classes) of this microservice to any interested client. The other package is the auto generated REST API client. If you don't need these, you can delete `marriage-breakdown-model` from the project directory, and remove the `createServiceClientJarPackage`, `compileJavaServiceClient`, `openApiGenerate` commands from `build.gradle`
- Update `src/main/docker/app.yml` and `src/main/docker/postgresql.yml` files to rename `java-microservice-starter` to your application name
- Create a namespace in GCP for your project (assuming you have `gcloud` installed and authenticated with your OMERS account)
  - `gcloud config set project om-pension-dev`
  - `gcloud container clusters get-credentials om-myomersdev-k8s --zone northamerica-northeast1`
  - `kubectl create ns YOUR_NAMESPACE`. Follow the namespace convention: `om-xxx-xxx` as in `om-donna-dev`. Do use environment names (e.g. `om-myawesomeproject-dev`) in your namespace, as namespaces are used to differentiate between environments.
- Go through the following files and update relevant properties
  - `infra/helm/Chart.yaml`: update your application name
  - `infra/helm/*values.yaml`: for all values files, update Kafka host, CloudSQL IP address, username, password
- To use secrets (such as database passwords, connection strings), you can use the sample `dev-secrets.yml` file under `infra`
  - Ensure `metadata.name` is updated with your project name
  - Add the secrets in a valid yaml format
  - Ensure your secret values are base64 encoded strings. Plain text will not work
  - Apply your dev secrets with: `kubectl apply -f infra/dev-secrets.yml`
  - Ensure that it is registered with `kubectl get secret (your secret name)`
  - At the very least you need secrets for `DB_PWD` and `DB_PWD_RW` which are the passwords for readonly and readwrite CloudSQL user accounts
  - For more info please see this [link](https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/)

- Go to `application.yaml` and update:
  - `spring.application.name`
  - `spring.datasource.url` (change the default schema)
  - `jpa.properties.hibernate.default.default_schema`
  - `liquibase.defaultSchema` and `liquibaseSchema`
  - `server.port` - Keep it as `8080` in `application.yaml` as it needs to run on port 8080 on GCP. This shoudl be set to a unique port when running locally. In `application-local.yaml`, set it to 9XXX where XXX is a unique number in Donna (try the ascii combination for the first 3 letters, e.g. for marriage breakdown, MAR=77+65+82=244, so 9244)
- If you are using `omers-sourced` (CQRS library), update `cloud.function.definition` as well as `stream.bindings` with the comands/events/projection handlers. See the application code for Marriage Breakdown Create and Save commands and events and projection handlers

- There's a `.gitlab-ci.yml` file that is ready to use. There's a change needed to make it work:
  - Update `variables` to use correct namespaces
  - After going through the above steps (specifically, `build.gradle`, `settings.gradle`, `gradle.properties` and updating `infra/helm/Chart.yaml` and other `*values.yaml` files and updating application name and namespaces), you can uncomment the stages under `.gitlab-ci.yml` (currently commented out)
  - If for some reason your deployment fails, you might need to do `helm delete --purge DEPLOYMENT_NAME` where DEPLOYMENT_NAME is your release (it should be projectname-dev as in java-starter-dev)

- Optionally, update the banner under `resources` directory to use your project name by using the [figlet generator](https://devops.datenkollektiv.de/banner.txt/index.html)

- Before next step, commit your changes as the next step is destructive!

- Once you have examined the sample source code, you can run `./gradlew deleteSampleCode` which will delete all Marriage Breakdown related code and tests from this application (leaving helm configuration, OpenAPI and Spring Security configuration). You will still have to rename the package `com.omers.marriagebreakdown` as well as the application name `MarriageBreakdownApplication`, but you can now add your own code to the application

- Push your changes to the remote branch to start the pipeline on Gitlab

- Once the application is scanned through Sonar, you can update the `Quality Gateway` section of this document and use your project badges

- This README can be modified to describe the setup for your specific microservice once the steps here are completed.

## Build operations

- Use `./gradlew assemble` to build the application (no tests)
- Use `./gradlew build` to build the application (and test)
- Use `./gradlew build -x test` to skip tests and build
- Use `./gradlew bootRun` to run the Spring Boot application
- Use `./gradlew lint` to see gradle lint issues
- Use `./gradlew fixGradleLint` to fix gradle lint issues
- Use `./gradlew test` to run unit tests
- Use `./gradlew e2eTest` to run end to end tests
- Use `./gradlew testCoverage` to run combined (unit/end to end) test coverage report (available under `build/reports/test/html/index.html`)
- Use `./gradlew clean` to clean output directory
- Use `./gradlew deleteSampleCode` to delete the sample Marriage Breakdown code in this repository
- Use `./gradlew createServiceClientJarPackage` to create an auto generated REST service client for this microservice (requires OpenAPI (Swagger) to be up and running on address defined in build.gradle - or replace with OpenAPI json file)

## Kafka

### Kafka in GCP

- In GCP DEV environment, Kafka (currently, as of writing) does not require authentication. Just specify broker connection string and schema registry

## Running the application in Docker

- Build the application image with `docker build -t java-microservice-starter:0.0.1-SNAPSHOT .` (change `java-microservice-starter` to the service name you are using in `/src/main/docker/app.yml` under `services`)
- Then use docker compose to bring up kafka, zookeeper and the application by running `docker-compose -f src/main/docker/app.yml up`
- Access the confluent kafka control center at http://localhost:9021/clusters

## PostgreSQL

- This application uses PostgreSQL as database backend
- Contact your team's DBA to have a CloudSQL created
- The connection string will need to be applied to `*values.yaml` under `infra/helm`. The password will need to be added as a kubernetes secret
- Request a readonly as well as a readwrite account from the DBA. This application uses `liquibase` to handle database schema evolution. `liquibase` will need a user account with read/write access

## API Documentation

- OpenAPI definition can be found at `http://localhost:9244/swagger-ui.html`
- The definition is updated dynamically as you add more controllers

## Running the application

### Profiles

- Available profiles:
  - dev: use in GCP-DEV environment
  - local: use when running locally
  - sit: use in GCP-SIT environment
  - test: use for unit/integration tests
  - e2eTest: use for end to end tests
  - chaos-monkey: use to enable `chaos-monkey`, which brings production level chaos to your microservice so you can test it under real conditions. See https://codecentric.github.io/chaos-monkey-spring-boot/
  
### Local environment

- The application needs kafka and postgresql to be up and running while developing locally
- use `docker-compose -f src/main/docker/kafka.yml up` to start up apache kafka along with zookeeper and confluent control center
- use `docker-compose -f src/main/docker/postgresql.yml up` to start up postgres server
- use `./gradlew bootRun --args='--spring.profiles.active=local'`
- Access your kafka cluster at http://localhost:9021/clusters
- If you have conflicting images that need to be removed in docker, use `docker rm -f $(docker ps -aq)` when troubleshooting

### Dev profile

- To run the application in dev profile (i.e. with cloud configuration), use the `dev` profile as in `./gradlew bootRun --args='--spring.profiles.active=dev'`
- If you want to run the application in dev profile and connect to a PostgreSQL instance or Confluent Kafka cluster, you have to set these environment properties
- export KAFKA_SCHEMA_REGISTRY_HOST=
- export KAFKA_HOST=
- export DB_HOST=
- export DB_NAME=
- export DB_USER=
- export DB_PWD=
- If you want to use the `dev` profile locally with IntelliJ, simply edit your Run Configuration and update `Environment Variables` section with the above details. Then, you can connect to a PostgreSQL database or Kafka instance running outside your local environment.


## Tests

- Your unit tests must end with `Test` as in `MyTest.java` whereas your end to end tests must end with `E2E` as in `MarriageBreakdownControllerE2E.java`
- To test the springboot app use `./gradlew test` (for unit tests) or `./gradlew e2eTest` (for end to end tests)
- To check code coverage use `./gradlew testCoverage`
- To see coverage report use `open build/reports/jacoco/test/html/index.html`
- There's an End to End Test example `MarriageBreakdownControllerE2E` that spins up Kafka and PostgreSQL - using Testcontainers
- To create a new E2E, simply extend `BaseE2E` class that spins up Kafka and PostgreSQL

### Chaos Monkey

Chaos Monkey is a library for Spring Boot that when enabled will perform various types of attack on the running Spring Boot application.  The library works by scanning for the annotations `@Controller, @RestController, @Service, @Repository, @Component` and uses AOP to intercept calls to methods of the class and mount "assaults". The types of assaults that can be thrown at the application include Latency Assault, Exception Assault, AppKiller Assault and Memory Assault. Please consult the sample `application-chaos-monkey.yaml` property file which configures Latency and Exception assaults on the REST controller and repository layers.

- The functionality can be enabled by including the `chaos-monkey` profile as part of the active Spring profiles
- The configuration also exposes the Chaos Monkey Spring Actuator endpoints (accessible via http://localhost:9244/actuator/chaosmonkey/..) which can be used to retrieve and set configuration settings in real time and also pull the library specific metrics. A list of available metrics can be retrieved using the http://localhost:9244/actuator/metrics endpoint (metrics will have a chaos.monkey prefix). Please note that these will only be returned once the application has been excercised.

Consult the Chaos Monkey documentation for a complete guide: https://codecentric.github.io/chaos-monkey-spring-boot/#releases

## CORS

To enable CORS add `cors.enabled` to application-[profile].yaml, `origin` can be set too (allows all domains if not set).

```yaml
cors:
  enabled: true
  origin: http://localhost:5000
```
For more fine-tuned control (e.g. enable CORS only for specific endpoints), make changes to `WebConfiguration`.
Also, see [Spring CORS docs](https://spring.io/guides/gs/rest-service-cors/#global-cors-configuration).

## Database change management

Liquibase is added to this project for evolution of database design. To get started:

- First time use: run `./gradlew liquibaseGenerateChangeLog` to create the initial changelog (already done). If you want to regenerate the initial changelog file against an existing database, you can execute this command
- Subsequent uses: Add your changelog to `src/main/resources/db` folder (e.g. `0002-my-important-change.sql`). Ensure you add the version at the beginning of the filename. Then, include that file in `main-changelog.groovy` such as:
- On startup, Spring will execute all liquibase changes. Note, to turn off this behavior (e.g. in production), update `spring.liquibase.enabled` to `false`
- See [this](https://github.com/spring-projects/spring-boot/blob/v2.3.0.RELEASE/spring-boot-project/spring-boot-autoconfigure/src/main/java/org/springframework/boot/autoconfigure/liquibase/LiquibaseProperties.java) link for available Spring liquibase properties. These are set in `application.yaml` and in specific profiles respectively

```groovy
changeSet(id: '''0002''', author: '''bbilgin''') {
        sqlFile(path: '0002-my-important-change.sql', relativeToChangelogFile: true)
    }
```

- To run a change in GCP only (e.g. in dev profile), add dev context: (this is captured in `spring.liquibase.contexts property`)

```groovy
    changeSet(id: '''0002''', author: '''bbilgin''', context: 'gcp') {
        sqlFile(path: '0001-grant-access.sql', relativeToChangelogFile: true)
    }
```

There's a `test` context available, if you need to populate data or schema with a change specific for tests.

Additionally, you can pass these options to `sqlFile` command:

`stripComments: true, splitStatements: true, endDelimiter: ";", encoding: "utf8"`

Further reading:
 
- Spring with Liquibase: https://docs.spring.io/spring-boot/docs/current/reference/html/howto.html#howto-execute-liquibase-database-migrations-on-startup
- Liquibase groovy plugin: https://github.com/tlberglund/groovy-liquibase

## Postman

- For applications exposing REST endpoints, please create a postman file with all applicable endpoint calls, and export it into `postman` directory. This directory is excluded from the source sets.

## Sonar

- Once enabled (and if configured properly, through `build.gradle`), the Sonar step in `.gitlab-ci.yml` will scan your application code through Sonar
- Sonar can be accessed at https://sonarqube.non-prod-pen-gcp.omers.com/projects
- IntelliJ has a Sonar plugin, which allows you to scan your code for smells, bugs, vulnerabilities before committing. It is required that you install this plugin and scan your code before committing your changes. See the developer onboarding guide for setup details.