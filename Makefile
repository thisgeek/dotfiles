all: janus
	@@echo "Build completed:"
	@@date

janus:
	@@ln -s `pwd`/janus.rake ~/.janus.rake
	@@ln -s `pwd`/vimrc.local ~/.vimrc.local
	@@ln -s `pwd`/gvimrc.local ~/.gvimrc.local

clean:
	@@rm ~/.janus.rake ~/.vimrc.local ~/.gvimrc.local
