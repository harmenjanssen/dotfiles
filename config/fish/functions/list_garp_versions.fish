function list_garp_versions
	for dir in ~/Sites/*
		if test -e $dir"/composer.json"
			echo $dir
			composer show -i -d $dir  | grep garp3
		end
	end
end
