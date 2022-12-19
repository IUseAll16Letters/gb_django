FROM postgres

ENV POSTGRES_PASSWORD password
ENV POSTGRES_USER postgres
ENV POSTGRES_DB gb_django

COPY post.sql /docker-entrypoint-initdb.d/

EXPOSE 5432