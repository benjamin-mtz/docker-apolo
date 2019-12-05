FROM node:lts-stretch
RUN apt-get update \
    && apt-get install zip git python python-pip curl -y \
    && apt-get clean --dry-run
RUN pip install pytz \
    && pip install awsebcli \
    && pip install awscli

RUN eb --version \
    && aws --version \
    && node --version \
    && npm install -g @angular/cli \
    && aws configure set preview.cloudfront true
CMD ["/bin/bash"]
