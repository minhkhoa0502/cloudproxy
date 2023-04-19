FROM nikolaik/python-nodejs:python3.11-nodejs16

ENV PYTHONPATH "$PYTHONPATH:/app"

EXPOSE 8000

COPY ./cloudproxy-ui /app/cloudproxy-ui
WORKDIR /app/cloudproxy-ui

RUN npm install
RUN npm run build

COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY . /app
WORKDIR /app

ENTRYPOINT ["python","./cloudproxy/main.py"]
