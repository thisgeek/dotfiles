MANIFEST=vimrc.after gvimrc.after bash_profile gitignore

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
