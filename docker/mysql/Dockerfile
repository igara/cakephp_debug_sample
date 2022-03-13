FROM mysql:8

RUN apt-get update \
  && apt-get install -y wget

RUN wget https://github.com/k0kubun/sqldef/releases/download/v0.11.44/mysqldef_linux_amd64.tar.gz
RUN tar -zxvf mysqldef_linux_amd64.tar.gz
RUN mv mysqldef /bin
