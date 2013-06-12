BASE := types

MAIN_SRC := $(BASE).vhdl

all: $(BASE)

$(BASE): $(MAIN_SRC)
	ghdl -a $^

clean:
	ghdl --remove

.PHONY: clean all
