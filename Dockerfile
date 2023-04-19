FROM nikolaik/python-nodejs:python3.11-nodejs16

ENV PYTHONPATH "$PYTHONPATH:/app"

EXPOSE 8000

COPY ./cloudproxy-ui /app/cloudproxy-ui
WORKDIR /app/cloudproxy-ui

RUN npm install
RUN npm run build

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

ENTRYPOINT ["python","./cloudproxy/main.py"]
