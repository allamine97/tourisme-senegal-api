FROM python:alpine3.6
COPY . /app
WORKDIR /app
EXPOSE 8080
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]