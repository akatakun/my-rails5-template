# my-rails5-template
## Preparation
### .envを設定
```
# required
DATABASE_DATABASE=
DATABASE_USERNAME=
DATABASE_PASSWORD=
DATABASE_HOST=
DATABASE_PORT=

# optional
TWITTER_APP_KEY=
TWITTER_SECRET=
STEAM_APP_KEY=
```

## Development
### without Docker
1. Change config/database.yml host and config/webpacker.yml host
2. Run command the following

```bash
make run
```

### with Docker
1. Run command the following
```bash
docker-compose up -d
```
