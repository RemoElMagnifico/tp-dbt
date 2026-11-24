-- Nombre minimum de lignes attendu pour chaque table
{% set expected_counts = {
    'customers': 50,
    'employees': 20,
    'stores': 10,
    'suppliers': 5,
    'products': 100,
    'orderitems': 1000,
    'orders': 200
} %}

-- Renvoie une ligne pour chaque table qui en contient MOINS que prévu
{% for table, expected_count in expected_counts.items() %}
    select
        '{{ table }}' as table_name,
        (select count(*) from {{ source('bronze', table) }}) as record_count,
        {{ expected_count }} as expected_count
    from dual
    where (select count(*) from {{ source('bronze', table) }}) < {{ expected_count }}
    {% if not loop.last %} union all {% endif %}
{% endfor %}