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

## Production
### Init Database
```mysql
use mysql;
create user 'your_name'@'%' identified by 'your_password';
grant all privileges on `db_name`.* to 'your_name'@'%';
```

```bash
RAILS_ENV=production bundle exec rails db:create db:migrate
```

### Deploy
```bash
cp #{ssh_key} ./etc/ssh/my-rails5-template.pem
```

Change 'config/deploy/production.rb' file.

Add deploy key on GitHub repository.

Capistrano::Puma::Nginxが何故か移してくれないので自分で移す。
```bash
scp ./etc/nginx/nginx.conf #{host}:~/
ssh #{host}
sudo su
mv ./nginx.conf /etc/nginx/nginx.conf
chown root:root /etc/nginx/nginx.conf
nginx -s reload
```

```bash
RAILS_ENV=production bundle exec cap production deploy
```
