#!/bin/bash
start_proxy() {
	export http_proxy=http://localhost:8889;
	export https_proxy=http://localhost:8889;
	echo "set http and https proxy to localhost:8889";
}

end_proxy() {
	unset http_proxy;
	unset https_proxy;
}