# Qfinder
​A fast command-line utility to locate specific strings or quotes within files across a directory, complete with line-by-line reporting.

### Requirements
- bash
- grep

### Installation
```bash
cd /opt
git clone https://github.com/Blziko/qfinder
chmod +x qfinder/qfinder.sh
ln -sf qfinder/qfinder.sh /usr/bin/qfinder
cd
```

### Usage
```bash
qfinder --find=<text> --target=<directory>
```