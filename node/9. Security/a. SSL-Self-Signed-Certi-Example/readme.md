## Digital Certificate

[**V IMP, really good video** SSL and SSL pinning and obfuscation](https://www.youtube.com/watch?v=HWJ3cCNdKKA)

- Used to varify the servers owenership prior to sending encrypted data. this prevents man in the middle attack where a hacker pretends to be the server that we're talking to and instead steals that data for their own purposes , with digital certificates we varify that server's ownership first.

- therefor it varify that this certificate came from a well known soruce ( a Certificate authority )
- [Certificate Authority](https://letsencrypt.org/) -  A trusted organization that issues digital certificate and which is known by most browsers. this certificate authorities only issues the certificate if we met their condition and one of the condition is to have a domain name and not just an IP address of an server somewhere.
- This is why we have a type of certificate called a self signed certificate that still allows us to encrypt our traffic and use https, but we sign it ourselves on our local machine thus is certificate isn't trusted by others.
- Self Signed Certificate - Enables HTTPS but not trusted by others. useful for development.

### openssl to create self signed certificate

openssl req -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365

- openssl req  ( request a certificate )
- -x509        ( self signed certificate )
- newkey       ( private key )
- rsa:4096     ( specifying encryption format , with key size in bits)
- -nodes       ( this option allow us to access private key without a password )
- -keyout key.pem     ( key should live in a file name key.pem)
- -out cert.pem   ( specifiying the name of our certificate file)
- -days 365     ( we specify how long this certificate will be valid for, by default its 30 days)
