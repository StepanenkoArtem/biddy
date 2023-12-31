# frozen_string_literal: true

ActiveRecordDoctor.configure do
  # Global settings affect all detectors.
  global :ignore_tables, [
    # Ignore internal Rails-related tables.
    'ar_internal_metadata',
    'schema_migrations',
    'active_storage_blobs',
    'active_storage_attachments',
    'action_text_rich_texts',
    'action_mailbox_inbound_emails'

    # Add project-specific tables here.
    # "legacy_users"
  ]

  global :ignore_models, [
    'ActionText::RichText',
    'ActionText::EncryptedRichText',
    'ActiveStorage::VariantRecord',
    'ActiveStorage::Blob',
    'ActiveStorage::Attachment',
    'ActionMailbox::InboundEmail'
  ]

  # Detector-specific settings affect only one specific detector.
  # detector :extraneous_indexes,
  #   ignore_tables: ["users"],
  #   ignore_indexes: ["accounts_on_email_organization_id"]
end
