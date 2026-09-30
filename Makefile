PSQL = docker compose exec -T db psql -U rockbuster -d dvdrental -v ON_ERROR_STOP=1

.PHONY: up down reset staging marts analyze test

up:
	docker compose up -d

down:
	docker compose down

reset:
	docker compose down -v && docker compose up -d

staging:
	@for f in sql/01_staging/*.sql; do echo "-> $$f"; $(PSQL) -f //$$f; done

marts:
	@for f in sql/02_marts/*.sql; do echo "-> $$f"; $(PSQL) -f //$$f; done

analyze: staging marts
	@for f in sql/03_analysis/*.sql; do echo "===== $$f ====="; $(PSQL) -f //$$f; done

test:
	@for f in sql/04_quality/*.sql; do echo "-> $$f"; $(PSQL) -f //$$f; done