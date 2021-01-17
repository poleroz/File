FROM python:3
COPY src/*.html /src/
EXPOSE 8080
WORKDIR /src
RUN cp bugs.html index.html
CMD python -m http.server 8090
