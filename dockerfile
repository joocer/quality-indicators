FROM python:3.11-bullseye
ADD . /app
WORKDIR /app

COPY requirements.txt .
RUN pip install --target=/app -r ./requirements.txt

WORKDIR /app
ENV PYTHONPATH /app
CMD ["/app/run.py"]
