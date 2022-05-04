ARG CODE_VERSION=latest
FROM ubuntu:${CODE_VERSION}

RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential checkinstall -y

RUN apt-get install dpkg-dev build-essential libncursesw5-dev libsqlite3-dev libreadline-dev libbz2-dev -y
RUN apt-get install libffi-dev libssl-dev libgdbm-dev zlib1g-dev libjpeg-dev libtiff-dev libpq-dev -y
RUN apt-get install libxml2-dev libxslt1-dev -y
RUN apt-get install wget -y
RUN apt-get install curl -y

RUN wget https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tgz
RUN tar xzf Python-3.8.12.tgz
WORKDIR "/Python-3.8.12"
RUN ./configure
RUN make altinstall

RUN pip3.8 install --upgrade pip
RUN pip3.8 install --upgrade setuptools

RUN pip3.8 install jupyterlab

CMD ["python3.8 -m jupyter notebook --ip 0.0.0.0 --allow-root"]
