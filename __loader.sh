#!/usr/bin/env bash

functions_dir=$(dirname $_)
for file in $(find $functions_dir -iname '*.sh' ! -iname '__loader.sh'); do
	function_dir=$(dirname ${file##"$functions_dir/"})
	if [[ $function_dir != "." ]]; then
		function_namespace="${function_dir//\//.}."
	else
		function_namespace=""
	fi
	function_name=${$(basename $file)%.sh*}
	function_body=$(cat $file | sed -E "s/^#!.+$//")
	eval $(echo "$function_namespace$function_name() {\n$function_body\n}")
done
