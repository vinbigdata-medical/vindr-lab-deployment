<img src="./images/LogoVinDrLab.png" width="256"/>

# VinDr Lab Deployment

Welcome to the VinDr Lab project.

# :rocket: Start it up

There are two ways to deploy our project are:

**Option 1: Kubernetes**

**Option 2: Docker (Coming soon)**

and the instruction is going to be described below. But we think using Kubernetes will be more interesting.

# :ship: Kubernetes

## Prerequisites

We use k3s as Kubernetes supporter. Install the <a href="https://k3s.io/">k3s</a> at first.

## Run

- First, you must initialize the namespace for these deployments by running: `kubectl create namespace vinlab`

- Then, go in to the kubernetes folder, and create the config map: `sh ./create_config_map.sh`

- Next step, just run `kubectl apply -f . -n vinlab`

- As you can see, in the first commits, we use `ingress-nginx` to load-balance and route endpoints. However, we found out that was inconvenient. So remove it and try another simple solution, a load-balancer service.

# :whale2: Docker

## Prerequisites

To deploy using Docker, yes, install docker first

## Run

We've already made it as simple as we can. Just go to the docker directory then run: `sh ./run.sh` and double check by `docker ps`

# :paperclip: Relevants

## Keycloak

We use Keycloak as an user management system (users, roles, permissions...), please follow [this link](KEYCLOAK.md) to complete the installation.

## MinIO

MinIO is being used to store some other things from the API. There is a small setup to do. After launching the whole system, please visit [MinIO url](http://localhost:8080/minio), then login with the keys we provided, feel free to change it to whatever you want but remember that.

# :link: Endpoints

| Name     | Endpoint                              |
| -------- | ------------------------------------- |
| Main     | `http://localhost:8080`               |
| Backend  | `http://localhost:8080/api`           |
| Orthanc  | `http://localhost:8080/dicomweb`      |
| Keycloak | `http://localhost:8080/auth`          |
| ES       | `http://localhost:8080/elasticsearch` |
| MinIO    | `http://localhost:8080/minio`         |

---

:cookie: Have fun!
