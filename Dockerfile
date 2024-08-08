# Usa a imagem oficial do migrate
FROM migrate/migrate

# Define o diretório de trabalho
WORKDIR /migrations



# Define o comando padrão para executar o migrate
ENTRYPOINT ["migrate"]
