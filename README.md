# nginx-api-gateway
Project that shows how to configure nginx as an API Gateway. Our demo project is a book store. The book store API is implemented as a collection of services.  We have two different services to serve the online store: catalog and stores. These  are implemented as separate services builded with diffent tech stacks. We use Python to build the catalog api (FastAPI) and Go to build the stores API (Gin). Our API Gateway publish them as a single API and also provides https and authentication to them.


## Architecture
![Alt text](images/bookstoreapigateway.png?raw=true "Architecture")


## Usage

### 1. Prerequisites:

Install [Docker](https://docs.docker.com/get-docker/).

### 2. Clone this repo:
```
$ git clone git@github.com:galvarado/nginx-api-gateway.git
```
### 3. Start the environment

For a full explanation please read the post at: https://github.com/galvarado/nginx-api-gateway

After completing the tutorial, you will have 3 containers deployed with docker and an API that responds to requests protected with HTTPS using an SSL certificate and also authentication based on API Key.
 
#### TLDR;

If you do not want to follow the tutorial, you can just get up and running the containers using the run.sh script as follows:
 
```
$ chmod a+x run.sh
$ ./run,sh
```

Your are going to have the following containers running:

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                          NAMES
138f2bc9dd9e        api-gateway         "/docker-entrypoint.…"   20 hours ago        Up 20 hours         80/tcp, 0.0.0.0:443->443/tcp   api-gateway
47e0f635f225        gin-stores          "/main"                  20 hours ago        Up 20 hours                                        gin-stores
67abe4427dc1        fastapi-catalog     "/start.sh"              20 hours ago        Up 20 hours         80/tcp                         fastapi-catalog
```

You can test the API with curl:

```
$ curl -ik --header "apikey:/ZkKxb0WYcqS8DRgn+e0aw==" --request GET  https://bookstore.io/api/bookstore/catalog/books
```
*Note: please add bookstore.io to your /etc/hosts file to resolve the domain in your local environment.

You will receive as response:

```
HTTP/1.1 200 OK
Server: nginx/1.19.6
Date: Fri, 07 Jan 2022 15:55:59 GMT
Content-Type: application/json
Content-Length: 185
Connection: keep-alive

[{"id":1,"name":"Pedro Páramo","author":"Juan Rulfo"},{"id":2,"name":"El Laberinto de la Soledad","author":"Octavio Paz"},{"id":3,"name":"La casa junto al rio","author":"Elena Garro"}] 

```
