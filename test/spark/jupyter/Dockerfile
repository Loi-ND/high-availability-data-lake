FROM ubuntu:24.04

RUN apt update && \
    apt install -y python3 python3-pip && \
    apt install jupyter-notebook -y

RUN useradd -ms /bin/bash admin
RUN mkdir /workspace && chown admin:admin /workspace

WORKDIR /workspace
USER admin

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser"]
