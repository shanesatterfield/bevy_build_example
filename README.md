# Bevy Build Example

This repo is an example of how to build Bevy games/apps for various platforms. This covers the following.

- Building for the web (HTML)
- Cross compiling for Windows and Linux
- Setting up CI/CD with Github Actions
- Automated publishing to Itch

## Building for All Targets

The [Makefile](https://github.com/shanesatterfield/bevy_build_example/blob/main/Makefile) includes tasks for all targets. You can run them together with the following command.

```bash
make
```

## Building for the Web

### Dependencies

First, add the WASM target for Rust with the following command.

```bash
rustup target add wasm32-unknown-unknown
```

Then, install `wasm-bindgen-cli` as the build tool.

```bash
cargo install -f wasm-bindgen-cli
```

### Building

There are two examples for how to build for the web in this repo. You can either look at just the  or at the larger  which includes other build targets.

#### Build Script

The [web build script](https://github.com/shanesatterfield/bevy_build_example/blob/main/build-web-zip.sh) is a standalone bash script that runs just the commands to build and bundle the web artifacts.

To run just the [web build script](https://github.com/shanesatterfield/bevy_build_example/blob/main/build-web-zip.sh), run the following command.

```bash
./build-web-zip.sh
```

#### Makefile

The [Makefile](https://github.com/shanesatterfield/bevy_build_example/blob/main/Makefile) includes tasks for all of the build targets. To execute just the web target by running the following command.

```bash
make web
```

#### Testing

If you have Python 3 installed, you can run the following command to start a local HTTP server to test the web build.

```bash
python -m http.server --directory dist 8080
```

This will start a web server at http://localhost:8080.
