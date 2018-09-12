#!/bin/shelL
if [[ ! -f ".env" ]] 
then 
    cp .env.example .env
fi

if [ ! -d ./vendor ] 
then
        composer install
        php artisan key:generate
        update composer
fi

php "artisan" "serve" "--port" "8080" "--host" "0.0.0.0"
