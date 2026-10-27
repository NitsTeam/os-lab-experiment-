#!/usr/bin/env bash
set -eu

echo "Current date/time:"
date

echo
echo "Logged-in users are being saved to logged_users.txt"
who > logged_users.txt
cat logged_users.txt

cat > sample.txt <<'EOF'
Linux is powerful.
Linux is useful.
Shell scripts save time.
A quick brown fox jumps.
EOF

echo
echo "Print line 2:"
sed -n '2p' sample.txt

echo
echo "Print lines 2 through 3:"
sed -n '2,3p' sample.txt

echo
echo "Delete first line from output:"
sed '1d' sample.txt

echo
echo "Replace first Linux occurrence per line:"
sed 's/Linux/UNIX/' sample.txt

echo
echo "Replace every occurrence globally:"
sed 's/is/IS/g' sample.txt

echo
echo "Lines beginning with Linux:"
sed -n '/^Linux/p' sample.txt

echo
echo "Lines ending with time."
sed -n '/time\\.$/p' sample.txt

cp sample.txt sample.txt.bak
sed -i.bak 's/powerful/portable/g' sample.txt
echo
echo "Updated sample.txt (backup: sample.txt.bak):"
cat sample.txt
