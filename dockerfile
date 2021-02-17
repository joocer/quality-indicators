FROM python:3-slim AS builder
ADD . /app
WORKDIR /app

RUN pip3 install --upgrade pip
COPY requirements.txt .
RUN pip install -r ./requirements.txt


FROM gcr.io/distroless/python3-debian10

COPY --from=builder /app /app
COPY --from=builder /usr/local/lib/python3.5/site-packages/ /usr/lib/python3.5/.

WORKDIR /app
ENV PYTHONPATH /app
CMD ["/app/run.py"]
