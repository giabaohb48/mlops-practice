FROM python:3.9-buster

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 3000

CMD ["python", "predict.py"]
