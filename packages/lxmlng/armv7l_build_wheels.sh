#!/bin/bash

SHELL_FOLDER=$(cd "$(dirname "$0")" && pwd)

PYTHON3_VERSION=$1
PACKAGE_VERSION=$2
PKG_NAME=$3

set -e

build_wheel() (
    PY_VER=$1
    VER=$2
    $PKG=$3
    mkdir build$PY_VER
    cd build$PY_VER
    pip$PY_VER wheel --no-deps $PKG==$VER
)

test_wheel() (
    PY_VER=$1
    $PKG=$2

    cd build$PY_VER
    pip$PY_VER install wheelhouse/$PKG*manylinux*armv7l.whl
    python$PY_VER -c "import $PKG; print($PKG)"
)

repair_wheel() (
    PY_VER=$1
    $PKG=$2
    cd build$PY_VER
    auditwheel repair $PKG*armv7l.whl
)

${SHELL_FOLDER}/prepare.sh

build_wheel $PYTHON3_VERSION $PACKAGE_VERSION $PKG_NAME
repair_wheel $PYTHON3_VERSION $PKG_NAME
test_wheel $PYTHON3_VERSION $PKG_NAME

cp wheelhouse/$PKG_NAME-*manylinux*armv7l.whl /export