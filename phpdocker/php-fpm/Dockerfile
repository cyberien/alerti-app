
FROM h1rkul2/nginx-php:composer.1

EXPOSE 80

COPY . .

COPY ./phpdocker/php-fpm/php-ini-overrides.ini  /etc/php/7.2/fpm/conf.d/99-overrides.ini

RUN rm  /etc/nginx/sites-available/default

COPY  ./phpdocker/nginx/vhost.conf /etc/nginx/sites-available/default

COPY  ./phpdocker/nginx/.htpasswd /etc/nginx/.htpasswd

RUN  composer install && \
     chmod +x /application/phpdocker/php-fpm/entrypoint.sh && \
     chown -R www-data:www-data /application /var/log/nginx 
     
RUN rm  /etc/supervisor/supervisord.conf

COPY ./phpdocker/php-fpm/supervisord.conf   /etc/supervisor/supervisord.conf


ENTRYPOINT [ "/application/phpdocker/php-fpm/entrypoint.sh" ]

