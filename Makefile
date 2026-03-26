prefix=/usr/local
EXEC_FILES =git-cloneall

all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	install -m 0755 $(EXEC_FILES) $(prefix)/bin

uninstall:
	test -d $(prefix)/bin && \
	cd $(prefix)/bin && \
	rm -f $(EXEC_FILES)
