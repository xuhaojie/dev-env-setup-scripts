./install-rust.sh
if [ $# -eq 0 ]; then
./set-cargo-mirror.sh 1
else
./set-cargo-mirror.sh $1
fi