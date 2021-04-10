<img src="./images/LogoVinDrLab.png" width="256"/>

# VinDr Lab Deployment

Welcome to the VinDr Lab project.

# :wrench: System Properties

Our project requires at least 4GB of RAM system for the best performance and experiement.

# :rocket: Start it up

There are two ways to deploy our project are:

**Option 1: Kubernetes**

**Option 2: Docker**

and the instruction is going to be described below. But we think using Kubernetes will be more interesting.

# :ship: Kubernetes

## Prerequisites

We use k3s as Kubernetes supporter. Install the <a href="https://k3s.io/">k3s</a> at first.

## Run

- First, you must initialize the namespace for these deployments by running: `kubectl create namespace vinlab`

- Then, go in to the `kubernetes` folder and create the config map: `sh ./create_config_map.sh`

- Next step, just run `kubectl apply -f . -n vinlab`

- As you can see, in the first commits, we use `ingress-nginx` to load-balance and route endpoints. However, we found out that was inconvenient. So remove it and try another simple solution, a load-balancer service.

# :whale2: Docker

## Prerequisites

To deploy using Docker, yes, install `docker` and `docker-compose` first

## Run

We've already made it as simple as we can. Just go to the docker directory then run: `./run.sh` file and double check by `docker ps`

# :paperclip: Relevants

## Keycloak

We use Keycloak as an user management system (users, roles, permissions...), please follow [this link](KEYCLOAK.md) to complete the installation.

## MinIO

MinIO is being used to store some other things from the API. There is a small setup to do. After launching the whole system, please visit [MinIO url](http://localhost:8080/minio), then login with the keys we provided, feel free to change it to whatever you want but remember that.

# :link: Endpoints

| Name      | Endpoint                              |
| --------- | ------------------------------------- |
| Main      | `http://localhost:8080`               |
| Dashboard | `http://localhost:8080/dashboard`     |
| Backend   | `http://localhost:8080/api`           |
| Orthanc   | `http://localhost:8080/dicomweb`      |
| Keycloak  | `http://localhost:8080/auth`          |
| ES        | `http://localhost:8080/elasticsearch` |
| MinIO     | `http://localhost:8080/minio`         |

# :pencil2: Note

1. Before using the system, please remember to setup the Keycloak first by [the doc](KEYCLOAK.md) !

2. As you can see, from the start, you will start at the `http://localhost:8080` endpoint. Normally, the nginx will redirect to `http://localhost:8080/dashboard`. However, the Dashboard endpoint will check what is your current session and permissions, if it is not permitted or not available. The site will redirect to login page of Keycloak. There is one more thing to notice here, when the Dashboard redirect to Keycloak login screen, if you see the error page of Keycloak, please go to the Keycloak enpoint to set it up

3. When you enter the Main site, you may see the 502 Error from Nginx. But do not worry, the system needs a bit of time to warm up and it will ready in some minutes.

---

:cookie: Have fun!
