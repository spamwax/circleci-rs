# This script takes care of testing your crate

set -ex
export PATH="$HOME/.cargo/bin:$PATH"

echo "CIRCLECI_TEST is ==" "$CIRCLECI_TEST" "=="
echo "TARGET is ==" "$TARGET" "=="

build_phase() {
    # if [ ! -z "$DISABLE_TESTS" ]; then
    #     return
    # fi
    case "$TARGET" in
        x86_64-apple-darwin)
            export alfred_debug=1
            export alfred_version="4.0.1"
            export alfred_workflow_version=0.11.1
            export alfred_workflow_uid=hamid63
            export alfred_workflow_name="RustyPin"
            export alfred_workflow_bundleid=cc.hamid.alfred-pinboard-rs
            export alfred_workflow_data=/Users/travis/.config/alfred-pinboard-rs
            export alfred_workflow_cache=/Users/travis/.config/alfred-pinboard-rs
            mkdir "/Users/travis/.config/alfred-pinboard-rs"

            cargo run --target "$TARGET" -- config --authorization hamid:12345
            cargo run --target "$TARGET" -- config -d
            ;;
        i686-apple-darwin)
            export alfred_debug=1
            cargo run --target "$TARGET" -- config --authorization hamid:12345
            export alfred_versioin=3.6
            cargo run --target "$TARGET" -- config -d
            ;;
        armv7-linux-androideabi)
            export alfred_debug=1
            cargo run --target "$TARGET" -- config --authorization hamid:12345
            ;;
        x86_64-unknown-linux-gnu)
            cargo build
            cargo run
            ;;
        *)
            echo "TARGET is: " "$TARGET"
            return
            ;;
    esac

}

# TODO This is the "test phase", tweak it as you see fit
test_phase() {

    if [ -n "$DISABLE_TESTS" ]; then
        cargo build --target "$TARGET"
        return
    fi

    cargo test --target "$TARGET" -- --nocapture --test-threads=1 || return
}

# we don't run the "test phase" when doing deploys
# if [ -z "$TRAVIS_TAG" ]; then

if [ -n "$CIRCLECI_TEST" ]; then
  test_phase
else
  build_phase
fi
# fi
