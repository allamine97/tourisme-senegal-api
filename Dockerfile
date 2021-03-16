FROM python:3.7-buster
COPY . /app
WORKDIR /app
EXPOSE 8080
RUN ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future pip install --upgrade numpy
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
