FROM senggen/python-centos

RUN pip install pylint && \
    pip install pytest && \
    pip install coverage && \
    pip install pytest-cov

RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | bash && \
    yum -y install gitlab-runner && \
    yum clean all && \
    wget -qO /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 && \
    chmod +x /usr/bin/dumb-init

VOLUME ["/etc/gitlab-runner/python", "/etc/gitlab-runner"]
ENTRYPOINT ["/usr/bin/dumb-init", "gitlab-runner"]
CMD ["run", "--user=root", "--working-directory=/home/gitlab-runner"]
