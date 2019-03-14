FROM python:3-slim

RUN pip install pylint &&
    pip install pytest &&
    pip install coverage &&
    pip install pytest-cov

VOLUME ["/etc/gitlab-runner/python", "/etc/gitlab-runner"]
ENTRYPOINT ["/usr/bin/dumb-init", "gitlab-runner"]
CMD ["run", "--user=root", "--working-directory=/home/gitlab-runner"]
