## INDEX
- JWT
- Why JWT
    - More on Security ( signature algorithms used in jwt)
- JWS Structure
    - Header
    - JWS payload
    - JWS signature
- JWS in Auth0 and its restrictions over claims
- [Validating JWS](https://auth0.com/docs/secure/tokens/json-web-tokens/validate-json-web-tokens)

### JWT

JSON web token (JWT) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object. Again, JWT is a standard, meaning that all JWTs are tokens, but not all tokens are JWTs.

JSON Web Tokens are an open, industry standard RFC 7519 method for representing claims securely between two parties.

[JWT.IO](https://jwt.io/) allows you to decode, verify and generate JWT.

### Why JWTs ?

There are benefits to using JWTs when compared to simple web tokens (SWTs) and SAML tokens.


- More Compact ( it is smaller than SAML tokens which uses XML)
- More Secure ( JWTs can use a public/private key pair in the form of an X.509 certificate for signing. whereas XML can also be signed but it is very difficult and can leave security holes )
- More common (JSON parsers are common in most programming languages because they map directly to objects.)
- Easier to process ( JWT is used at internet scale, this means that it is easier to process on users' devices, expecially mobile )

#### More on security 
Signing algorithms are algorithms used to sign tokens issued for your application or API. A signature is part of a JSON Web Token (JWT) and is used to verify that the sender of the token is who it says it is and to ensure that the message wasn't changed along the way.

signing algorithms:
- RS256 (RSA signature with SHA-256) - an asymmetric algorithm, which means that there are two keys: one public key and one private key that must be kept secret. Auth0 has the private key used to generate the signature, and the consumer of the JWT retrieves a public key from the metadata endpoints provided by Auth0 and uses it to validate the JWT signature.

- HS256 (HMAC with SHA-256)          - A symmetric algorithm, which means that there is only one private key that must be kept secret, and it is shared between the two parties. Since the same key is used both to generate the signature and to validate it, care must be taken to ensure that the key is not compromised. This private key (or secret) is created when you register your application (client secret) or API (signing secret) and choose the HS256 signing algorithm.

The most secure practice, and our recommendation, is to use RS256 because:

With RS256, you are sure that only the holder of the private key (Auth0) can sign tokens, while anyone can check if the token is valid using the public key.

With RS256, if the private key is compromised, you can implement key rotation without having to re-deploy your application or API with the new secret (which you would have to do if using HS256).


### JWS Structure 

All Auth0-issued JWTs have JSON Web Signatures (JWSs), meaning they are signed rather than encrypted. A JWS represents content secured with digital signatures or Message Authentication Codes (MACs) using JSON-based data structures.

In its compact form, JSON Web Tokens consist of three parts separated by dots (.), which are:

- Header
- JWS Payload
- JWS Signature

Therefore, a JWT typically looks like the following.

xxxxx.yyyyy.zzzzz

### Header

The header typically consists of two parts: the type of the token, which is JWT, and the signing algorithm being used, such as HMAC SHA256 or RSA.

For example:

``` json
{
  "alg": "HS256",
  "typ": "JWT"
}
```

### JWS Payload ( claims )

The second part of the token is the payload, which contains the claims. Claims are statements about an entity (typically, the user) and additional data. There are three types of claims: registered, public, and private claims.

The JWT Claims Set represents a JSON object whose members are the claims conveyed by the JWT.
```json
{
      "sub": "1234567890",
      "name": "John Doe",
      "admin": true
}
```
#### Registered claims(reserved claims):
These are a set of predefined claims which are not mandatory but recommended, to provide a set of useful, interoperable claims.

- iss (issuer): Issuer of the JWT
- sub (subject): Subject of the JWT (the user)
- aud (audience): Recipient for which the JWT is intended
- exp (expiration time): Time after which the JWT expires
- nbf (not before time): Time before which the JWT must not be accepted for processing
- iat (issued at time): Time at which the JWT was issued; can be used to determine age of the JWT
- jti (JWT ID): Unique identifier; can be used to prevent the JWT from being replayed (allows a token to be used only once)


#### public claims:
You can create custom claims for public consumption, which might contain generic information like name and email. If you create public claims, you must either register them or use collision-resistant names through namespacing and take reasonable precautions to make sure you are in control of the namespace you use.

In the IANA JSON Web Token Claims Registry, you can see some examples of public claims registered by **OpenID Connect** (OIDC):
- auth_time -  Time when the authentication occurred
- name - Full name
- picture - Profile picture URL
- preferred_username
- nonce - Value used to associate a Client session with an ID Token (MAY also be used for nonce values in other applications of JWTs)

#### private claims:
You can create private custom claims to share information specific to your application. For example, while a public claim might contain generic information like name and email, private claims would be more specific, such as employee ID and department name.

### JWS signature

```json
HMACSHA256(
      base64UrlEncode(header) + "." +
      base64UrlEncode(payload),
      secret)
```
The signature is used to verify that the sender of the JWT is who it says it is and to ensure that the message wasn't changed along the way.

To create the signature, the Base64-encoded header and payload are taken, along with a secret, and signed with the algorithm specified in the header.


### Security of JWS and Auth0 restrictions

Auth0 enforces the general restrictions on custom claims: 
- custom claims payload is set to a maximum of 100KB
- a subset of OIDC and other registered standard claims or claims used internally by Auth0 cannot be customized or modified
- access tokens with an Auth0 API audience, excluding the /userinfo endpoint, cannot have private, non-namespaced custom claims 
- only specified OIDC user profile claims can be added to access tokens

--- 

Auth0 uses JSON Web Token (JWT) for secure data transmission, authentication, and authorization. Tokens should be parsed and validated in regular web, native, and single-page applications to make sure the token isn’t compromised and the signature is authentic. Tokens should be verified to decrease security risks if the token has been, for example, tampered with, misused, or has expired. JWT validation checks the structure, claims, and signature to assure the least amount of risk.

Before a received JWT is used, it should be properly validated using its signature. **Note that a successfully validated token only means that the information contained within the token has not been modified by anyone else. This doesn't mean that others weren't able to see the content, which is stored in plain text.** Because of this, you should never store sensitive information inside a JWT and should take other steps to ensure that JWTs are not intercepted, such as by sending JWTs only over HTTPS, following best practices, and using only secure and up-to-date libraries.


### References 

- [okta docs](https://auth0.com/docs/secure/tokens/json-web-tokens)
- [official reference](https://datatracker.ietf.org/doc/html/rfc7519#section-1)

