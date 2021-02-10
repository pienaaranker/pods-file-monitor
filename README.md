# pods-file-monitor
Monitor files that change in your Pods directory and override their respective files in their source directory

# installation 
clone this project into your top level project

`brew install fswatch`

`chmod +x fswatchmonitor.sh`

`chmod +x sourcestream.sh`


# Usage
run the fswatchmonitor.sh script

`./fswatchmonitor.sh`

Every time a file is changes in the `{top_level_project_dir}/Pods/` directory it will search for that file in `{top_level_project_dir}/../` recursively, matching the Pod name as the source directory and replacing the file that changed.

