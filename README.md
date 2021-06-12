# Toolbox

> Tools for various purposes

## Programs

### Shell

#### [videoLen](./bin/videoLen):

- Calculate video length of a specified video
- Calculate total duration of all videos in the specified directory

Default video types: `mp4, mov, avi`
Video type/extension can be specified manually

**Dependency:** `progress`

**Example:**

```bash
videoLen --dir <directory of videos> --quiet --default
videoLen --dir <directory of videos> --quiet mp4 mov
```

##### Demo

<img src="README.assets/videoLen.gif" alt="videoLen" width="600" />

##### Installation

[install.videoLen.sh](./installation/install.videoLen.sh)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/HuakunShen/Toolbox/master/installation/install.videoLen.sh)"
# or
sh -c "$(wget https://raw.githubusercontent.com/HuakunShen/Toolbox/master/installation/install.videoLen.sh -O -)"
```

##### Uninstallation

[uninstall.videoLen.sh](./installation/uninstall.videoLen.sh)

```bash
sudo rm /usr/local/bin/videoLen
```

#### [progress](./bin/progress):

- Display a progress bar
- Have customized config for progress bar styling

**Dependency:** _None_

**Example:**

```bash
progress 25 100
# [##########________________________________________](100%)
progress --begin G --end gle --char o --length 10 --demo
# Go________ogle(100%)
# Goo_______ogle(100%)
# Gooo______ogle(100%)
# ...
# Goooooooooogle(100%)
progress <dir of videos> --begin G --end gle --char o --length 60
```

##### Demo

<img src="README.assets/google-demo.gif" alt="google-demo" width="600" />

<img src="README.assets/default.gif" alt="default" width="600" />

<img src="README.assets/videoLen.gif" alt="videoLen" width="600" />

##### man

[man page](./man/progress.1)

[man page .gz](./man/progress.1.gz)

##### Installation

[install.progress.sh](./installation/install.progress.sh)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/HuakunShen/Toolbox/master/installation/install.progress.sh)"
# or
sh -c "$(wget https://raw.githubusercontent.com/HuakunShen/Toolbox/master/installation/install.progress.sh -O -)"
```

##### Uninstallation

[uninstall.progress.sh](./installation/uninstall.progress.sh)

```bash
sudo rm /usr/share/man/man1/progress.1.gz
sudo rm /usr/local/bin/progress
```

#### [imgToHtml](./bin/imgToHtml)

- Put a list of image into an html for a simple list view, instead of opening every image one by one.

**Example**

```bash
imgToHtml 		# put all png in cwd into an html
imgToHtml jpg 	# put all jpg in cwd into an html
```





## Settings

### [.zshrc](./setting/zshrc.sh):

`.zshrc` is for `zsh`, for Mac.

- Contains `PROMPT` settings
- Helper function `mcd`, `cd` into a dir, `mkdir` if not exist
- Helper function `search`, run `grep -Rn <search-content> <target-dir>`, "target-dir" is optional, search cwd by default

##### Installation

```bash
wget https://raw.githubusercontent.com/HuakunShen/Toolbox/master/setting/zshrc.sh
cat zshrc.sh >> ~/.zshrc
rm zshrc.sh
```

### [.bashrc](./setting/bashrc.sh):

- Contains `PS1`/`Command Prompt` setting
- Contains optional sample alias app for Linux subsystem under Win10

##### Installation

```bash
wget https://raw.githubusercontent.com/HuakunShen/Toolbox/master/setting/bashrc.sh
cat bashrc.sh >> ~/.bashrc
rm bashrc.sh
```

[crontab template](./setting/crontab.sh):

- crontab is for periodic tasks
- Contains contab template
- `crontab -e` to edit
