OPTIONS = -Wall -g2012
TEST_FILES = L74x02.sv L74x04.sv L74x21.sv L74x86.sv L74x154.sv L74x283.sv L74x574.sv Supercar.sv testbench.vh
OUT_FILE = test_file

.PHONY: clean test

test: $(OUT_FILE)
	vvp $(OUT_FILE)

clean:
	rm -rf $(OUT_FILE)

$(OUT_FILE): $(TEST_FILES)
	iverilog $(OPTIONS) -o $(OUT_FILE) $(TEST_FILES)