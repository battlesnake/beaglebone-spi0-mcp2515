in = MCP2515.dts
out = /lib/firmware/BB-MCP2515-00A0.dtbo

.PHONY: all
all: $(out)
	rm -f -- /lib/firmware/$(out)
	for slot in $$(grep BB-MCP2515 /root/slots | cut -f1 -d:); do echo -$$slot > /root/slots; done
	echo BB-MCP2515 > /root/slots

$(out): $(in)
	dtc -@ -I dts -O dtb -o $@ $<
