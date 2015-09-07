    SELECT
        ad.pk1_value Lockbox_number, ad.pk2_value lockbox_date,us.user_name, ad.created_by, ad.creation_date
    FROM
        fnd_attached_documents          ad
        ,fnd_documents                  d
        ,fnd_documents_tl               dt
        ,fnd_document_categories_tl     dct
        ,fnd_user                       us
    WHERE
        ad.document_id          =   d.document_id
        AND dt.document_id      =   d.document_id
        AND dct.category_id     =   d.category_id
        AND dct.LANGUAGE        =   userenv('LANG')
        AND dt.LANGUAGE         =   userenv('LANG')
        AND us.user_id          =   ad.created_by
        AND d.category_id       =   1000863           ---Check the category

        AND lv_global_key       =   pk1_value||pk2_value||pk3_value||pk4_value||pk5_value;
