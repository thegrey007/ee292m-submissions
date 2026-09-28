-include .env
export

API := https://292m.ee.stanford.edu/api/v1

.PHONY: check submit

check:
	@test -n "$(EE292M_API_KEY)" || (echo "Missing EE292M_API_KEY. Copy .env.example to .env and add your key."; exit 1)
	@curl -sSf $(CURL_OPTS) -H "Authorization: Bearer $(EE292M_API_KEY)" $(API)/me/
	@echo
	@echo "Key OK"

submit: check
	@test -n "$(WL)" || (echo "Usage: make submit WL=2a"; exit 1)
	@test -f worklog-$(WL).md || (echo "File worklog-$(WL).md not found"; exit 1)
	@curl -sSf $(CURL_OPTS) -H "Authorization: Bearer $(EE292M_API_KEY)" \
	     -F file=@worklog-$(WL).md $(API)/worklogs/$(WL)/
	@echo
	@echo "Submitted worklog $(WL)"
