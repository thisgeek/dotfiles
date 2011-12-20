MANIFEST=janus.rake vimrc.local gvimrc.local bash_profile gitignore

all: link
	@@echo "Build completed:"
	@@date

link:
	@@for file in ${MANIFEST}; do \
		ln -s `pwd`/$$file ~/.$$file; \
	done;

clean:
	@@for file in ${MANIFEST}; do \
		rm ~/.$$file; \
	done;
