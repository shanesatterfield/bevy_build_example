#!/bin/bash

# Replace with the name of your project
PROJECT_NAME=bevy_build_example

OUTPUT_DIR=dist
OUTPUT_NAME=app
PUBLIC_DIR=public
RELEASE_DIR=target/wasm32-unknown-unknown/release

# Create a release build
cargo build --release --target wasm32-unknown-unknown && \
    # Generate Javascript bindings for our WASM file
    wasm-bindgen --out-dir ./$OUTPUT_DIR/ --out-name $OUTPUT_NAME --target web $RELEASE_DIR/$PROJECT_NAME.wasm && \
    # Copy only the relevant files to an output folder
    mkdir -p $OUTPUT_DIR/$RELEASE_DIR && \
    cp -R assets $OUTPUT_DIR && \
    cp $PUBLIC_DIR/index.html $OUTPUT_DIR && \
    cp $RELEASE_DIR/$PROJECT_NAME.d $RELEASE_DIR/$PROJECT_NAME.wasm $OUTPUT_DIR/$RELEASE_DIR && \
    # Bundle files for distribution
    cd $OUTPUT_DIR && \
    zip -r dist.zip *

