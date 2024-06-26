# Q&D DBG

Collection of functions useful for quick and dirty debugging.

Some additional tips & tricks useful for debugging are given below.

# Tips & Tricks

1. Getting generated bytecode size from `should_pass` tests

```
cargo run --bin test --release -- --release --verbose should_pass/ | egrep "(Compiling should_pass|Bytecode size)" | tee ~/Desktop/bytecode_sizes.txt
cargo run --bin test --release -- --release --verbose --no-encoding-v1 --exclude 'log_decode|payable_non_zero_coins|workspace_test|slice_contract' should_pass/ | egrep "(Compiling should_pass|Bytecode size)" | tee ~/Desktop/bytecode_sizes.txt

tr -d '\n' < ~/Desktop/bytecode_sizes.txt > ~/Desktop/bytecode_sizes.txt.01.single_line.temp.txt

sed -i.bak -r 's/\s*Compiling\sshould_pass\/([0-9a-zA-Z\/_-]*)\s\.\.\.\s*Bytecode\ssize:\s([0-9]+)\sbytes/\1,\2\n/g' ~/Desktop/bytecode_sizes.txt.01.single_line.temp.txt

sed -i.bak -r '/\s+.*/d' ~/Desktop/bytecode_sizes.txt.01.single_line.temp.txt

sort ~/Desktop/bytecode_sizes.txt.01.single_line.temp.txt -o ~/Desktop/bytecode_sizes.txt.02.final.temp.txt

cp ~/Desktop/bytecode_sizes.txt.02.final.temp.txt ~/Desktop/bytecode_sizes.csv
```
