FROM openjdk:8
MAINTAINER aaraujo@protonmail.ch

ENV OMADA_TAR Omada_Controller_v3.2.1_linux_x64
ENV OMADA_HOME /opt/${OMADA_TAR}

RUN cd /opt && curl https://static.tp-link.com/2019/201909/20190906/${OMADA_TAR}.tar.gz -O && \
    tar zxvf ${OMADA_TAR}.tar.gz && rm ${OMADA_TAR}.tar.gz

COPY start.sh /start.sh
CMD /start.sh
