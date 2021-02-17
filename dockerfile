FROM python:3.8-slim AS builder
ADD . /app
WORKDIR /app

FROM gcr.io/distroless/python3-debian10
COPY --from=builder /app /app
WORKDIR /app
RUN pip install -r requirements.txt
ENV PYTHONPATH /app
CMD ["/app/run.py"]