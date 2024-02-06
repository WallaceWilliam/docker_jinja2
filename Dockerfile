# docker run --rm \
# -v **TEMPLATE_FOLDER**:/opt/templates \ 
# -v **VARIABLES_FOLDER**:/opt/variables  \
# -e CUSTOM_ENV_VAR=**VALUE** \
# jinja2 /templates/json.j2 /variables/json.json --format=json > **OUTPUT_FILE**

###
FROM alpine:3
LABEL maintainer.name = WallaceWilliam <chernuyorel@gmail.com>
LABEL maintainer.git = https://github.com/WallaceWilliam

# Set env vars
ENV TEMPLATES_DIR /opt/templates
ENV VARIABLES_DIR /opt/variables

WORKDIR /opt

RUN --mount=type=cache,target=/etc/apk/cache --mount=type=bind,source=data,target=/opt/data set -ex \
    && mkdir -p ${TEMPLATES_DIR} ${VARIABLES_DIR} \
    && apk add --no-cache jinja2-cli py3-yaml py3-toml py3-xmltodict py3-hjson \
    && apk add --no-cache --virtual .deps py3-pip \
    && pip3 install json5 --break-system-packages \
    && apk del .deps  \
    && rm -rf /var/cache/apk/* \
    && jinja2 --version \
    && cd data \ 
    && ./test.sh \
    && ./sample.sh


#    apk add --no-cache py3-pip
#
#RUN pip3 install jinja2-cli[yaml,toml,xml,hjson,json5]==0.8.2 --break-system-packages

ENTRYPOINT ["jinja2"]

