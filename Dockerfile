FROM java:8
LABEL version="1"
LABEL software="tabula-java"
LABEL software.version="1.0.2"
LABEL description="Tool for converting part of pdf file with tables into csv,tsv format"
LABEL website="https://github.com/hangphan/tabula-java"
LABEL documentation="https://github.com/hangphan/tabula-java"
LABEL license="https://github.com/tabulapdf/tabula-java"
LABEL tags="Data sciences"

# Maintainer
MAINTAINER Jazzido <manuel@jazzido.com>
# update packages and install maven
RUN  \
  export DEBIAN_FRONTEND=noninteractive && \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y vim wget curl git maven

RUN mkdir /data/ && \
    cd /home/ && \
    git clone https://github.com/hangphan/tabula-java.git && \
    cd tabula-java && \
    mvn clean compile assembly:single

FROM java:8
LABEL version="1"
LABEL software="tabula-java"
LABEL software.version="1.0.2"
LABEL description="Tool for converting part of pdf file with tables into csv,tsv format"
LABEL website="https://github.com/hangphan/tabula-java"
LABEL documentation="https://github.com/hangphan/tabula-java"
LABEL license="https://github.com/tabulapdf/tabula-java"
LABEL tags="Data sciences"

# Maintainer
MAINTAINER Jazzido <manuel@jazzido.com>
# update packages and install maven
RUN  \
  export DEBIAN_FRONTEND=noninteractive && \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y vim wget curl git maven

RUN mkdir /data/ && \
    cd /home/ && \
    git clone https://github.com/hangphan/tabula-java.git && \
    cd tabula-java && \
    mvn clean compile assembly:single
    
WORKDIR /data/
VOLUME /data/
CMD ["java", "-jar", "/home/tabula-java/target/tabula-1.0.2-SNAPSHOT-jar-with-dependencies.jar", "--help"]

