BASE := barshift
TB   := $(BASE)_tb

MAIN_SRC := $(BASE).vhdl
TB_SRC   := $(TB).vhdl

all: $(BASE) $(TB) run

$(BASE): $(MAIN_SRC)
	ghdl -a $^

$(TB): $(TB_SRC)
	ghdl -a $^
	ghdl -e $(TB)

run:
	ghdl -r $(BASE)_tb --vcd=$(BASE).vcd

clean:
	ghdl --remove
	rm -f *.vcd

.PHONY: clean all
