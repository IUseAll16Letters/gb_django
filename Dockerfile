FROM postgres

ENV POSTGRES_PASSWORD password
ENV POSTGRES_USER postgres
ENV POSTGRES_DB gb_django

COPY psql_22_12_22.sql /docker-entrypoint-initdb.d/

EXPOSE 5432