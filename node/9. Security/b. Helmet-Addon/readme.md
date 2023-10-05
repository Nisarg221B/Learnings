## [Helmet](https://www.npmjs.com/package/helmet#cross-origin-opener-policy) - a package which sets good security headers 

[good article distinguishing CORS CORP COOP COEP](https://snigel.com/blog/a-simple-guide-to-coop-coep-corp-and-cors)

### 0. CORS and CORP
Code from `https://mybank.com` should only have access to `https://mybank.com's` data, and `https://evil.example.com` should certainly never be allowed access. Each origin is kept isolated from the rest of the web, giving developers a safe sandbox in which to build and play.

the same-origin policy has had some historical exceptions. Any website can:
- Embed cross-origin iframes
- Include cross-origin resources such as images or scripts
- Open cross-origin popup windows with a DOM reference

The security side-effects of such a lax same-origin policy were patched in two ways. One way was through the introduction of a new protocol called Cross Origin Resource Sharing (CORS) whose purpose is to make sure that the server allows sharing a resource with a given origin.

CORS (Cross-Origin Resource Sharing) in general, and the Access-Control-Allow-... headers in particular, are a way to relax same-origin policy. They are used when you need to allow cross-origin requests that would usually fail to instead succeed, and in particular to allow cross-origin requesters to see the response body (which is normally not visible to the initiating page for cross-origin requests). Same-origin policy in general includes the cross-origin read blocking policy, which prevents some (but not all) access to cross-origin requests (scripts and images are two major counterexamples).

CORP is basically the opposite of CORS. CORP is a way of tightening the same-origin policy, removing the response from requests where the response would normally be processed. It is not widely used, and not generally considered essential, but it could in some cases protect a site's users from attacks that compromise the browser security model (as Spectre did/does) by not processing the response even in situations where same-origin policy would allow it (such as scripts or images).

Example : 
    - Helmet(Default)
        - Cross-Origin-Resource-Policy: same-origin
     

### 1. COEP and COOP ( new security feature which is stricter than corss-origin policy)

[COEP COOP good article](https://web.dev/why-coop-coep/)

[COEP COOP good video ](https://www.youtube.com/watch?v=D5DLVo_TlEA)

- Even with the precaution take with CORS , [spectre attack](https://www.youtube.com/watch?v=q3-xCvzBjGs) can happen which is a CPU level attack where. 
    - Misleading input.
    - CPU reads secret character and save it in cache.
    - hacker guesses secret from CPU Cashe with pricise timer. 

- Therefore we need corss-origin-isolated for powerful features such as sharedArrayBuffer, performance.measureUserAgentSpecificMemory() and high resolution timer with better precision.
- Deploy COOP+COEP to opt-in to "cross-origin isolated" state
- Use HTTP headers:
    - Cross-Origin-Opener-Policy: same-origin ( Helmets default)
    - Cross-Origin-Embedder-Policy: require-corp ( Helmet does not set Cross-Origin-Embedder-Policy by default)

### 2. Content Security Policy ( CSP )

[Good video for understanding XSS](https://www.youtube.com/watch?v=EoaDgUgS6QA)
Cross-site scripting (XSS) attacks, for example, bypass the same origin policy by tricking a site into delivering malicious code along with the intended content ([example using a comment section, see this twitch stream](https://www.youtube.com/watch?v=2GtbY1XWGlQ)). This is a huge problem, as browsers trust all of the code that shows up on a page as being legitimately part of that page's security origin. 

The XSS Cheat Sheet is an old but representative cross-section of the methods an attacker might use to violate this trust by injecting malicious code. If an attacker successfully injects any code at all, it's pretty much game over: user session data is compromised and information that should be kept secret is exfiltrated to The Bad Guys. We'd obviously like to prevent that if possible.

- [mdn/csp](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP)
- [good article](https://web.dev/csp/)
- [another good article](https://hacks.mozilla.org/2009/10/content-security-policy/)

---

the main reason why this header exists is due to cross site scripting ( XSS - a javascript injectino technique)

Content Security Policy is a declarative policy that lets the authors (or server administrators) of a web application inform the client about the sources from which the application expects to load resources.

To mitigate XSS attacks, for example, a web application can declare that it only expects to load script from specific, trusted sources. This declaration allows the client to detect and block malicious scripts injected into the application by an attacker.

To reap the greatest benefit, authors will need to move all inline script and style out-of-line, for example into external scripts, because the user agent cannot determine whether an inline script was injected by an attacker.

Browsers that don't support it still work with servers that implement it, and vice versa: browsers that don't support CSP ignore it, functioning as usual, defaulting to the standard same-origin policy for web content.

---
- **Content Security Policy (CSP) is not intended as a first line of defense against content injection vulnerabilities. Instead, CSP is best used as defense-in-depth, to reduce the harm caused by content injection attacks. As a first line of defense against content injection, server operators should validate their input and encode their output.**
- The above means that CSP header does nothing for the server, it is for the benefits of users so if the browser
supports CSP it will remove any js code or non authorized content injected from displaying to the users to mitigate any risk of data leaking but if the user is using an old browser or a plugin which disables CSP header
it is possible that inject malicious code or content will harm the user. thus as a first line of defence it is necessary to validate the inputs for any malicius threats it offers and remove them and stop them from being injected into the server resources ( like a database ).
- therefore CSP comes into the picture after the malicious code is somehow intelligently injected into the system as a extra layer of protection incase such a situation happens.
---
example header 

- Content-Security-Policy: script-src 'self' https://apis.google.com 
    - allows scripts from only self(site's own origin) and "apis.google.com" 
- Content-Security-Policy: default-src 'self'
    - all content ( scripts, images, media etc) to come from the site's own origin (this excludes subdomains.)
- Helmet default
    - Content-Security-Policy: default-src 'self';base-uri 'self';font-src 'self' https: data:;form-action 'self';frame-ancestors 'self';img-src 'self' data:;object-src 'none';script-src 'self';script-src-attr 'none';style-src 'self' https: 'unsafe-inline';upgrade-insecure-requests

### 3. Referree-Policy

[good video - see how websites track you](https://www.youtube.com/watch?v=uDigwNal7GQ) 
The Referrer-Policy HTTP header controls how much referrer information (sent with the Referer header) should be included with requests.

referer: https://www.google.com/ -> implies you came to this site via google

- Referre-Policy: no-referrer ( helmet default)
    - The Referer header will be omitted: sent requests do not include any referrer information.
- Referre-Policy: origin 
    - Send only the origin in the Referer header. For example, a document at https://example.com/page.html will send the referrer https://example.com/
etc

### 4. Strict Transport Security

The HTTP Strict-Transport-Security response header (often abbreviated as HSTS) informs browsers that the site should only be accessed using HTTPS, and that any future attempts to access it using HTTP should automatically be converted to HTTPS.


- max-age=`expire-time`
    - The time, in seconds, that the browser should remember that a site is only to be accessed using HTTPS.

- includeSubDomains :
    - If this optional parameter is specified, this rule applies to all of the site's subdomains as well.

- Helmet defaut :
    - Strict-Transport-Security: max-age=15552000(180days); includeSubDomains


### 5. X content type option header


#### MIME type

- A media type (also known as a Multipurpose Internet Mail Extensions or MIME type) indicates the nature and format of a document, file, or assortment of bytes.
- A simplest MIME type consists of a type and a subtype. A MIME type comprises these strings concatenated with a slash (/). No whitespace is allowed in a MIME type:
    - type/subtype

    - text/html
    - text/plain
    - application/zip
    - audio/mpeg
    - audio/vorbis

#### MIME type sniffing 

- In the absence of a MIME type, or in certain cases where browsers believe they are incorrect, browsers may perform MIME sniffing — guessing the correct MIME type by looking at the bytes of the resource. **There are security concerns as some MIME types represent executable content**. Servers can prevent MIME sniffing by sending the X-Content-Type-Options header.
- X-Content-Type-Options: nosniff (helmet default)

### 6. X DNS prefetch 

The X-DNS-Prefetch-Control HTTP response header controls DNS prefetching, a feature by which browsers proactively perform domain name resolution on both links that the user may choose to follow as well as URLs for items referenced by the document, including images, CSS, JavaScript, and so forth.



if on - Enables DNS prefetching , if the browser supports it. which increases the performance while compromising little privacy 

while turning it off -  can improve user privacy at the expense of performance. ( helmet default )

### 7. X powered by
Default: the X-Powered-By header, if present, is removed.

Helmet removes the X-Powered-By header, which is set by default in Express and some other frameworks. Removing the header offers very limited security benefits (see this discussion) and is mostly removed to save bandwidth, but may thwart simplistic attackers.


