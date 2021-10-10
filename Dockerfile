FROM python:3.9

RUN apt-get update && \
    apt-get install -y --no-install-recommends npm && \
    apt-get clean && \
    pip install kallithea==0.7 && \
    kallithea-cli front-end-build && \
    mkdir -p /srv/kallithea/state && \
    mkdir -p /srv/kallithea/repos

COPY start.sh /srv/kallithea/start.sh

VOLUME ["/srv/kallithea/state", "/srv/kallithea/repos"]

EXPOSE 80

CMD ["bash", "/srv/kallithea/start.sh"]

