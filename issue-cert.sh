#!/bin/bash
set -ex

export VAULT_ADDR=https://vault.lmhd.me

# Issue client cert from Vault
vault write --format=json -f pki/inter/issue/api.test.lmhd.me-client > cert.json
cat cert.json | jq -r .data.certificate > cert.pem

# Inspect cert
cat cert.pem | openssl x509 -text -noout



# The PKI Role used above looks like this:
# $ vault read pki/inter/roles/api.test.lmhd.me-client
# Key                                   Value
# ---                                   -----
# allow_any_name                        true
# allow_bare_domains                    true
# allow_glob_domains                    false
# allow_ip_sans                         false
# allow_localhost                       false
# allow_subdomains                      false
# allow_token_displayname               false
# allowed_domains                       []
# allowed_domains_template              false
# allowed_other_sans                    []
# allowed_serial_numbers                []
# allowed_uri_sans                      []
# basic_constraints_valid_for_non_ca    false
# client_flag                           true
# code_signing_flag                     false
# country                               []
# email_protection_flag                 false
# enforce_hostnames                     false
# ext_key_usage                         []
# ext_key_usage_oids                    []
# generate_lease                        false
# key_bits                              2048
# key_type                              rsa
# key_usage                             [DigitalSignature KeyEncipherment]
# locality                              []
# max_ttl                               1h
# no_store                              false
# not_before_duration                   0s
# organization                          [fronter.federate:read fronter.federate:write]
# ou                                    [api.test.lmhd.me]
# policy_identifiers                    []
# postal_code                           []
# province                              []
# require_cn                            false
# server_flag                           false
# street_address                        []
# ttl                                   1h
# use_csr_common_name                   true
# use_csr_sans                          true