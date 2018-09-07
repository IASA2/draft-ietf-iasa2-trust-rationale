
PREV=	draft-arkko-iasa2-trust-rationale-00.txt
ALL=	draft-ietf-iasa2-trust-rationale.txt \
	draft-ietf-iasa2-trust-rationale-diff.html

all:	$(ALL)

draft-ietf-iasa2-trust-rationale.txt \
draft-ietf-iasa2-trust-rationale-diff.html:	draft-ietf-iasa2-trust-rationale.xml
	scp draft-ietf-iasa2-trust-rationale.xml $(PREV) jar@arkko.eu:
	ssh jar@arkko.eu xml2rfc draft-ietf-iasa2-trust-rationale.xml
	ssh jar@arkko.eu rfcdiff $(PREV) draft-ietf-iasa2-trust-rationale.txt
	scp jar@arkko.eu:draft-ietf-iasa2-trust-rationale.txt .
	scp jar@arkko.eu:draft-ietf-iasa2-trust-rationale-from-arkko-iasa2-trust-rationale-00.diff.html \
	    draft-ietf-iasa2-trust-rationale-diff.html

copy:	$(ALL)
	scp draft-ietf-iasa2-trust-rationale.txt \
	    draft-ietf-iasa2-trust-rationale-diff.html \
	    jar@cloud1.arkko.eu:/var/www/www.arkko.com/html/ietf/iasa20
