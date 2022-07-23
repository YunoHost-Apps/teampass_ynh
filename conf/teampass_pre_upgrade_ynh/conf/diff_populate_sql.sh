#!/bin/bash

# This small script is design to perform a diff between the previous and the new install.queries.php file, which contains all the database requests needed for populate.sql

# Get the script's directory
script_dir="$(dirname $(realpath $0))"

# Grep versions of teampass to compare
new_version="$(grep SOURCE_URL= "./app.src" | cut -d'=' -f2)"
old_version="$(grep SOURCE_URL= "../../app.src" | cut -d'=' -f2)"

get_and_extract () {
	local version="$1"
	# Download the release
	wget -nv "$version"
	local archive="$(basename "$version")"
	local dir="$(basename -s .tar.gz "$version")"
	mkdir "$dir"
	# Extract
	tar -xf "$archive" -C "$dir" --strip-components 1
	# Then cherry pick the file to compare
	cp "$dir/install/install.queries.php" ./install.queries.php
	# Remove previous useless archive and directory
	rm -r "$dir" "$archive"
}

echo "new_version=$new_version"
get_and_extract $new_version
mv install.queries.php install.queries.php.new
echo "old_version=$old_version"
get_and_extract $old_version
mv install.queries.php install.queries.php.old

# Make a colored diff of the 2 files.
git diff --no-index install.queries.php.old install.queries.php.new

# Then remove these files
rm install.queries.php.{old,new}
