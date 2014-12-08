BASE := mux
TB   := $(BASE)_tb

MAIN_SRC := $(BASE).vhdl
TB_SRC   := $(TB).vhdl

all: $(BASE) $(TB) run

mux: $(MAIN_SRC)
	ghdl -a $^

mux_tb: $(TB_SRC)
	ghdl -a $^
	ghdl -e $(TB)

run:
	ghdl -r $(BASE)_tb --vcd=$(BASE).vcd

clean:
	rm -f *.vcd *.obj *.cf

.PHONY: clean all
