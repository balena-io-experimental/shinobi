FROM balenalib/jetson-nano-ubuntu-node:12-bionic-build

# set some default config options
ENV DB_USER=majesticflame \
    DB_PASSWORD='majesticflame' \
    DB_HOST='mariadb' \
    DB_DATABASE=ccio \
    DB_PORT=3306 \
    PLUGIN_KEYS='{}' \
    SSL_ENABLED='false' \
    DB_DISABLE_INCLUDED=true \
    MYSQL_ROOT_PASSWORD=''

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /home/Shinobi /config /var/lib/mysql

# set up some directories
WORKDIR /home/Shinobi

# clone the shinobi repo 
RUN git clone https://gitlab.com/Shinobi-Systems/Shinobi.git /home/Shinobi \
# pin the repo to a commit so that we can update in control
&& git -c advice.detachedHead=false checkout 33576277ba36dac78f789487b18d4e267df2c918

RUN chmod -R 777 /home/Shinobi/plugins

# install a DB client and ffmpeg
RUN install_packages jq mariadb-client ffmpeg 

# install some npm dependencies
RUN npm install npm@latest -g \
    && npm install pm2@3.0.0 -g \
    && npm install --unsafe-perm

# get the scripts ready for running
RUN chmod -f +x /home/Shinobi/Docker/init.sh
COPY ./entrypoint.sh .
RUN chmod -f +x /home/Shinobi/entrypoint.sh

ENTRYPOINT ["bash", "/home/Shinobi/entrypoint.sh"]
CMD [ "pm2-docker", "/home/Shinobi/Docker/pm2.yml" ]
