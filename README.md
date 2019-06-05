delete-merged
=============
**Additional function to delete merged branches in [Zsh](http://www.zsh.org).**

## Installation

### Using zsh framework [oh-my-zsh](http://github.com/robbyrussell/oh-my-zsh)

* Clone the repository inside your oh-my-zsh repo:

```
    git clone git@github.com:schmidma/delete-merged ~/.oh-my-zsh/custom/plugins/delete-merged
```

* Enable it in your `.zshrc` by adding it to your plugin list:

```
    plugins=(… delete-merged)
```


### Manual installation

* Clone the repository:

```
    git clone git@github.com:schmidma/delete-merged ~/.oh-my-zsh/custom/plugins/delete-merged
```

* Source the zsh plugin file

```
    source path/to/plugin/delete-merged.plugin.zsh
```


## Usage

Deleting all merged branches:

```
    gbmcleanup
```

Using interactive mode to manually accept/reject the deletion of each branch

```
    gbmcleanup -i
```
