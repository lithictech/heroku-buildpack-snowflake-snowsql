# heroku-buildpack-snowflake-snowsql

Install the SnowflakeDB snowsql CLI into your build.

It is quite difficult to integrate a Snowflake driver into an application;
we have found that calling SnowSQL is a suitable alternative for certain types of workloads.

# Installation

There are no dependencies, and this buildpack can be run in any order.

heroku buildpacks:add https://github.com/lithictech/heroku-buildpack-snowflake-snowsql 

# Configuration

You should be able to use environment variables to control
how this buildpack works.

- `SNOWSQL_BUILDPACK_DOWNLOAD_URL`: By default, we use the S3 installer download link.
  Set this config var to use the Azure location, or if you need a specific version.

- `SNOWSQL_BUILDPACK_CONFIG_CONTENTS`: The value of this variable will be put into `~/.snowsql/config`
  If it is blank, then the config file will be blank; there's no reason to have the default config emplaced
  on a server.

Note that if you aren't otherwise using the config file,
and instead use command line arguments when you call `snowsql` from your application,
you will usually still want to set `log_file` either in the config, and/or when you invoke `snowsql`,
since the default location is not writeable (this will just cause a warning to stderr when you invoke `snowsql`).

Usually you will want to set `SNOWSQL_BUILDPACK_CONFIG_CONTENTS` in Heroku config to:

```
[options]
log_file = /tmp/snowsql_log
```

See [https://docs.snowflake.com/en/user-guide/snowsql-config.html](https://docs.snowflake.com/en/user-guide/snowsql-config.html)
for more about configuring SnowSQL.

Note as well that `snowsql` depends on the `~/.snowsql` directory, so you cannot configure that.

# Testing and Developing

Check the `Makefile`.
