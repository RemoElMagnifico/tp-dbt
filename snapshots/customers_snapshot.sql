{% snapshot customers_snapshot %}

{{ config(
    target_schema='snapshots',
    unique_key='customerid',
    strategy='timestamp',
    updated_at='updated_at'
) }}

select * from {{ source('bronze', 'customers') }}

{% endsnapshot %}