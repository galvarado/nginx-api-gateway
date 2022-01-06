echo "***** Starting development environment *****"
date
echo "[1] Create docker network (bookstore-network)"
docker network create -d bridge bookstore-network

# Start FastAPI Catalog
echo "[2] Create FastAPI Catalog"
docker stop fastapi-catalog
docker rm fastapi-catalog
docker build -t api-gateway catalog/
docker run -d --name  fastapi-catalog --net=bookstore-network  fastapi-catalog

# Start Gin  Stores
echo "[3] Create Gin Stores"
docker stop gin-stores
docker rm gin-stores
docker build -t gin-stores stores/
docker run -d --name  gin-stores --net=bookstore-network  gin-stores


# Start API Gateway 
echo "[4] Create API Gateway"
docker stop api-gateway
docker rm api-gateway
docker build -t api-gateway gateway/
docker run -d --name api-gateway --net=bookstore-network  -p 443:443 api-gateway


echo "The following containers are running..."

docker ps


# Testing...
echo "[5] Testing API Gateway (Must get a 200 OK HTTTP Response)"
curl -ik --header "apikey:/ZkKxb0WYcqS8DRgn+e0aw==" --request GET  https://bookstore.io/api/bookstore/catalog/books

