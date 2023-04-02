#!/usr/bin/env bash

functions_dir=$(dirname $BASH_SOURCE)
for file in $(find $functions_dir -iname '*.sh' ! -iname '__loader.sh'); do
	function_dir=$(dirname ${file##"$functions_dir/"})
	if [[ $function_dir != "." ]]; then
		function_namespace="${function_dir//\//.}."
	else
		function_namespace=""
	fi
	file_name=$(basename $file)
	function_name=${file_name%.sh*}
	function_body=$(cat $file | sed -E "s/^#!.+$//")
	eval "$(echo -e "$function_namespace$function_name() {\n$function_body\n}")"
done