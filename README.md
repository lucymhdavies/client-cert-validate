# Proof of Concept x.509 Client Certificate Validation

Step 1, issue a cert:

```
$ ./issue-cert.sh
```

This will issue a certificate from Vault, and store it in a file cert.pem


Step 2, run the app:

```
$ go run main.go 
Cert Generated By Trusted CA: CN=LMHD Intermediary CA
Cert Properties:
        OU: [fronter.federate:read fronter.federate:write]
        O:  [api.test.lmhd.me]
```

This will
* Use Vault's Root CA as a trusted CA Root
* Read the certificate from cert.pem
* Get the certificate's issuing CA
* Validate certificate trust for Authentication
* Output cert OU and O


In a real application, we would use OU and O to determine Authorization within our application


A real application should also require use of the private key in some way.
