# Тестовое задание Senior DevOps

Состав стенда:
- `nginx` на `:443` с TLS termination
- `backend` на `:8080`
- `postgres:15`
- `redis:7`

Реализовано:
- `X-Forwarded-For`, `X-Forwarded-Proto`, `X-Forwarded-Host`
- `rate limiting` `10 req/s` на IP
- `client_max_body_size 10m`
- `healthcheck` для всех сервисов
- переменные вынесены в `.env`
- сертификат генерируется через `gen-certs.sh`

## Запуск

```bash
cd senior-devops-test
chmod +x gen-certs.sh
./gen-certs.sh
docker compose up -d
curl -k https://localhost/
```

## Проверка

Проверка backend через Nginx:

```bash
curl -k -i https://localhost/
```

Проверка health endpoint:

```bash
curl -k -i https://localhost/healthz
```

Проверка заголовков проксирования:
- backend получает `Host`
- backend получает `X-Real-IP`
- backend получает `X-Forwarded-For`
- backend получает `X-Forwarded-Proto=https`
- backend получает `X-Forwarded-Host`
