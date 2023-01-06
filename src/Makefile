all: tools adsb  

tools: tools.dockerfile
	@docker build -t sdr:tools -f tools.dockerfile ctx

adsb: adsb.dockerfile
	@docker build -t sdr:adsb -f adsb.dockerfile ctx

.PHONY: all
