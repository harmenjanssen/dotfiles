function dock
	docker exec -it (basename $PWD)_web_1 $argv
end
