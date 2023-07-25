FROM launcher.gcr.io/google/debian11 AS builder
ADD . /app
WORKDIR /app

COPY requirements.txt .
RUN pip install --target=/app -r ./requirements.txt

FROM gcr.io/distroless/python3-debian11

COPY --from=builder /app /app

WORKDIR /app
ENV PYTHONPATH /app
CMD ["/app/run.py"]
