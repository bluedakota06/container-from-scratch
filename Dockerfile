FROM python:3.7.3-stretch 

# working directory 
WORKDIR /app 

# Copy src codes to working directory 
COPY . app.py /app/

# Install package requirements 
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt 
    
    