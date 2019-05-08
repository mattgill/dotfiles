# for each hidden file, make a symlink in home.
# this way with just a git pull we can sync these.
for FILE in `pwd`/.*
do
	# ignore . and ..
	if ! [[ $FILE =~ \.$ ]]; then
		LOCALNAME=`basename $FILE`

		# if it's a directory, ignore it. thinking .git dir.
		if [[ -d $FILE ]]; then
			continue
		fi

		#echo "ln -s $FILE ~/$LOCALNAME"
		#continue

		# the script is destructive so let's backup the current user files just in case.
		if [[ -e ~/$LOCALNAME && ! -L ~/$LOCALNAME ]]; then
			mv ~/$LOCALNAME ~/$LOCALNAME.bak
			ln -s $FILE ~/$LOCALNAME
		fi

		# and if it's not a link, make it one
		if [[ -e ~/$LOCALNAME ]]; then
			rm ~/$LOCALNAME
		fi

		ln -s $FILE ~/$LOCALNAME
	fi
done
