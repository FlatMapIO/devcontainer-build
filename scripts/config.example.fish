
set -x HTTP_PROXY http://127.0.0.1:7890
set -x HTTPS_PROXY $HTTP_PROXY

function unset-proxy
  set -e HTTP_PROXY HTTPS_PROXY
end