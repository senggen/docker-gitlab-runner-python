FROM python:3-slim

ADD https://github.com/Yelp/dumb-init/releases/download/v1.0.2/dumb-init_1.0.2_amd64 /usr/bin/dumb-init
RUN chmod +x /usr/bin/dumb-init

RUN pip install pylint &&
    pip install pytest &&
    pip install coverage &&
    pip install pytest-cov

VOLUME ["/etc/gitlab-runner/python", "/etc/gitlab-runner"]
ENTRYPOINT ["/usr/bin/dumb-init", "gitlab-runner"]
CMD ["run", "--user=root", "--working-directory=/home/gitlab-runner"]
