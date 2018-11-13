cd /root && \
apt update && apt install git && \
git clone https://github.com/Opentotum/FABlin.git && \
go get -u github.com/arduino/arduino-cli && \
mv /go/bin/arduino-cli . && \
./arduino-cli core update-index && \
./arduino-cli core upgrade && \
./arduino-cli core install arduino:avr && \
./arduino-cli lib update-index && \
./arduino-cli lib upgrade && \
./arduino-cli lib install TMC2208Stepper && \
cp -Rv FABlin/libraries/SmartComm/ Arduino/libraries/ && \
./arduino-cli compile -b arduino:avr:mega:cpu=atmega1280 FABlin/Marlin/ && \
cp FABlin/Marlin/Marlin.arduino.avr.mega.hex /out/totumduino_$(date +%d%m%Y%H%M%S).hex && \
rm -f FABlin/Marlin/Marlin.arduino.avr.mega.hex