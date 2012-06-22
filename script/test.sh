
test_dir="test"
libs="-Ilib -Itest"

set -e
cd "$(dirname $0)/.."

files=$(find $test_dir -name \*test.rb -o -name \*spec.rb) 
load=""
for f in $files; do
  load="$load; load '$f'"
done

clear
echo $libs
echo $files
time ruby $libs -e "$load"
