FROM hashicorp/terraform:1.2.9
RUN mkdir templates
RUN mkdir state
WORKDIR /templates
COPY ./templates/* ./
RUN ls -al
RUN terraform init
CMD ["apply","-auto-approve"]