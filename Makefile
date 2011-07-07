all: janus
	@@echo "Build completed:"
	@@date

janus:
	@@ln -s .janus.rake ~/.janus.rake
	@@ln -s .vimrc.local ~/.vimrc.local
	@@ln -s .gvimrc.local ~/.gvimrc.local

clean:
	@@rm ~/.janus.rake ~/.vimrc.local ~/.gvimrc.local
