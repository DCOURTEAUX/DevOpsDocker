FROM python:3.6-alpine
WORKDIR /opt
RUN pip install flask==1.1.2
ADD . /opt/
VOLUME /opt
EXPOSE 8080
ENV odoo_url="https://www.odoo.com/"
ENV pgadmin_url="https://www.pgadmin.org/"
ENTRYPOINT ["python"]
CMD [ "app.py" ]

