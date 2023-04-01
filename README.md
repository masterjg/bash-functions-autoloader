# BASH functions autoloader

Very simple idea to autoload namespaced BASH functions.

Just source the loader `source __loader.sh` and magic happens! All your functions in the subfolders will automatically be namespaced, i.e.:

```
__loader.sh
[network]
	mount_nfs.sh
	set_hostname.sh
	[optional]
		xxx.sh
```

Will autoload functions with these names:

* `network.mount_nfs`
* `network.set_hostname`
* `network.optional.xxx`

Cool right? ;)

## How to use the autoloader

Look into the **example** folder

## Author

Marius Guščius
