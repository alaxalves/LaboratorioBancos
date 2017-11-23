### Executing my scripts

```
docker-compose build && docker-compose up -d &&  docker exec redis-hollywood bash -lc "cat <MYSCRIPT>.txt | redis-cli"
```
