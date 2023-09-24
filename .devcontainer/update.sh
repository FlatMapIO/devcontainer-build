echo "=========== Update you container on start ==========="

echo "== Set pip cn mirror =="

if [ TZ = "Asia/Shanghai"]; then
  echo "== Set cn source mirror =="
  pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
  sudo sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
fi

if [ -f ./requirements.txt ]; then
  echo "== Install requirements =="
  pip install -r ./requirements.txt
fi


if ! [ -z MODULAR_AUTH ]; then
  fish -c echo "== Install Mojo: https://developer.modular.com/download =="
  curl https://get.modular.com | su -
  # TODO set env
fi