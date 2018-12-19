FROM openjdk:8
MAINTAINER aaraujo@protonmail.ch

ENV OMADA_TAR Omada_Controller_v3.0.5_linux_x64
ENV OMADA_HOME /opt/${OMADA_TAR}

RUN cd /opt && curl https://static.tp-link.com/2018/201811/20181108/${OMADA_TAR}.tar.gz.zip -O && \
    unzip ${OMADA_TAR}.tar.gz.zip && \
    tar zxvf ${OMADA_TAR}.tar.gz && rm ${OMADA_TAR}.tar.gz

COPY start.sh /start.sh
CMD /start.sh
