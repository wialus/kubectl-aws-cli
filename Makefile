.DEFAULT_GOAL = build

YEAR = $(shell date '+%Y')
YEAR_AND_MONTH = $(shell date '+%Y.%m')
YEAR_AND_MONTH_AND_DAY = $(shell date '+%Y.%m.%d')

.PHONY: build
build:
	$(eval ID=$(shell docker build . -q))
	docker tag $(ID) wialus/kubectl-aws-cli:$(YEAR)
	docker tag $(ID) wialus/kubectl-aws-cli:$(YEAR_AND_MONTH)
	docker tag $(ID) wialus/kubectl-aws-cli:$(YEAR_AND_MONTH_AND_DAY)

.PHONY: push
push: build
	docker push wialus/kubectl-aws-cli:$(YEAR)
	docker push wialus/kubectl-aws-cli:$(YEAR_AND_MONTH)
	docker push wialus/kubectl-aws-cli:$(YEAR_AND_MONTH_AND_DAY)
