#!/usr/bin/env bash

FUNCTIONS_DIR=$(dirname $_)
for file in $(find $FUNCTIONS_DIR -iname '*.sh' ! -iname '__loader.sh'); do
	FUNCTION_DIR=$(dirname ${file##"$FUNCTIONS_DIR/"})
	if [[ $FUNCTION_DIR != "." ]]; then
		FUNCTION_NAMESPACE="${FUNCTION_DIR//\//.}."
	else
		FUNCTION_NAMESPACE=""
	fi
	eval "$(cat $file | sed -E "s/^([a-z0-9_]+\s?\(\)\s?\{)$/$FUNCTION_NAMESPACE\1/")"
done
