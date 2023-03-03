
checksum:
	@for formula in *.rb; do \
		echo $$formula; \
		curl -sL `awk '$$1 == "url" { gsub("\"", "", $$2); print $$2 }' $$formula` | sha256sum | awk '{ print $$1 }'; \
	done
