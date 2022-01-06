# nginx-api-gateway
Project that shows how to configure nginx as an API Gateway. Our demo project is a book store. The book store API is implemented as a collection of services.  We have two different services to serve the online store: catalog and stores. These  are implemented as separate services builded with diffent tech stacks. We use Python to build the catalog api (FastAPI) and Go to build the stores API (Gin). Our API Gateway publish them as a single API and also provides https and authentication to them.


## Architecture
![Alt text](images/bookstoreapigateway.png?raw=true "Architecture")


## How to start it

Just run the run.sh script to start the environment. To a full explanation please go to: https://galvarado.com.mx/post/desplegar-un-api-gateway-con-nginx/ 