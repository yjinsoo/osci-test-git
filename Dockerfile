FROM 784695908961.dkr.ecr.us-west-2.amazonaws.com/nginx:latest
ENV TOMCATS 10.0.0.4
RUN apt-get update && apt-get install -y vim && apt-get install -y zip
RUN rm -rf /usr/share/nginx/html && rm -rf /etc/nginx/conf.d/default.conf
ADD ./html/css /usr/share/nginx/html/css
ADD ./html/fonts /usr/share/nginx/html/fonts
ADD ./html/js /usr/share/nginx/html/js
ADD ./html/images /usr/share/nginx/html/images
ADD ./html/*.html /usr/share/nginx/html/
ADD tomcat1.conf /
WORKDIR /usr/share/nginx/html
EXPOSE 80
CMD ["/bin/sh" , "-c" , "envsubst '$TOMCATS' < /tomcat1.conf > /etc/nginx/conf.d/tomcat.conf && exec nginx -g 'daemon off;'"]


