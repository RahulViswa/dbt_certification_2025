-- macros/generate_database_name.sql
{% macro generate_database_name(custom_database_name, node) -%}
    {%- set default_database = target.database -%}
    
    {%- if target.name == 'prod' -%}
        {%- if custom_database_name is none -%}
            {{ default_database }}
        {%- else -%}
            {{ custom_database_name | trim }}
        {%- endif -%}
    {%- elif target.name == 'ci' -%}
        SANDBOX_CI
    {%- else -%}
        SANDBOX_ENGINEERING
    {%- endif -%}
{%- endmacro %}