# Replace with the name of your project
PROJECT_NAME=bevy_build_example

OUTPUT_DIR=dist
OUTPUT_NAME=app
ZIP_NAME=dist.zip
PUBLIC_DIR=public
RELEASE_DIR=target/wasm32-unknown-unknown/release

all: local web

# +-------+
# | Local |
# +-------+

local:
	@echo "+----------------------+"
	@echo "| Starting Local Build |"
	@echo "+----------------------+"
	@cargo build --release

# +-----+
# | Web |
# +-----+

web: web_build_banner web_build web_copy web_bundle

web_build_banner:
	@echo "+--------------------+"
	@echo "| Starting Web Build |"
	@echo "+--------------------+"

web_build:
	@echo "Building"
	@cargo build --release --target wasm32-unknown-unknown
	@wasm-bindgen --out-dir ./${OUTPUT_DIR}/ --out-name ${OUTPUT_NAME} --target web ${RELEASE_DIR}/${PROJECT_NAME}.wasm

web_copy:
	@echo "Copying files"
	@mkdir -p ${OUTPUT_DIR}/${RELEASE_DIR} assets
	@cp -R assets ${OUTPUT_DIR}
	@cp ${PUBLIC_DIR}/index.html ${OUTPUT_DIR}
	@cp ${RELEASE_DIR}/${PROJECT_NAME}.d ${RELEASE_DIR}/${PROJECT_NAME}.wasm ${OUTPUT_DIR}/${RELEASE_DIR}

web_bundle:
	@echo "Bundling"
	@zip -r ${ZIP_NAME} ${OUTPUT_DIR}/*
	@mv ${ZIP_NAME} ${OUTPUT_DIR}
