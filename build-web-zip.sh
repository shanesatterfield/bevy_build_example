#!/bin/bash

RELEASE_DIR=target/wasm32-unknown-unknown/release
PROJECT_NAME=bevy-zone-examples
OUTPUT_DIR=dist
OUTPUT_NAME=app
PUBLIC_DIR=public

cargo build --release --target wasm32-unknown-unknown && \
    wasm-bindgen --out-dir ./$OUTPUT_DIR/ --out-name $OUTPUT_NAME --target web $RELEASE_DIR/$PROJECT_NAME.wasm && \
    mkdir -p $OUTPUT_DIR/$RELEASE_DIR && \
    cp -R assets $OUTPUT_DIR && \
    cp $PUBLIC_DIR/index.html $OUTPUT_DIR && \
    cp $RELEASE_DIR/$PROJECT_NAME.d $RELEASE_DIR/$PROJECT_NAME.wasm $OUTPUT_DIR/$RELEASE_DIR && \
    cd $OUTPUT_DIR && \
    zip -r dist.zip *

