#!/bin/bash
export proxy_server_address=localhost;
export proxy_server_port=7890;
start_proxy() {
	export http_proxy="http://$proxy_server_address:$proxy_server_port";
	export https_proxy="http://$proxy_server_address:$proxy_server_port";
	export all_proxy="http://$proxy_server_address:$proxy_server_port";
}

stop_proxy() {
	unset http_proxy;
	unset https_proxy;
	unset all_proxy;
}

start_git_proxy() {
	git config --global http.proxy "http://$proxy_server_address:$proxy_server_port";
	git config --global https.proxy "http://$proxy_server_address:$proxy_server_port";
}

stop_git_proxy() {
	git config --global --unset https.proxy;
	git config --global --unset http.proxy;
}
