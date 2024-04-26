#!/bin/bash
docker run -d -p 5432:5432 --name POSTGRESQL_SERVER -e POSTGRES_PASSWORD=postgres -d postgres
