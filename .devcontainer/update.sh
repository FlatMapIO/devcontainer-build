echo "=========== Update you container on start ==========="


echo "== Set pip cn mirror =="
# TODO check gepip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple


if [ -f ./requirements.txt ]; then
  pip install -r ./requirements.txt
fi

echo "Install Mojo: https://developer.modular.com/download"
echo "Use apt cn source: sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list"