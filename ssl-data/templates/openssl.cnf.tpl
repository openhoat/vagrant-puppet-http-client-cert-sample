HOME					                = .
RANDFILE			                = $SSL_GEN_DIR/.rnd           # $ENV::HOME/.rnd
oid_section		                = new_oids
[ new_oids ]
tsa_policy1                   = 1.2.3.4.1
tsa_policy2                   = 1.2.3.4.5.6
tsa_policy3                   = 1.2.3.4.5.7
[ ca ]
default_ca		                = CA_default                  # The default ca section
[ CA_default ]
dir                           = $SSL_GEN_DIR                # Where everything is kept
certs                         = \$dir/certs                 # Where the issued certs are kept
crl_dir                       = \$dir/crl                   # Where the issued crl are kept
database                      = \$dir/index.txt             # database index file.
unique_subject                = no                          # several certificates with same subject.
new_certs_dir                 = \$dir/newcerts              # default place for new certs.
certificate                   = \$dir/certs/ca-cert.pem     # The CA certificate
serial                        = \$dir/serial                # The current serial number
crlnumber                     = \$dir/crlnumber             # the current crl number
                                                            # must be commented out to leave a V1 CRL
crl                           = \$dir/crl.pem               # The current CRL
private_key                   = \$dir/private/ca-key.pem    # The private key
RANDFILE                      = \$dir/private/.rand         # private random number file
x509_extensions               = usr_cert                    # The extentions to add to the cert
name_opt                      = ca_default			            # Subject Name options
cert_opt                      = ca_default			            # Certificate field options
default_days                  = $CA_DAYS			              # how long to certify for
default_crl_days  	          = 30				                  # how long before next CRL
default_md		                = default			                # use public key default MD
preserve		                  = no				                  # keep passed DN ordering
policy			                  = policy_match
[ policy_match ]
countryName		                = match
stateOrProvinceName	          = match
organizationName	            = match
organizationalUnitName	      = optional
commonName		                = supplied
emailAddress		              = optional
[ policy_anything ]
countryName		                = optional
stateOrProvinceName	          = optional
localityName		              = optional
organizationName	            = optional
organizationalUnitName	      = optional
commonName		                = supplied
emailAddress		              = optional
[ req ]
default_bits		              = 2048
default_md		                = sha1
default_keyfile 	            = priv-key.pem
distinguished_name	          = req_distinguished_name
attributes		                = req_attributes
x509_extensions		            = v3_ca				                # The extentions to add to the self signed cert
string_mask = utf8only
[ req_distinguished_name ]
countryName			              = Country Name (2 letter code)
countryName_default 		      = $COUNTRY_NAME
countryName_min			          = 2
countryName_max			          = 2
stateOrProvinceName		        = State or Province Name (full name)
stateOrProvinceName_default 	= $STATE_OR_PROVINCE_NAME
localityName			            = Locality Name (eg, city)
localityName_default 		      = $LOCALITY_NAME
0.organizationName		        = Organization Name (eg, company)
0.organizationName_default 	  = $ORGANIZATION_NAME
organizationalUnitName		    = Organizational Unit Name (eg, section)
commonName			              = Common Name (eg, your name or your server\'s hostname)
commonName_default 		        = $COMMON_NAME
commonName_max			          = 64
emailAddress			            = Email Address
emailAddress_default 		      = $EMAIL_ADDRESS
emailAddress_max		          = 64
[ req_attributes ]
challengePassword	          	= A challenge password
challengePassword_min		      = 4
challengePassword_max		      = 20
unstructuredName		          = An optional company name
[ usr_cert ]
basicConstraints              = CA:FALSE
nsComment			                = "OpenSSL Generated Certificate"
subjectKeyIdentifier		      = hash
authorityKeyIdentifier		    = keyid,issuer
[ v3_req ]
basicConstraints 		          = CA:FALSE
keyUsage 			                = nonRepudiation, digitalSignature, keyEncipherment
[ v3_ca ]
subjectKeyIdentifier		      = hash
authorityKeyIdentifier		    = keyid:always,issuer
basicConstraints 		          = CA:true
[ crl_ext ]
authorityKeyIdentifier		    = keyid:always
[ proxy_cert_ext ]
basicConstraints		          = CA:FALSE
nsComment			                = "OpenSSL Generated Certificate"
subjectKeyIdentifier		      = hash
authorityKeyIdentifier		    = keyid,issuer
proxyCertInfo			            = critical,language:id-ppl-anyLanguage,pathlen:3,policy:foo
[ tsa ]
default_tsa 			            = tsa_config1			            # the default TSA section
[ tsa_config1 ]
dir				                    = ./demoCA			              # TSA root directory
serial				                = \$dir/tsa-serial		        # The current serial number (mandatory)
crypto_device			            = builtin			                # OpenSSL engine to use for signing
signer_cert			              = \$dir/certs/tsa-cert.pem
certs				                  = \$dir/certs/ca-cert.pem
signer_key			              = \$dir/private/tsa-key.pem 	# The TSA private key (optional)
default_policy			          = tsa_policy1
other_policies			          = tsa_policy2, tsa_policy3	  # acceptable policies (optional)
digests				                = md5, sha1			              # Acceptable message digests (mandatory)
accuracy			                = secs:1, millisecs:500, microsecs:100	# (optional)
clock_precision_digits  	    = 0
ordering			                = yes
tsa_name			                = yes
ess_cert_id_chain		          = no

