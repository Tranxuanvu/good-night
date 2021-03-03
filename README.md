# Project Information

- Ruby version 2.7.2

- Rails version 6.0.3.5

- Database: Postgresql

# Setup Project

- Run this command and change the config with your local database system

  ```
  cp config/database.yml.sample config/database.yml
  ```

- Run this command and change env variables for your local

  ```
  cp .env.sample .env
  ```

- Run this command to create database, run migration and sample data

  ```
  rake db:create db:migrate
  ```

- Run this command to apply `credentials.yml` for your local

  ```
  cp config/master.key.example config/master.key
  ```

- Edit `credentials.yml`

  ```
  EDITOR=vim rails credentials:edit
  ```
