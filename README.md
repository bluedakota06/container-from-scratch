
# Building a Docker Container Project from Scratch

## Gen key pair

```
ssh-keygen -t rsa 
```

## Public key 
```
cat  /home/ec2-user/.ssh/id_rsa.pub
```

## Update Github SSH key 

## Create Github repository 

## Clone repository 
```
git clone git@github.com:bluedakota06/container-from-scratch.git
```


## Makefile 

```
install:
        pip install --upgrade pip &&\
        pip install -r requirements.txt

lint:
        docker run --rm -i hadolint/hadolint < Dockerfile(.container) 
```

## Dockerfile 
```
FROM python:3.7.3-stretch 

# working directory 
WORKDIR /app 

# Copy src codes to working directory 
COPY . app.py /app/

# Install package requirements 
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt 
    
```

## Requirements.txt 
```
pylint
click
```

## The application
```
#!/usr/bin/env python
import click

@click.command()
@click.option("--name")
def hello(name):
    click.echo(f'Hello {name}!')

if __name__ == '__main__':
    #pylint: disable=no-value-for-parameter
    hello()
```

## Make 

```
make install 
```

## Run with Github image

```bash
docker run -it noahgift/cloudapp python app.py --name "Big Apple"
#the output
Hello Big Apple!
```

## Run using local Image 
```bash
docker run -it app python app.py --name "Leo"
#the output
Hello Leo!
```

### Build image
*(If you want to develop yourself)* 
```
docker build --tag=app .
```

### List images 
```
docker image ls 
```