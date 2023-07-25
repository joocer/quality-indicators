FROM python:3.11-bullseye

ADD . /app
WORKDIR /app

COPY requirements.txt .
RUN pip install -r ./requirements.txt

ENV PYTHONPATH /app
CMD ["python", "/app/run.py"]
