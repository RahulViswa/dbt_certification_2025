with payments as (

    select * from {{ ref('stg_stripe__payments') }}

),

order_payments as (

    select
        order_id,
        sum(case
            when payment_status = 'success'
                then payment_amount
        end) as amount
    from payments
    group by 1

)

select * from order_payments