MANIFEST=janus.rake vimrc.local gvimrc.local

all: janus
	@@echo "Build completed:"
	@@date

janus:
	@@for file in ${MANIFEST}; do \
		ln -s `pwd`/$$file ~/.$$file; \
	done;

clean:
	@@for file in ${MANIFEST}; do \
		rm ~/.$$file; \
	done;
