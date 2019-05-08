# Odoo 12 with Docker & Docker Compose.
Using Ubuntu 18.04 & Wkhtmltopdf 0.12.5-*

## Run Odoo.
type `docker-compose up` and run `localhost:9069` on your browser

## Create scaffold new module.
type `docker-compose run web odoo scaffold module_name /mnt/extra-addons/`
