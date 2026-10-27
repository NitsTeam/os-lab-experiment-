# Experiment 1: Linux Basics, Redirection & Process Management

## Aim
To practice Linux file/directory commands, standard streams, pipes, searching, editors, and process management.

## Commands to demonstrate
```bash
pwd
cd ..
mkdir -pv demo/subdir
mkdir -m 755 permissions_demo
rmdir -v empty_dir
rmdir -pv demo/subdir
ls -lah
touch -c existing_file
touch -t 202610231030 sample.txt
touch -d "2026-10-23 10:30" sample.txt
cp -rp source_dir backup_dir
cp -i source.txt destination.txt
mv -iv oldname.txt newname.txt
mv -n source.txt destination.txt
rm -i file.txt
cat -n sample.txt
cat -b sample.txt
head -n 5 sample.txt
tail -n 5 sample.txt
```

## I/O redirection and pipes
```bash
echo "hello" > output.txt
echo "another line" >> output.txt
ls /not-a-real-path 2> errors.txt
ls /not-a-real-path &> combined.txt
cat < output.txt
printf "pear\\napple\\npear\\n" | sort | uniq
printf "one\\ntwo\\n" | tee stream.txt
printf "a b c\\n" | xargs -n 1 echo
```
Standard streams: stdin = 0, stdout = 1, stderr = 2. `>` overwrites; `>>` appends.

## grep and find
```bash
grep -in "linux" sample.txt
grep -v "skip" sample.txt
grep -c "error" sample.txt
grep -w "cat" sample.txt
find . -name "*.txt"
find . -iname "*.TXT"
find . -type f -size +1M
find . -user "$USER"
find . -empty
```

## Editors
- `nano file.txt`: edit; save with Ctrl+O, Enter; exit Ctrl+X.
- `vim file.txt`: press `i` to insert; Esc then `:wq` to save and quit; Esc then `:q!` to quit without saving. Search with `/word`, next match with `n`.

## Process management
```bash
sleep 300 &
jobs
bg
fg
ps
ps -e
ps -ef
ps -p $$ 
ps aux
top
nice -n 10 sleep 60 &
renice 5 -p PID
kill -15 PID
kill -STOP PID
kill -CONT PID
kill -9 PID
```
Replace `PID` with the real process ID. `kill -9` forces termination; try `kill -15` first.
