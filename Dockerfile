FROM openjdk:8
MAINTAINER aaraujo@protonmail.ch

ENV OMADA_TAR Omada_Controller_V3.0.2_Linux_x64_targz
ENV OMADA_HOME /opt/${OMADA_TAR}

RUN cd /opt && curl https://static.tp-link.com/2018/201809/20180907/${OMADA_TAR}.tar.gz -O && \
    tar zxvf ${OMADA_TAR}.tar.gz && rm ${OMADA_TAR}.tar.gz

COPY start.sh /start.sh
CMD /start.sh
