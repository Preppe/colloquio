per inizializare il db con i dati di test eseguire il seguente comando:
cat dump.sql | docker exec -i <docker_container> psql -U colloquio -d colloquio