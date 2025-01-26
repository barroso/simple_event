# Docker commands
docker-compose --version

docker-compose up --build

docker-compose run consumer
docker-compose run producer

# Ver logs dos serviços
docker-compose logs

# Listar containers
docker-compose ps

# Parar serviços
docker-compose down
docker-compose down && docker-compose up --build

# Criar tópico
docker-compose exec kafka kafka-topics --create --topic user_events --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1

# Listar tópicos
docker-compose exec kafka kafka-topics --list --bootstrap-server kafka:9092

# Descrever tópico
docker-compose exec kafka kafka-topics --describe --topic user_events --bootstrap-server kafka:9092

# remove orphans
docker-compose down --remove-orphans
docker-compose up --build

# limpar completamente
docker system prune -af

## Resumo dos comandos

# Criar e iniciar container
docker run [imagem]

# Listar containers ativos
docker ps

# Listar todos containers
docker ps -a

# Parar container
docker stop [container_id]

# Parar todos containers
docker stop $(docker ps -q)

# Remover container
docker rm [container_id]

# Remover todos containers parados
docker container prune

# Baixar imagem
docker pull [imagem]

# Listar imagens locais
docker images

# Remover imagem
docker rmi [imagem_id]

# Subir serviços
docker-compose up

# Subir em background
docker-compose up -d

# Parar serviços
docker-compose down

# Ver logs
docker-compose logs

# Listar serviços
docker-compose ps

# Consumo de recursos
docker stats

# Ver logs de um container
docker logs [container_id]

# Acessar container rodando
docker exec -it [container_id] /bin/bash
