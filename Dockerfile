FROM ubuntu:20.04
RUN apt-get update -y && apt-get install sudo -y
RUN apt-get install wget -y && apt-get install gpg -y && apt-get install unzip -y
#RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
#RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
#RUN apt-get update -y && apt-get install -y terraform
RUN wget https://releases.hashicorp.com/terraform/1.2.6/terraform_1.2.6_linux_amd64.zip
RUN unzip terraform_1.2.6_linux_amd64.zip
RUN mv terraform /usr/local/bin/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]