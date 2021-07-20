@ECHO OFF
IF EXIST "./app" (
    ECHO Iniciando Container
    docker-compose up -d
    pause
    exit
) ELSE (
    COPY ../.env .
    ECHO Criando Build
    cd builder
    docker-compose --env-file ../.env up
    docker-compose down
    cd ..
    docker-compose up
)
pause