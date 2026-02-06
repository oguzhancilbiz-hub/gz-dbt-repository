with 

source as (
    select * from {{ source('raw_circle', 'parcel_product') }}
),

renamed as (
    select
        ParCEL_id as parcel_id,
        -- Tüm model isimlerini aralarına virgül koyarak tek bir hücrede birleştirir:
        STRING_AGG(Model_mAME, ', ') as model_name, 
        SUM(QUANTITY) AS quantity,
        COUNT(DISTINCT Model_mAME) as nb_models
    from source
    group by parcel_id
)

select * from renamed