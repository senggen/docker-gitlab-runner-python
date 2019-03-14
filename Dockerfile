FROM python:3-slim

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install python-pip && \
    apt-get -y autoremove

RUN pip install pylint && \
    pip install pytest && \
    pip install coverage && \
    pip install pytest-cov

ADD https://github.com/Yelp/dumb-init/releases/download/v1.0.2/dumb-init_1.0.2_amd64 /usr/bin/dumb-init
RUN chmod +x /usr/bin/dumb-init

VOLUME ["/etc/gitlab-runner/python", "/etc/gitlab-runner"]
ENTRYPOINT ["/usr/bin/dumb-init", "gitlab-runner"]
CMD ["run", "--user=root", "--working-directory=/home/gitlab-runner"]
