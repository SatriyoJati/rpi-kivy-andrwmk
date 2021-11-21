# rpi-kivy
Docker image for running Kivy apps on a Raspberry Pi 3. Based largely on the work here https://github.com/shaunmulligan/resin-kivy plus scraps from around the internet.

## Install Raspbian
You probably already have Raspbian
## Install Docker
`curl -sSL https://get.docker.com | sh`
## Pull Docker image and run app
`docker run --rm -it --device=/dev/input/event0 --device=/dev/vchiq andrewmk/rpi-kivy2:buster python apps/pictures/main.py`

or

`./run.sh apps/yourapp/main.py`
## Build the Docker image yourself
`docker build -t you/yourimage -f Dockerfile .`
