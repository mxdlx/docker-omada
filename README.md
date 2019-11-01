# TP-Link Omada Docker Container

This is a working container version of Omada but still work in progress. There are lots of confusing properties lying around in `${OMADA_HOME}/properties` files. I ran into a lot of issues that I was able to work through thanks to the people in the **Inspired by** section.

## Technical Debt!

* There's no need to use `openjdk:8` image.
* Need to test if `mongo.external = true` means that omada won't start a MongoDB instance so I don't have to customize `${OMADA_HOME}/properties/mongodb.properties`.
* Need to add proper logic in case user is comfortable with using Omada's internal MongoDB instance.
* Need to review all of the customized options to know if any of them should be left as it is.
* Need to add Docker volumes for logs and Omada's backups if those are needed.
* There are many variables for MongoDB authentication and security that need to be reviewed.
* Setup throws an exception that I haven't been able to fix:

```
omada_1  | SLF4J: com.tp_link.eap.util.m.a
omada_1  | SLF4J: The following set of substitute loggers may have been accessed
omada_1  | SLF4J: during the initialization phase. Logging calls during this
omada_1  | SLF4J: phase were not honored. However, subsequent logging calls to these
omada_1  | SLF4J: loggers will work as normally expected.
omada_1  | SLF4J: See also http://www.slf4j.org/codes.html#substituteLogger
omada_1  | Exception in thread "Thread-0" java.lang.IllegalArgumentException: URI is not hierarchical
omada_1  | 	at java.io.File.<init>(File.java:418)
omada_1  | 	at com.tp_link.eap.util.g.a.a(SourceFile:47)
omada_1  | 	at com.tp_link.eap.configuration.b.a(SourceFile:58)
omada_1  | 	at com.tp_link.eap.util.o.c(SourceFile:443)
omada_1  | 	at com.tp_link.eap.util.o.b(SourceFile:434)
omada_1  | 	at com.tp_link.eap.start.f.run(SourceFile:35)
```

## MongoDB

Omada runs a MongoDB instance if you perform a complete install with the provided `install.sh` script. I customized this container image to use an external MongoDB instance.

## Variables

You need to setup the following variables, all of them are mandatory right now:

* `OMADA_HTTP_PORT`: HTTP port for Omada.
* `OMADA_HTTPS_PORT`: HTTPS port for Omada.
* `OMADA_MONGO_HOST`: MongoDB instance hostname or IP address.
* `OMADA_MONGO_PORT`: MongoDB instance port.
* `OMADA_MONGO_DATABASE`: MongoDB instance database name.

## Docker Compose

There's a `docker-compose.yml` example included in this repository that shows how to use an external MongoDB instance.

## Inspired by

* [macexx version](https://github.com/macexx/EAP-Controller)
* [binelson version](https://github.com/binelson/dockerized-tp-eap-controller)
* [mbentley version](https://github.com/mbentley/docker-omada-controller)
