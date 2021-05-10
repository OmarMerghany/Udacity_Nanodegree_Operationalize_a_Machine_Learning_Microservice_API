FROM python:3.7.3-stretch


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
## Step 1:
WORKDIR /opt

## Step 2:
COPY . /app

## Step 3:
# RUN pip3 install -r /opt/app/requirements.txt
# hadolint ignore=DL3013

RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r /app/requirements.txt

## Step 4:
EXPOSE 80

## Step 5:
# Run app.py at container launch

CMD [ "python3","/app/app.py" ]