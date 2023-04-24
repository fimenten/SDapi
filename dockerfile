FROM nvidia/cuda:11.5.0-cudnn8-runtime-ubuntu20.04

# Install Git and Python
RUN apt-get update && \
    apt-get install -y git python3.10 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
# COPY stable-diffusion-webui stable-diffusion-webui
WORKDIR /stable-diffusion-webui
RUN pip install -r requirements.txt
RUN pip install flask

CMD ["python","/stable-diffusion-webui/launch.py","--api"]
# CMD ["python", "app.py"]