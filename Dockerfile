FROM python:3.9.15-slim-bullseye
RUN pip install mkdocs
RUN mkdocs new my-project
WORKDIR /my-project
EXPOSE 8000
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]