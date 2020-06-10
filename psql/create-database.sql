DROP SCHEMA IF EXISTS blog;
CREATE SCHEMA blog;

DROP TABLE IF EXISTS blog.users;
CREATE TABLE blog.users
(
    id            serial       NOT NULL
        CONSTRAINT users_pk
            PRIMARY KEY,
    first_name    VARCHAR(50)  NOT NULL,
    last_name     VARCHAR(50)  NOT NULL,
    email         VARCHAR(255) NOT NULL,
    hash_password VARCHAR(255) NOT NULL,
    created_at    DATE         NOT NULL,
    user_role     VARCHAR(30)  NOT NULL,
    enabled       boolean      NOT NULL
);

DROP TABLE IF EXISTS blog.articles;
CREATE TABLE blog.articles
(
    id         serial       NOT NULL
        CONSTRAINT articles_pk
            PRIMARY KEY,
    title      VARCHAR(255) NOT NULL,
    article    text         NOT NULL,
    status     VARCHAR(30)  NOT NULL,
    user_id    INTEGER      NOT NULL
        CONSTRAINT articles_users_id_fk
            REFERENCES blog.users,
    created_at DATE         NOT NULL,
    updated_at DATE         NOT NULL
);

DROP TABLE IF EXISTS blog.comments;
CREATE TABLE blog.comments
(
    id           serial  NOT NULL
        CONSTRAINT comments_pk
            PRIMARY KEY,
    text_message text    NOT NULL,
    article_id   INTEGER NOT NULL
        CONSTRAINT comments_articles_id_fk
            REFERENCES blog.articles,
    user_id      INTEGER NOT NULL
        CONSTRAINT comments_users_id_fk
            REFERENCES blog.users,
    created_at   DATE    NOT NULL
);

DROP TABLE IF EXISTS blog.tags;
CREATE TABLE blog.tags
(
    id       serial       NOT NULL
        CONSTRAINT tags_pk
            PRIMARY KEY,
    tag_name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS blog.article_tag;
CREATE TABLE blog.article_tag
(
    article_id INTEGER NOT NULL
        CONSTRAINT article_tag_articles_id_fk
            REFERENCES blog.articles,
    tag_id     INTEGER NOT NULL
        CONSTRAINT article_tag_tags_id_fk
            REFERENCES blog.tags
);