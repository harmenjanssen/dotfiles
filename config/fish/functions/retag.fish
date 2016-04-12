function retag
	ctags -R --exclude=.svn --exclude=.git --exclude=log --exclude=tmp --exclude=node_modules --exclude=bower_components *
end
