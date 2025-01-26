# Dockerfile
FROM ruby:3.1-slim

# Instalar dependências do sistema
RUN apt-get update && \
  apt-get install -y build-essential librdkafka-dev && \
  rm -rf /var/lib/apt/lists/*

# Definir diretório de trabalho
WORKDIR /app

# Copiar Gemfile
COPY Gemfile Gemfile.lock ./

# Instalar dependências do Ruby
RUN bundle install

# Copiar código fonte
COPY . .

# Comando padrão
CMD ["ruby", "performance_producer.rb"]