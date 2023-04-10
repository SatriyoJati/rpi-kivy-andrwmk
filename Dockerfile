FROM balenalib/raspberry-pi:bullseye-run-20230218

RUN apt-get update && apt-get install -yq --no-install-recommends \
    gcc libraspberrypi-dev libraspberrypi-bin libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev \
    pkg-config libgl1-mesa-dev libgles2-mesa-dev mtdev-tools\
    python3-setuptools libgstreamer1.0-dev git-core \
    gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly \
    gstreamer1.0-alsa gstreamer1.0-omx python3-dev python3-pip libmtdev-dev xclip xsel libjpeg-dev && \
    apt-get clean all && rm -rf /var/lib/apt/lists/*

# create src dir
RUN mkdir -p /usr/src/app/
ENV KIVY_HOME=/usr/src/app

# set as WORKDIR
WORKDIR /usr/src/app

RUN python3 -m pip install --upgrade pip setuptools

RUN pip3 install wheel && pip3 install pgen && pip3 install Cython &&\
    pip3 install pygments && pip3 install docutils && pip3 install pygame && rm -Rf /root/.cache/*

#RUN git clone -b stable-1.10.1 --depth 1 https://github.com/andrewmk/kivy \
#     && cd kivy && python3 setup.py build && python3 setup.py install && cd ..

RUN python3 -m pip install kivy==2.1.0

# Copy Kivy config file
COPY config.ini config.ini

# Copy my application files
RUN mkdir -p apps
COPY ./apps/ ./apps/

# runs a sample app on container start
CMD ["python3", "apps/pictures/main.py"]
