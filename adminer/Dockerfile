FROM adminer:latest



MAINTAINER Patrick Artounian <partounian@gmail.com>



USER root



# Store PHP Configs at /usr/local/etc/php/conf.d

RUN echo "upload_max_filesize = 2048M" >> /usr/local/etc/php/conf.d/upload_large_dumps.ini \

    && echo "post_max_size = 2048M"       >> /usr/local/etc/php/conf.d/upload_large_dumps.ini \

    && echo "memory_limit = -1"           >> /usr/local/etc/php/conf.d/upload_large_dumps.ini \

    && echo "max_execution_time = 0"      >> /usr/local/etc/php/conf.d/upload_large_dumps.ini



# Add volume for sessions to allow session persistence

VOLUME /sessions



USER adminer



# We expose Adminer on port 8080 (Adminer's default)

EXPOSE 8080
