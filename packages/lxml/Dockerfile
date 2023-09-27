FROM ghcr.io/bjia56/armv7l-wheel-builder:main
ARG PYTHON_VERSION
ARG VERSION
ARG OUTPUT_DIR

WORKDIR /

COPY . /repo

RUN /repo/armv7l_build_wheels.sh ${PYTHON_VERSION} ${VERSION} "lxml"

RUN mkdir -p ${OUTPUT_DIR} && \
    cp build${PYTHON_VERSION}/wheelhouse/lxml*manylinux*armv7l.whl ${OUTPUT_DIR}
