with 

source as (

    select * from {{ source('raw_circle', 'parcel') }}

),

renamed as (

    select
        Parcel_id as parcel_id,
        Parcel_tracking as parcel_tracking,
        Transporter as transporter,
        Priority as priority,
        PARSE_DATE('%B %e, %Y', TRIM(Date_purCHase)) AS date_purchase,
        PARSE_DATE('%B %e, %Y', TRIM(Date_sHIpping)) AS date_shipping,
        PARSE_DATE('%B %e, %Y', TRIM(DATE_delivery)) AS date_delivery,
        PARSE_DATE('%B %e, %Y', TRIM(DaTeCANcelled)) AS date_cancelled
    from source

)

select * from renamed