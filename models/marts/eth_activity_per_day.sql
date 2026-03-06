-- depends_on: {{ ref('stg_token_transfers') }}
{{ config(materialized='table', tags = ['daily'])}}

select
date,
transaction_category,
count(*) as tx_count,
{{ conversion('value', '18') }} as sum_eth_value

from {{ ref('stg_transactions_enriched') }}

group by 
date,
transaction_category

{{ random_macro() }}