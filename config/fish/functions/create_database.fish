function create_database
	mysql -uroot -e CREATE\ DATABASE\ $argv;
end
