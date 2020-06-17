ARG IMAGE=store/intersystems/irishealth-community:2020.2.0.204.0

FROM $IMAGE
LABEL maintainer="Guillaume Rongier <guillaume.rongier@intersystems.com>"

RUN echo "password" > /tmp/password.txt && /usr/irissys/dev/Container/changePassword.sh /tmp/password.txt

USER root

RUN apt-get update && apt-get install -y sudo && \
/bin/echo -e $ISC_PACKAGE_MGRUSER\\tALL=\(ALL\)\\tNOPASSWD: ALL >> /etc/sudoers &&\
sudo -u $ISC_PACKAGE_MGRUSER sudo echo enabled passwordless sudo-ing for $ISC_PACKAGE_MGRUSER

USER irisowner

COPY . /tmp/src

WORKDIR /tmp/src

RUN iris start $ISC_PACKAGE_INSTANCENAME EmergencyId=sys,sys && \
 sh install.sh $ISC_PACKAGE_INSTANCENAME && \
 /bin/echo -e "sys\nsys\n" | iris stop $ISC_PACKAGE_INSTANCENAME quietly 

WORKDIR /home/irisowner/