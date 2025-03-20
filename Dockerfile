FROM python:3.12

COPY ./requirements.txt .
RUN pip install -r ./requirements.txt
RUN pip install gunicorn

WORKDIR /usr/src/app

COPY ./src /usr/src/app

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8080", "app:app"]
