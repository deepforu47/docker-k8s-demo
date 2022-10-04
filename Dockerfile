ARG  CODE_VERSION=3.8.8-slim-buster
FROM python:${CODE_VERSION}

LABEL docker-k8s-demo-author="demo@example.com"
ARG CODE_VERSION
# Show the ARG value
RUN echo "$CODE_VERSION"

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY . testfile.txt app.py /app/

# Install packages from requirements.txt
RUN pip install --no-cache-dir --upgrade pip &&\
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt
#ENV APP_COLOR=red

EXPOSE 8080

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
