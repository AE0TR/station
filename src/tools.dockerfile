FROM alpine AS build

WORKDIR /var/build

RUN apk add --update --no-cache \
	linux-headers \
	libusb-dev \
	build-base \
	musl-dev \
	cmake \
	make \
	git 


RUN git clone https://gitea.osmocom.org/sdr/rtl-sdr.git; \
    cd rtl-sdr; \
    mkdir build; \
    cd build; \
    cmake ../ -DINSTALL_UDEV_RULES=ON \
    make; \
    make install; 

FROM alpine

WORKDIR /

RUN apk add --no-cache \
    libusb \
    grep \
    vim

COPY --from=build /etc/udev/rules.d/rtl-sdr.rules /etc/udev/rules.d/rtl-sdr.rules
COPY --from=build /usr/local/bin/ /usr/local/bin/ 
COPY --from=build /usr/local/lib/ /usr/local/lib/ 
COPY ./rtl_device /usr/local/bin/

