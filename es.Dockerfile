ARG CODE_VERSION=3.10.5
FROM python:${CODE_VERSION}

RUN apt-get update && apt-get upgrade -y
RUN pip install --upgrade pip

WORKDIR /usr/src/es

RUN mkdir IMDB

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY ./IMDB ./IMDB

COPY movies_search.ipynb .

CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]