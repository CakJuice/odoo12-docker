FROM ubuntu:18.04
LABEL maintainer="hd.brandoz@gmail.com"

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y
RUN apt install -y wget python3 python3-dev python3-pip postgresql-client
RUN pip3 install --upgrade pip

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
RUN apt install -y ./wkhtmltox_0.12.5-1.bionic_amd64.deb

RUN wget https://nightly.odoo.com/12.0/nightly/deb/odoo_12.0.latest_all.deb
RUN apt install -y ./odoo_12.0.latest_all.deb

COPY ./odoo.conf /etc/odoo/
RUN chown odoo:odoo /etc/odoo/odoo.conf

RUN mkdir -p /mnt/addons-enterprise/
RUN chown -R odoo:odoo /mnt/addons-enterprise/
COPY ./addons-enterprise /mnt/addons-enterprise/

RUN mkdir -p /mnt/addons-extra/
RUN chown -R odoo:odoo /mnt/addons-extra/
COPY ./addons-extra /mnt/addons-extra/
