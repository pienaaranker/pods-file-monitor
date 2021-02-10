#!/bin/sh
updated_file=$@
dir_components=($(echo $updated_file | tr "/" "\n"))

# Get project name from directory directly after pods
i=1
for comp in ${dir_components[@]}
do
  if [ "$comp" == "Pods" ]; then
    break
  fi
  ((i+=1))
done
file_name=${dir_components[${#dir_components[@]}-1]}
project_name=${dir_components[$i]}

cd "$(dirname "$BASH_SOURCE")"/../..
search_results=($(find "$(dirname "$BASH_SOURCE")"/../.. -type d | grep "$project_name.xcworkspace"))
pushd ${search_results[0]}/../$project_name

file_to_replace=$(find `pwd` -type f -name "$file_name")

if [ -f "$updated_file" -a -f "$file_to_replace" ]; then
  echo "\n\nUpdating $file_name..."
  echo "============================================"
  rm -rf "$file_to_replace"
  cp "$updated_file" "$file_to_replace"
  echo "Replaced contents of: $file_to_replace\n\nwith contents of: $updated_file"
fi

popd
