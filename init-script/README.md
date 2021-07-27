# Init Script for bash or zsh

Add the following code to `.bashrc` or `.zshrc`

```bash
for init_script in $(ls ~/Documents/scripts/init);
do
	source ~/Documents/scripts/init/$init_script;
done
```

Then add your init script to `~/Documents/scripts/init`, all scripts in this folder will be sourced when a terminal is open.

## Proxy Script

[proxy.sh](./init/proxy.sh) is a script for setting up proxy after connecting to vpn. The port I am using is 8889, which is the default port of Qv2ray, you may want to change the port.