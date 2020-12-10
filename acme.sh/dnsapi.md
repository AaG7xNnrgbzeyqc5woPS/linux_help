# dns api mode

# Automatic DNS API integration

If your DNS provider supports API access, we can use that API to automatically issue the certs.

You don't have to do anything manually!


** https://github.com/acmesh-official/acme.sh/wiki/dnsapi **

35. Use Namesilo.com API
You'll need to generate an API key at https://www.namesilo.com/account_api.php Optionally you may restrict the access to an IP range there.

export Namesilo_Key="xxxxxxxxxxxxxxxxxxxxxxxx"

And now you can issue certs with:

acme.sh --issue --dns dns_namesilo --dnssleep 900 -d example.com -d www.example.com


