#!/bin/bash
export proxy_server_address='192.168.0.117';
export proxy_server_port='7890';
export proxy_server_protocol='http';

start_proxy() {
	export http_proxy="$proxy_server_protocol://$proxy_server_address:$proxy_server_port";
	export https_proxy="$proxy_server_protocol://$proxy_server_address:$proxy_server_port";
	export all_proxy="$proxy_server_protocol://$proxy_server_address:$proxy_server_port";
}

stop_proxy() {
	unset http_proxy;
	unset https_proxy;
	unset all_proxy;
}

start_git_proxy() {
	git config --global http.proxy "$proxy_server_protocol://$proxy_server_address:$proxy_server_port";
	git config --global https.proxy "$proxy_server_protocol://$proxy_server_address:$proxy_server_port";
}

stop_git_proxy() {
	git config --global --unset https.proxy;
	git config --global --unset http.proxy;
}
