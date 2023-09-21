echo "=========== Update you container on start ==========="

echo "== Set pip cn mirror =="
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

echo "== Set apt cn mirror =="
sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
