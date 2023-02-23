package db

databaseChangeLog {

    changeSet(id: '001', author: 'smohan') {
        sqlFile(path: '001-create-template-table.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '002', author: 'anton') {
        sqlFile(path: '002-modified_on_column_change.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '003', author: 'anton') {
        sqlFile(path: '003-template-table-required-fields.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '004', author: 'anton') {
        sqlFile(path: '004-history-and-audit.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '005', author: 'dirodriguez') {
        sqlFile(path: '005-sad_templates_1.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '006', author: 'dirodriguez') {
        sqlFile(path: '006-sad_templates_2_footer_correction.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '007', author: 'cattri') {
        sqlFile(path: '007_sad-template_history_1.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '008', author: 'praja') {
        sqlFile(path: '008-sad_templates_3.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '009', author: 'praja') {
        sqlFile(path: '009-sad_template_history_2.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0010', author: 'praja') {
        sqlFile(path: '0010-sad_templates_4_form4e_alignment.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0011', author: 'praja') {
        sqlFile(path: '0011-sad_templates_history_3.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0012', author: 'dirodriguez') {
        sqlFile(path: '0012-email_nft_templates.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0013', author: 'auy') {
        sqlFile(path: '0013-email_batchprint_templates.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0014', author: 'dirodriguez') {
        sqlFile(path: '0014-email_batchprint_templates_v2.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0015', author: 'anton') {
        sqlFile(path: '0015-remove_privilage_from_read_user.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0016', author: 'dirodriguez') {
        sqlFile(path: '0016-print_nft_templates.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0017', author: 'auy') {
        sqlFile(path: '0017-email_batchprint_templates_v3.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0018', author: 'mchow') {
        sqlFile(path: '0018-email-nft-templates_v2.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0019', author: 'drodriguez') {
        sqlFile(path: '0019-print-nft-templates_v2.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0020', author: 'drodriguez') {
        sqlFile(path: '0020-update_history_table.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0021', author: 'drodriguez') {
        sqlFile(path: '0021-print-nft-templates_v3.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0022', author: 'mchow') {
        sqlFile(path: '0022-email-nft-templates-v3.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0023', author: 'drodriguez') {
        sqlFile(path: '0023-add_template_stamp.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0024', author: 'drodriguez') {
        sqlFile(path: '0024-add_space_for_printId.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0025', author: 'mchow') {
        sqlFile(path: '0025-print-nft-templates_v4.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0026', author: 'drodriguez') {
        sqlFile(path: '0026-print-nft-templates_v5.sql', relativeToChangelogFile: true)
    }

    changeSet(id: '0027', author: 'mchow') {
        sqlFile(path: '0027-print-nft-templates_v6.sql', relativeToChangelogFile: true)
    }
    changeSet(id: '0028', author: 'mchow') {
        sqlFile(path: '0028-print-nft-templates_v7.sql', relativeToChangelogFile: true)
    }
    changeSet(id: '0029', author: 'mchow') {
        sqlFile(path: '0029-print-nft-templates_v8.sql', relativeToChangelogFile: true)
    }
}
